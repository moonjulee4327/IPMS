package com.ipms.proj.docs.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.ipms.proj.docs.vo.DocsVO;

public interface DocsService {
	
	// 폴더 조회 
	public List<DocsVO>selectDocs(DocsVO docsVO);
	
	// 폴더 생성
	public int insertFolder(DocsVO docsVO);
	
	// 파일 업로드
	public void fileUpload(MultipartFile docsFile);
}
