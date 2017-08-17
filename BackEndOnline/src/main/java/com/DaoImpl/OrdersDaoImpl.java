package com.DaoImpl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.Model.Orders;

@Repository("OrdersDaoImpl")
public class OrdersDaoImpl {
	
	
	@Autowired
    SessionFactory sessionFactory;
	
	  public OrdersDaoImpl(SessionFactory sessionFactory) {
		 // super();
		  this.sessionFactory=sessionFactory;

}
	  public void insertOrders(Orders orders) {
			Session session= sessionFactory.openSession();
			  session.beginTransaction();
			  
			  // value get nd set from the User(Getter ns Setter method////
			  session.persist(orders);
			  session.getTransaction().commit();	
			  
	  }

}
