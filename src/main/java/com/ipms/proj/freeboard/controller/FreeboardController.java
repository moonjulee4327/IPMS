package com.ipms.proj.freeboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/proj")
public class FreeboardController {

	@GetMapping("/freeboard")
	public String freeboard() {
		return "proj/freeboard/freeBoard";
	}
	
	@GetMapping("/freeBoardInsert")
	public String freeInsert() {
		return "proj/freeboard/freeBoardInsert";
	}
		
	
}
