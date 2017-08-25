<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
$(".alert").alert()
</script>

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
 
    <script src="js/bootstrap.min.js"></script>

</head>
<body>
<jsp:include page="Header.jsp"></jsp:include>
<br><br><br><br><br><br>

<center><div class="alert alert-success" role="alert">
  <h2 class="alert-heading">You are not authorized to access this page.</h2></div>

<h2><a href="${pageContext.request.contextPath}/index">Go to Home</a></h2></center>
</body>
</html>