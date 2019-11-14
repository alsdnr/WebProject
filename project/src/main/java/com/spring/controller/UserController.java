package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping
@AllArgsConstructor
public class UserController {
  
  @GetMapping("/main")
  public void doAll() {
    log.info("모두 접근 가능");
  }
  
  @GetMapping("/main/main2")
  public void doMember() {
    log.info("회원만 접근 가능");
  }
  
  @GetMapping("/main/main3")
  public void doAdmin() {
    log.info("관리자만 접근 가능");
  }
}
