package com.spring.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class Criteria {

  private int pageNum;
  private int amount;
  
  private String type;
  private String keyword;

  public Criteria() {
    this(1, 9);
  }

  public Criteria(int pageNum, int amount) {
    this.pageNum = pageNum;
    this.amount = amount;
  }
 
}