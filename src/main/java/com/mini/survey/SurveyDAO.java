package com.mini.survey;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SurveyDAO {

	@Autowired
	SqlSessionTemplate SurveySST;

	public List<SurveyVO> mainSurveyAll(){
		return SurveySST.selectList("mainSurvey.mainsurveyall");	
	}

	public int surveyMake(SurveyVO surveyvo){
		return SurveySST.insert("mainSurvey.surveymake",surveyvo);
	}

	public SurveyVO surveyone(int id) {
		return SurveySST.selectOne("mainSurvey.getBySurveyByMainId", id);
	}
	
	public int surveyDelete(int id) {
		return SurveySST.delete("mainSurvey.delete", id);
	}
	
	
	
	
}
