package com.ipms.main.admin.projManagement.service;

import java.util.List;

import com.ipms.main.admin.projManagement.vo.ProjManaVO;

public interface ProjManagementService {

	public List<ProjManaVO> adminProjList();
	
	public ProjManaVO adminProjDetail(ProjManaVO projManaVO);
}

