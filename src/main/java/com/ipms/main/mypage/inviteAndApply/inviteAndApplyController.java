package com.ipms.main.mypage.inviteAndApply;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/main")
@Controller
public class inviteAndApplyController {
	
	@GetMapping("/inforManagement")
	public String infor() {
		
		return "main/mypage/inforManagement/inforManagement";
	}
}
