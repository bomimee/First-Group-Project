package com.ict.project.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.project.dao.QADAO;
import com.ict.project.dao.QAVO;

@Service
public class QAServiceImpl implements QAService{
	@Autowired
	private QADAO qaDAO;

	@Override
	public int getQATotalCount() {
		return qaDAO.getQATotalCount();
	}

	@Override
	public List<QAVO> getQAList(int offset, int limit) {
		return qaDAO.getQAList(offset, limit);
	}

	@Override
	public int getQAInsert(QAVO qavo) {
		return qaDAO.getQAInsert(qavo);
	}

	@Override
	public QAVO getQADetail(String qa_idx) {
		return qaDAO.getQADetail(qa_idx);
	}

	@Override
	public int getQALevUpdate(Map<String, Integer> map) {
		return 0;
	}

	@Override
	public int getQADeleteOk(QAVO qavo) {
		return qaDAO.getQADeleteOk(qavo);
	}

	@Override
	public int getQAUpdateOk(QAVO qavo) {
		return qaDAO.getQAUpdateOk(qavo);
	}

	@Override
	public int getCommentInsert(QAVO qavo) {
		return qaDAO.getCommentInsert(qavo);
	}

	@Override
	public List<QAVO> getQACommentList(String qa_idx) {
		return qaDAO.getQACommentList(qa_idx);
	}

	@Override
	public int getCommentUpdate(QAVO qavo) {
		return qaDAO.getCommentUpdate(qavo);
	}
	
	
}
