package com.travel.seoul.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.travel.seoul.mapper.BoardMapper;
import com.travel.seoul.vo.BoardVO;
import com.travel.seoul.vo.Criteria;

import lombok.Setter;

@Service
@Transactional
public class BoardServiceImpl implements BoardService{
	
	@Setter(onMethod_ = @Autowired)
	BoardMapper bmapper;

	@Override
	public List<BoardVO> getBoardList() {
		return bmapper.getBoardList();
	}

	@Override
	public void insert(BoardVO board) {
		System.out.println("서비스에서 추가 : "+board);
		bmapper.insert(board);
		
	}


	@Override
	public BoardVO getBoardByNum(long num) {
		System.out.println("서비스에서 게시글 하나 가져오기 :" +num);
		return bmapper.getBoardByNum(num);
	}

	@Override
	public int getNextNum() {
		int maxNo = bmapper.getNextNum();
		System.out.println("여기는 서비스 : 게시글 마지막 번호 :" +maxNo);
		return bmapper.getNextNum();
	}

	@Override
	public int update(BoardVO board) {
		System.out.println("서비스에서 수정 : "+board);
		return bmapper.update(board);
	}

	@Override
	public int delete(long num) {
		System.out.println("서비스에서 삭제 : "+num);
		return bmapper.delete(num);
	}

	@Override
	public int visitCount(long num) {
		return bmapper.visitCount(num);
	}

	@Override
	public List<BoardVO> getListPaging(Criteria cri) {
		return bmapper.getListPaging(cri);
	}

	@Override
	public int getListPaingTotal() {
		return bmapper.getListPaingTotal();
	}

}
