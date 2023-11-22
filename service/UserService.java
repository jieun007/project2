package com.travel.seoul.service;

import java.util.List;

import com.travel.seoul.vo.UserVO;

public interface UserService {
	void insert(UserVO vo);
	List<UserVO> list();
	int delete(Long userSerial);
	int update(UserVO vo);
}
