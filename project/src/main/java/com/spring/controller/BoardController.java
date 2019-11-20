package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;
import com.spring.domain.PageDTO;
import com.spring.service.BoardService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
public class BoardController {
  @Autowired
  private BoardService service;
  
  
   @GetMapping("/list")
   public void list(Criteria cri, Model model) { 
     log.info("list" + cri);
   model.addAttribute("list", service.getList(cri)); 
   int total = service.getTotal(cri); 
   log.info("total" + total);
   model.addAttribute("pageMaker", new PageDTO(cri, total)); }
  
  
  /*@GetMapping("/list")
  public void list(Model model) {
    log.info("list");
    model.addAttribute("list", service.getList());
  }*/
  
  @PostMapping("/register")
  public String register(BoardVO board, RedirectAttributes rttr) {
    log.info("register:" + board);
    service.register(board);
    rttr.addFlashAttribute("result", board.getIdx());
    
    return "redirect:/board/list";
  }
  
  @GetMapping({"/get","/modify"})
  public void get(@RequestParam("idx") Long idx, Model model) {
    log.info("/get or modify");
    model.addAttribute("board", service.get(idx));
  }
  
  @PostMapping("/modify")
  public String modify(BoardVO board, RedirectAttributes rttr) {
    log.info("modify:" + board);
    
    if(service.modify(board) ) {
      rttr.addFlashAttribute("result", "success");
    }
    return "redirect:/board/list";
  }
  @PostMapping("/remove")
  public String remove(@RequestParam("idx") Long idx, RedirectAttributes rttr) {
    log.info("remove" + idx);
    if(service.remove(idx)) {
      rttr.addFlashAttribute("result", "success");
    }
    return "redirect:/board/list";
  }
  
  /*
   * @GetMapping(value = "/listA", produces = {
   * MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE })
   * public BoardVO listAj(Model model) { }
   */
  
  @GetMapping("/register")
  public void register() {
    
  }
}
