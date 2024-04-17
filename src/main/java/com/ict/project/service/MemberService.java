package com.ict.project.service;


import com.ict.project.dao.MemberVO;

public interface MemberService {
	public int getSignUp(MemberVO mvo) throws Exception;
	
	public MemberVO getLogInOK(MemberVO mvo) throws Exception;
	// 아이디 중복 확인
	public String getIdChk(String m_id);
	
	public MemberVO getUpdateDetailAccount(String member_idx);
	
	public int getUpdateOKAccount(MemberVO mvo);
	
	public MemberVO getMemberDetail(String member_idx);
	
	public int getDeleteOKAccount(String member_idx);
	
	public MemberVO getLostPwd(String member_id);
	
	public int tempPwdUpdate(MemberVO mvo);
	
	public MemberVO getLostMyID(String member_name);
}

