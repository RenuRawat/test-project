package com.DaoImpl;



import org.hibernate.HibernateException;
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
			  session.save(orders);
			  session.getTransaction().commit();	
			  
	  }
	  
		public Orders findByOrderId(String userId) {
			
			Session session= sessionFactory.openSession();
			Orders o =null;
			try {
			session.beginTransaction();
			o = session.get(Orders.class, userId);
			session.getTransaction().commit();
			}
			catch (HibernateException ex)
			{
			 ex.printStackTrace();
			 session.getTransaction().rollback(); // It will not fetch the Id
			}
			return o;
			}
		
	
	


	
	
}

