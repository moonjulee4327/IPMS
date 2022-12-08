package com.ipms.main.admin.customerServiceManagement.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/main")
@Controller
public class CustomerServiceManaController {

	@GetMapping("/customerServiceMana")
	public String CustomerServiceMana() {
		return "main/admin/customerServiceMana";
	}
}
