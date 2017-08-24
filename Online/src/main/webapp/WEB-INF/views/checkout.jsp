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

<c:set var="gtot" value="0"></c:set>
<c:forEach var="c" items="${cart}">
<c:set var="gtot" value="${gtot + c.cartPrice * c.cartQuantity }"></c:set>
</c:forEach>

<%-- <c:forEach var="c" items="${cart}">
<c:set var="c" value="${c.prod.stock-c.cartQuantity }"></c:set>
</c:forEach> --%>
<%-- <c:set var="stot" value="0"></c:set>
<c:forEach var="c" items="${cart}">
<c:set var="stot" value="${c.product.stock-c.cartQuantity }"></c:set>
</c:forEach> --%>

<div class="well">
<table class="tbdetail">

<tr>
<td colspan="3"><b>Name</b></td>
<td>${user.username}</td>
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
<td colspan="3"><b>Total Amount</b></td>
<td> ${gtot}</td>
</tr>


</table></div>

<div style="margin-top:10px">
<h3><strong>Enter Card Details</strong></h3>
</div>
<input type="hidden" name="total" value="${gtot}">

<div class="well">
<table>
<tr><th><label>Payment</label></th><br>
<td><select name="payment" style="width:60%">
<option>----Select----</option> 

<option value="NetBanking">Net Banking</option>
<option value="COD">Cash on Delivery</option>
</select></td></tr>

<tr><th>Card Number</th>
<td><input type="text" name="cardnum" placeholder="Enter your card number" style="width:60%"></td></tr><br>
<tr><th>Card Namer</th>
<td><input type="text" name="name" placeholder="Name on the card" style="argin-bottom:10px; width:60%"></td></tr><br>

<tr>
<th>CVV</th>
 <td><input path="number" name="cvv" style="width:60%"></td></tr>
 <tr>
 <th>Expire</th>
<td colspan="2"> 

<input type="text" min="1" max="31" name="month" placeholder="mm" style="width:20%">&nbsp;&nbsp;
<input type="text" min="2016" max="2030" name="year" placeholder="yy" style="width:20%"></td>

</tr>
</table></div>

    <!-- inner end card number -->
<input type="submit" value="PROCEED" style="width:75%; font-size:20px;" class="btn btn-success">
</form></div></div> 
</div>
</div>
</div>



<hr>

</body>
</html>