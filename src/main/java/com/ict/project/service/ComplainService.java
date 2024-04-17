package com.ict.project.service;

import java.util.List;
import java.util.Map;

import com.ict.project.dao.ComplainVO;
import com.ict.project.dao.QAVO;

public interface ComplainService {
	public int getTotalCount();

	// 리스트
	public List<ComplainVO> getComplainList(int offset, int limit);
	
	// 삽입
	public int getComplainInsert(ComplainVO cpvo);
	
	// 상세보기
	public ComplainVO getComplainDetail(String complain_idx);
	
	public int getComplainLevUpdate(Map<String, Integer> map);
	
	// 삭제
	public int getComplainDeleteOK(ComplainVO cpvo);
	
	// 수정
	public int getComplainUpdateOK(ComplainVO cpvo);

	public int getCommentInsert(ComplainVO cpvo);
	
	public List<ComplainVO> getComplainCommentList(String complain_idx);
	
	public int getCommentUpdate(ComplainVO cpvo);

	
	
	
}
