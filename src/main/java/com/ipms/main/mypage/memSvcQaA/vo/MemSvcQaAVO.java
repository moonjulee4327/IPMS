package com.ipms.main.mypage.memSvcQaA.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MemSvcQaAVO {
	
	private long qnaNum;
	private String writer;
	private String qnaTitle;
	private String qnaCts;
	private Date qnaWriteDate;
	
}
