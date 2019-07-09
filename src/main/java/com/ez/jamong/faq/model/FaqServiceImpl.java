package com.ez.jamong.faq.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class FaqServiceImpl implements FaqService{
	@Autowired private FaqDAO faqDao;

	@Override
	public int faqAdd(FaqVO vo) {
		return faqDao.faqAdd(vo);
	}

	@Override
	public List<FaqVO> selectAll(int faqCateNo) {
		return faqDao.selectAll(faqCateNo);
	}

	@Override
	public FaqVO selectByNo(int faqNo) {
		return faqDao.selectByNo(faqNo);
	}

	@Override
	public int updateFaq(FaqVO vo) {
		return faqDao.updateFaq(vo);
	}

	@Override
	public int deleteFaq(int faqNo) {
		return faqDao.deleteFaq(faqNo);
	}

	@Override
	public List<FaqCategoryVO> selectCateAll() {
		return faqDao.selectCateAll();
	}

	@Override
	public FaqCategoryVO selectCateByNo(int faqCateNo) {
		return faqDao.selectCateByNo(faqCateNo);
	}

	@Override
	@Transactional
	public int deleteFaqItems(List<FaqVO> list) {
		int cnt = 0;
		
		try {
			for(FaqVO vo : list) {
				if(vo.getFaqNo()!=0) {	//체크된 것만 삭제
					cnt = faqDao.deleteFaq(vo.getFaqNo());
				}
			}
		}catch(RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
		}
		
		return cnt;
	}
	
}
