package com.spring.service;

import java.util.List;

import com.spring.domain.Criteria;
import com.spring.domain.ReplyPageDTO;
import com.spring.domain.ReplyVO;

public interface ColumnReplyService {
  
  public int register(ReplyVO vo);
  
  public ReplyVO get(Long rno);
  
  public int modify(ReplyVO vo);
  
  public int remove(Long rno);
  
  public List<ReplyVO> getList(Criteria cri, Long idx);
  
  public ReplyPageDTO getListPage(Criteria cri, Long idx);
}
