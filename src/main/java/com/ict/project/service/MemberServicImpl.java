package com.ict.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.project.dao.MemberDAO;
import com.ict.project.dao.MemberVO;

@Service
public class MemberServicImpl implements MemberService{
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public int getSignUp(MemberVO mvo) throws Exception {
		return memberDAO.getSignUp(mvo);
	}

	@Override
	public MemberVO getLogInOK(MemberVO mvo) throws Exception {
		return memberDAO.getLogInOK(mvo);
	}

	@Override
	public String getIdChk(String m_id){
		//아이디 중복 확인
		return memberDAO.getIdChk(m_id);
	}

	@Override
	public MemberVO getUpdateDetailAccount(String member_idx) {
		
		return memberDAO.getUpdateDetailAccount(member_idx);
	}

	@Override
	public int getUpdateOKAccount(MemberVO mvo) {
		
		return memberDAO.getUpdateOKAccount(mvo);
	}

	@Override
	public MemberVO getMemberDetail(String member_idx) {
		
		return memberDAO.getMemberDetail(member_idx);
	}

	@Override
	public int getDeleteOKAccount(String member_idx) {
		
		return memberDAO.getDeleteOKAccount(member_idx);
	}

	@Override
	public MemberVO getLostPwd(String member_id) {
		
		return memberDAO.getLostPwd(member_id);
	}

	@Override
	public int tempPwdUpdate(MemberVO mvo) {
		
		return memberDAO.tempPwdUpdate(mvo);
	}

	@Override
	public MemberVO getLostMyID(String member_name) {
		
		return memberDAO.getLostMyID(member_name);
	}
}
