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
<link href="assets/mycss/Registration.css" rel="stylesheet">
<title>Admin Page</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/Header.jsp"></jsp:include>
<div class="container">
<div class="page-header">
<br></div> 
<div class="container">
<div class="row">
<div class="col-md-6">
<div class="panel with-nav-tabs panel-primary">
<div class="panel-heading">
<ul class="nav nav-tabs">
<li class="active"><a href= "#tab1primary" class="btn btn-lg btn-primary" data-toggle="tab">Category</a></li>
<li><a href="#tab2primary" class="btn btn-lg btn-primary" data-toggle="tab">Supplier</a></li>
<li><a href="#tab3primary" class="btn btn-lg btn-primary" data-toggle="tab">Products</a></li>
</ul></div></div>                                                                                                
<div class="panel-body">
<div class="tab-content">
<div class="tab-pane fade in active" id="tab1primary">
<form method="post" action="<c:url value="/admin/savecategory"/>"
class="form-signin">
<span id="reauth-email" class="reauth-email"></span>

<h4 class="input-title">Category Name</h4>
<input class="form-control" type="text" name="name" required /><br>
<button class="btn btn-lg btn-primary" type="submit">Save</button>
<button class="btn btn-lg btn-primary" type="reset">Cancel</button>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
</form></div>


<div class="tab-pane fade" id="tab2primary">
<form method="post" action="<c:url value="/admin/savesupplier"/>"
class="form-signin">
<span id="reauth-email" class="reauth-email"></span>

<h4 class="input-title">Supplier Name</h4>
<input class="form-control" type="text" name="suppliername" required /><br>
<button class="btn btn-lg btn-primary" type="submit">Save</button>
<button class="btn btn-lg btn-primary" type="reset">Cancel</button>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
</form></div> 


<div class="tab-pane fade" id="tab3primary">
<form method="post" action="<c:url value="/admin/addproduct"/>"  class="form-signin" enctype="multipart/form-data">
<span id="reauth-email" class="reauth-email"></span>

<h4 class="input-title">Product Name</h4>
<input class="form-control" type="text" name="pName" required />
<h4 class="input-title">Product Description</h4>
<input class="form-control" type="text" name="pDescription" required />
<h4 class="input-title">Product Price</h4>
<input class="form-control" type="text" name="pPrice" required />
<h4 class="input-title">Product Stock</h4>
<input class="form-control" type="text" name="pStock" required />


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
<option value="${sup.sid}">${sup.suppliername}</option>
</c:forEach>
</select>
</div>
 
<div class="fileinput fileinput-new" data-providers="fileinput">
<tr>
<td><h4 class="input-title">Image</h4></td>
<td><input class="form-control" type="file" name="file" accept="image/*"></td>
</tr>
 
</div><br>
 
<button class="btn btn-lg btn-primary" type="submit">Save</button>
<button class="btn btn-lg btn-primary" type="reset">Cancel</button>
</form>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>