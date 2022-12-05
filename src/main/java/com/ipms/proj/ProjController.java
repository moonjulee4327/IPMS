package com.ipms.proj;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/proj")
@Slf4j
@Controller
public class ProjController {

	@GetMapping("/dashboard")
	public String projMain() {
		return "proj/dashboard";
	}
	
	@GetMapping("/settingManagement")
	public String setProj() {
		return "proj/settingManagement";
	}
	
}
