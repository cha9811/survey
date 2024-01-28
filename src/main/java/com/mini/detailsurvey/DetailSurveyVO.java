package com.mini.detailsurvey;

public class DetailSurveyVO {

	private int detail_id;
	private String detail_content;
	private String detail_answer;
	private int main_id;
	private String detail_category;
	
	
	
	public String getDetail_category() {
		return detail_category;
	}
	public void setDetail_category(String detail_category) {
		this.detail_category = detail_category;
	}
	public int getDetail_id() {
		return detail_id;
	}
	public void setDetail_id(int detail_id) {
		this.detail_id = detail_id;
	}
	public String getDetail_content() {
		return detail_content;
	}
	public void setDetail_content(String detail_content) {
		this.detail_content = detail_content;
	}
	public String getDetail_answer() {
		return detail_answer;
	}
	public void setDetail_answer(String detail_answer) {
		this.detail_answer = detail_answer;
	}
	public int getMain_id() {
		return main_id;
	}
	public void setMain_id(int main_id) {
		this.main_id = main_id;
	}
	@Override
	public String toString() {
		return "DetailSurveyVO [detail_id=" + detail_id + ", detail_content=" + detail_content + ", detail_answer="
				+ detail_answer + ", main_id=" + main_id + ", detail_category=" + detail_category + "]";
	}

	
	
	
}
