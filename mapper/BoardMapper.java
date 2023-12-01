package com.travel.seoul.mapper;
import com.travel.seoul.vo.BoardVO;
import com.travel.seoul.vo.Criteria;

import java.util.List;

public interface BoardMapper {
	public List<BoardVO> getBoardList();
	public void insert(BoardVO boardVO);
	public int update(BoardVO boardVO);
	public void boardInsert(BoardVO board);
	public BoardVO getBoardByNum(long num);
	public int getNextNum();
	public int delete(long num);
	public int visitCount(long num);
	public List<BoardVO> getListPaging(Criteria cri);
	public int getListPaingTotal();
}
