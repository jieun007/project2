package com.travel.seoul.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.travel.seoul.mapper.UserMapper;
import com.travel.seoul.vo.UserVO;

import lombok.Setter;

@Service
public class UserServiceImpl implements UserService{
	
	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;
	
	@Override
	public void insert(UserVO vo) {
		System.out.println("서비스에서 추가 : " + vo);
		mapper.insert(vo);
		
	}

	@Override
	public List<UserVO> list() {
		System.out.println("서비스에서 전체 목록 조회");
		return mapper.list();
	}

	@Override
	public int delete(Long userSerial) {
		System.out.println("서비스에서 삭제 : "+userSerial);
		return mapper.delete(userSerial);
	}

	@Override
	public int update(UserVO vo) {
		System.out.println("서비스에서 수정 : "+vo);
		return mapper.update(vo);
	}

	@Override
	public boolean selectID(String userID) {
		System.out.println("아이디 중복 확인");
		return mapper.selectID(userID);
	}

}
