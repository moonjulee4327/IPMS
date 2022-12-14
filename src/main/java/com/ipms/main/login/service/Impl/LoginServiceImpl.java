package com.ipms.main.login.service.Impl;

import com.ipms.main.login.service.LoginService;
import com.ipms.main.login.vo.MemVO;
import com.ipms.main.login.mapper.MemMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {
    @Autowired
    MemMapper memMapper;
    public  int loginMem(MemVO memvo ){
        return  this.memMapper.loginMem( memvo);
    }
}
