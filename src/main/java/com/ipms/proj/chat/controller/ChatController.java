package com.ipms.proj.chat.controller;


import java.util.List;

import javax.servlet.annotation.MultipartConfig;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ipms.commons.ftp.vo.IntgAttachFileVO;
import com.ipms.proj.chat.service.ChatService;
import com.ipms.proj.chat.vo.ChatVO;
import com.ipms.util.FileUploadUtil;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/proj")
@Controller
public class ChatController {
	
	@Autowired
	ChatService chatService;
	
	@GetMapping("/{projId}/chat")
	public String chat2(@PathVariable(name = "projId") String projId,Model model,String memId) {

		log.info("projId: "+projId);
		ChatVO chatVO = new ChatVO();
		chatVO.setChatRoomId(projId);
		chatVO.setWriter(memId);
		List<ChatVO> chatList = chatService.selectChat(chatVO);
		log.info("list: "+chatList.toString());
		
		model.addAttribute("chatList",chatList);
		model.addAttribute("memId",memId);
		model.addAttribute("projId",projId);
		return "chat/chat";
	}
	
	@ResponseBody
	@PostMapping("/{projId}/sendFile")
	public List<IntgAttachFileVO> sendFile(MultipartFile[] uploadFile,ChatVO chatVO) {
		log.info("multi: "+uploadFile[0].getOriginalFilename());
		log.info("chatVO: "+chatVO.toString());
		
		//int result = chatService.insertChat(chatVO);
		List<IntgAttachFileVO> list = FileUploadUtil.fileUploadAction(uploadFile,chatVO.getChatRoomId(), chatVO.getWriter());
		for(int i = 0;i<list.size();i++) {
			int attachNum = chatService.selectChatNum();
			chatVO.setItgrnAttachFileNum(attachNum);
			log.info("attachNum을 넣은 후: "+chatVO.toString());
			int result = chatService.insertChat(chatVO);
			list.get(i).setIntgAttachFileNum(Integer.toString(attachNum));
			chatService.insertAttach(list.get(i));
			}
		
		log.info("처리후 데이터: "+list.toString());
		return list;
	}
}
