package com.travel.seoul.service;

import java.util.List;

import com.travel.seoul.vo.CommentVO;

public interface CommentService {
	public List<CommentVO> getCommentList();
	public void commentInsert(CommentVO comment);
	public int deleteComment(long co_num);
	public void updateComment(CommentVO comment);
	List<CommentVO> getCommentListByBoardNum(long board_num);
}
