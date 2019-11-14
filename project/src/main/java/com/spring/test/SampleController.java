package com.spring.test;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.domain.SampleVO;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/sample")
@Log4j
public class SampleController {
  
  @GetMapping(value="/getText", produces="text/plain; charset=UTF-8")
  public String getText() {
    log.info(MediaType.TEXT_PLAIN_VALUE);
    
    return "hi";
  }
  
  @GetMapping(value = "/getSample", 
      produces = { MediaType.APPLICATION_JSON_UTF8_VALUE,
      MediaType.APPLICATION_XML_VALUE })
  public SampleVO getSample() {

    return new SampleVO(112, "스타", "로드");

  }
}
