package com.DaoImpl;

import com.Model.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Dao.UserDao;
@Repository("UserDaoImpl")
public class UserDaoImpl implements UserDao{
	
	 @Autowired
     SessionFactory sessionFactory;
	
	  public UserDaoImpl(SessionFactory sessionFactory) {
		  super();
		  this.sessionFactory=sessionFactory;
	  }

	public void insertUser(User user) {
		Session session= sessionFactory.openSession();
		  session.beginTransaction();
		  
		  // value get nd set from the User(Getter ns Setter method////
		  session.save(user);
		  session.getTransaction().commit();
	}


}
