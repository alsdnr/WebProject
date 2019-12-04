package com.spring.service;

import java.util.List;

import com.spring.domain.AuthVO;
import com.spring.domain.MemberVO;

public interface MemberService {
  
  public void register(MemberVO member, AuthVO auth);
  
  public MemberVO get(String email);
  
  public boolean modify(MemberVO member);
  
  public boolean remove(String email);
  
  public List<MemberVO> getList();
  
  public MemberVO info(String email);
}
