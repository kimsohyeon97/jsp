package kr.co.farmstory.service;

import java.util.List;

import kr.co.farmstory.dao.TermsDAO;
import kr.co.farmstory.dto.TermsDTO;

public enum TermsService {
	
	INSTANCE;

	private TermsDAO dao = TermsDAO.getInstance();
	
	public void registerTerms(TermsDTO dto) {
		dao.insertTerms(dto);
	}
	
	public TermsDTO findTerms(int no) {
		return dao.selectTerms(no);
	}
	
	public List<TermsDTO> findTerms() {
		return dao.selectAllTerms();
	}
	
	public void modifyTerms(TermsDTO dto) {
		dao.updateTerms(dto);
	}
	
	public void deleteTerms(int no) {
		dao.deleteTerms(no);
	}
	
	
}
