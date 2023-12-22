package com.travel.seoul.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class AttachFileVO {
	private String fileName;
	private String uploadPath;
	private String uuid;
	private Long userSerial;
}
