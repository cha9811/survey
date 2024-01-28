package com.mini.member;

import java.io.IOException;

import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mini.gifticon.GifticonDAO;
import com.mini.gifticon.GifticonVO;

@Controller
public class MemberController {
//로그인 관련은 security에서 작업
	@Autowired
	MemberDAO memberDAO;

	@Autowired
	MemberService memberService;

	@Autowired
	GifticonDAO gifticonDAO;

	@RequestMapping("/loginPage")
	public String loginPage() {
		return "member/loginPage";
	}

	@RequestMapping("/findMemberPage")
	public String findMemeberPage() {
		return "member/infoFindPage";
	}

	@RequestMapping("/signUpPage")
	public String signUpPage() {
		return "member/signUpPage";
	}

	@RequestMapping("signUp")
	public String signup(MemberVO vo) {
		memberService.signup(vo);
		return "redirect:/loginPage";
	}

	@RequestMapping("logOut")
	public void logOut(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		session.invalidate();
		String redirectURL = request.getContextPath() + "/loginPage";
		try {
			response.sendRedirect(redirectURL);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("/mypage")
	public String mypage(Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName(); // 현재 사용자의 이름 (예: "admin")
		MemberVO memberinfo = memberService.myPage(username);
		model.addAttribute("memberInfo", memberinfo);
		List<GifticonVO> vo = gifticonDAO.giftconByMemberId(memberinfo.getMember_id());
		model.addAttribute("giftcon", vo);
		return "member/mypage";
	}

	@RequestMapping("/memberupdate")
	public String memberInfoUpdate(MemberVO memberUpdateInfo) {
		memberDAO.memberInfoUpdate(memberService.memberUpdateCheck(memberUpdateInfo));
		return "redirect:/mypage";
	}

	// 매퍼,pw업데이트 등바꾸기 ajax
	@RequestMapping("/memberPWupdate")
	public String memberPWUpdate(String member_password, String new_member_password) {
		memberService.memberPWUpdate(new_member_password, member_password);
		return "redirect:/mypage";
	}

	// 비로그인상태에서 PW 변경하기 ajax
	//AJAX 요청을 통해 서버에 데이터를 전송한 후 페이지 리디렉션을 원하는 경우, 페이지 리디렉션이 클라이언트 측 JavaScript에서 처리되어야 합니다. 서버에서 return "redirect:/loginPage";를 사용하는 것은 전통적인 서브밋(submit) 방식의 폼 처리에 적합하지만, AJAX 요청에서는 작동하지 않습니다. AJAX 요청은 비동기적으로 수행되며, 서버의 응답이 클라이언트에게 반환된 후 JavaScript 코드로 추가 처리를 해야 합니다.
	@RequestMapping("/PWupdate")
	public String nomemberPWUpdate(String new_member_password, String new_member_password_cert,String email) {
		memberService.PWUpdate(new_member_password, new_member_password_cert,email);
		return "redirect:/loginPage";
	}

	@RequestMapping(value = "/checkUsername", method = RequestMethod.GET)
	@ResponseBody
	public boolean usernameCheck(@RequestParam("member_name") String username) {
		boolean index = false;
		if (null == memberDAO.memberCheck(username)) {
			index = true;
		}
		System.out.println(index);
		return index;
	}
	
	
	@PostMapping("/sendEmailID")
	public ResponseEntity<?> sendIDEmail(@RequestParam("email") String email, HttpSession session) {
		if (memberDAO.memberInfoByEmail(email) != null) {
			email = email + "@naver.com";
			int checknum = memberService.sendIDEmail(email);
			session.setAttribute("authCode", checknum);
			System.out.println("저장된 authCode: " + session.getAttribute("authCode"));
			return ResponseEntity.ok(checknum);
		} else {
			return null;
		}
	}

	// id인증번호 매칭
	@PostMapping("/compairNumber")
	public ResponseEntity<?> compairNumber(@RequestParam("email") String email,@RequestParam("certNum_ID") int certNumID, HttpSession session) {
		boolean numberMatched = memberService.isCodeMatched(certNumID, session);
		if (numberMatched == true) {
			String Username = memberService.sendID(email);
			return ResponseEntity.ok().build();
		} else {
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
		}

	}

	// PW인증받기
	@PostMapping("/sendEmailPW")
	public ResponseEntity<?> sendPWEmail(@RequestParam("email") String email, @RequestParam("member_name") String member_name,
			HttpSession session) {
		System.out.println(email);
		MemberVO vo = memberDAO.memberInfoByEmail(email);
		if (vo != null) {
			// 세션에 인증용 번호 저장
			if(!vo.getMember_name().equals(member_name)) {
				return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();			}
			email = email + "@naver.com";
			int checknum = memberService.sendIDEmail(email);
			session.setAttribute("authCode", checknum);
			System.out.println("저장된 authCode: " + session.getAttribute("authCode"));
			return ResponseEntity.ok(checknum);
		} else {
			return null;
		}
	}

	// PW인증번호비교
	@PostMapping("/compairPWNumber")
	public ResponseEntity<?> compairPWNumber(@RequestParam("certNum_PW") int certNumPW, HttpSession session) {
		boolean numberMatched = memberService.isCodeMatched(certNumPW, session);
		if (numberMatched == true) {
			return ResponseEntity.ok().build();
		} else {
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
		}
	}
}
