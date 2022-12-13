package com.ipms.main.login.controller;

import com.ipms.main.login.service.LoginService;
import com.ipms.main.vo.MemVO;
import com.ipms.mapper.MemMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import lombok.extern.slf4j.Slf4j;

import javax.servlet.http.HttpSession;

@Slf4j
@RequestMapping("/main")
@Controller
public class LoginController {
    @Autowired
    LoginService loginService;
    @Autowired
    MemMapper memMapper;
    @GetMapping("/loginForm")
    public String loginForm() {
        return "main/login/loginForm";
    }

    // 비밀번호 찾기
    @RequestMapping(value = "fgtPwd", method = RequestMethod.GET)
    public String ForgotPwd() {
        return "main/ForgotPassword/fgtPwd";
    }

    //로그인  POST
    @RequestMapping(value = "/loginPost", method = RequestMethod.POST)
    public String loginPost(@ModelAttribute MemVO memvo , @RequestParam String email) {
log.info("=================================");
         int result = this.loginService.loginMem( memvo);

        if (result==1) {
            return "redirect:/main/loginMain";
        } else {
           log.info("=====================");
            return "redirect:/main/loginForm";
        }
    }

    //로그인 메인페이지
    @GetMapping("/loginMain")
    public String asd(){
        return "main/login/loginMain";
    }

    @PostMapping(value = "")
    public String getPwd(){
        return "";
    }

}
