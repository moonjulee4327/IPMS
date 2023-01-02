package com.ipms.main.mypage.portfolio.service;

import java.util.List;

import com.ipms.main.mypage.portfolio.vo.PortfolioVO;

public interface PortfolioService {
	
	// 완성된 프로젝트 리스트 조회
	public List<PortfolioVO> completeProjSelect(String memCode);
	
	// 진행 중인 프로젝트 리스트 조회
	public List<PortfolioVO> proceedingProjSelect(String memCode);

}
