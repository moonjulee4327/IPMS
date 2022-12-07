package com.ipms.main.systemMypage.memManagement.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/main")
@Controller
public class AdminMemManagementController {

	@GetMapping("/adminMemberManagement")
	public String memberMana() {
		
		return "proj/systemMypage/adminMemManagement";
	}
}