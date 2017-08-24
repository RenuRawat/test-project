<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
              pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="assets/mycss/Registration.css" rel="stylesheet">
 <!--  <script src="https://use.fontawesome.com/fd9dba5260.js"></script -->>
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
 <link rel="stylesheet" href="style.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
 
    <script src="js/bootstrap.min.js"></script>
  
	<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>

		
	</head>
<body>
<jsp:include page="Header.jsp"></jsp:include>

<div class="container">
			<div class="row main">
				<div class="panel-heading">
	               <div class="panel-title text-center">
	               	<h2 class="title">User Login</h2>
	               	<hr />
	               	</div>
	            </div> 
				<div class="main-login main-center">
				
<form action="${pageContext.request.contextPath }/login" class="form-signin" method ="post">
<span id="reauth-email" class="reauth-email"></span>
<fieldset>



<div class="form-group">
<label for ="username" class="cols-sm-2 control-label">Email</label>
<div class="cols-sm-10">
<div class="input-group">
<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
<input type="text" id="inputEmail" name="username" class="form-control" placeholder="Enter Your Email" required /></div>
</div></div>

<div class="form-group">
<label for ="password" class="cols-sm-2 control-label">Password</label>
<div class="cols-sm-10">
<div class="input-group">
<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
<input type="password" id="inputPassword" name="password" class="form-control" placeholder= "********" required />

<!-- <span style="width:0%" id="password_show_button" class="input-group-addon"><i class="fa fa-eye-slash" aria-hidden="true"></i></span>
 -->
 </div></div></div>

<div class="single-bottom">
<input type="checkbox"  id="remember" value="">
<label for="remember"><span></span>Remember Me</label>
</div>



<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
<button class="btn btn-primary btn-md btn-block login-button" type="submit">Login</button>
<button class="btn btn-primary btn-md btn-block login-button" type="reset">Cancel</button>

<h4><a href="${pageContext.request.contextPath}/register" >Create an account</a></h4>
    </fieldset>         
</form></div>
</div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
</div>






</body>
</html>