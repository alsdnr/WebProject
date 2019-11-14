package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;
import com.spring.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImp implements BoardService{
  
  @Setter(onMethod_ = @Autowired)
  private BoardMapper mapper;
  
  @Override
  public BoardVO get(Long idx) {
    log.info("get");
    return mapper.read(idx);
  }

  @Override
  public boolean modify(BoardVO board) {
    log.info("modify"+board);
    return mapper.update(board) == 1;
  }

  @Override
  public boolean remove(Long idx) {
    log.info("remove"+idx);
    return mapper.delete(idx) == 1;
  }

  /*
   * @Override public List<BoardVO> getList(Criteria cri) {
   * log.info("getList criteria :"+ cri);
   * 
   * return mapper.getListWithPaging(cri); }
   */
  
  @Override
  public List<BoardVO> getList() {
    log.info("getList");
    
    return mapper.getList();
  }

  @Override
  public void register(BoardVO board) {
    log.info("register"+board);
    mapper.insert(board);
  }
  
  @Override  
  public int getTotal(Criteria cri) {
    log.info("get total count");
    
    return mapper.getTotalCount(cri);
  }
}
