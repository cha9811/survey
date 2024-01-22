package com.mini.answer;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mini.member.MemberService;
import com.mini.survey.SurveyDAO;
import com.mini.survey.SurveyService;

@Controller
public class AnswerController {
	
	@Autowired
	AnswerService answerService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	SurveyService surveyService;
	
	@Autowired
	SurveyDAO dao;
	
	//답변 제출
	@RequestMapping("/surveySubmit")
	public String surveySumbmit(@RequestParam("id") int id, HttpServletRequest request,Principal principal) {
		String member_info = answerService.answerSubmit(id, request, principal);
		int reward = surveyService.surveyRewradInfo(id);
		memberService.memberSubmit(reward,member_info);
		return "redirect:/surveylist";
	}
	
	//결과 모아보기
	public String surveyResult() {
		return "만들자!";
	}
}
