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
<br><br><br>
<div class="container">
<h4><img src"${pageContext.request.contextPath }/images/icon.png"> &nbsp; YOUR CART</h4>
<table id="cart" class="table table-hover table-condensed">
<thread> 
<tr>
<th>Product Name</th>
<th>Quantity</th>
<th>price</th>
<th>Image</th>
<th>Total</th>
<th>Action</th>
</tr></thread>

<tbody>
<c:if test="${empty cartInfo }">
<tr>
<td colspan="9" align="center">No Record Exists</td></tr>
</c:if>

<c:forEach var="c" varStatus="st" items="${cartInfo }">
<tr>
<td><c:out value="${c.cartProductName }"></c:out></td>
<td><c:out value="${c.cartQuantity }"></c:out></td>
<td><c:out value="${c.cartPrice }"></c:out></td>

<td><img src="${pageContext.request.contextPath }/resources/<c:out value='${c.cartImage }'></c:out>"></td>
<td><c:out value="${c.cartQuantity * c.cartPrice }"></c:out></td>
<td><a href="${pageContext.request.contextPath }/deleteCart/${c.cartId}" class="btn btn-danger btn-sm"></a></td>
<c:set var="gtot" value= "${gtot + c.cartPrice * c.cartQuantity }"></c:set>
</tr>
</c:forEach>

<%-- <tr>
<td><span class="col-lg-5"><c:out value="${c.cartQuantity * c.cartPrice }"></c:out></span></td>
</tr> --%>



<tr>
<label>Grand Total</label>
<td><span class="col-lg-9" align="right"><c:out value="${gtot }"></c:out></span></td>
</tr>
</tbody>

<tfoot>
<tr>
<td><a href="${pageContext.request.contextPath }/index" class="btn btn-warning">
<i class="fa fa-angle-left"></i>Continue Shopping</a></td>
<c:if test="${not empty cartInfo }">
<td><a href="${pageContext.request.contextPath }/checkout" class="btn btn-success btn-block">Checkout
<i class="fa fa-angle-right"></i></a></td>
</c:if></tr>
</tfoot>
</table>

</div>

</body>
</html>