package com.ipms.proj.docs.controller;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ipms.commons.ftp.FtpUtil;
import com.ipms.commons.vo.FtpVO;
import com.ipms.proj.docs.vo.DocsVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/proj")
@Controller
public class DocsTestController {
	
	@GetMapping("/test")
	public String view() {
		return "proj/docs/test";
	}
	
	
	@ResponseBody
	@GetMapping("/docTest")
	public List<FtpVO> docsTests(@RequestParam String path) {
		
		List<FtpVO> docsList = null;
		docsList = FtpUtil.getList(path);
		
		return docsList;
	}
	
	@ResponseBody
	@PostMapping("/dirDocTest")
	public boolean makeDirTests(String path, String dirName) {
		
		String nowPath = "";
		
		if(StringUtils.isNotBlank(path)) {
			nowPath += "/" + path;
		}
		
		boolean check = FtpUtil.isDirectoryExist(nowPath, dirName);
		boolean result = false;
		// 같은 이름의 폴더가 없다면
		if(!check) {
			// 폴더를 생성합니다.
			result = FtpUtil.createDirectory(nowPath, dirName);
		}
		
		// 성공적으로 마치면 true 반환
		return result;
	}
	
	@ResponseBody
	@PostMapping("/uploadFileTest")
	public boolean uploadFile(MultipartFile[] docsFile, String path) {
		
		String savePath = "";
		
		if(StringUtils.isNotBlank(path) || docsFile.length > 0 || docsFile != null) {
			log.info("DocsTestController - uploadFile -> path : {}", path);
			log.info("DocsTestController - uploadFile -> docsFile.length : {}", docsFile.length);
			savePath += path;
		}
		
		
		for(int i=0; i < docsFile.length; i++) {
			FtpUtil.uploadToFtp(savePath, docsFile[i].getOriginalFilename(), docsFile[i]);
		}
		
		return true;
	}
	
	
	
	
}
