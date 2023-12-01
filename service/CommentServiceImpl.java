package com.travel.seoul.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.travel.seoul.mapper.CommentMapper;
import com.travel.seoul.vo.CommentVO;

import lombok.Setter;

@Service
@Transactional
public class CommentServiceImpl implements CommentService {
	@Setter(onMethod_ = @Autowired)
	CommentMapper cmapper;

	@Override
	public List<CommentVO> getCommentList() {
		return cmapper.getCommentList();
	};

	@Override
	public void commentInsert(CommentVO comment) {
		System.out.println("댓글 서비스 : " + comment);
		cmapper.commentInsert(comment);
	}

	@Override
    public int deleteComment(long co_num) {
        return cmapper.deleteComment(co_num);
    }

    @Override
    public void updateComment(CommentVO comment) {
        cmapper.updateComment(comment);
    }

	@Override
	public List<CommentVO> getCommentListByBoardNum(long board_num) {
		return cmapper.getCommentListByBoardNum(board_num);
	}



}
