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
<h2>Product List</h2>
<table class="table table-hover" id="category" class="display" border="1" width="80" align="center">

<tr>
<th> Sr No.</th><th>PID</th><th>Name</th><th>Category</th><th>Supplier</th><th>Price</th><th>Stock</th><th style="width:15">Description</th>
<th>Image</th><th class="span2">Action</th>
</tr>

<c:if test="${empty produList }"><tr><td colspan="9" align="center">No record exists</td></tr>
</c:if>
<c:forEach var="c" varStatus="st" items="${produList }">
<tr>
<td><c:out value="${st.count }"></c:out></td>
<td><c:out value="${c.pid }"></c:out></td>
<td><c:out value="${c.name }"></c:out></td>
<td><c:out value="${c.cat.name }"></c:out></td>
<td><c:out value="${c.sup.name }"></c:out></td>
<td><c:out value="${c.price }"></c:out></td>
<td><c:out value="${c.stock }"></c:out></td>

<td class="span2"><c:out value="${c.description}"></c:out></td>




<td><img src="${pageContext.request.contextPath}/resources/${c.imgname}"  height="60px" width="60px"></td>
<td class="span4">
<c:set var="contextRoot" value="${pageContext.request.contextPath}"></c:set>
<a class="btn btn-info" role="button" href="<c:url value="/admin/deleteProduct/${c.pid}"/>">Delete</a>
<br>
<a class="btn btn-info" role="button" href="${contextRoot }/admin/updateProduct?pid=<c:out value="${c.pid}"> </c:out>">Update</a>
</td></tr>
</c:forEach>

</table>
</body>
</html>