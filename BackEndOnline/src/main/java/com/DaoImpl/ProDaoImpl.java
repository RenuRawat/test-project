package com.DaoImpl;

import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Dao.ProDao;
import com.Model.Category;

import com.Model.Product;

@SuppressWarnings("unused")
@Repository("ProDaoImpl")
public class ProDaoImpl implements ProDao {
	
	@Autowired
    SessionFactory sessionFactory;
   
    public ProDaoImpl(SessionFactory sessionFactory) {
                 super();
                 this.sessionFactory = sessionFactory;
    }
   
    
    public void insertProduct(Product pro) {
		Session session= sessionFactory.openSession();
		  session.beginTransaction();
		  
		  // value get nd set from the User(Getter ns Setter method////
		 
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

/////////////CustomerList///////////////////

public List<Product> getProById(int cid) {
Session session= sessionFactory.openSession();
List<Product> products =null;
session.beginTransaction();
products = session.createQuery("from Product where cid="+ cid).list();
session.getTransaction().commit();
return products;
}
 
	public Product findById(int pid) {
	Session session= sessionFactory.openSession();
	Product p =null;
	try {
	session.beginTransaction();
	p = session.get(Product.class, pid);
	
	System.out.println("find");
	session.getTransaction().commit();
	
	System.out.println("findid");
	session.close();
	System.out.println("findid1");
	}
	catch (HibernateException ex)
	{
	 ex.printStackTrace();
	 session.getTransaction().rollback(); // It will not fetch the Id
	 System.out.println("findid2");
	 session.close();
	
	}

	return p;
	}



 public void deleteProduct(int pid){
              Session session = sessionFactory.openSession();
              session.beginTransaction();
              Product product = (Product)session.get(Product.class, pid);
              session.delete(product);
              session.getTransaction().commit();
              }
 public void updateProduct(Product p){
System.out.println("inside update product 1");
              Session session = sessionFactory.openSession();
              System.out.println("inside update product 2");
              session.beginTransaction();
              System.out.println("inside update product 3");
              session.update(p);
              System.out.println("inside update product 4");
              session.getTransaction().commit();
              System.out.println("inside update product last ");
              
              
 }
}
	 
	 
