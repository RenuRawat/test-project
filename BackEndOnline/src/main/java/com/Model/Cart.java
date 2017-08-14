package com.Model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Table(name="CartDetails")
@Component
@Entity
public class Cart implements Serializable {
	
	
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Id
	private int cartId;
	
	private int cartProductID;
	
	@OneToOne(fetch= FetchType.LAZY)
	@JoinColumn(name="userMailId")
	private User cartUserDetails;
	
	private Double cartPrice;
	private int cartQuantity;
	private String cartImage;
	private String cartProductName;
	
	
////using constructor for non inserting data//////////////
	public Cart(int cartId, int cartProductID, User cartUserDetails, Double cartPrice, int cartQuantity, 
			String cartImage, String cartProductName)
	{
		this.cartId= cartId;
		this.cartProductID= cartProductID;
		this.cartUserDetails= cartUserDetails;
		this.cartPrice= cartPrice;
		this.cartQuantity=cartQuantity;
		this.cartImage =cartImage;
		this.cartProductName =cartProductName;
	}
	
	
	public Cart() {
		// TODO Auto-generated constructor stub
	}


	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public int getCartProductID() {
		return cartProductID;
	}

	public void setCartProductID(int cartProductID) {
		this.cartProductID = cartProductID;
	}

	public User getCartUserDetails() {
		return cartUserDetails;
	}

	public void setCartUserDetails(User cartUserDetails) {
		this.cartUserDetails = cartUserDetails;
	}

	public Double getCartPrice() {
		return cartPrice;
	}

	public void setCartPrice(Double cartPrice) {
		this.cartPrice = cartPrice;
	}

	public int getCartQuantity() {
		return cartQuantity;
	}

	public void setCartQuantity(int cartQuantity) {
		this.cartQuantity = cartQuantity;
	}

	public String getCartImage() {
		return cartImage;
	}

	public void setCartImage(String cartImage) {
		this.cartImage = cartImage;
	}

	public String getCartProductName() {
		return cartProductName;
	}

	public void setCartProductName(String cartProductName) {
		this.cartProductName = cartProductName;
	}

	

}
