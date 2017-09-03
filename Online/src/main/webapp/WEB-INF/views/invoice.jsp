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



	    <div class="row color-invoice">
      <div class="col-md-10">

       <%-- <label> #Sr. No: ${st.count}</label> --%>
        <div class="row">
          <div class="col-lg-7 col-md-7 col-sm-7">
           <h3><label> Customer Details : </label></h3>
            <label>${orderDetails.username} </label>
           <br> <label>${orderDetails.addressline1},&nbsp;${orderDetails.addressline2}</label>
            <br><label> ${orderDetails.city}</label>,<label>&nbsp; ${orderDetails.state}</label>
            
          </div>
          <div class="col-lg-5 col-md-5 col-sm-5">
       <h3>  <label>Customer Contact :</label></h3><label> Mob: ${orderDetails.phone}</label>
            <br><label>${orderDetails.email}</label>
            
           
         
          
          </div>
        </div>
        <hr />
        <div class="row">
          <div class="col-lg-7 col-md-7 col-sm-7">
          <h3> <label> Shipping Details : </label></h3>
            <label>${order.sname} </label>
           <br><label>${order.sadd1},&nbsp;${order.sadd2}</label>
            <br /><label> ${order.scity}</label>,<label>&nbsp; ${order.sstate}</label>
          </div>
          <div class="col-lg-5 col-md-5 col-sm-5">
        <h3>  <label>Contact :</label></h3><label> Mob: ${order.sphone}</label>
            <br><label>${order.semail}</label>
           
          
          
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
               Only Exchange.

              </li>
              <li>
                Only Exchange.
              </li>
              <li>
                Only Exchange.
              </li>
            </ol>
          </div>
        </div> -->
        <hr />
        <div class="row">
         <center><div class="col-lg-12 col-md-12 col-sm-12 ">
       <!--      <a href="#" class="btn btn-success btn-sm">Print Invoice</a>    
            <a href="#" class="btn btn-info btn-sm">Download In Pdf</a> -->
            <a class="btn btn-primary btn-md" href="${pageContext.request.contextPath }/cart/Thankyou" type="submit" name="invoice" >ThankYou </a>

          </div></center> 
        </div>
      </div>
    </div>
</div>





</div></div></div></form></div></center>




               
          <div class="row cart-footer">
        
            </div></div> 
     
     
         
            
           </body></html>
           
           
