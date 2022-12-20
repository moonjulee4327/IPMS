package com.ipms.proj.docs.controller;

import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ipms.commons.ftp.FtpUtil;
import com.ipms.commons.vo.FtpVO;
import com.ipms.proj.docs.vo.DocsVO;

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
	
}
