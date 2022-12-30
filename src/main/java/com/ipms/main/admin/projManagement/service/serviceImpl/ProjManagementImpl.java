package com.ipms.main.admin.projManagement.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ipms.main.admin.projManagement.mapper.ProjManagementMapper;
import com.ipms.main.admin.projManagement.service.ProjManagementService;
import com.ipms.main.admin.projManagement.vo.ProjManaVO;

@Service
public class ProjManagementImpl implements ProjManagementService {
	
	@Autowired
	ProjManagementMapper projManagementMapper;

	@Override
	public List<ProjManaVO> adminProjList() {
		
		return this.projManagementMapper.adminProjList();
	}

	@Override
	public ProjManaVO adminProjDetail(ProjManaVO projManaVO) {
		
		return this.projManagementMapper.adminProjDetail(projManaVO);
	}
	
	

}
