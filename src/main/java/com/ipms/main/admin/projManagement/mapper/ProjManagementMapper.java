package com.ipms.main.admin.projManagement.mapper;

import java.util.List;

import com.ipms.main.admin.projManagement.vo.ProjManaVO;

public interface ProjManagementMapper {
	
	public List<ProjManaVO> adminProjList(); 	// 프로젝트 리스트
	
	public ProjManaVO adminProjDetail(ProjManaVO projManaVO);

}
