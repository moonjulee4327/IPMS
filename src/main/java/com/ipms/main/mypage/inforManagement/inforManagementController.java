package com.ipms.main.mypage.inforManagement;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping("/main")
@Controller
public class inforManagementController {
	
	@GetMapping("/inviteAndApply")
	public String inviteOrApply() {
		
		return "main/mypage/inviteAndApply/inviteAndApply";
	}
}