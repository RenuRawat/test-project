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
	@Column(name = "username")
	 private String username;
	
	@NotNull(message="Password is Null")
	 private String password;
	
	 private String role;
	 @NotNull(message="Address is Null")
	 private String address;
	 
	
	 @Pattern(regexp="[\\d] {10}", message="Please enter digits")
	 @NotNull
	 @Size(min=8, max=10, message="Enter correct Phone")
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
 

	
	

}
 