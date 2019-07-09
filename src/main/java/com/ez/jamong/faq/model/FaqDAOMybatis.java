package com.ez.jamong.faq.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FaqDAOMybatis implements FaqDAO{
	@Autowired private SqlSessionTemplate sqlSesson;
	private String namespace = "config.mybatis.mapper.oracle.faq.";
	
	@Override
	public int faqAdd(FaqVO vo) {
		return sqlSesson.insert(namespace+"faqAdd", vo);
	}
	@Override
	public List<FaqVO> selectAll(int faqCateNo) {
		return sqlSesson.selectList(namespace+"selectAll", faqCateNo);
	}
	@Override
	public FaqVO selectByNo(int faqNo) {
		return sqlSesson.selectOne(namespace+"selectByNo", faqNo);
	}
	@Override
	public int updateFaq(FaqVO vo) {
		return sqlSesson.update(namespace+"updateFaq", vo);
	}
	@Override
	public int deleteFaq(int faqNo) {
		return sqlSesson.delete(namespace+"deleteFaq", faqNo);
	}
	@Override
	public List<FaqCategoryVO> selectCateAll() {
		return sqlSesson.selectList(namespace+"selectCateAll");
	}
	@Override
	public FaqCategoryVO selectCateByNo(int faqCateNo) {
		return sqlSesson.selectOne(namespace+"selectCateByNo", faqCateNo);
	}
	
}
