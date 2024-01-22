package com.mini.notice;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAO {
	
	@Autowired
	SqlSessionTemplate noticeSST;
	
	public List<NoticeVO> noticeAll(){
		return noticeSST.selectList("notice.noticeAll");
	}
	
	public int noticeMake(NoticeVO noticevo) {
		return noticeSST.insert("notice.noticeMake",noticevo);
	}

	public NoticeVO getNoticeById(int id) {
		return noticeSST.selectOne("notice.getNoticeById",id);
	}
	
	public int noticeDelete(int id) {
		return noticeSST.delete("notice.noticeDelete", id);
	}
	
	public int noticeUpdate(NoticeVO noticevo) {
		return noticeSST.update("notice.noticeUpdate", noticevo);
	}
	
}
