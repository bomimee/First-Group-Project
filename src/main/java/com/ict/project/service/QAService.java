package com.ict.project.service;

import java.util.List;
import java.util.Map;

import com.ict.project.dao.QAVO;

public interface QAService {
	public int getQATotalCount();
	public List<QAVO> getQAList(int offset, int limit);
	public int getQAInsert(QAVO qavo);
	public QAVO getQADetail(String qa_idx);
	public int getQALevUpdate(Map<String, Integer> map);
	public int getQADeleteOk(QAVO qavo);
	public int getQAUpdateOk(QAVO qavo);
	public int getCommentInsert(QAVO qavo);
	public List<QAVO> getQACommentList(String qa_idx);
	public int getCommentUpdate(QAVO qavo);
}
