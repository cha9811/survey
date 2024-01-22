package com.mini.shop;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ShopDAO {
	
	@Autowired
	SqlSessionTemplate shopSST;
	
	public List<ShopVO> goodsALL(){
		return shopSST.selectList("shop.goodsAll");
	}
	
	public int goodsInsert(ShopVO vo) {
		return shopSST.insert("shop.goodsInsert", vo);
	}
	
	public ShopVO goodsDetail(String goodsName) {
		return shopSST.selectOne("shop.getgoodsByName",goodsName);
	}

	public int goodsUpdate(ShopVO vo) {
		return shopSST.update("shop.goodsUpdate", vo);
	}
	
	public int goodsDelete(int number) {
		return shopSST.delete("shop.goodsDelete", number);
	}
//	public List<ShopVO> goodsSearchOne(Str) {
//		return shopSST.selectList("", )
//	}
	
}
