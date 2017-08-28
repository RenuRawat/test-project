<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
              pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href="assets/mycss/listDlt.css" rel="stylesheet">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="/resources/bootstrap.css">


<link href="assets/mycss/custmlistView.css" rel="stylesheet">

<title>Login Page</title>
</head>
<body>
<jsp:include page="Header.jsp"></jsp:include>
<br><br><br>
<div class="container">

<h4>
<img src="<c:url value="/images/cart.jpg"/>" width="140" height="110"/> &nbsp; YOUR CART</h4>
<table id="cart" class="table table-hover table-condensed">
<thead> 
<tr>
<th>Sr.no.</th>
<th>Product Name</th>
<th>Quantity</th>
<th>price</th>
<th>Image</th>
<th>Total</th>
<th>Action</th>
</tr></thead>
<tbody>
<c:if test="${empty cartInfo }">
<tr>
<td colspan="9" align="center">No Record Exists</td></tr>
</c:if>

<c:forEach var="c" varStatus="st" items="${cartInfo }">
<tr>
<td><c:out value="${st.count }"></c:out></td>
<td><c:out value="${c.cartProductName }"></c:out></td>
<td><c:out value="${c.cartQuantity }"></c:out></td>
<td><c:out value="${c.cartPrice }"></c:out></td>


<td><img src="${pageContext.request.contextPath }/resources/${c.cartImage }" height="50px" width="50px"></td>

<td><c:out value="${c.cartQuantity * c.cartPrice }"></c:out></td>

<td class="actions" data-th="">
<a href="<c:url value="/cart/goToCart" />" class="btn btn-info btn-md" ><i class="fa fa-refresh"></i></a>
<a href="<c:url value="/cart/deleteCart/${c.cartId}"/>" class="btn btn-danger btn-md"><i class="fa fa-trash-o"></i></a></td>
<c:set var="gtot" value= "${gtot + c.cartPrice * c.cartQuantity}"></c:set>


</tr></c:forEach>


<tr>

<td><span class="col-lg-9" align="right"><label>Grand Total</label><c:out value="${gtot }"></c:out></span></td>
</tr>
</tbody>

<tfoot>
<tr>
<br>
<td><a href="${pageContext.request.contextPath }/index" class="btn btn-warning">
<i class="fa fa-angle-left"></i> Continue Shopping</a></td>
<c:if test="${not empty cartInfo }">
<td colspan="4" class="hidden-xs"></td>
<td><a href="<c:url value="/cart/checkout" />" class="btn btn-success btn-block">Checkout
<i class="fa fa-angle-right"></i></a></td>
</c:if></tr>
</tfoot>
</table></div>



</body>
</html>