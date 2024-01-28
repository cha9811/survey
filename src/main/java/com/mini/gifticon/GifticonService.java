package com.mini.gifticon;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mini.member.MemberDAO;
import com.mini.member.MemberService;
import com.mini.member.MemberVO;
import com.mini.shop.ShopService;
import com.mini.shop.ShopVO;

@Service
public class GifticonService {

	@Autowired
	MemberService memberService;

	@Autowired
	MemberDAO memberdao;

	@Autowired
	ShopService shopService;
	
	@Autowired
	GifticonDAO gifticonDAO;
	
	// 기프티콘 구매 (기프티콘에 맴버 계정 넣기, 맴버 돈 빼기)
	public boolean  gifticonBuy(@RequestParam("gifticon_id") int gifticon_id) {
		MemberVO memberInfo = memberService.getmemberInfo();
		GifticonVO gifticonvo = gifticonDAO.gifticonByGifticonId(gifticon_id);
		ShopVO goodsInfo = shopService.giftconInfo(gifticonvo.getGoods_content());
		int memberId = memberInfo.getMember_id();
		int price = goodsInfo.getGoods_price();
		int haveMoney = memberInfo.getMember_money();
		if(haveMoney >= price) {
			gifticonvo.setMember_id(memberId);
			gifticonDAO.gifticonUpdate(gifticonvo);
			haveMoney = haveMoney - price;
			memberInfo.setMember_money(haveMoney);
			memberdao.memberInfoUpdate(memberInfo);
            return true;
		}
		else{
            return false;
		}
	}
	
	public void gifticonDelete(@RequestParam("gifticon_id") int gifticon_id) {
		gifticonDAO.gifticonDeleteById(gifticon_id);
	}
}
