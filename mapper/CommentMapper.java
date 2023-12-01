package com.travel.seoul.mapper;

import java.util.List;

import com.travel.seoul.vo.CommentVO;

public interface CommentMapper {
	public List<CommentVO> getCommentList();
	public void commentInsert(CommentVO comment);
	public int deleteComment(long co_num);
	public void updateComment(CommentVO comment);
	List<CommentVO> getCommentListByBoardNum(long board_num);
}
