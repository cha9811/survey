package com.mini.member;

public class MemberVO {

	private int member_id;
	private String member_name;
	private String member_password;
	private String member_nickname;
	private String member_age;
	private String member_phone;
	private String member_job;
	private String member_local;
	private int member_money;
	private String member_email;
	private String member_role;

	
	public String getMember_role() {
		return member_role;
	}
	public void setMember_role(String member_role) {
		this.member_role = member_role;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_password() {
		return member_password;
	}
	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}
	public String getMember_nickname() {
		return member_nickname;
	}
	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}
	
	public String getMember_age() {
		return member_age;
	}
	public void setMember_age(String member_age) {
		this.member_age = member_age;
	}
	public String getMember_job() {
		return member_job;
	}
	public void setMember_job(String member_job) {
		this.member_job = member_job;
	}
	public String getMember_local() {
		return member_local;
	}
	public void setMember_local(String member_local) {
		this.member_local = member_local;
	}
	public int getMember_money() {
		return member_money;
	}
	public void setMember_money(int member_money) {
		this.member_money = member_money;
	}
	@Override
	public String toString() {
		return "MemberVO [member_id=" + member_id + ", member_name=" + member_name + ", member_password="
				+ member_password + ", member_nickname=" + member_nickname + ", member_age=" + member_age
				+ ", member_phone=" + member_phone + ", member_job=" + member_job + ", member_local=" + member_local
				+ ", member_money=" + member_money + ", member_email=" + member_email + ", member_role=" + member_role
				+ "]";
	}

	
}
