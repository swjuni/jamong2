package com.ez.jamong.orders.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrdersServiceImpl implements OrdersService{
	@Autowired private OrdersDAO ordersDao;

	@Override
	public int insertOrders(OrdersVO orderVo) {
		return ordersDao.insertOrders(orderVo);
	}
}
