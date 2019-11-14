package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.AuthVO;
import com.spring.domain.MemberVO;
import com.spring.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
@AllArgsConstructor
public class MemberController {

  @Autowired
  BCryptPasswordEncoder passwordEncoder;
  
  private MemberService service;
  
  @PostMapping("/list")
  public void list(Model model) {
    log.info("list");
    model.addAttribute("list", service.getList());
  }
  
  @PostMapping("/register")
  public String register(MemberVO member, AuthVO auth, RedirectAttributes rttr) {
    log.info("register" + member);
    String encPwd = passwordEncoder.encode(member.getPw());
    member.setPw(encPwd);
    service.register(member, auth);
    rttr.addFlashAttribute("result", member.getEmail());
    return "redirect:/";
  }
  
  
  @PostMapping("/get")
  public void get(@RequestParam("email") String email, Model model) {
    log.info("/get");
    model.addAttribute("member", service.get(email));
  }
  
  @PostMapping("/modify")
  public String modify(MemberVO member, RedirectAttributes rttr) {
    log.info("modify" + member);
    if(service.modify(member)) {
      rttr.addFlashAttribute("result", "success");
    }
    return "redirect:/member/list";
  }
  
  @PostMapping("/remove")
  public String remove(@RequestParam("email") String email, RedirectAttributes rttr) {
    log.info("remove" + email);
    if(service.remove(email)) {
      rttr.addFlashAttribute("result", "success");
    }
    return "redirect:/member/list";
  }
  
  @GetMapping("/register") 
  public void register() {
    
  }
}
