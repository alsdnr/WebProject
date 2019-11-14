package com.spring.domain;

import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
  private String email;
  private String pw;
  private String name;
  private String nickName;
  private boolean enabled;
  
  private List<AuthVO> authList;
}
