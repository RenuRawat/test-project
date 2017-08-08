<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
  <title>Online shopping</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="index">Online Shop</a>
    </div>
    <!-- Collect the nav links, forms, and other contents for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    <ul class="nav navbar-nav">
      <li class="active"><a href="index">Home</a></li>
    
    
      <!-- <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 1 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Page 1-1</a></li>
          <li><a href="#">Page 1-2</a></li>
          <li><a href="#">Page 1-3</a></li>
        </ul>
      </li>
 -->     
 
  <li><a href="aboutus">About us</a></li>
  <li><a href="contactus">Contact us</a></li>
  
 <!--  <li><a href="category">Add category</a></li>
  <li><a href="product">Add Product</a></li>
   <li><a href="supplier">Add Supplier</a></li> -->
   
   <li><a href="/admin/productList">ProductList</a></li>
  
    
     <li><a href="/admin/adding">Admin</a></li>
     
  <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="productCustList">Category<span class="caret"></span></a>
<ul class="dropdown-menu">
<c:forEach var="catVal" items="${catList}">
<li><a href="${pageContext.request.contextPath}/productCustList?cid=${catVal.cid}"> ${catVal.name } </a></li>
</c:forEach></ul></li>
  
  
    </ul>
    <ul class="nav navbar-nav navbar-right">
    <c:if test="${pageContext.request.userPrincipal.name==null}">
    <li><a href="${pageContext.request.contextPath}/register"><span class="glyphicon glyphicon-user"></span>Sign Up</a></li>
    <li><a href="${pageContext.request.contextPath}/login"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
    </c:if>
    <c:if test="${pageContext.request.userPrincipal.name!=null}">
    <li><a>Welcome:${pageContext.request.userPrincipal.name}</a></li>
    <li><a href="<c:url value="/logout"/>">Logout</a></li>
    </c:if>
    
   <!--    <li><a href="register"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li> -->
    
    
    </ul>
  </div></div>
</nav>


</body>
</html>
