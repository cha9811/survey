package com.mini.survey;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mini.answer.AnswerDAO;
import com.mini.answer.AnswerListVO;
import com.mini.answer.AnswerService;
import com.mini.answer.AnswerVO;
import com.mini.detailsurvey.DetailSurveyDAO;
import com.mini.detailsurvey.DetailSurveyVO;

@Controller
public class SurveyController {

	@Autowired
	SurveyDAO surveyDAO;

	@Autowired
	DetailSurveyDAO detailSurveyDAO;

	@Autowired
	AnswerDAO answerdao;

	@Autowired
	AnswerService answerService;

	@Autowired
	SurveyService surveyService;

	@RequestMapping("/surveylist")
	public String surveyAll(Model model, Principal principal) {
		surveyService.surveyAll(model, principal);
		return "survey/surveylist";

	}

	// 페이지 이동
	@RequestMapping("/surveyMakePage")
	public String surveyMakePage() {
		return "survey/surveymakePage";
	}

	// 작성하기
	@RequestMapping("/surveyMake")
	public String surveyMake(SurveyVO vo, Principal principal) {
		System.out.println(vo);
		System.out.println(principal.getName());
		vo.setMember_name(principal.getName());
		surveyDAO.surveyMake(vo);
		return "redirect:/surveylist";
	}

	@RequestMapping("/surveyUpdatePage")
	public String surveyUpdatePage(@RequestParam("id") int id, Model model, Principal principal) {
		SurveyVO vo = surveyDAO.surveyone(id);
		List<DetailSurveyVO> detailSurveys  = detailSurveyDAO.getByMainId(id);
	    Map<Integer, List<AnswerListVO>> answersMap = new HashMap<>();
	    
		for(DetailSurveyVO index : detailSurveys) {
		int detailId = index.getDetail_id();
		List<AnswerListVO> answerlist = answerdao.getAnswerListByDetailID(detailId);
        answersMap.put(detailId, answerlist); // Map에 추가

		}
		String member_name = principal.getName();
		model.addAttribute("mainsurvey", vo);
		model.addAttribute("detailsurvey", detailSurveys);
		model.addAttribute("answersMap", answersMap);
		return "forward:/survey/surveyUpdatePage.jsp";
	}

	@RequestMapping("/surveyUpdate")
	public String surveyUpdate(@RequestParam("id") int id,
			@RequestParam(value = "allOptions[]", required = false) String[] allOptions, HttpServletRequest request) {

		List<Integer> detailIds = new ArrayList<>();
		
		Enumeration<String> parameterNames = request.getParameterNames();
		while (parameterNames.hasMoreElements()) {
		    String paramName = parameterNames.nextElement();
		    if (paramName.startsWith("detail_content_")) {
		    	
		        int detailId = Integer.parseInt(paramName.substring("detail_content_".length()));
		        if (!detailIds.contains(detailId)) { // Preventing duplicates

		        	detailIds.add(detailId);
		        }
		        
		    }
		}
		//답변저장
		for (Integer detailId : detailIds) {
			String[] additionalOptions = request.getParameterValues("additional_options_" + detailId);
			if (additionalOptions != null) {
				for (String additionalOption : additionalOptions) {
					AnswerListVO vo = new AnswerListVO();
					vo.setAnswerlist_answer(additionalOption);
					vo.setDetail_id(detailId);
					answerdao.answerListInsert(vo);
					System.out.println("나실행"+vo);
				}
			}
		}
		 for (Integer detailId : detailIds) {
		        String detailContent = request.getParameter("detail_content_" + detailId);
		        String detail_category = request.getParameter("detail_category_" + detailId);
		        DetailSurveyVO detailSurvey = new DetailSurveyVO();
		        detailSurvey.setDetail_category(detail_category);
		        detailSurvey.setDetail_id(detailId);
		        detailSurvey.setDetail_content(detailContent);
		        detailSurvey.setMain_id(id);
		        if(detailSurveyDAO.getBydetailId(detailId)==null) {
		        	detailSurveyDAO.detailSurveyMake(detailSurvey);
		        System.out.println("생성완료");
		        }
		        else{detailSurveyDAO.detailSurveyUpdate(detailSurvey);
		        System.out.println("업뎃완료");
		        }
		        System.out.println(detailSurvey);
		 }
		
		return "redirect:/surveylist";
	}

	@RequestMapping("/surveydelete")
	public String surveyDelete(@RequestParam("id") int id) {
		surveyDAO.surveyDelete(id);
		return "redirect:/surveylist";
	}

	@RequestMapping("/surveyresultpage")
	public String surveyResultPage(Model model) {
		surveyService.resultsurveyAll(model);
		return "survey/surveyresultpage";
	}

	@RequestMapping("/surveyresultdetailpage")
	public String surveyResultDetailPage(Model model) throws UnsupportedEncodingException {
		return "survey/surveyresultdetailpage";
	}

//	@RequestMapping("/surveyresultdetailpage/{main_id}")
//	public String surveyResultDetailPage2(@PathVariable("main_id") int main_id, Model model) {
//		List<AnswerVO> answerall = answerdao.getanswerall(main_id);
//		model.addAttribute("answerall", answerall);
//		return "survey/surveyresultdetailpage";
//	}

}
