package com.ict.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberInfoDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<MemberInfoVO> getMemberList() {
		try {
			return sqlSessionTemplate.selectList("memberinfo.list");
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
}
