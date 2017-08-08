package com.DaoImpl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Dao.SupDao;
import com.Model.Category;
import com.Model.Supplier;

@Repository("SupDaoImpl")
public class SupDaoImpl implements SupDao {
	
	 @Autowired
     SessionFactory sessionFactory;
	
	  public SupDaoImpl(SessionFactory sessionFactory) {
		 // super();
		  this.sessionFactory=sessionFactory;

}
	  public void insertSupplier(Supplier sup) {
			Session session= sessionFactory.openSession();
			  session.beginTransaction();
			  
			  // value get nd set from the User(Getter ns Setter method////
			  session.save(sup);
			  session.getTransaction().commit();	  
}

	  public List<Supplier> retrieve() {
			Session session= sessionFactory.openSession();
			session.beginTransaction();
			List<Supplier> list=  session.createQuery("from Supplier").list();
			session.getTransaction().commit();
			return list;
		}
	
	  public Supplier findById(int sid) {
			Session session= sessionFactory.openSession();
			Supplier p=null;
			try {
				session.beginTransaction();
				p = session.get(Supplier.class, sid);
				session.getTransaction().commit();
			} 
			catch(HibernateException ex)  
			{ ex.printStackTrace();
			  session.getTransaction().rollback(); //It will not fetch the id
			} return p;
		}
		
		
    	public void deleteSupplier(int sid) {
			Session session= sessionFactory.openSession();
		    session.beginTransaction();
		    Supplier supplier =(Supplier) session.get(Supplier.class, sid);
		    session.delete(supplier);
		    session.getTransaction().commit();
		}

			
		public void update(Supplier s) 
		{
			Session session= sessionFactory.openSession();
			try {
				session.beginTransaction();
				session.update(s);
			} 
			catch(HibernateException ex)  
			{ ex.printStackTrace();
			  session.getTransaction().rollback(); //It will not fetch the id
			} 
		}
		
	  
}
