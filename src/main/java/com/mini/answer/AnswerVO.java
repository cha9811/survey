package com.mini.answer;

public class AnswerVO {

	private int answer_id;
	private String answer;
	private int member_id;
	private int detail_id;
	private String member_name;
	private int main_id;
	@Override
	public String toString() {
		return "AnswerVO [answer_id=" + answer_id + ", answer=" + answer + ", member_id=" + member_id + ", detail_id="
				+ detail_id + ", member_name=" + member_name + ", main_id=" + main_id + "]";
	}
	public int getAnswer_id() {
		return answer_id;
	}
	public void setAnswer_id(int answer_id) {
		this.answer_id = answer_id;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public int getDetail_id() {
		return detail_id;
	}
	public void setDetail_id(int detail_id) {
		this.detail_id = detail_id;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public int getMain_id() {
		return main_id;
	}
	public void setMain_id(int main_id) {
		this.main_id = main_id;
	}





}
