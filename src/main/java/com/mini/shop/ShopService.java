package com.mini.shop;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.mini.gifticon.GifticonDAO;
import com.mini.gifticon.GifticonVO;

@Service
public class ShopService {

	@Autowired
	private ShopDAO shopDAO;
	
	@Autowired
	private GifticonDAO gifticonDAO;

	public void upload(ShopVO shopvo, HttpServletRequest request, MultipartFile file) throws IllegalStateException, IOException {

		String randomName = UUID.randomUUID().toString();
		String savename = randomName+"_"+file.getOriginalFilename();
		String uploadPath = request.getSession().getServletContext().getRealPath("resources/img");

		File target = new File(uploadPath+"/"+savename);
		file.transferTo(target);
		System.out.println("File Path: " + target.getAbsolutePath());
		
		shopvo.setGoods_img(savename);
		if(savename.split("_").length ==1) {
			shopvo.setGoods_img(null);
		}
		
		shopDAO.goodsInsert(shopvo);
	}
	
	public void update(ShopVO shopvo, HttpServletRequest request, MultipartFile file) throws IllegalStateException, IOException {

		String randomName = UUID.randomUUID().toString();
		String savename = randomName+"_"+file.getOriginalFilename();
		String uploadPath = request.getSession().getServletContext().getRealPath("resources/img");

		File target = new File(uploadPath+"/"+savename);
		file.transferTo(target);
		System.out.println("File Path: " + target.getAbsolutePath());
		
		shopvo.setGoods_img(savename);
		if(savename.split("_").length ==1) {
			shopvo.setGoods_img(null);
		}
		
		shopDAO.goodsUpdate(shopvo);
	}
	
	public void giftconupload(String name,GifticonVO vo, HttpServletRequest request, MultipartFile file) throws IllegalStateException, IOException {

			String randomName = UUID.randomUUID().toString();
			String savename = randomName+"_"+file.getOriginalFilename();
			String uploadPath = request.getSession().getServletContext().getRealPath("resources/img");
			
			File target = new File(uploadPath+"/"+savename);
			file.transferTo(target);
			System.out.println("File Path: " + target.getAbsolutePath());
			vo.setGoods_content(name);
			vo.setGifticon_img(savename);
			if(savename.split("_").length ==1) {
				vo.setGifticon_img(null);
			}
			
			gifticonDAO.giftconInsert(vo);
		}
	public ShopVO giftconInfo(String goods_content) {
		ShopVO vo = shopDAO.goodsDetail(goods_content);
		return vo;	
	}
	
}
	

