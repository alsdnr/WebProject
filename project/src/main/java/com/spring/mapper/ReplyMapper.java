package com.spring.mapper;

import com.spring.domain.ReplyVO;

public interface ReplyMapper {

  
   public int insert(ReplyVO vo);
   
   public ReplyVO read(Long idx);
   
   public int delete(int idx);
   
   public int update(ReplyVO reply);
   
   public int getCountByBno(Long bno);
  
}
