<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>Registration Page</title>
</head>
<body>
<jsp:include page="Header.jsp"></jsp:include>
<form:form action="savecategory" method="POST" modelAttribute="cat">

<table>
    
    <tr>
        <td>Category Name :</td>
        <td><form:input path="name" /></td>
    </tr>
  
  
    <tr>
        <td colspan="2"><input type="submit" value="Add Catyegory"></td>
    </tr>
</table>
</form:form>
<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
