package com.mini.detailsurvey;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mini.survey.SurveyVO;

@Repository
public class DetailSurveyDAO {
	
	@Autowired
	SqlSessionTemplate detailSST;
	
	public List<DetailSurveyVO> detailall(int i){
		return detailSST.selectList("detailSurvey.detailsurveyall",i);
	}
	
	public List<DetailSurveyVO> getByMainId(int i){
		return detailSST.selectList("detailSurvey.getDetailSurveyByMainId",i);	
	}
	
	public int detailSurveyUpdate(DetailSurveyVO vo){
		System.out.println("vo 실행 결과: " + vo);
		return detailSST.update("detailSurvey.updateDetailSurvey", vo);
	}
	
	public int detailSurveyDelete(int id){
		return detailSST.delete("detailSurvey.deleteall", id);
	}

	public int detailSurveyMake(DetailSurveyVO vo) {
		return detailSST.insert("detailSurvey.detailsurvemake", vo);
	}

	public DetailSurveyVO getBydetailId(int detailId) {
		return detailSST.selectOne("detailSurvey.getDetailSurveyByDetailId", detailId);
	}

//	public int updateDetailSurvey(DetailSurveyVO updatedetail) {
//	return 	
//	}

}
