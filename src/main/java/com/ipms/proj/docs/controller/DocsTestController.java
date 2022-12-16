package com.ipms.proj.docs.controller;

import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ipms.commons.ftp.FtpUtil;
import com.ipms.proj.docs.vo.DocsVO;

@Controller
public class DocsTestController {
	
	@GetMapping("/test")
	public String view() {
		return "proj/docs/test";
	}
	
	
	@ResponseBody
	@GetMapping("/docTest")
	public List<DocsVO> docsTests() {
		
		List<DocsVO> docsList = null;
		docsList = FtpUtil.ftpGetDir("/");
		
		return docsList;
	}
}
