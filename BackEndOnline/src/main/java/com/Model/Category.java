package com.Model;


import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;


@Table(name="category")
@Component
@Entity
public class Category implements Serializable{
	
	private static final long serialVersionUID = 1L;
	@Id
 @GeneratedValue(strategy = GenerationType.AUTO)
	
	private int cid;
	private String name;
	@OneToMany (targetEntity=Product.class, fetch=FetchType.EAGER, mappedBy="cat")
	
	private Set<Product> products = new HashSet<Product>(0);
	
	public Set<Product> getProducts() {
		return products;
	}
	public void setProducts(Set<Product> products) {
		this.products = products;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}

	

}
