package com.ez.jamong.faq.model;

import java.util.List;

public interface FaqDAO {
	public int faqAdd(FaqVO vo);  
	public List<FaqVO> selectAll(int faqCateNo);
	public FaqVO selectByNo(int faqNo);
	public int updateFaq(FaqVO vo);
	public int deleteFaq(int faqNo);
	public List<FaqCategoryVO> selectCateAll();
	public FaqCategoryVO selectCateByNo(int faqCateNo);
}
