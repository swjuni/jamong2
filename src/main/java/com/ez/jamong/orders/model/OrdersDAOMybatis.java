package com.ez.jamong.orders.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrdersDAOMybatis implements OrdersDAO{
	@Autowired private SqlSessionTemplate session;
	private String namespace="config.mybatis.mapper.oracle.orders.";
	@Override
	public int insertOrders(OrdersVO orderVo) {
		return session.insert(namespace+"insertOrders",orderVo);
	}
}
