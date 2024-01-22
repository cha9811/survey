package com.mini.detailsurvey;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mini.answer.AnswerDAO;
import com.mini.answer.AnswerListVO;
import com.mini.survey.SurveyDAO;
import com.mini.survey.SurveyVO;

@Controller
public class DetailSurveyController {
	
	@Autowired
	DetailSurveyDAO detailSurveyDAO;
	
	@Autowired
	SurveyDAO surveyDAO;
	
	@Autowired
	AnswerDAO answerdao;
	
	
	@RequestMapping("/surveydetail")
	public String datailSurvey(@RequestParam("id") int id, Model model, Principal principal){
		List<DetailSurveyVO> detailSurveyVO = detailSurveyDAO.detailall(id);
		SurveyVO vo = surveyDAO.surveyone(id);
		String memberName = principal.getName();
		String makeName = vo.getMember_name();
	    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
	    
	    boolean isNameMatch = false;
	    boolean isMaster = authorities.stream()
                .anyMatch(authority -> authority.getAuthority().equals("ROLE_MASTER"));
		if(isMaster) {
			isNameMatch = true;
		}
		if(memberName.equals(makeName)) {
			isNameMatch = true;
		}
	    Map<Integer, List<AnswerListVO>> answerMap = new HashMap<>();

		String surveyName = vo.getMain_title();
		model.addAttribute("id", id);
		model.addAttribute("survey_main_title", surveyName);
		model.addAttribute("detailsurvey", detailSurveyVO);
		model.addAttribute("isNameMatch", isNameMatch);
		
	for (DetailSurveyVO answervo : detailSurveyVO) {
        int detailID = answervo.getDetail_id();
        List<AnswerListVO> answers = answerdao.getAnswerListByDetailID(detailID);
        if (answers == null) {
            answers = new ArrayList<>();
        }
        answerMap.put(detailID, answers);
    }
		model.addAttribute("answerMap",answerMap);
		return "survey/surveydetail";
		
	}
	
	@RequestMapping("/deatailsurveymake")
	public String detailSurveyMake(@RequestParam("id") int id) {
		List<DetailSurveyVO> detailSurveyVO = detailSurveyDAO.detailall(id);
		return "survey/surveydetail";
	}
	

}
