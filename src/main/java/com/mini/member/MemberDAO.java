package com.mini.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {

	@Autowired
	SqlSessionTemplate memberSST;

	//회원가입
	public int signUp(MemberVO vo) {
		return memberSST.insert("member.signUp", vo);
	}
	
	//중복체크
	public String memberCheck(String member_name){
		return memberSST.selectOne("member.memberIdCheck", member_name);
	}
	
	//?? 나중에 확인하기
	public MemberVO memberLogin2(String member_name) {
		        MemberVO member = memberSST.selectOne("member.getMemberByName", member_name);
		        return member;    
	}
	
	public MemberVO memberInfo(String member_name) {
        MemberVO member = memberSST.selectOne("member.getMemberByName", member_name);
		return member;	
	}

	public MemberVO memberInfoByEmail(String member_email) {
        MemberVO member = memberSST.selectOne("member.getMemberByEmail", member_email);
		return member;	
	}
	
	public MemberVO memberInfoByMemberID(int member_id) {
        MemberVO member = memberSST.selectOne("member.getMemberByID", member_id);
		return member;	
}
	
	public int memberInfoUpdate(MemberVO vo) {
		MemberVO updateInfo = vo;
		return memberSST.update("member.memberInfoUpdate", updateInfo);
	}
	
	//	비번 체크용
	public MemberVO memberInfoByPW(String member_password) {
        MemberVO member = memberSST.selectOne("member.getMemberByPassword", member_password);
		return member;	
	}
	
	//	비번 변경
	public MemberVO memberPWUpdate(MemberVO vo) {
		MemberVO member = vo;
		memberSST.update("member.memberPWUpdate", member);
		return member;
	}
	
}