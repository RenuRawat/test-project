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
</head>
<body>
<jsp:include page="Header.jsp"></jsp:include>

<div class="container">
<div class="row">
<div class="col-xs-6 jumbotron">   <!-- 1st column -->
<div class="head">
<h3><p class="mytext">Customer Details</p></h3>
</div>
<div class="outer">
<div class="well" style="width:100%">
<form action="${pageContext.request.contextPath}/invoiceprocess" method="post">
<c:set var="srk2" value="0"></c:set>
<c:forEach var="c" items="${cart }">
<c:set var="srk2" value="${srk2 + c.cartPrice * c.cartQuantity }"></c:set>
</c:forEach>

<div class="well">
<table class="tbdetail">
<tr>
<td colspan="3"><b>Name</b></td>
<td>${user.name}</td>
</tr>
<tr>
<td colspan="3"><b>Email</b></td>
<td>${user.email}</td>
</tr>
<tr>
<td colspan="3"><b>Phone</b></td>
<td>${user.phone}</td>
</tr>
<tr>
<td colspan="3"><b>Customer Address</b></td>
<td>${user.address}</td>
</tr>

</table>
<table>
<tr><th colspan="2">Expiry</th>
<th>&nbsp;&nbsp;&nbsp;&nbsp;</th>
<th>CVV</th></tr>
<tr>
<td colspan="2"> 
<input type="number" min="1" max="12" name="month" palacholder="mm" style="width:50%">
<input type="number" min="1" max="12" name="month" palacholder="yy" style="width:50%"></td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>

</table>
</div></div>     <!-- inner end card number -->
<input type="submit" value="PROCEED" style="width:75%; font-size:20px;" class="btn btn-success">
</form>
</div>
</div>
</div>


</div>
<hr>

</body>
</html>