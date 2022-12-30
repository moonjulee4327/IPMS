package com.ipms.main.admin.projManagement.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ipms.main.admin.projManagement.service.ProjManagementService;
import com.ipms.main.admin.projManagement.vo.ProjManaVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/main")
@Controller
public class ProjManagementController {

	@Autowired
	ProjManagementService projManagementService;
	
	@GetMapping("/projManagement")
	public String adminProjList(Model model) {

		List<ProjManaVO> ProjManaVO = this.projManagementService.adminProjList();
		
		log.info("ProjManaVO: " + ProjManaVO);
		
		model.addAttribute("ProjManaVO", ProjManaVO);
		
		return "main/admin/projManagement";

	}
	
	@GetMapping("/adminProjDetail")
	public String adminProjDetail(@ModelAttribute ProjManaVO projManaVO, Model model) {
		
		ProjManaVO data = this.projManagementService.adminProjDetail(projManaVO);
		
		log.info("proj detail-------> " + data.toString());
		
		model.addAttribute("data", data);
		
		return "main/admin/adminPopUp/adminProjDetail";
	}
	
	
	
}