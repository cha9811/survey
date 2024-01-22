package com.mini.survey;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.mini.answer.AnswerDAO;
import com.mini.answer.AnswerVO;
import com.mini.detailsurvey.DetailSurveyDAO;
import com.mini.detailsurvey.DetailSurveyVO;

@Service
public class SurveyService {

	@Autowired
	SurveyDAO surveyDAO;

	@Autowired
	AnswerDAO answerDAO;

	@Autowired
	DetailSurveyDAO detailSurveyDAO;
	
	public int surveyRewradInfo(int id) {
		SurveyVO vo = surveyDAO.surveyone(id);
		int reward = vo.getMain_reward();
		return reward;
	}

	public void surveyAll(Model model, Principal principal) {
		List<SurveyVO> surveyall = surveyDAO.mainSurveyAll();
		String member_name = principal.getName();
		// 로그인한 사람 데이터를 가져와서 그 사람이 응답한 값을 찾기(detail_id가 main_id와 대칭)
		List<AnswerVO> answerall = answerDAO.getByMainUserID(member_name);
		Iterator<AnswerVO> iteratorA = answerall.iterator();
		while (iteratorA.hasNext()) {
			AnswerVO answerVO = iteratorA.next();
			int targetSurveyId = answerVO.getDetail_id();
			
			Iterator<SurveyVO> iteratorB = surveyall.iterator();
			while (iteratorB.hasNext()) {
				SurveyVO surveyVO = iteratorB.next();
				if (surveyVO.getMain_id() == targetSurveyId) {
					iteratorB.remove(); // 중복된 surveyVO 삭제
				}
				
			}
		}
		model.addAttribute("mainsurvey", surveyall);
	}
	
	public void resultsurveyAll(Model model) {
		List<SurveyVO> vo = surveyDAO.mainSurveyAll();
		model.addAttribute("result_main", vo);
	    Map<Integer, List<DetailSurveyVO>> detailMap = new HashMap<>();
	    Map<Integer, String> surveyStatus = new HashMap<>();
	    Map<Integer, String> formattedEndTimes = new HashMap<>(); // 종료 시간을 저장하기 위한 맵
	    Date currentDate = new Date();

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

		for(SurveyVO surveylist : vo) {
			int surveyindex = surveylist.getMain_id();
			List<DetailSurveyVO> detaillist = detailSurveyDAO.getByMainId(surveyindex);
	        detailMap.put(surveyindex, detaillist);
	        Date endDate = surveylist.getMain_end_time();
	       
	        if (endDate != null) {
	            String formattedDate = dateFormat.format(endDate);
	            formattedEndTimes.put(surveyindex, formattedDate); // 포맷된 날짜를 맵에 저장

	            if (endDate.before(currentDate)) {
	                surveyStatus.put(surveylist.getMain_id(), "집계완료");
	            } else {
	                surveyStatus.put(surveylist.getMain_id(), "진행중");
	            }
	        }
		}
	    model.addAttribute("detailMap", detailMap);
	    model.addAttribute("surveyStatus", surveyStatus);
	    model.addAttribute("formattedMainEndTime", formattedEndTimes);

	}

}
