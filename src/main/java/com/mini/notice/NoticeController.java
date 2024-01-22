package com.mini.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class NoticeController {

	@Autowired
	NoticeDAO noticeDAO;

	// 전체
	@RequestMapping("/notice")
	public String noticeAll(Model model) {
		List<NoticeVO> noticeall = noticeDAO.noticeAll();
		model.addAttribute("notice", noticeall);
		return "notice/notice";
	}

	// 게시글 쓰기 페이지 이동
	@RequestMapping("survey/noticeMakePage")
	public void makePage(NoticeVO noticevo, Model model) {
		noticeDAO.noticeMake(noticevo);
	}

	// 게시글 만들기
	@RequestMapping("/noticeMake")
	public String noticeMake(NoticeVO noticevo) {
		noticeDAO.noticeMake(noticevo);
		return "redirect:/notice";
	}

	// 게시글 상세보기
	@RequestMapping("/noticeDetail")
	public String noticeDetail(@RequestParam("id") int id, Model model) {
		NoticeVO noticevo = noticeDAO.getNoticeById(id);
		model.addAttribute("notice", noticevo);
		return "notice/noticeDetail";
	}

	
	//게시글 수정하러 이동하기
		@RequestMapping("/noticeUpdatePage")
		public String noticeUpdateMove(@RequestParam("id") int id, Model model) {
			NoticeVO noticevo = noticeDAO.getNoticeById(id);
			model.addAttribute("notice", noticevo);
			return "notice/noticeUpdatePage";
		}

	@PostMapping("/noticeUpdate")
	public String noticeUpdate(@RequestParam("id") int id,NoticeVO noticevo) {
		noticevo.setNotice_id(id);
		noticeDAO.noticeUpdate(noticevo);
		return "redirect:/noticeDetail?id=" + noticevo.getNotice_id();
	}
	
	// 게시글 날리기
	@RequestMapping("/noticeDelete")
	public String noticeDelete(@RequestParam("id") int id) {
		noticeDAO.noticeDelete(id);
		return "redirect:/notice";
	}

}
