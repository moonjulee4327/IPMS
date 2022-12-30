package com.ipms.main.admin.adminServiceCenter.adminSvcQaA.mapper;

import java.util.List;

import com.ipms.commons.vo.Criteria;
import com.ipms.main.admin.adminServiceCenter.adminSvcQaA.vo.AdminSvcQaAVO;

public interface AdminSvcQaAMapper {
	
	// 관리자 Q&A 조회(페이지 가능)
	public List<AdminSvcQaAVO> adminSvcQaASelect(Criteria criteria);
	
	// 페이징을 위한 총 개수 조회
	public int adminTotal();
	
	// Q&A 디테일 페이지
	public AdminSvcQaAVO adminSvcQaADetail(String qnaNum);

}
