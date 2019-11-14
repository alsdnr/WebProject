package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.AuthVO;
import com.spring.domain.MemberVO;
import com.spring.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImp implements MemberService{

  @Setter(onMethod_ = @Autowired) 
  private MemberMapper mapper;
  
  @Override
  public void register(MemberVO member, AuthVO auth) {
    log.info("register"+member);
    mapper.insert(member);
    mapper.insertAuth(auth);
  }

  @Override
  public MemberVO get(String email) {
    log.info("get");
    return mapper.read(email);
  }

  @Override
  public boolean modify(MemberVO member) {
    log.info("modifiy" + member);
    return mapper.update(member) == 1;
  }

  @Override
  public boolean remove(String email) {
    log.info("remove" + email);
    return mapper.delete(email) == 1;
  }

  @Override
  public List<MemberVO> getList() {
    log.info("getList");
    return mapper.getList();
  }
}
