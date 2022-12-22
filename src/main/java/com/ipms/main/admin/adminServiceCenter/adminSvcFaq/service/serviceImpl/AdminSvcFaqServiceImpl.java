package com.ipms.main.admin.adminServiceCenter.adminSvcFaq.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ipms.commons.vo.Criteria;
import com.ipms.main.admin.adminServiceCenter.adminSvcFaq.mapper.AdminSvcFaqMapper;
import com.ipms.main.admin.adminServiceCenter.adminSvcFaq.service.AdminSvcFaqService;
import com.ipms.main.serviceCenter.svcNotice.vo.SvcNoticeVO;

@Service
public class AdminSvcFaqServiceImpl implements AdminSvcFaqService{
	
	@Autowired
	AdminSvcFaqMapper adminSvcFaqMapper;
	
	@Override
	public List<SvcNoticeVO> selectFaq(Criteria criteria){
		return adminSvcFaqMapper.selectFaq(criteria);
	}
	
	@Override
	public int total() {
		return adminSvcFaqMapper.total();
	}
}
