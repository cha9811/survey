package com.mini.answer;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mini.survey.SurveyVO;

@Repository
public class AnswerDAO {
	
	@Autowired
	SqlSessionTemplate answer;
	
	public List<AnswerVO> getanswerall(int main_id){
		return answer.selectList("answer.getAnswerByMainId",main_id);
	}
	
	
	public int answerInsert(AnswerVO vo){
		return answer.insert("answer.answerInsert",vo);
	}

	
	public List<AnswerVO> getByMainUserID(String member_name){
		return answer.selectList("answer.getAnswerByMemberName",member_name);	
	}
	
	public List<AnswerListVO> getAnswerListByDetailID(int detail_id){
		return answer.selectList("answer.getAnswerListByMainId",detail_id);	
	}
	
	public int answerListInsert(AnswerListVO answerListVO) {
		return answer.insert("answer.answerListInsert", answerListVO);
	}
}
