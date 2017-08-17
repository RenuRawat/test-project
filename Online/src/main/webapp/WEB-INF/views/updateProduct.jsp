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
<title>Update Product</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/Header.jsp"></jsp:include>
<br>
<br><br><br>
<br>
<div class="container">


<%-- <form method="post" enctype="multipart/form-data" action="<c:url value="/productUpdate" var="pro"/>">
                          "OR"     --%>

<c:url value="/productUpdate" var="pro"></c:url>
<form action="${pageContext.request.contextPath}/admin/productUpdate" method="post" enctype="multipart/form-data">
<input type="hidden" name="pid" value="${produ.pid }">

<h4 class="input-title">Product Name</h4>
<input class="form-control" type="text" name="pName" value="${produ.name }" required />
<h4 class="input-title">Product Description</h4>
<input class="form-control" type="text" name="pDescription" value="${produ.description }" required />
<h4 class="input-title">Product Price</h4>
<input class="form-control" type="text" name="pPrice" value="${produ.price }" required />
<h4 class="input-title">Product Stock</h4>
<input class="form-control" type="text" name="pStock" value="${produ.stock }" required />


<div class="form-group">
<td><h4 class="input-title">Select Category</h4></td>
<td><select class="form-control" name="pCategory" required>
<option>----Category----</option> 
<c:forEach items="${catList}" var="cat"> 
<option value="${cat.cid}">${cat.name}</option>
</c:forEach>
</select>
</div>


 <div class="form-group">
<td><h4 class="input-title">Select Supplier</h4></td>
<td><select class="form-control" name="pSupplier" required>
<option>----Supplier----</option> 
<c:forEach items="${supList}" var="sup">
<option value="${sup.sid}">${sup.name}</option>
</c:forEach>
</select>
</div>


<tr><td><h4 class="input-title">Image</h4></td><br>
<td><input class="form-control" type="file" name="file"/></td></tr><br>
<button class="btn btn-lg btn-primary" type="update">Update</button></div>
</form>
</div>
 

</body>
</html>