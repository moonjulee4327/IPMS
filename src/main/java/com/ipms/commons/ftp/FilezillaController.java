package com.ipms.commons.ftp;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/proj")
@Controller
public class FilezillaController {

	@GetMapping("/fileTest")
	public String filezillaTest() {
		return "proj/docs/docs";
	}
	
	
	@PostMapping("/fileUploadTest")
	public String fileUploadTest(MultipartFile fileTest) throws IOException {
		
		log.info("fileTest SIZE : " + fileTest.getSize());
		
		File revFile = new File(fileTest.getOriginalFilename());
		
		FilezillaUtil.FTPUploader("192.168.42.53", 21, "mjmj", "java", revFile);
		log.info("여기 들어옴!");
		
		return "redirect:/proj/docs";
	} 
	
	
	
}
