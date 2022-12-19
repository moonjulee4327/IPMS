package com.ipms.proj.docs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
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
import org.springframework.web.multipart.MultipartFile;
import com.ipms.commons.ftp.FtpUtil;
import com.ipms.commons.vo.IntgAttachFileVO;
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
	 * 문서함의 폴더 조회(DB만)
	 * @param projId : 추후 프로젝트 구성원 ID 받을 것
	 * @param model
	 * @return 문서함 최상위
	 */
	@GetMapping("/docs")
	public String docs(@ModelAttribute DocsVO docsVO, Model model, @RequestParam(required = false) String foldName) {
		
		// DB로만 구현
//		docsVO.setProjId("P001");
//		
//		List<DocsVO> docsList = docsService.selectDocs(docsVO);
//		
//		if( !docsList.isEmpty() && docsList != null ) {
//			log.info("DocsController - docs() : st -> {}", docsList.get(0).getFoldName());
//		}else {
//			FtpUtil.ftpDocsMkdir("/", docsVO.getProjId());
//			docsVO.setFoldName(docsVO.getProjId());
//			docsService.insertFolder(docsVO);
//		}
//		
//		model.addAttribute("docsList", docsList);
		
		// FTPClient 내장 메소드 사용
		List<DocsVO> docsList = null;
		List<IntgAttachFileVO> fileList = null;
		log.info("DocsController - docs -> foldName : {}", foldName);
		
		if(foldName != null) {
			docsList = FtpUtil.ftpGetDir("/" + foldName);
			fileList = FtpUtil.ftpGetFile("/" + foldName);
		}else {
			docsList = FtpUtil.ftpGetDir("/");
			fileList = FtpUtil.ftpGetFile("/");
		}
		
		model.addAttribute("docsList", docsList);
		model.addAttribute("fileList", fileList);
		
		return "proj/docs/docsList";
	}
	
	
	/**
	 * 문서함 폴더 생성
	 * @param foldName : 추후 VO로 받을 것
	 * @return 문서함 최상위로 리턴 추후, 폴더를 생성한 폴더로 바꿔주기
	 */
	@ResponseBody
	@PostMapping("/docsMkdir")
	public boolean insertFolder(String path, String newFoldName) {
		
		if( newFoldName != "" || newFoldName != null ) {
			log.info("DocsController - insertFolder() : newFoldName -> {}", newFoldName);
		}
		
		if( path != "" || path != null ) {
			log.info("DocsController - insertFolder() : path -> {}", path);
		}
		
		boolean flag = FtpUtil.ftpDocsMkdir(path, newFoldName);
		
//		int result = docsService.insertFolder(docsVO);
//		
//		if(result > 0) {
//			log.info("DocsController - insertFolder() : 폴더 생성 완료");
//		}else {
//			log.info("DocsController - insertFolder() : 폴더 생성 실패!!!");
//		}
		
//		return "redirect:/proj/docs";
		return flag;
		
	}
	
	/**
	 * 파일 업로드
	 * @param docsFile
	 * @return
	 */
	@PostMapping("/docsFileUpload")
	public String docsFileUpload(MultipartFile docsFile) {
		
		if( docsFile != null && !docsFile.isEmpty() ) {
			log.info("DocsController - docsFileUpload() : uploadFile.getOriginalFilename() -> {}", docsFile.getOriginalFilename());
		}
		
		docsService.fileUpload(docsFile);
		
		return "redirect:/proj/docs";
	}
	
	
}
