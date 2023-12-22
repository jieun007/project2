package com.travel.seoul.mapper;

import java.util.List;

import com.travel.seoul.vo.AttachFileVO;


public interface BoardAttachMapper {
	public void insert(AttachFileVO vo);
	public void delete(String uuid);
	public List<AttachFileVO> findByuserSerial(Long userSerial);
	public void deleteAll(Long userSerial);
}
