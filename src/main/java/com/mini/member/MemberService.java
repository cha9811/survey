package com.mini.member;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;


@Service
public class MemberService {

	@Autowired
	MemberDAO memberDAO;

	@Autowired
	BCryptPasswordEncoder Encoder;

	@Autowired
	JavaMailSenderImpl mailSender;

	public boolean memberIdCheck(String member_id) {
		String member_id2 = memberDAO.memberCheck(member_id);
		boolean index = false;
		if (member_id2 != null) {
			index = true;
		}
		return index;
	}

	public boolean signup(MemberVO vo) {
		vo.setMember_password(Encoder.encode(vo.getMember_password()));
		memberDAO.signUp(vo);
		return false;
	}

	public MemberVO myPage(String member_name) {
		MemberVO member = memberDAO.memberInfo(member_name);
		return member;
	}

	public MemberVO memberUpdateCheck(MemberVO membervo) {
		MemberVO vo = memberDAO.memberInfoByMemberID(membervo.getMember_id());
		if (vo.getMember_password().equals(membervo.getMember_password())) {
			memberDAO.memberInfoUpdate(membervo);
			System.out.println("실행");
			return membervo;
		} else {
			System.out.println("에러");
			System.out.println(vo.getMember_password() + "///" + membervo.getMember_password());
			return null;
		}

	}

	public void memberPWUpdate(String new_member_password, String member_password) {
		MemberVO membervo = memberDAO.memberInfoByPW(member_password);	
		if (member_password.equals(membervo.getMember_password())) {
			membervo.setMember_password(new_member_password);
			memberDAO.memberPWUpdate(membervo);
		} else {
			System.out.println("올바르지 않습니다");
		}
	}

	public void PWUpdate(String new_member_password, String new_member_password_cert, String email) {
		MemberVO UserInfo = memberDAO.memberInfoByEmail(email);
		if (UserInfo == null) {
			return;
		}
		UserInfo.setMember_password(Encoder.encode(new_member_password));
		memberDAO.memberInfoUpdate(UserInfo);
	}

	public MemberVO memberSubmit(int reward, String member_name) {
		MemberVO member = memberDAO.memberInfo(member_name);
		int past_reward = member.getMember_money();
		member.setMember_money(past_reward + reward);
		memberDAO.memberInfoUpdate(member);
		return member;
	}

	public MemberVO getmemberInfo() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = null;
		MemberVO memberInfo = null;
		if (authentication != null) {
			Object principal = authentication.getPrincipal();
			if (principal instanceof UserDetails) {
				username = ((UserDetails) principal).getUsername();
				memberInfo = memberDAO.memberInfo(username);
			}
		}
		return memberInfo;
	}

	public void memberInfoUpdate(MemberVO vo) {
		memberDAO.memberInfoUpdate(vo);
	}

	public int sendIDEmail(String email) { // 난수의 범위 111111 ~ 999999 (6자리 난수)
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		// 이메일 보낼 양식
		String toMail = email;
		String title = "회원가입 인증 이메일 입니다.";
		String content = "인증 코드는 " + checkNum + " 입니다." + "<br>" + "해당 인증 코드를 인증 코드 확인란에 기입하여 주세요.";
		try {
			MimeMessage message = mailSender.createMimeMessage(); 
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("랜덤숫자 : " + checkNum);
		return checkNum;
	}

	public String sendID(String email) { 

		MemberVO memberVO = memberDAO.memberInfoByEmail(email);
		String user_name = memberVO.getMember_name();
		email = email + "@naver.com";
		String title = "아이디 찾기 메일입니다.";
		String content = "회원님의 ID는 " + user_name + " 입니다.";
		try {
			MimeMessage message = mailSender.createMimeMessage(); // Spring에서 제공하는 mail API
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setTo(email);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("회원님의 ID는 " + user_name);
		return email;
	}
	
	// 인증번호 비교 코드
	public boolean isCodeMatched(@RequestParam("certNum_ID") int certNumID, HttpSession session) {
		boolean numberMatched = false;
		Integer storedCode = (Integer) session.getAttribute("authCode");
		if (storedCode != null && certNumID == storedCode) {
			System.out.println("성공" + certNumID);
			numberMatched = true;
		}
		return numberMatched;
	}

}