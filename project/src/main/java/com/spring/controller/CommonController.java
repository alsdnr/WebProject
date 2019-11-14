package com.spring.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/main")
public class CommonController {
  
  @GetMapping("/accessError")
  public void accessDenied(Authentication auth, Model model) {
    log.info("접근 거부" + auth);
    model.addAttribute("msg", "WARN : 접근할 수 없습니다.");
  }
  
  @GetMapping("/login")
  public void loginInput(String error, String logout, Model model) {
    log.info("error: " + error);
    log.info("logout: " + logout);
    
    if(error != null) {
      model.addAttribute("error", "아이디or비밀번호를 다시 입력하세요");
    }
    
    if(logout != null) {
      model.addAttribute("logout", "로그아웃");
    }
  }
  
  @GetMapping("/logout")
  public String logoutGET() {
    log.info("logout");
    
    return "redirect:/";
  }
}
