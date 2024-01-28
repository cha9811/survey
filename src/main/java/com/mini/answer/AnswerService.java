package com.mini.answer;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.mini.member.MemberDAO;
import com.mini.member.MemberVO;

@Service
public class AnswerService {

	@Autowired
	AnswerDAO answerDAO;

	@Autowired
	MemberDAO memberdao;

	
	public String answerSubmit(@RequestParam("id") int id, HttpServletRequest request, Principal principal) {
	    String username = principal.getName();
	        MemberVO memberInfo = memberdao.memberInfo(username);

	        Enumeration<String> parameterNames = request.getParameterNames();
	        while (parameterNames.hasMoreElements()) {
	            String paramName = parameterNames.nextElement();
	            if (paramName.startsWith("detail_answer_")) {
	                String[] values = request.getParameterValues(paramName);
	                if (values != null) {
	                    String combinedValues = String.join(",", values); // Combine all checkbox values

	                    AnswerVO vo = new AnswerVO();
	                    vo.setAnswer(combinedValues);
	                    vo.setMember_id(memberInfo.getMember_id());
	                    vo.setDetail_id(id);
	                    vo.setMain_id(id);
	                    vo.setMember_name(username);
	                    answerDAO.answerInsert(vo);
	                }
	            }
	        }
	    return username;
	}

}
