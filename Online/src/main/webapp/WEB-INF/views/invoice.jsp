<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
              pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href="assets/mycss/checkout.css" rel="stylesheet">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="/resources/bootstrap.css">
</head>
<body><br><br>
<jsp:include page="Header.jsp"></jsp:include>
<br><br><br><br>

<div class="container">
           
                
          <center> <div class="row cart-body">

              <form action="form-horizontal" method="post">
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
               
                  
 
 <div class="panel panel-info">
<div class="panel-heading"><h4>Invoice Process</h4></div>
<div class="panel-body">
<fieldset>
<%-- <c:set var="gtot" value="0"></c:set>
<c:forEach var="c" items="${cart}">
<c:set var="gtot" value="${gtot + c.cartPrice * c.cartQuantity }"></c:set>
</c:forEach> --%>

<div class="form-group">
<label class="col-md-4 control-label" for="username">Customer Name</label>
<div class="col-md-4">
<label class="col-md-4 control-label" for="username">${orderDetails.username}</label>
</div>
</div><br>

<div class="form-group">
<label class="col-md-4 control-label" for="email">Customer Email Address</label>
<div class="col-md-4">
<label class="col-md-4 control-label" for="email">${orderDetails.email}</label>
</div></div><br><br>

<div class="form-group">
<label class="col-md-4 control-label" for="address">Shipping Address</label>
<div class="col-md-4">
<label class="col-md-4 control-label" for="address">${orderDetails.address}</label>
</div></div><br>

<%-- <div class="form-group">
<label class="col-md-4 control-label" for="address">Total Amount</label>
<div class="col-md-4">
<label class="col-md-4 control-label" for="address">${user.gtot}</label>
</div></div><br> --%>

<div class="form-group">
<label class="col-md-4 control-label" for="deliverydate">Date of Delivery</label>
<div class="col-md-6">
<label class="col-md-6 control-label" for="deliverydate">Delivery in 7 Working day</label>
</div></div><br><br>


<center><div class="form-group">
<div class="col-md-4 control-label">
<a class="btn btn-success btn-block" role="button" href="${pageContext.request.contextPath }/Thankyou" type="submit" name="invoice" class="btn btn-primary"> Ok </a>
</div></div></center><br>

</fieldset>
</div></div>
</div></form>
</div></center>
               
          <div class="row cart-footer">
        
            </div></div>
            
            
           </body></html>
           
           
