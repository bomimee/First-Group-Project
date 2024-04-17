package com.ict.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.project.dao.MemberInfoDAO;
import com.ict.project.dao.MemberInfoVO;

@Service
public class MemberInfoServiceImpl implements MemberInfoService{
	
	@Autowired
	private MemberInfoDAO memberInfoDAO;
	
	@Override
	public List<MemberInfoVO> getMemberList() {
		return memberInfoDAO.getMemberList();
	}
}
