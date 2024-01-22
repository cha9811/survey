package com.mini.gifticon;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.mini.gifticon.GifticonDAO;
import com.mini.gifticon.GifticonVO;

import sun.print.resources.serviceui;

@Controller
public class GifticonController {

	@Autowired
	GifticonService gifticonService;

	// 기프티콘 구매 (맴버 계정에 넣기, 삭제하기)
	@RequestMapping("/gifticonBuy")
	public String gifticonBuy(@RequestParam("gifticon_id") int gifticon_id, Model model) {
		System.out.println(gifticon_id);
		boolean result = gifticonService.gifticonBuy(gifticon_id);
		if (result != true) {
			return "redirect:/shop/buyFail";
		}
		return "redirect:/shop";

	}

	// 기프티콘 삭제
	@RequestMapping("/gifticonDelete/{gifticon_id}")
	public String gifticonDelete(@PathVariable("gifticon_id") int gifticon_id, Model model) {
		System.out.println(gifticon_id);
		System.out.println("나");
		gifticonService.gifticonDelete(gifticon_id);
		return "redirect:/shop";
	}

	// 기프티콘 삭제
	@RequestMapping("/myGifticonDelete/{gifticon_id}")
	public String myGifticonDelete(@PathVariable("gifticon_id") int gifticon_id, Model model) {
		System.out.println(gifticon_id);
		System.out.println("너");
		gifticonService.gifticonDelete(gifticon_id);
		return "redirect:/mypage";
	}

	@RequestMapping("/shop/buyFail")
	public String buyFailPage() {
		return "shop/buyFail";
	}

}
