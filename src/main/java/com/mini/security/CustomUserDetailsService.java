package com.mini.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.mini.member.MemberDAO;
import com.mini.member.MemberVO;

@Service
public class CustomUserDetailsService implements UserDetailsService{

	@Autowired
	MemberDAO memberDAO;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	 
	@Override
    public UserDetails loadUserByUsername(String member_name) throws UsernameNotFoundException {
        System.out.println("나시작");
        MemberVO member = memberDAO.memberLogin2(member_name);
        if (member == null) {
            System.out.println("유저없슴");
            throw new UsernameNotFoundException("User not found");
        }

        // 사용자 정보를 UserDetails 객체로 매핑
        UserDetails userDetails = User.withUsername(member.getMember_name())
//            .password(passwordEncoder.encode(member.getMember_password())) // 비밀번호 인코딩
                .password(member.getMember_password()) // 여기를 수정 UserDetails에 저장된 이미 인코딩된 비밀번호와 비교하여 사용자를 인증합니다
        		.roles(member.getMember_role()) // 사용자의 권한 정보 설정
            .build();
        System.out.println("끝남");
        return userDetails;
    }
}	
