package com.mini.notice;

public class NoticeVO {

	private int notice_id;
	private String notice_title;
	private String notice_content;
	private String notice_create_time;
	private String notice_modifi_time;
	private String writer;
	

	public int getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(int notice_id) {
		this.notice_id = notice_id;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getNotice_create_time() {
		return notice_create_time;
	}
	public void setNotice_create_time(String notice_create_time) {
		this.notice_create_time = notice_create_time;
	}
	public String getNotice_modifi_time() {
		return notice_modifi_time;
	}
	public void setNotice_modifi_time(String notice_modifi_time) {
		this.notice_modifi_time = notice_modifi_time;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	@Override
	public String toString() {
		return "NoticeVO [notice_id=" + notice_id + ", notice_title=" + notice_title + ", notice_content="
				+ notice_content + ", notice_create_time=" + notice_create_time + ", notice_modifi_time="
				+ notice_modifi_time + ", writer=" + writer + "]";
	}

	
	
	
	
}
