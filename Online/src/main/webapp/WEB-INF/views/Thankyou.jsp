<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html lang="en">
    <head> 

     <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link href="assets/mycss/Registration.css" rel="stylesheet">
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
 <link rel="stylesheet" href="style.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
 
    <script src="js/bootstrap.min.js"></script>
  
	<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>

		
	</head>
	<body>
	<jsp:include page="Header.jsp"></jsp:include>
	<br><br>
	
	<div class="container" style="margin-top:5%;">
	<div class="row">
	
        <div class="jumbotron" style="box-shadow: 2px 2px 4px #000000;">
            <h2 class="text-center">Thank you <span style="color:#F89406;"> for </span><span style="color:#26A65B;">Shopping </span><span style="color:#19B5FE;">here</span></h2>
            <center><div class="btn-group" style="margin-top:50px;">
                <a class="btn btn-info" role="button" href="${pageContext.request.contextPath}/index" class="btn btn-lg btn-primary">Go To Home</a>
               
            </div></center>
        </div>
	</div>
</div>
	
	
	
	

</body>
</html>