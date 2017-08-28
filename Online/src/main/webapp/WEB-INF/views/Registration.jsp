<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html lang="en">
    <head> 
    <title>Registration</title>
<!-- <script type="text/javascript">
    function check_info(){
    	
    	console.log('inside function');
    	var password = document.getElementById("password").value;
    	var confirm = document.getElementById("confirm").value;
    	if(password == confirm){
    		console.log('inside if');
    		return true;
    	}
    	else{
    		alert ('Password is not match');
    		return false;
    		
    	}    }    
    
</script>  -->
    <style>
        .err{
color: red;
}
.err_bdr {
border: 1px solid red;
}
.bdr {
  border: 1px solid gray;
}
 
    </style>
     
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
	
		<div class="container">
			<div class="row main">
				<div class="panel-heading">
	               <div class="panel-title text-center">
	               		<h2 class="title">User Details</h2>
	               		<hr />
	               	</div>
	            </div> 
				<div class="main-login main-center">
				
				
				
<form modelAttribute="user"  method="post" action="saveregister" onsubmit="return check_info()">
<span id="reauth-email" class="reauth-email"></span>
<fieldset>


<div class="form-group has error has-feedback has success">
<label for ="email" class="cols-sm-2 control-label">Email</label>
<div class="cols-sm-10">
<errors path="email" cssClass="err"/>
<div class="input-group">
<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
<input type="text" id="inputEmail" name="email" path="email" class="form-control" placeholder="Enter Your Email" required />
</div></div></div>

<div class="form-group has error has-feedback has success">
<label for ="username" class="cols-sm-2 control-label">Name</label>
<div class="cols-sm-10">
<errors path="username" cssClass="err"/>
<div class="input-group">
<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
<input type="text" id="inputUserName" name="username" path="username" class="form-control" placeholder= "Enter Your Name" required />
</div></div></div>

<div class="form-group has error has-feedback has success">
<label for ="password" class="cols-sm-2 control-label">Password</label>
<div class="cols-sm-10">
<errors path="password" cssClass="err"/>
<div class="input-group">
<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
<input type="password" id="inputPassword" path="password" name="password" class="form-control" placeholder= "********" required />
</div></div></div>

<!-- <div class="form-group has error has-feedback has success">
<label for ="confirm" class="cols-sm-2 control-label">Confirm Password</label>
<div class="cols-sm-10">

<div class="input-group">
<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
<input type="password" id="inputConfirmPassword" id="confirm"  name="confirm" class="form-control" placeholder= "********" required />
</div></div></div> -->

<div class="form-group has error has-feedback has success">
<label for ="phone" class="cols-sm-2 control-label">Phone</label>
<div class="cols-sm-10">
<errors path="phone" cssClass="err"/>
<div class="input-group">
<span class="input-group-addon"><i class="fa fa-phone fa" aria-hidden="true"></i></span>
<input type="text"  name="phone" path="phone" class="form-control" placeholder="Enter Your Phone" required/>
</div></div></div>



<div class="form-group has error has-feedback has success">
<label for ="addressline1" class="cols-sm-2 control-label">Address line1</label>
<div class="cols-sm-10">
<errors path="addressline1" cssClass="err"/>
<div class="input-group">
<span class="input-group-addon"><i class="fa fa-map-marker fa" aria-hidden="true"></i></span>
<input type="text"  name="addressline1" path="addressline1" class="form-control" placeholder="Enter Your Address line1" required/>
</div></div></div>

<div class="form-group has error has-feedback has success">
<label for ="addressline2" class="cols-sm-2 control-label">Address line2</label>
<div class="cols-sm-10">
<errors path="addressline2" cssClass="err"/>
<div class="input-group">
<span class="input-group-addon"><i class="fa fa-map-marker fa" aria-hidden="true"></i></span>
<input type="text"  name="addressline2" path="addressline2" class="form-control" placeholder="Enter Your Address line2" required/>
</div></div></div>

<div class="form-group has error has-feedback has success">
<label for ="city" class="cols-sm-2 control-label">City</label>
<div class="cols-sm-10">
<errors path="city" cssClass="err"/>
<div class="input-group">
<span class="input-group-addon"><i class="fa fa-map-marker fa" aria-hidden="true"></i></span>
<input type="text"  name="city" path="city" class="form-control" placeholder="Enter Your City" required/>
</div></div></div>

<div class="form-group has error has-feedback has success">
<label for ="state" class="cols-sm-2 control-label">State</label>
<div class="cols-sm-10">
<errors path="state" cssClass="err"/>
<div class="input-group">
<span class="input-group-addon"><i class="fa fa-map-marker fa" aria-hidden="true"></i></span>
<input type="text"  name="state" path="state" class="form-control" placeholder="Enter Your State" required/>
</div></div></div>

<div class="form-group has error has-feedback has success">
<label for ="pincode" class="cols-sm-2 control-label">Pin code</label>
<div class="cols-sm-10">
<errors path="state" cssClass="err"/>
<div class="input-group">
<span class="input-group-addon"><i class="fa fa-map-marker fa" aria-hidden="true"></i></span>
<input type="text"  name="pincode" path="pincode" class="form-control" placeholder="Enter Your pincode" required/>
</div></div></div>

<div class="form-group has error has-feedback has success">
<label for ="country" class="cols-sm-2 control-label">Country</label>
<div class="cols-sm-10">
<errors path="country" cssClass="err"/>
<div class="input-group">
<span class="input-group-addon"><i class="fa fa-map-marker fa" aria-hidden="true"></i></span>
<input type="text"  name="country" path="country" class="form-control" placeholder="Enter Your Country" required/>
</div></div></div>




<div class="form-group">
<button type="submit" value="register" class="btn btn-primary btn-lg btn-block login-button">Register</button>
</div>
</fieldset></form>
</div></div></div>

</body></html>
