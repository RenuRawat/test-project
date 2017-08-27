package com.Model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="user")
public class User implements Serializable {
	
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@Email(message="Enter valid Email")
	@NotEmpty(message="Enter the Email")
	private String email;
	
	@NotEmpty(message="Enter the Username")
	 private String username;
	
	@NotNull(message="Password is Null")
	@Size(min=6 , max=12 , message="password lenght should be more than 6 and less than 12")
	 private String password;
	
	 private String role;
	
	 @NotNull(message="Addressline1 is Null")
	 private String addressline1;
	 
	 
	 
	 //////////////////////////////////////////////////////////////////////////
	 @NotNull(message="Addressline2 is Null")
	 private String addressline2;
	 @NotNull(message="City is Null")
	 private String city;
	 @NotNull(message="State is Null")
	 private String state;
	 @NotNull(message="Pin Code is Null")
	 private String pincode;
	 @NotNull(message="Country is Null")
	 private String country;
	 
	 
	 
	 
	 
	 
	 public String getAddressline1() {
		return addressline1;
	}
	public void setAddressline1(String addressline1) {
		this.addressline1 = addressline1;
	}
	public String getAddressline2() {
		return addressline2;
	}
	public void setAddressline2(String addressline2) {
		this.addressline2 = addressline2;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPincode() {
		return pincode;
	}
	public void setPincode(String pincode) {
		this.pincode = pincode;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	 
	 /////////////////////////////////////////////////////////////////////////
	 
	 
	
	 /*@Pattern(regexp="[\\d]{10}" , message="please enter digits")*/

	@Pattern(regexp="^[789]\\d{9}$",message="number should be of 10 digits,and begins 9,8,7 since in india")
	 @NotNull
	 @Size(min=8, max=10, message="Enter correct number")
	 private String phone;
	 
	 private boolean enable = true;
	 
	 
		public boolean isEnable() {
			return enable;
		}
		public void setEnable(boolean enable) {
			this.enable = enable;
		}
		 
	 

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}

	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
 

	
	

}
 