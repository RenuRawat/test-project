<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
              pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href="assets/mycss/checkout.css" rel="stylesheet">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="/resources/bootstrap.css">
</head>
<body><br><br>
<jsp:include page="Header.jsp"></jsp:include>


<div class="container wrapper">
            <div class="row cart-head">
                <div class="container">
                <div class="row">
                    <p></p>
                </div>
              
               
                </div>
            </div>    
           <div class="row cart-body">


                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 col-md-push-6 col-sm-push-6">


 <div class="panel panel-info">
    
 <div class="panel-heading">Order Details</div>
<div class="panel-body">                
<h4><p class="mytext">Customer Details</p></h4>
</div>

<form>

<c:set var="gtot" value="0"></c:set>
<c:forEach var="c" items="${cart}">
<c:set var="gtot" value="${gtot + c.cartPrice * c.cartQuantity }"></c:set>
</c:forEach>
<center><div class="well">
<table class="tbdetail">

<tr>
<td colspan="3"><b>Name: </b></td>
<td>${user.username}</td>
</tr>
<tr>
<td colspan="3"><b>Email: </b></td>
<td>${user.email}</td>
</tr><br>
<tr>
<td colspan="3"><b>Phone: </b></td>
<td>${user.phone}</td>
</tr><br>
<tr>
<td colspan="3"><b>Total Amount: </b></td>
<td>${gtot}</td>
</tr><hr>


</table></div></center></form>


                    </div></div>                
                
                
                
                
                
              
                
                
             <%--    <input type="hidden" name="total" value="${gtot}"> --%>
 
            
            

            
            
                    
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 col-md-pull-6 col-sm-pull-6">
              

  <form action="${pageContext.request.contextPath}/cart/invoiceprocess" method="post">
  <span id="reauth-email" class="reauth-email"></span>


  <!--SHIPPING METHOD-->
  
                <div class="panel panel-info">
                        <div class="panel-heading">Address</div>
                        <div class="panel-body">
                            <div class="form-group">
                                <div class="col-md-12">
                                    <h4>Shipping Address</h4>
                                </div>
                            </div>
   
<!-- <div class="form-group has error has-feedback has success">
<label for ="email" class="cols-sm-2 control-label">Email</label>
<div class="cols-sm-10">
<errors path="email" cssClass="err"/>
<div class="input-group">
<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
<input type="text" id="inputEmail" name="email" path="email" class="form-control" placeholder="Enter Your Email" "required" />
</div></div></div> -->

<div class="form-group has error has-feedback has success">
<label for ="sname" class="cols-sm-2 control-label">Name</label>
<div class="cols-sm-10">
<errors path="sname" cssClass="err"/>
<div class="input-group">
<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
<input type="text" id="inputUserName" name="sname" path="sname" class="form-control" placeholder= "Enter Your Full Name" required />
</div></div></div>



<!-- <div class="form-group has error has-feedback has success">
<label for ="phone" class="cols-sm-2 control-label">Phone</label>
<div class="cols-sm-10">
<errors path="phone" cssClass="err"/>
<div class="input-group">
<span class="input-group-addon"><i class="fa fa-phone fa" aria-hidden="true"></i></span>
<input type="text"  name="phone" path="phone" class="form-control" placeholder="Enter Your Phone" required/>
</div></div></div> -->



<div class="form-group has error has-feedback has success">
<label for ="sadd1" class="cols-sm-2 control-label">Address line1</label>
<div class="cols-sm-10">
<errors path="sadd1" cssClass="err"/>
<div class="input-group">
<span class="input-group-addon"><i class="fa fa-map-marker fa" aria-hidden="true"></i></span>
<input type="text"  name="sadd1" path="sadd1" class="form-control" placeholder="Enter Your Address line1" required/>
</div></div></div>

<div class="form-group has error has-feedback has success">
<label for ="sadd2" class="cols-sm-2 control-label">Address line2</label>
<div class="cols-sm-10">
<errors path="sadd2" cssClass="err"/>
<div class="input-group">
<span class="input-group-addon"><i class="fa fa-map-marker fa" aria-hidden="true"></i></span>
<input type="text"  name="sadd2" path="sadd2" class="form-control" placeholder="Enter Your Address line2" required/>
</div></div></div>

<div class="form-group has error has-feedback has success">
<label for ="scity" class="cols-sm-2 control-label">City</label>
<div class="cols-sm-10">
<errors path="scity" cssClass="err"/>
<div class="input-group">
<span class="input-group-addon"><i class="fa fa-map-marker fa" aria-hidden="true"></i></span>
<input type="text"  name="scity" path="scity" class="form-control" placeholder="Enter Your City" required/>
</div></div></div>

<div class="form-group has error has-feedback has success">
<label for ="sstate" class="cols-sm-2 control-label">State</label>
<div class="cols-sm-10">
<errors path="sstate" cssClass="err"/>
<div class="input-group">
<span class="input-group-addon"><i class="fa fa-map-marker fa" aria-hidden="true"></i></span>
<input type="text"  name="sstate" path="sstate" class="form-control" placeholder="Enter Your State" required/>
</div></div></div>

<div class="form-group has error has-feedback has success">
<label for ="spincode" class="cols-sm-2 control-label">Zip / Postal Code:</label>
<div class="cols-sm-10">
<errors path="spincode" cssClass="err"/>
<div class="input-group">
<span class="input-group-addon"><i class="fa fa-map-marker fa" aria-hidden="true"></i></span>
<input type="text"  name="spincode" path="spincode" class="form-control" placeholder="Enter Your pincode" required/>
</div></div></div>

