package com.mini.shop;

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

@Controller
public class ShopController {

	@Autowired
	ShopDAO shopDAO;

	@Autowired
	GifticonDAO giftconDAO;
	
	@Autowired
	ShopService shopService;

	
//	초기화면
	@RequestMapping("/shop")
	public String shopAll(Model model) {
		List<ShopVO> goodsAll = shopDAO.goodsALL();
		model.addAttribute("goodsAll", goodsAll);
		return "shop/shop";
	}

//	업로드
	@RequestMapping("/shopUpload") // POST 요청을 처리하는 경우
	public String shopUpload(ShopVO shopvo, HttpServletRequest request, MultipartFile file, Model model)
			throws IllegalStateException, IOException {
		shopService.upload(shopvo, request, file);
		return "redirect:/shop"; // shopUpload 메서드가 실행된 후 "/shop"로 이동
	}
//업데이트
	@RequestMapping("/shopUpdate")
	public String shopUpdate(ShopVO shopvo, HttpServletRequest request, MultipartFile file, Model model) throws IllegalStateException, IOException	{
		shopService.update(shopvo, request, file);
		return "redirect:/shop";
	}
	
//	삭제하기
	@RequestMapping("/shopDelete/{id}")
	public String shopDelete(@PathVariable("id") int id) {
		System.out.println("실행");
		shopDAO.goodsDelete(id);
		System.out.println("실행완료");
		return "redirect:/shop";
	}


	@RequestMapping("/shopDetail/{name}")
	public String shopDetail2(@PathVariable("name") String name, Model model) {
		List<GifticonVO> gifticon = giftconDAO.giftconByName(name);
		ShopVO goods = shopDAO.goodsDetail(name);
		model.addAttribute("goods", goods);
		model.addAttribute("gifticon", gifticon);
		return "shop/shopDetail";
	}

	@RequestMapping("/shopDetailUpload") // POST 요청을 처리하는 경우
	public String shopDetailUpload(ShopVO shopvo, HttpServletRequest request, MultipartFile file, Model model)
			throws IllegalStateException, IOException {
		shopService.upload(shopvo, request, file);
		return "redirect:/shop"; // shopUpload 메서드가 실행된 후 "/shop"로 이동
	}


	
	@RequestMapping("/shop/shopUpdatePage/{name}")
	public String shopUpdatePage(@PathVariable("name") String name, Model model){
		ShopVO vo = shopDAO.goodsDetail(name);
		System.out.println(vo);
		model.addAttribute("goods", vo);
		return "shop/shopUpdatePage";
	}
	
	@RequestMapping("/shop/shopGoodsUploadPage/{name}")
	public String shopGoodsUploadPage(@PathVariable("name") String name, Model model){
		ShopVO vo = shopDAO.goodsDetail(name);
		model.addAttribute("goods", vo);
		return "shop/shopGoodsUploadPage";
	}
	
	@RequestMapping("/shopGoodsUpload/{name}")
	public String shopGoodsUpload(@PathVariable("name") String name,HttpServletRequest request, @RequestParam("files") MultipartFile[] files, Model model) throws UnsupportedEncodingException{
//		한글문자 인코딩 에러로 인한 추가코드	
	    // URLEncoder.encode 메서드는 공백을 +로 인코딩합니다. 하지만 URL 경로의 일부로 사용될 때는 공백을 %20으로 인코딩해야 올바르게 해석됩니다.'+' 문자를 '%20'로 치환 인코딩 방식이 스타벅스+아메리카노

	    String encodedName = URLEncoder.encode(name, StandardCharsets.UTF_8.toString());
	    encodedName = encodedName.replaceAll("\\+", "%20");
	    for (MultipartFile file : files) {
	        // 각 파일에 대한 GifticonVO 생성
	        GifticonVO giftcon = new GifticonVO();
	        try {
	            shopService.giftconupload(name, giftcon, request, file);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
		return "redirect:/shopDetail/"+encodedName;
	}
	
	


}
