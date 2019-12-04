package com.spring.mapper;

import java.util.List;

import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;


public interface BoardMapper {
  
  //@Select("select * from tbl_board where idx>0")
  //public List<BoardVO> getList();
  
  public List<BoardVO> getListWithPaging(Criteria cri); 
  
  public void insert(BoardVO board);
  
  public BoardVO read(Long idx);
  
  public int delete(Long idx);
  
  public int update(BoardVO board);
  
  public int getTotalCount(Criteria cri);
  
  public int updateViewCnt(Long idx);
}
