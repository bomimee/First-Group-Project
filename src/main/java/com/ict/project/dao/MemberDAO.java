package com.ict.project.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int getSignUp(MemberVO mvo)  {
		try {
			return sqlSessionTemplate.insert("member.insert", mvo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
	
	public MemberVO getLogInOK(MemberVO mvo) throws Exception {
		try {
			return sqlSessionTemplate.selectOne("member.login", mvo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	public MemberVO getUpdateDetailAccount(String member_idx) {
		try {
			return sqlSessionTemplate.selectOne("member.updateDetail", member_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	public int getUpdateOKAccount(MemberVO mvo) {
		try {
			return sqlSessionTemplate.update("member.update", mvo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
		
	}
	
	public MemberVO getMemberDetail(String member_idx) {
		try {
			return sqlSessionTemplate.selectOne("member.member_detail",member_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
		
	}
	
	public int getDeleteOKAccount(String member_idx) {
		try {
			return sqlSessionTemplate.delete("member.delete", member_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}
	
	public MemberVO getLostPwd(String member_id) {
		try {
			return sqlSessionTemplate.selectOne("member.findPwd", member_id);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
		
	}
	
	
	public int tempPwdUpdate(MemberVO mvo) {
		try {
			return sqlSessionTemplate.update("member.tempUpdatePwd", mvo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}
	
	public MemberVO getLostMyID(String member_name) {
		try {
			return sqlSessionTemplate.selectOne("member.findMyId", member_name);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public String getIdChk(String m_idx) {
		try {
		  	int result = sqlSessionTemplate.selectOne("member.idchk", m_idx);
		  	// member_id�� �����ϸ� 
		  	if(result>0) {
		  		return "0";
		  	}
		  	// member_id�� �������� ������ 
		  	return "1" ;
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
}
