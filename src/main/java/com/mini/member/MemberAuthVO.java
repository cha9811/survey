package com.mini.member;

public class MemberAuthVO {


	private int member_id;
	private String member_auth;

	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}

	public String getMember_auth() {
		return member_auth;
	}

	public void setMember_auth(String member_auth) {
		this.member_auth = member_auth;
	}

	@Override
	public String toString() {
		return "MemberAuthVO [member_id=" + member_id + ", member_auth=" + member_auth + "]";
	}
}
