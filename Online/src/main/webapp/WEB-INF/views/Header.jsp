<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<link rel="stylesheet" href="yourPath/fakeLoader.css">
  <title>Online shopping</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"></script>
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
  <div class="container-fluid">
    <div class="navbar-header">
    
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
    
    <a class="navbar-brand" href="index">GADGETs</a>
 <!--  <a href="index" class="navbar-brand"> -->
 <img src="<c:url value="/images/logo.png"/>" width="50" height="50"   />
  <!--  <img src="images/logo.png" width="50" height="50"/> -->
<!-- </a> -->
      
    </div>
    <!-- Collect the nav links, forms, and other contents for toggling -->
    
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    
     
 <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
 <ul class="nav navbar-nav navbar-right">
    <c:if test="${pageContext.request.userPrincipal.name==null}">
    <li><a href="${pageContext.request.contextPath}/register"><span class="glyphicon glyphicon-user"></span>Sign Up</a></li>
    <li><a href="${pageContext.request.contextPath}/login"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
    
    </c:if>
    <c:if test="${pageContext.request.userPrincipal.name!=null}">
    

    <li><a>Welcome:${pageContext.request.userPrincipal.name}</a></li>
    <li><a href="<c:url value="/logout"/>">Logout</a></li>


    </c:if>
    </ul></div>
    
    
    
    
  <ul class="nav navbar-nav">
  <li class="active"><a href="<c:url value="index"/>">Home</a></li>
    <li><a class="page-scroll" href="<c:url value="aboutus"/>">About us</a></li>
 <li><a class="page-scroll" href="<c:url value="contactus"/>">Contact us</a></li> 
 <li><a class="page-scroll" href="<c:url value="Demo"/>">Demo</a></li>
 
 
   <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="<c:url value="productCustList"/>">Category<span class="caret"></span></a>
<ul class="dropdown-menu">
<c:forEach var="catVal" items="${catList}">
<li><a class="page-scroll" href="<c:url value="/productCustList?cid=${catVal.cid}"/>"> ${catVal.name } </a></li>
</c:forEach></ul></li>
  



<sec:authorize access="hasRole('ROLE_USER')">
<ul class="nav navbar-nav navbar-right"> 

<c:if test="${pageContext.request.userPrincipal.name!=null }">

    <li><a class="page-scroll" href="<c:url value="/cart/goToCart"/>">My Cart <i class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></i></a></li>
</c:if></ul>
</sec:authorize>
 
 
 <sec:authorize access="hasRole('ROLE_ADMIN')">
<ul class="nav navbar-nav navbar-right"> 

<c:if test="${pageContext.request.userPrincipal.name!=null }">

<li><a class="page-scroll" href="<c:url value="/admin/adding"/>">Add Product</a></li>
<li><a class="page-scroll" href="<c:url value="/admin/productList"/>">Update Product</a></li>
</c:if></ul>
</sec:authorize>
 
 
 
</ul>   


  </div>
</nav>


</body>
</html>
