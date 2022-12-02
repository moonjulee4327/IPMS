package com.ipms;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/main")
@Slf4j
@Controller
public class MainController {

	
	@GetMapping("/index")
	public String hello() {
		return "main/index";
	}
	
}
