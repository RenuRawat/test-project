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
<br><br>

<div class="container">
           
                
         

<form action="/cart/invoiceprocess" method="post">
               
               
                  
 
 <div class="panel panel-info">
<div class="panel-heading"><h4><center>Invoice Process</center></h4></div>
<div class="panel-container">



<%-- <fieldset>
<c:set var="gtot" value="0"></c:set>
<c:forEach var="c" items="${cart}">
<c:set var="gtot" value="${gtot + c.cartPrice * c.cartQuantity }"></c:set>
</c:forEach>

<div class="form-group">
<label class="col-md-4 control-label" for="username">Customer Name</label>
<div class="col-md-4">
<label class="col-md-4 control-label" for="username">${orderDetails.sname}</label>
</div>
</div><br>

<div class="form-group">
<label class="col-md-4 control-label" for="email">Customer Email Address</label>
<div class="col-md-4">
<label class="col-md-4 control-label" for="email">${orderDetails.email}</label>
</div></div><br><br>

<div class="form-group">
<label class="col-md-4 control-label" for="address">Shipping Address</label>
<div class="col-md-4">
<label class="col-md-4 control-label" for="address">${orderDetails.sadd1}</label>
</div></div><br>



<div class="form-group">
<label class="col-md-4 control-label" for="address">Shipping Address</label>
<div class="col-md-4">
<label class="col-md-4 control-label" for="address">${orderDetails.sadd2}</label>
</div></div><br>
<div class="form-group">
<label class="col-md-4 control-label" for="address">Shipping Address</label>
<div class="col-md-4">
<label class="col-md-4 control-label" for="address">${orderDetails.scity}</label>
</div></div><br>
<div class="form-group">
<label class="col-md-4 control-label" for="address">Shipping Address</label>
<div class="col-md-4">
<label class="col-md-4 control-label" for="address">${orderDetails.sstate}</label>
</div></div><br>
<div class="form-group">
<label class="col-md-4 control-label" for="address">Shipping Address</label>
<div class="col-md-4">
<label class="col-md-4 control-label" for="address">${orderDetails.spincode}</label>
</div></div><br>
<div class="form-group">
<label class="col-md-4 control-label" for="address">Shipping Address</label>
<div class="col-md-4">
<label class="col-md-4 control-label" for="address">${orderDetails.country}</label>
</div></div><br>








<div class="form-group">
<label class="col-md-4 control-label" for="address">Total Amount</label>
<div class="col-md-4">
<label class="col-md-4 control-label" for="address">${user.gtot}</label>
</div></div><br>

<div class="form-group">
<label class="col-md-4 control-label" for="deliverydate">Date of Delivery</label>
<div class="col-md-6">
<label class="col-md-6 control-label" for="deliverydate">Delivery in 7 Working day</label>
</div></div><br><br> --%>












	    <div class="row color-invoice">
      <div class="col-md-10">
       <label> #Sr. No: 78660</label>
        <div class="row">
          <div class="col-lg-7 col-md-7 col-sm-7">
           <label> <h1>INVOICE</h1></label>
            <br />
           <label> <strong>Email : </strong> renu.rawat09@gmail.com</label>
            <br />
        <label>    <strong>Call : </strong> +91-9876543211</label>
          </div>
          <div class="col-lg-5 col-md-5 col-sm-5">

          <label>  <h2> GADGETs </h2> #814, Ballabgarh, Faridabad,</label>
            <br><label> Pin- 121004,</label>
            <br><label> Haryana.</label>

          </div>
        </div>
        <hr />
        <div class="row">
          <div class="col-lg-7 col-md-7 col-sm-7">
           <label> <h3>Customer Details : </h3></label>
            <h5><label>${orderDetails.username} </label>
           <br> </h5><label>${orderDetails.addressline1}${orderDetails.addressline2}</label>
            <br /><label> ${orderDetails.state}</label>
          </div>
          <div class="col-lg-5 col-md-5 col-sm-5">
         <label>   <h3>Customer Contact :</h3> Mob: ${orderDetails.phone}</label>
            <br><label>${orderDetails.email}</label>
           
           <br><label>${order.sstate}</label>
            <h3>${order.sname}</h3>
          
          </div>
        </div>
        <hr />
        <div class="row">
          <div class="col-lg-7 col-md-7 col-sm-7">
            <strong>ITEM DESCRIPTION & DETAILS :</strong>
          </div>
        </div>
        <hr />
        <div class="row">
          <div class="col-lg-12 col-md-12 col-sm-12">
            <div class="table-responsive">
              <table class="table table-striped table-bordered">
                <thead>
<tr><th>Sr.no.</th>
<th>Product Name</th>
<th>Quantity</th>
<th>price</th>
<th>Image</th>
<th>Total</th>

</tr>
</thead>



<tbody>

<%-- <c:set var="gtot" value="0"></c:set>
<c:forEach var="c" items="${cart}">
<c:set var="gtot" value="${gtot + c.cartPrice * c.cartQuantity }"></c:set>
</c:forEach> --%>

<c:forEach var="c" varStatus="st" items="${cart }">
<tr>
<td><c:out value="${st.count }"></c:out></td>
<td><c:out value="${c.cartProductName }"></c:out></td>
<td><c:out value="${c.cartQuantity }"></c:out></td>
<td><c:out value="${c.cartPrice }"></c:out></td>


<td><img src="${pageContext.request.contextPath }/resources/${c.cartImage }" height="50px" width="50px"></td>

<td><c:out value="${c.cartQuantity * c.cartPrice }"></c:out></td>

<c:set var="gtot" value= "${gtot + c.cartPrice * c.cartQuantity}"></c:set>


</tr></c:forEach>


<%-- <tr>

<td><span class="col-lg-9" align="right"><label>Grand Total</label><c:out value="${gtot }"></c:out></span></td>
</tr> --%>
                </tbody>
              </table>
            </div>
            <hr>
             
        <div class="row">
          <div class="col-lg-12 col-md-12 col-sm-12">
            
              <h4><label>Grand Total</label><c:out value="${gtot }"></c:out></h4>
            </div></div>
            <hr>
           
  <!--       <div class="row">
          <div class="col-lg-12 col-md-12 col-sm-12">
            <strong> Important: </strong>
            <ol>
              <li>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit.

              </li>
              <li>
                Nulla eros eros, laoreet non pretium sit amet, efficitur eu magna.
              </li>
              <li>
                Curabitur efficitur vitae massa quis molestie. Ut quis porttitor justo, sed euismod tortor.
              </li>
            </ol>
          </div>
        </div> -->
        <hr />
        <div class="row">
          <div class="col-lg-12 col-md-12 col-sm-12">
            <a href="#" class="btn btn-success btn-sm">Print Invoice</a>    
            <a href="#" class="btn btn-info btn-sm">Download In Pdf</a>
            <a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath }/cart/Thankyou" type="submit" name="invoice" > Ok </a>

          </div>
        </div>
      </div>
    </div>
</div>





</div></div></form></div></center></div>




               
          <div class="row cart-footer">
        
            </div></div> 
     
     
         
            
           </body></html>
           
           
