<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>Registration Page</title>
</head>
<body>
<jsp:include page="Header.jsp"></jsp:include>
<form:form action="savesupplier" method="POST" modelAttribute="sup">

<table>
    
    <tr>
        <td>Supplier Name :</td>
        <td><form:input path="name" /></td>
    </tr>
  
  
    <tr>
        <td colspan="2"><input type="submit" value="Add Supplier"></td>
    </tr>
</table>
</form:form>
<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
