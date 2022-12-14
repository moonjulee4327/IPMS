package com.ipms.main.login.vo;

import lombok.Data;

import java.util.Date;
import java.util.List;

/**
 * @author KMG
 */
@Data
public class MemVO {
    private String memCode;//회원번호
    private String memEmail;//이메일
    private String memPasswd;//비밀번호
    private String memName;//이름
    private String memPhoneNumber;//전화번호
    private Date memSgnupDate; //가입일자
    private String memWhdrlWhth;//탈퇴여부
    private String memImgRoute;//프로필

    private List<MemberAuth> memAuthList;//N+1
}
