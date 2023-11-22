package com.travel.seoul.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class UserVO {
    private Long userSerial;
    private String userID;
    private String userPassword;
    private String userBirth;
    private String userSex;
    private String userArea;
}
