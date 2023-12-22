package com.travel.seoul.vo;

import lombok.Data;

@Data
public class BoardVO {
	private long num;
	private String title;
	private String content;
	private String id;
	private String pw;
	private String postdate;
	private long visitcount;
	
}
