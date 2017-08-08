package com.configuration;


import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.DaoImpl.CatDaoImpl;
import com.DaoImpl.ProDaoImpl;
import com.DaoImpl.SupDaoImpl;
import com.DaoImpl.UserDaoImpl;
import com.Model.Category;
import com.Model.Product;
import com.Model.User;
import com.Model.Supplier;




@Configuration
@ComponentScan("com.*")
@EnableTransactionManagement
public class HibernateConfiguration {
	
	
@Autowired
@Bean(name="dataSource")
public DataSource getH2DataSource()
{
System.out.println("Data Source Method");

DriverManagerDataSource dataSource = new DriverManagerDataSource();
dataSource.setDriverClassName("org.h2.Driver");
dataSource.setUrl("jdbc:h2:tcp://localhost/~/test");
dataSource.setUsername("sa");
dataSource.setPassword("");

System.out.println("Data Source Created");
return dataSource;
}
private Properties getHibernateProperties() {
Properties properties = new Properties();
properties.put("hibernate.dialect", "org.hibernate.dialect.H2Dialect");
properties.put("hibernate.hbm2ddl.auto", "update");
properties.put("hibernate.show_sql", "true");
System.out.println("Table Source Created");
return properties;
}

@Autowired
@Bean(name = "sessionFactory")
public SessionFactory getSessionFactory(DataSource dataSource) {
LocalSessionFactoryBuilder sessionBuilder = new LocalSessionFactoryBuilder(dataSource);
sessionBuilder.addProperties(getHibernateProperties());
sessionBuilder.addAnnotatedClass(User.class);
sessionBuilder.addAnnotatedClass(Category.class);
sessionBuilder.addAnnotatedClass(Product.class);
sessionBuilder.addAnnotatedClass(Supplier.class);

//sessionBuilder.scanPackages("com.model");
return sessionBuilder.buildSessionFactory();
}




@Autowired
@Bean(name="UserDaoImpl")
public UserDaoImpl getUserDAO(SessionFactory sessionFactory)
{
return new UserDaoImpl(sessionFactory);
}

@Autowired
@Bean(name="CatDaoImpl")
public CatDaoImpl getCatDAO(SessionFactory sessionFactory)
{
return new CatDaoImpl(sessionFactory);
}

@Autowired
@Bean(name="ProDaoImpl")
public ProDaoImpl getProDAO(SessionFactory sessionFactory)
{
return new ProDaoImpl(sessionFactory);
}

@Autowired
@Bean(name="SupDaoImpl")
public SupDaoImpl getSupDAO(SessionFactory sessionFactory)
{
return new SupDaoImpl(sessionFactory);
}


@Autowired
@Bean(name = "transactionManager")
public HibernateTransactionManager getTransactionManager(SessionFactory sessionFactory) {
HibernateTransactionManager transactionManager = new HibernateTransactionManager(sessionFactory);
return transactionManager;
}

}
	