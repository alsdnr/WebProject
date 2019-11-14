package com.spring.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
  private Long idx;
  private String title;
  private String content;
  private String writer;
  private Date regdate;
}
