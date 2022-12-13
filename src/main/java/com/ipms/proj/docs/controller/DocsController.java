package com.ipms.proj.docs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ipms.commons.ftp.FtpUtil;
import com.ipms.commons.ftp.FtpUtilHome;
import com.ipms.proj.docs.service.DocsService;
import com.ipms.proj.docs.vo.DocsVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/proj")
@Controller
public class DocsController {
	
	@Autowired
	private DocsService docsService;
	
	/**
	 * 문서함의 폴더 조회 
	 * @param projId : 추후 프로젝트 구성원 ID 받을 것
	 * @param model
	 * @return
	 */
	@GetMapping("/docs")
	public String docs(String projId, Model model) {
		
		projId = "P001";
		
		List<DocsVO> docsList = docsService.selectDocs(projId);
		
		if( !docsList.isEmpty() && docsList != null ) {
			log.info("여기 들어온다 : {}",docsList.get(0).getFoldName());
		}
		
		model.addAttribute("docsList", docsList);
		
		return "proj/docs/docsList";
	}
	
	@GetMapping("/insertDocs")
	public String insertDocs() {
		return "proj/docs/insertDocsForm";
	}
	
	/**
	 * 폴더 생성
	 * @param foldName : 추후 VO로 받을 것
	 * @return docsList
	 */
	@PostMapping("/docsMkdir")
	public String insertFolder(@ModelAttribute DocsVO docsVO) {
		if( docsVO != null ) {
			log.info("docsVO : {}", docsVO.getFoldName());
		}
		
		int result = docsService.insertFolder(docsVO);
		
		if(result > 0) {
			log.info("폴더 생성 완료");
		}else {
			log.info("폴더 생성 실패!!!");
		}
		
		return "redirect:/proj/docs";
		
	}
	
	
}
