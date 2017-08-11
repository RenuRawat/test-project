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
 
  <li><a class="page-scroll" href="<c:url value="aboutus"/>">About us</a></li>
 <li><a class="page-scroll" href="<c:url value="contactus"/>">Contact us</a></li>
  
 <!--  <li><a href="category">Add category</a></li>
  <li><a href="product">Add Product</a></li>
   <li><a href="supplier">Add Supplier</a></li> -->
  <%--  
   <li><a href="${pageContext.request.contextPath}/productList">ProductList</a></li>
  
    
     <li><a href="${pageContext.request.contextPath}/adding">Admin</a></li> --%>
     
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
    
<security:authorize access="hasRole('ROLE_ADMIN')">
<ul class="nav navbar-nav navbar-right">

<c:if test="${pageContext.request.userPrincipal.name!=null}">

<li><a class="page-scroll" href="<c:url value="/admin/adding"/>">Add Product</a></li>
<li><a class="page-scroll" href="<c:url value="/admin/productList"/>">Update Product</a></li>
</c:if>

</ul>
</security:authorize>

<security:authorize access="hasRole('ROLE_ADMIN')">

<c:if test="${pageContext.request.userPrincipal.name==null}">
<input type="hidden" name="ADMIN" value="${ROLE_ADMIN }">

</c:if>

</ul>
</security:authorize>

    
    
    </ul>
  </div></div>
</nav>


</body>
</html>
