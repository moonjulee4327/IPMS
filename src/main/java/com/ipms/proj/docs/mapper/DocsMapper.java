package com.ipms.proj.docs.mapper;

import java.util.List;

import com.ipms.proj.docs.vo.DocsVO;

public interface DocsMapper {
	
	// 폴더 생성
	public int insertFolder(DocsVO docsVO);
	
	// 폴더 조회 
	public List<DocsVO>selectDocs(String projId);
	
}
