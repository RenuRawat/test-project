package com.Model;



import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.stereotype.Component;

@Table(name="Orders")
@Component
@Entity
public class Orders {
	
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Id
 	private int orderId;
	
	@ManyToOne
	@JoinColumn(name="email")
	private User user;
	
	private String payment;
	private Double total;
	
	
	////////////////////////////////////////////////////
	
	@Email(message="Enter valid Email")
	@NotEmpty(message="Enter the Email")
	private String semail;
	
	@Pattern(regexp="^[789]\\d{9}$",message="number should be of 10 digits,and begins 9,8,7 since in india")
	 @NotNull
	 @Size(min=8, max=10, message="Enter correct number")
	 private String sphone;
	
	@NotEmpty(message="Enter the name")
	private String sname;
	@NotNull(message="Addressline1 is Null")
	private String sadd1;
	@NotNull(message="Addressline2 is Null")
	private String sadd2;
	@NotNull(message="City is Null")
	private String scity;
	@NotNull(message="State is Null")
	private String sstate;
	@NotNull(message="Zip is Null")
	private String spincode;
	 @NotNull(message="Country is Null")
	 private String scountry;
	
	
	
	public String getSemail() {
		return semail;
	}
	public void setSemail(String semail) {
		this.semail = semail;
	}
	public String getSphone() {
		return sphone;
	}
	public void setSphone(String sphone) {
		this.sphone = sphone;
	}
	public String getScountry() {
		return scountry;
	}
	public void setScountry(String scountry) {
		this.scountry = scountry;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getSadd1() {
		return sadd1;
	}
	public void setSadd1(String sadd1) {
		this.sadd1 = sadd1;
	}
	public String getSadd2() {
		return sadd2;
	}
	public void setSadd2(String sadd2) {
		this.sadd2 = sadd2;
	}
	public String getScity() {
		return scity;
	}
	public void setScity(String scity) {
		this.scity = scity;
	}
	public String getSstate() {
		return sstate;
	}
	public void setSstate(String sstate) {
		this.sstate = sstate;
	}
	public String getSpincode() {
		return spincode;
	}
	public void setSpincode(String spincode) {
		this.spincode = spincode;
	}

	
	
	
	///////////////////////////////////////////////////
	

	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public Double getTotal() {
		return total;
	}
	public void setTotal(Double total) {
		this.total = total;
	}
	

}
