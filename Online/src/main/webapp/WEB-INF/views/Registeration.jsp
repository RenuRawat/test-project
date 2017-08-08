<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>Registration Page</title>
</head>
<body>
<jsp:include page="Header.jsp"></jsp:include>
<form:form action="saveregister" method="POST" modelAttribute="user">

<table>
    <tr>
        <td>Email :</td>
        <td><form:input path="email" /></td>
    </tr>
    <tr>
        <td>Name :</td>
        <td><form:input path="username" /></td>
    </tr>
    <tr>
        <td>Password :</td>
        <td><form:password path="password" /></td>
    </tr>
    <%-- <tr>
        <td>Role :</td>
        <td><form:role path="role" /></td>
    </tr> --%>
    <tr>
        <td>Address :</td>
        <td><form:textarea  path="address" /></td>
    </tr>
    <tr>
        <td>Phone :</td>
        <td><form:input path="phone" /></td>
    </tr>
    
   <%--  <tr>
        <td>Gender :</td>
        <td>
            <form:radiobutton path="gender" value="M" label="M" /> 
            <form:radiobutton path="gender" value="F" label="F" />
        </td>
    </tr> --%>
    <%-- <tr>
        <td>Country :</td>
        <td>
            <form:select path="country">
            <form:option value="0" label="Select" />
            <form:options items="${countryList}" itemValue="countryId" itemLabel="countryName" />
            </form:select>
        </td>
    </tr> --%>
    <%-- <tr>
        <td>About you :</td>
        <td><form:textarea path="aboutYou" /></td>
    </tr> --%>
   <%--  <tr>
        <td>Community :</td>
        <td><form:checkboxes path="communityList" items="${communityList}" itemValue="key" itemLabel="value" /></td>
    </tr> --%>
<%--     <tr>
        <td></td>
        <td>
        <form:checkbox path="mailingList" label="Would you like to join our mailinglist?" />
        </td>
    </tr> --%>
    <tr>
        <td colspan="2"><input type="submit" value="Register"></td>
    </tr>
</table>
</form:form>
<br><br>
<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>












<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="Header.jsp"></jsp:include>
<br>



 <center> 
 <div style="width:550px; height:850px; padding 2px; border:10px groove yellowgreen;">
<center></center>
<center><h1><br><b><font color=gray><u>Registration</u></font></b>
</center></h1><br><h3>
<table cellpadding="6" width="300" style=table-layout:fixed  border="0" align=center>                                   
                                    </div>


               

                                 
   <div class = "container">                                 
							
 <div class="col-1g-12">
 <div class ="row">
 
 <form:form modelAttribute="user" action="saveregister" method="post">
 <div class="col-1g-12">
 
 
 
 <div class="form-group" >
    <form:label class="control-label col-sm-2" for="email">Email:</form:label> 	
    <div class="col-sm-10">
   <input path="email" placeholder="Enter Mail id.." class="form-control"/>
    </div></div>
	
	<div class = "form-group">	
    <form:label class="control-label col-sm-2" for="name">Name:</form:label>  
    <div class="col-sm-10">
      <input path="text" placeholder="Enter Your Name "class="form-control" />
    </div></div>
	
	<div class = "form-group">	
    <form:label class="control-label col-sm-2" for="password">Password:</form:label>  
    <div class="col-sm-10">
      <input path="password" placeholder="Enter Your Password "class="form-control"/>
    </div></div>
	
	
                
	
  <div class = "form-group">	
    <form:label class="control-label col-sm-2" for="role">Role:</form:label>  
    <div class="col-sm-10">
      <input path="role" placeholder="Enter Your Rollno "class="form-control"/>
    </div></div>
	
			
	<div class = "form-group">	
    <form:label class="control-label col-sm-10" for="address">Address:</form:label>  
    <div class="col-sm-10">
      <input path="address" placeholder="Enter Your Home Address "class="form-control"/>
    </div></div>
	

	
	<div class = "form-group">	
    <form:label class="control-label col-sm-2" for="phone">Phone Number:</form:label> 
    <div class="col-sm-10"> 
      <input path="phone" placeholder="Enter Your Phone Number "class="form-control"/>
    </div></div>
	
	<div class = "form-group">	
    <form:label class="control-label col-sm-2" for="id">Id:</form:label>  
    <div class="col-sm-10">
      <input path="id" placeholder="Enter Your Id "class="form-control"/>
    </div></div>
	<br>
	
	  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-default">register</button>
    </div></div></div></form:form></div></div></div></table></h3>
  </div>
  
  </center>

<br>

<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html> --%>