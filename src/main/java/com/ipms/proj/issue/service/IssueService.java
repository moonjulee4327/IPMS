package com.ipms.proj.issue.service;

import java.util.List;

import com.ipms.commons.vo.Criteria;
import com.ipms.commons.vo.PageVO;
import com.ipms.proj.issue.vo.IssueVO;

public interface IssueService {
	
	public List<IssueVO> taskListSelect();
	
	public int IssueDataInsert(IssueVO vo);
	
	public List<IssueVO> IssueListSelect();
	
	public List<IssueVO> issuePage(Criteria criteria);
	
	public int totalNum();
	
	public IssueVO IssueDetail(IssueVO vo);
	
	public int MaxFileNumSelect(IssueVO vo);

}
