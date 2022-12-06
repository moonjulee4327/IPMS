package com.ipms.main.mypage.portfolio;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/main")
@Controller
public class portfolioController {
	
	@GetMapping("/portfolio")
	public String portfolio() {
		
		return "main/mypage/portfolio/portfolio";
	}
}
