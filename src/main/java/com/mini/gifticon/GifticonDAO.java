package com.mini.gifticon;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GifticonDAO {
	
	@Autowired
	SqlSessionTemplate gifticonSST;
	
	public List<GifticonVO> giftconByName(String name){
		return gifticonSST.selectList("gifticon.gifticonAll",name);
	}
	
	public int giftconInsert(GifticonVO vo) {
		return gifticonSST.insert("gifticon.gifticonInsert", vo);
	}
	
	public List<GifticonVO> giftconByMemberId(int member_id){
		return gifticonSST.selectList("gifticon.gifticonAllByMemberId",member_id);
	}
	
	
	public GifticonVO gifticonByGifticonId(int gifticon_id) {
		return gifticonSST.selectOne("gifticon.gifticonByid", gifticon_id);
	}
	public int gifticonUpdate(GifticonVO vo) {
		return gifticonSST.update("gifticon.gifticonBuy", vo);
	}

	public int gifticonDeleteById(int id) {
		return gifticonSST.delete("gifticon.gifticondelete", id);
	}
	
	
}
