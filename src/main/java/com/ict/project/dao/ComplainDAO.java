package com.ict.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ComplainDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int getTotalCount() {
		try {
			return sqlSessionTemplate.selectOne("complain.cp_count");
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
	
	public List<ComplainVO> getComplainList(int offset, int limit) {
		try {
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("offset", offset);
			map.put("limit", limit);
			
			return sqlSessionTemplate.selectList("complain.cp_list", map);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	public int getComplainInsert(ComplainVO cpvo) {
		try {
			return sqlSessionTemplate.insert("complain.cp_insert", cpvo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
	public ComplainVO getComplainDetail(String complain_idx) {
		try {
			return sqlSessionTemplate.selectOne("complain.cp_detail", complain_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	public int getComplainDeleteOK(ComplainVO cpvo) {
		try {
			if(cpvo.getComplain_step().equals("0")) {
				return sqlSessionTemplate.update("complain.cp_delete", cpvo);
			} 
			else {
				return sqlSessionTemplate.delete("complain.cp_comment_delete", cpvo);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
	
	public int getComplainUpdateOK(ComplainVO cpvo) {
		try {
			return sqlSessionTemplate.update("complain.cp_update", cpvo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	public int getCommentInsert(ComplainVO cpvo) {
		try {
			return sqlSessionTemplate.insert("complain.cp_comment_insert", cpvo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
	
	public List<ComplainVO> getComplainCommentList(String complain_idx) {
		try {
			return sqlSessionTemplate.selectList("complain.cp_comment_list", complain_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	public int getCommentUpdate(ComplainVO cpvo) {
		try {
			return sqlSessionTemplate.update("complain.cp_comment_update", cpvo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
	
}
