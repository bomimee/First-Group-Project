package com.ict.project.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.project.dao.ComplainDAO;
import com.ict.project.dao.ComplainVO;

@Service
public class ComplainServiceImpl implements ComplainService{

	@Autowired
	private ComplainDAO complainDAO;

	@Override
	public int getTotalCount() {
		return complainDAO.getTotalCount();
	}
	@Override
	public List<ComplainVO> getComplainList(int offset, int limit) {
		return complainDAO.getComplainList(offset, limit);
	}

	@Override
	public int getComplainInsert(ComplainVO cpvo) {
		return complainDAO.getComplainInsert(cpvo);
	}

	@Override
	public ComplainVO getComplainDetail(String complain_idx) {
		return complainDAO.getComplainDetail(complain_idx);
	}

	@Override
	public int getComplainDeleteOK(ComplainVO cpvo) {
		return complainDAO.getComplainDeleteOK(cpvo);
	}

	@Override
	public int getComplainUpdateOK(ComplainVO cpvo) {
		return complainDAO.getComplainUpdateOK(cpvo);
	}
	@Override
	public int getComplainLevUpdate(Map<String, Integer> map) {
		return 0;
	}
	
	@Override
	public int getCommentInsert(ComplainVO cpvo) {
		return complainDAO.getCommentInsert(cpvo);
	}
	
	
	@Override
	public List<ComplainVO> getComplainCommentList(String complain_idx) {
		return complainDAO.getComplainCommentList(complain_idx);
	}
	@Override
	public int getCommentUpdate(ComplainVO cpvo) {
		return complainDAO.getCommentUpdate(cpvo);
	}

	
	

	
	

	
	
}
