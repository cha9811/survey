package com.mini.security;

//패스워드 인코딩
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PasswordEncoder implements org.springframework.security.crypto.password.PasswordEncoder {

    private BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();

    @Override
    public String encode(CharSequence rawPassword) {
        // BCryptPasswordEncoder를 사용하여 비밀번호를 안전하게 인코딩
        return bCryptPasswordEncoder.encode(rawPassword);
    }

    @Override
    public boolean matches(CharSequence rawPassword, String encodedPassword) {
        // BCryptPasswordEncoder를 사용하여 비밀번호 일치 여부를 검사
    	
        return bCryptPasswordEncoder.matches(rawPassword, encodedPassword);
    }
}

