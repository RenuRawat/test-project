package com.DaoImpl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Model.Cart;


@Repository("CartDaoImpl")
public class CartDaoImpl {
	
	 @Autowired
     SessionFactory sessionFactory;
	
	  public CartDaoImpl(SessionFactory sessionFactory) {
		 // super();
		  this.sessionFactory=sessionFactory;

}
	  public void insertCart(Cart cart) {
			Session session= sessionFactory.openSession();
			  session.beginTransaction();
			  
			  // value get nd set from the User(Getter ns Setter method////
			  session.persist(cart);
			  
			  session.getTransaction().commit();	
		  }
	  
	
			public List<Cart> findCartById(String userId) 
			{
			Session session= sessionFactory.openSession();
			List<Cart> cr =null;
			try {
			session.beginTransaction();
			System.out.println("queryfind");
			cr =(List<Cart>) session.createQuery("from Cart where userMailId= :email").setString("email", userId).list();
			System.out.println("queryfind2");
			session.getTransaction().commit();
			}
			catch (HibernateException ex)
			{
			 ex.printStackTrace();
			 session.getTransaction().rollback(); // It will not fetch the Id
			}
			return cr;
			}
			
		
			
			@SuppressWarnings("deprecation")
			public Cart getCartById(int pid, String userEmail) 
			{
				Session session= sessionFactory.openSession();
				Cart cr =null;
				session.beginTransaction();
				//System.out.println("query1");
				cr = (Cart)session.createQuery("from Cart where userMailId= :email and cartProductID =:id")
						.setString("email" ,userEmail).setInteger("id", pid).uniqueResult();
				//System.out.println("query1");
				session.getTransaction().commit();
				return cr;
				}
				
     
			public void deleteCart(int cartId) {
				Session session= sessionFactory.openSession();
			    session.beginTransaction();
			    Cart cr =(Cart) session.get(Cart.class, cartId);
			    
			    System.out.println("getCartIdDel");
			   
			    session.delete(cr);
			    
			    System.out.println("getCartIdDel1");
			  System.out.println("delete");
			  System.out.println("getCartIdDel3");
			    session.getTransaction().commit();
				
			}

			
			

			public void updateCart(Cart cr) {
				Session session= sessionFactory.openSession();
			    session.beginTransaction();
			    session.update(cr);
			   // System.out.println("********************reach till query************************");
			    session.getTransaction().commit();
			}
	
		
		
}
