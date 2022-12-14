package com.ipms.proj.task.vo;

import java.util.Date;

import lombok.Data;

@Data
public class TaskVO {
	private String classification; // 일감 구분
	private String taskId; // 일감 아이디
	private String projId; // 프로젝트 아이디
	private String memCode; // 회원 코드
	private String taskTitle; // 일감 제목
	private String taskCts; //  일감 내용
	private Date taskStrtDate; // 일감 시작일자
	private Date taskEndDate; // 일감 종료일자
	private String taskStusCode; // 일감 상태 코드
	private int taskPgres; // 진척도
	private String highTaskId; //  상위 일감 아이디
	private int lowRgstSeq; // 하위 등록 순서
	private String aprovWhth; // 승인 여부
	private String taskRepre; // 담당자
	private String deleteYn; // 삭제 여부
	private String referCts; // 반려 내용
	
}
