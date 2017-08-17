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

<br>
<br><br>

<div class="container">
<form class="form-horizontal" action="checkout">
<fieldset>
<div class="form-group">
<label class="col-md-4 control-label" for="username">Customer Name</label>
<div class="col-md-4">
<label class="col-md-4 control-label" for="username">${orderDetails.username }</label>
</div>
</div>

<div class="form-group">
<label class="col-md-4 control-label" for="email">Customer Email Address</label>
<div class="col-md-4">
<label class="col-md-4 control-label" for="email">${orderDetails.email }</label>
</div></div>

<div class="form-group">
<label class="col-md-4 control-label" for="address">Shipping Address</label>
<div class="col-md-4">
<label class="col-md-4 control-label" for="address">${orderDetails.address }</label>
</div></div>



<div class="form-group">
<label class="col-md-4 control-label" for="deliverydate">Date of Delivery</label>
<div class="col-md-4">
<label class="col-md-4 control-label" for="deliverydate">Delivery in 7 Working day</label>
</div></div>

<div class="form-group">
<label class="col-md-4 control-label" for="submit"></label>
<div class="col-md-4">
<button type="submit" name="invoiceClick" class="btn btn-primary"> Ok </button>
</div></div>

</fieldset>

</form>

</div>

</body>
</html>