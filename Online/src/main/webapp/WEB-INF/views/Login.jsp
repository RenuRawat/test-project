<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
              pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<link href="/resources/bootstrap.css">
<title>Login Page</title>
<script type="text/javascript">
function check_info(){
	var inputEmail = document.getElementById('inputEmail').value;
	var inputPassword = document.getElementById('inputPassword').value;
	
	/* if(inputEmail=="" || inputPassword==""){
		alert
	} */
}
</script>


</head>
<body>
<jsp:include page="Header.jsp"></jsp:include>


<div class="container">
<center>Welcome to Login Page</center>
<div class="card card-container">
<h2 class='login_title text-center'>Login</h2>
<hr>
<form action="${pageContext.request.contextPath }/login" class="form-signin" method ="post">
<span id="reauth-email" class="reauth-email"></span>
<h4 class="input-title">Email</h4>
<input type="text" id="inputEmail" name="username" class="login_box" placeholder="email" required />
<h4 class="input-title">Password</h4>
<input type="password" id="inputPassword" name="password" class="login_box" placeholder= "********" required />

<div id="remember" class="checkbox">
<label>

</label>
</div>
<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
<button class="btn btn-md btn-primary" type="submit">Login</button>
<button class="btn btn-md btn-primary" type="reset">Cancel</button>   
<br>
<h4><a href="${pageContext.request.contextPath}/register" >Create an account</a></h4>
               
</form>
</div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
</div>





<br><br>

<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>