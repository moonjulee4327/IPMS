package com.ipms.main.mypage.inviteAndApply.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ipms.main.login.vo.MemberAuth;
import com.ipms.main.mypage.inviteAndApply.service.InviteAndApplyService;
import com.ipms.main.mypage.mapper.MyPageMapper;
import com.ipms.main.newProject.mapper.ProjMapper;
import com.ipms.main.newProject.vo.ProjMemVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class InviteAndApplyServiceImpl implements InviteAndApplyService {
    @Autowired
    MyPageMapper myPageMapper;
    @Autowired
    ProjMapper projMapper;

    @Transactional
    public int approval(ProjMemVO projMemVO) {
        if (this.myPageMapper.approvalJoiningProject(projMemVO) == 1) {
            MemberAuth memberAuth = new MemberAuth();
            memberAuth.setMemCode(projMemVO.getMemCode());
            memberAuth.setProjId(projMemVO.getProjId());
            memberAuth.setMemAuth("ROLE_PROJECT");
            this.projMapper.projAuthInsert(memberAuth);
            return 1;
        }
        return 0;
    }

    @Override
    public List<ProjMemVO> memberWhoApplied(String memCode) {
        return this.myPageMapper.memberWhoApplied(memCode);
    }

    @Override
    public List<ProjMemVO> projectsApplied(String memCode) {
        return this.myPageMapper.projectsApplied(memCode);
    }

    @Override
    public String getMemCode(String memEmail) {
        return this.myPageMapper.getMemCode(memEmail);
    }

    @Override
    public int approvalJoiningProject(ProjMemVO projMemVO) {
        return this.myPageMapper.approvalJoiningProject(projMemVO);
    }


    @Override
    public int companionProject(ProjMemVO projMemVO) {
        return this.myPageMapper.companionProject(projMemVO);
    }
}