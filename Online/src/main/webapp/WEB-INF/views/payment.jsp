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








                    
<div class="col-lg-6 col-md-6 col-sm-6 ">
              




<div class="panel panel-info">

<div class="panel-heading"><span><i class="glyphicon glyphicon-lock"></i></span> Secure Payment</div>
<div class="panel-body">
                        
                        
  <form  action="${pageContext.request.contextPath}/cart/invoiceprocess">
  <span id="reauth-email" class="reauth-email"></span>
                        
                        
       
                        
                        
                            <div class="form-group has error has-feedback has success">
                               
                                <div class="col-md-12"><strong>Card Type:</strong>
                                <errors path="CreditCardType" cssClass="err"/>
                                    <select id="CreditCardType" name="CreditCardType" path="CreditCardType" class="form-control">
                                        <option value="5">Visa</option>
                                        <option value="6">MasterCard</option>
                                        <option value="7">American Express</option>
                                        <option value="8">MastroCard</option>
                                    </select>
                                </div>
                            </div>
                            
<div class="form-group has error has-feedback has succes">
<div for ="card_name" class="col-md-12" control-label"><strong>Credit Card Name:</strong>
<errors path="card_name" cssClass="err"/>
<input type="text" class="form-control" path="card_name" name="card_name" placeholder="Enter Your Card Name" required /></div>
 </div>
                            
                            
<div class="form-group has error has-feedback has succes">
<div for ="card_number" class="col-md-12" control-label"><strong>Credit Card Number:</strong>
<errors path="card_number" cssClass="err"/>
<input type="text" id="card_number" size="24" maxlength="16" class="form-control" path="card_number" id="card_number" name="card_number" placeholder="Enter Your Card Number" required /></div>
 </div>

<div class="form-group has error has-feedback has succes">
<div for ="cvv_number" class="col-md-12" control-label"><strong>CVV Code:</strong>
<errors path="cvv_number" cssClass="err"/>
<input type="text" class="form-control" path="cvv_number" name="cvv_number" placeholder="Enter Your CVV Code" required /></div>
 </div>


                            <div class="form-group has error has-feedback has succes">
                                <div class="col-md-12">
                                    <strong>Expiration Date</strong>
                                </div>
                                <errors path="expirationmnth" cssClass="err"/>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <select class="form-control has error has-feedback has succes" name="expirationmnth">
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
                                <errors path="expirationyear" cssClass="err"/>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <select class="form-control has error has-feedback has succes" name="expirationyear">
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
<button type="${pageContext.request.contextPath }/cart/invoiceprocess"  class="btn btn-primary btn-lg btn-block login-button">Payment</button>
</div></form></div>
                            </div>
                        </div>
                    </div>
                   
                </div> 







  


            <div class="row cart-footer">
        
            </div></div></div>
            
           
            
            
<!--  <script type="text/javascript">
 onclick="cardnumber(document.form1.text1
 function cardnumber(card_number)  
 {  
   var cardno = /^(?:5[1-5][0-9]{14})$/;  
   if(card_number.value.match(cardno))  
         {  
       return true;  
         }  
       else  
         {  
         alert("Not a valid Mastercard number!");  
         return false;  
         }  
 }  
</script>  -->         
    
</body>
</html>        
                