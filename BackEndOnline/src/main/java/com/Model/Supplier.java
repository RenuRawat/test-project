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

@Table(name="supplier")
@Entity
public class Supplier implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
 @GeneratedValue(strategy = GenerationType.AUTO)
	private int sid;
	private String name;
	
	@OneToMany (targetEntity=Product.class, fetch=FetchType.EAGER, mappedBy="sup")
	
	private Set<Product> products = new HashSet<Product>(0);

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<Product> getProducts() {
		return products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}
	
	

	


	

}
