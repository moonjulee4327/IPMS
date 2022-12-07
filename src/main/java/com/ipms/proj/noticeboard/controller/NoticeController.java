package com.ipms.proj.noticeboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/proj")
public class NoticeController {

	@GetMapping("/noticeboard")
	public String noticeBoard() {
		return "proj/noticeboard/noticeBoard";
	}
		
	
}
