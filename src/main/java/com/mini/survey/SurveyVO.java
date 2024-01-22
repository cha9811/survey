package com.mini.survey;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class SurveyVO {

	private int main_id;
	private String main_title;
	private String main_content;
	private String main_category;
	private int main_reward;
	private int main_limit;
	 @DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date main_start_time;
	 @DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date main_end_time;
	private String use_time;
	private String member_name;
	
	
	
	
	public int getMain_id() {
		return main_id;
	}
	public void setMain_id(int main_id) {
		this.main_id = main_id;
	}
	public String getMain_title() {
		return main_title;
	}
	public void setMain_title(String main_title) {
		this.main_title = main_title;
	}
	public String getMain_content() {
		return main_content;
	}
	public void setMain_content(String main_content) {
		this.main_content = main_content;
	}
	public String getMain_category() {
		return main_category;
	}
	public void setMain_category(String main_category) {
		this.main_category = main_category;
	}
	public int getMain_reward() {
		return main_reward;
	}
	public void setMain_reward(int main_reward) {
		this.main_reward = main_reward;
	}
	public int getMain_limit() {
		return main_limit;
	}
	public void setMain_limit(int main_limit) {
		this.main_limit = main_limit;
	}
	
	
	public String getUse_time() {
		return use_time;
	}
	public void setUse_time(String use_time) {
		this.use_time = use_time;
	}
	public Date getMain_start_time() {
		return main_start_time;
	}
	public void setMain_start_time(Date main_start_time) {
		this.main_start_time = main_start_time;
	}
	public Date getMain_end_time() {
		return main_end_time;
	}
	public void setMain_end_time(Date main_end_time) {
		this.main_end_time = main_end_time;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	@Override
	public String toString() {
		return "SurveyVO [main_id=" + main_id + ", main_title=" + main_title + ", main_content=" + main_content
				+ ", main_category=" + main_category + ", main_reward=" + main_reward + ", main_limit=" + main_limit
				+ ", main_start_time=" + main_start_time + ", main_end_time=" + main_end_time + ", use_time=" + use_time
				+ ", member_name=" + member_name + "]";
	}
	
	
	
	
}
