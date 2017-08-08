<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>Product Page</title>
</head>
<body>
<jsp:include page="Header.jsp"></jsp:include>
<br>
<form:form action="addproduct" method="POST" modelAttribute="pro">

<table>
    
    <tr>
        <td>Product Name :</td>
        <td><form:input path="name" /></td>
    </tr>
    
    <tr>
        <td>Product Category :</td>
        <td><form:input path="category" /></td>
    </tr>
   <tr>
        <td>Product Description :</td>
        <td><form:textarea  path="description" /></td>
    </tr>
     <tr>
        <td>Product Amount :</td>
        <td><form:input path="amount" /></td>
    </tr>
    
     <tr>
        <td>Product Quantity :</td>
        <td><form:input path="quantity" /></td>
    </tr>
  
    <tr>
        <td colspan="2"><input type="submit" value="Add Product"></td>
    </tr>
</table>
</form:form>
<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
