package com.ict.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QADAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int getQATotalCount() {
		try {
			return sqlSessionTemplate.selectOne("qa.count");
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	} 

	public List<QAVO> getQAList(int offset, int limit) {
		try {
			Map<String, Integer> map = new HashMap<String, Integer>();  
			map.put("offset", offset);
			map.put("limit", limit);
			return sqlSessionTemplate.selectList("qa.qa_list", map);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	public int getQAInsert(QAVO qavo) {
		try {
			return sqlSessionTemplate.insert("qa.qa_insert", qavo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	public QAVO getQADetail(String qa_idx) {
		try {
			return sqlSessionTemplate.selectOne("qa.qa_detail", qa_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	public int getQALevUpdate(Map<String, Integer> map) {
		try {
			return sqlSessionTemplate.update("qa.qa_levupdate", map);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	public int getQADeleteOk(QAVO qavo) {
		try {
			if(qavo.getQa_step().equals("0")) {
				return sqlSessionTemplate.update("qa.qa_delete", qavo);
			}else {
				return sqlSessionTemplate.update("qa.qa_comment_delete", qavo);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	public int getQAUpdateOk(QAVO qavo) {
		try {
			return sqlSessionTemplate.update("qa.qa_update", qavo);
		} catch (Exception e) {
			System.out.println(1);
			System.out.println(e);
			System.out.println(2);
		}
		return -1;
	}
	
	public int getCommentInsert(QAVO qavo) {
		try {
			return sqlSessionTemplate.insert("qa.qa_comment_insert", qavo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
	
	public List<QAVO> getQACommentList(String qa_idx) {
		try {
			return sqlSessionTemplate.selectList("qa.qa_comment_list", qa_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	public int getCommentUpdate(QAVO qavo) {
		try {
			return sqlSessionTemplate.update("qa.qa_comment_update", qavo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
	
}
