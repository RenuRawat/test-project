package com.DaoImpl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.Dao.CatDao;
import com.Model.Category;


@Repository("CatDaoImpl")
public class CatDaoImpl implements CatDao {
	
	 @Autowired
     SessionFactory sessionFactory;
	
	  public CatDaoImpl(SessionFactory sessionFactory) {
		 // super();
		  this.sessionFactory=sessionFactory;
	  }

	public void insertCategory(Category cat) {
		Session session= sessionFactory.openSession();
		  session.beginTransaction();
		  
		  // value get nd set from the User(Getter ns Setter method////
		  session.save(cat);
		  session.getTransaction().commit();
	
		}
	
	public List<Category> retrieve() {
		Session session= sessionFactory.openSession();
		session.beginTransaction();
		List<Category> list=  session.createQuery("from Category").list();
		session.getTransaction().commit();
		return list;
	}

	
	public Category findById(int cid) {
		Session session= sessionFactory.openSession();
		Category p=null;
		try {
			session.beginTransaction();
			p = session.get(Category.class, cid);
			session.getTransaction().commit();
		} 
		catch(HibernateException ex)  
		{ ex.printStackTrace();
		  session.getTransaction().rollback(); //It will not fetch the id
		} return p;
	}
		
	public void deleteCategory(int cid) {
		Session session= sessionFactory.openSession();
	    session.beginTransaction();
	    Category category =(Category) session.get(Category.class, cid);
	    session.delete(category);
	    session.getTransaction().commit();
	}
		
	public void update(Category c) 
	{
		Session session= sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.update(c);
		} 
		catch(HibernateException ex)  
		{ ex.printStackTrace();
		  session.getTransaction().rollback(); //It will not fetch the id
		} 
	}

}
