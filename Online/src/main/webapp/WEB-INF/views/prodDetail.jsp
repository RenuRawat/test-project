<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<html>
<head>
  <title>Product List</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/Header.jsp"></jsp:include>
<br>

<div class="container">
<div class= "row">
<div class="col-md-6 item-photo">
<img src="${pageContext.request.contextPath }/resources/${product.imgname}"
          style="max-width:100% ; margin-top:50px;">
</div>
<div class="col-md-7">
<label>Name</label>
<h2>${product.name}</h2>
<label>Description</label>
<h4>${product.description}</h4>
<label>Price</label>
<h5>${product.price}</h5>
<label>Stock</label>
<h5>${product.stock}</h5>
<label>Vendor</label>
<h5>${product.sup.name}</h5>
</div>
<div class="section" style="padding-bottom:20px;">

<form action="${pageContext.request.contextPath }/addToCart" method="post">
<input type="hidden" value="${product.pid }" name="pId"/>
<input type="hidden" value="${product.name }" name="name"/><br>
<input type="hidden" value="${product.price }" name="pPrice"/><br>
<input type="hidden" value="${product.stock }" name="pStock"/><br>
<input type="hidden" value="${product.sup.name }" name="pSupplier"/><br>
<input type="hidden" value="${product.imgname }" name="imgname"/><br>

<input type="number" class="form-control" name="quant" required/><br>

<label>Mention quantity of product for purchase:</label><br>
<input class="btn btn-primary btn-lg" type="submit" value="Add to cart">

</form>

<h6><span class="glyphicon-heart-empty" style="cursor:pointer;"></span>Wish List</h6>
</div></div>

<div class="col-xs-9">
<ul class="menu-items">
<li class="active">Details of Product</li>
</ul>
<hr>
<p>All Products are home made</p>
</div>



<%-- <input class="btn btn-primary btn-lg" type="submit" value="Add To Cart">
</form>
</div>
<div class="col-sm-9">
<label><h3>Description</h3></label>
<hr></hr>
<p>The Products are all hand-made and certified by Food corporation of India.</p>
</div> --%>


</body>
</html>