package com.travel.seoul.service;

import java.util.List;

import com.travel.seoul.vo.BoardVO;
import com.travel.seoul.vo.Criteria;

public interface BoardService {
	public List<BoardVO> getBoardList();
	public void insert(BoardVO board);
	public int update(BoardVO board);
	public int delete(long num);
	public BoardVO getBoardByNum(long num);
	public int getNextNum();
	public int visitCount(long num);
	public List<BoardVO> getListPaging(Criteria cri);
	public int getListPaingTotal();
}
