package com.DaoImpl;

import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Model.Category;
//import com.Model.Category;
import com.Model.Product;

@Repository("ProDaoImpl")
public class ProDaoImpl {
	
	 @Autowired
     SessionFactory sessionFactory;
	
	  public ProDaoImpl(SessionFactory sessionFactory) {
		  super();
		  this.sessionFactory=sessionFactory;
	  }
	  
	  public void insertProduct(Product pro) {
			Session session= sessionFactory.openSession();
			  session.beginTransaction();
			  
			  // value get nd set from the User(Getter ns Setter method////
			 /* session.save(pro);*/
			  session.persist(pro);
			  session.getTransaction().commit();

}

	public List<Product> retrieve() 
	{
		Session session= sessionFactory.openSession();
		session.beginTransaction();
		List<Product> list=  session.createQuery("from Product").list();
		session.getTransaction().commit();
		return list;
	}
	
	

/*	public List<Product> getProById(int cid) {
	Session session= sessionFactory.openSession();
	List<Product> products =null;
	session.beginTransaction();
	products = session.createQuery("from product where cid="+ cid).list();
	session.getTransaction().commit();
	return products;
	}*/
	

	public Product findById(int pid) {
	Session session= sessionFactory.openSession();
	Product p =null;
	try {
	session.beginTransaction();
	p = session.get(Product.class, pid);
	session.getTransaction().commit();
	}
	catch (HibernateException ex)
	{
	 ex.printStackTrace();
	 session.getTransaction().rollback(); // It will not fetch the Id
	}
	return p;
	}



	public void deleteProduct(int pid) {
		Session session= sessionFactory.openSession();
	    session.beginTransaction();
	    Product product =(Product) session.get(Product.class, pid);
	    session.delete(product);
	    session.getTransaction().commit();
		
	}

	public void updateProduct(Product pro2) {
		Session session= sessionFactory.openSession();
	    session.beginTransaction();
	    session.update(pro2);
	   // System.out.println("********************reach till query************************");
	    session.getTransaction().commit();
	}

	public void saveProduct(Product pro2) {
		// TODO Auto-generated method stub
		
	}

/*	public void updateProduct(Product pro2) {
		// TODO Auto-generated method stub
		
	}
	*/
}