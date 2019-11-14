package com.spring.security;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.spring.domain.MemberVO;

import lombok.Getter;

@Getter
public class CustomUser extends User {

	private static final long serialVersionUID = 1L;

	private MemberVO member;

	public CustomUser(String email, String pw, 
			Collection<? extends GrantedAuthority> authorities) {
		super(email, pw, authorities);
	}

	public CustomUser(MemberVO vo) {

		super(vo.getEmail(), vo.getPw(), vo.getAuthList().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getAuthority())).collect(Collectors.toList()));

		this.member = vo;
	}
}
