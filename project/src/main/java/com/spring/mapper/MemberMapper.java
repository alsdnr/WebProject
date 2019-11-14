package com.spring.mapper;

import java.util.List;

import com.spring.domain.AuthVO;
import com.spring.domain.MemberVO;

public interface MemberMapper {
  
  public List<MemberVO> getList();
  
  public void insert(MemberVO member);
  
  public void insertAuth(AuthVO auth);
  
  public MemberVO read(String email);
  
  public int delete(String email);
  
  public int update(MemberVO member);
}
