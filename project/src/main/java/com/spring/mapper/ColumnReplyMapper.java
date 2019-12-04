package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.Criteria;
import com.spring.domain.ReplyVO;

public interface ColumnReplyMapper {

  
   public int insert(ReplyVO vo);
   
   public ReplyVO read(Long idx);
   
   public int delete(Long rno);
   
   public int update(ReplyVO reply);
   
   public List<ReplyVO> getListWithPaging(
        @Param("cri") Criteria cri,
        @Param("idx") Long idx
   );
   
   public int getCountByidx(Long bno);
  
}
