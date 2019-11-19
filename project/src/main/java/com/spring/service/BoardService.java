package com.spring.service;

import java.util.List;

import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;

public interface BoardService {
  
  public BoardVO get(Long idx);
  
  public boolean modify(BoardVO board);
  
  public boolean remove(Long idx);
  
  //public List<BoardVO> getList();
  
   public List<BoardVO> getList(Criteria cri); 
  
  public void register(BoardVO board);
  
  public int getTotal(Criteria cri);
}
