package com.ipms.main.serviceCenter.svcQaA.vo;

import java.util.Date;

import lombok.Data;

@Data
public class SvcQaAVO {
	
	private int qnaNum; // Q&A 번호
	private String writer; // 작성자
	private String qnaTitle; // Q&A 제목
	private String qnaCts; // Q&A 내용
	private Date qnaWriteDate; // 작성일자
	
}
