package com.ipms.main.mypage.inviteAndApply.service;

import com.ipms.main.newProject.vo.ProjMemVO;

import java.util.List;

public interface InviteAndApplyService {
    public List<ProjMemVO> memberWhoApplied(String memCode);

    public List<ProjMemVO> projectsApplied(String memCode);

    public String getMemCode(String memEmail);

    public int approvalJoiningProject(ProjMemVO projMemVO);

    public int companionProject(ProjMemVO projMemVO);

    public int approval(ProjMemVO projMemVO);
}
