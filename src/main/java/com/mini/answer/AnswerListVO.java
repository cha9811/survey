package com.mini.answer;

public class AnswerListVO {

	private int answerlist_id;
	private String answerlist_answer;
	private int detail_id;
	
	public int getAnswerlist_id() {
		return answerlist_id;
	}
	public void setAnswerlist_id(int answerlist_id) {
		this.answerlist_id = answerlist_id;
	}
	public String getAnswerlist_answer() {
		return answerlist_answer;
	}
	public void setAnswerlist_answer(String answerlist_answer) {
		this.answerlist_answer = answerlist_answer;
	}
	public int getDetail_id() {
		return detail_id;
	}
	public void setDetail_id(int detail_id) {
		this.detail_id = detail_id;
	}
	
	@Override
	public String toString() {
		return "AnswerListVO [answerlist_id=" + answerlist_id + ", answerlist_answer=" + answerlist_answer
				+ ", detail_id=" + detail_id + "]";
	}
	



}