<!-- <div class="form-group has error has-feedback has success">
<label for ="country" class="cols-sm-2 control-label">Country</label>
<div class="cols-sm-10">
<errors path="country" cssClass="err"/>
<div class="input-group">
<span class="input-group-addon"><i class="fa fa-map-marker fa" aria-hidden="true"></i></span>
<input type="text"  name="country" path="country" class="form-control" placeholder="Enter Your Country" required/>
</div></div></div> -->

<div class="form-group">
<button type="${pageContext.request.contextPath }/cart/invoiceprocess"  value="Payment" class="btn btn-primary btn-lg btn-block login-button">Payment</button>
</div>




</div></div> 




<%-- <div class="panel panel-info">

                        <div class="panel-heading"><span><i class="glyphicon glyphicon-lock"></i></span> Secure Payment</div>
                        <div class="panel-body">
                        
                        
<!--                         
 <div class="form-group has error has-feedback has success">
<label for ="country" class="cols-sm-2 control-label">Country</label>
<div class="cols-sm-10">
<errors path="country" cssClass="err"/>
<div class="input-group">
<span class="input-group-addon"><i class="fa fa-map-marker fa" aria-hidden="true"></i></span>
<input type="text"  name="country" path="country" class="form-control" placeholder="Enter Your Country" required/>
</div></div></div> -->
                        
                        
                        
                        
                        
                            <div class="form-group">
                                <div class="col-md-12"><strong>Card Type:</strong></div>
                                <div class="col-md-12">
                                    <select id="CreditCardType" name="CreditCardType" class="form-control">
                                        <option value="5">Visa</option>
                                        <option value="6">MasterCard</option>
                                        <option value="7">American Express</option>
                                        <option value="8">MastroCard</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12"><strong>Credit Card Number:</strong></div>
                                <div class="col-md-12"><input type="text" class="form-control" name="car_number" value="" /></div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12"><strong>Card CVV:</strong></div>
                                <div class="col-md-12"><input type="text" class="form-control" name="car_code" value="" /></div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12">
                                    <strong>Expiration Date</strong>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <select class="form-control" name="">
                                        <option value="">Month</option>
                                        <option value="01">01</option>
                                        <option value="02">02</option>
                                        <option value="03">03</option>
                                        <option value="04">04</option>
                                        <option value="05">05</option>
                                        <option value="06">06</option>
                                        <option value="07">07</option>
                                        <option value="08">08</option>
                                        <option value="09">09</option>
                                        <option value="10">10</option>
                                        <option value="11">11</option>
                                        <option value="12">12</option>
                                </select>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <select class="form-control" name="">
                                        <option value="">Year</option>
                                        <option value="2017">2017</option>
                                        <option value="2018">2018</option>
                                        <option value="2019">2019</option>
                                        <option value="2020">2020</option>
                                        <option value="2021">2021</option>
                                        <option value="2022">2022</option>
                                        <option value="2023">2023</option>
                                        <option value="2024">2024</option>
                                        <option value="2025">2025</option>
                                        <option value="2015">2026</option>
                                        <option value="2016">2027</option>
                                </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12">
                                    <span>Pay secure using your credit card.</span>
                                </div>
                                <div class="col-md-12">
                                    <ul class="cards">
                                        <li class="visa hand">Visa</li>
                                        <li class="mastercard hand">MasterCard</li>
                                        <li class="amex hand">Amex</li>
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-6 col-sm-6 col-xs-12">
       

                               
<a href="${pageContext.request.contextPath }/cart/invoiceprocess" role="button" type="submit" class="btn btn-primary btn-submit-fix">PROCEED</a>
                                </div>
                            </div>
                        </div>
                    </div></form>
                    <!--CREDIT CART PAYMENT END-->
                </div> --%>





















    



                   
                            
                            
     <!--                        
                            <div class="form-group">
                                <div class="col-md-12"><strong>Country:</strong></div>
                                <div class="col-md-12">
                                    <input type="text" class="form-control" name="country" value="" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-6 col-xs-12">
                                    <strong>First Name:</strong>
                                    <input type="text" name="first_name" class="form-control" value="" />
                                </div>
                                <div class="span1"></div>
                                <div class="col-md-6 col-xs-12">
                                    <strong>Last Name:</strong>
                                    <input type="text" name="last_name" class="form-control" value="" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12"><strong>Address:</strong></div>
                                <div class="col-md-12">
                                    <input type="text" name="address" class="form-control" value="" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12"><strong>City:</strong></div>
                                <div class="col-md-12">
                                    <input type="text" name="city" class="form-control" value="" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12"><strong>State:</strong></div>
                                <div class="col-md-12">
                                    <input type="text" name="state" class="form-control" value="" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12"><strong>Zip / Postal Code:</strong></div>
                                <div class="col-md-12">
                                    <input type="text" name="zip_code" class="form-control" value="" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12"><strong>Phone Number:</strong></div>
                                <div class="col-md-12"><input type="text" name="phone_number" class="form-control" value="" /></div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12"><strong>Email Address:</strong></div>
                                <div class="col-md-12"><input type="text" name="email_address" class="form-control" value="" /></div>
                            </div>
                        </div>
                    </div> -->
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  


            <div class="row cart-footer">
        
            </div></div></div>
    
</body>
</html>