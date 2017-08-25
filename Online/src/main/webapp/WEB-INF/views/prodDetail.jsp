<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="robots" content="noindex, nofollow">

    <title>Product Detail </title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <style type="text/css">
    ul > li{margin-right:25px;font-weight:lighter;cursor:pointer}
li.active{border-bottom:3px solid silver;}

.item-photo{display:flex;justify-content:center;align-items:center;border-right:1px solid #f6f6f6;}
.menu-items{list-style-type:none;font-size:11px;display:inline-flex;margin-bottom:0;margin-top:20px}
.btn-success{width:100%;border-radius:0;}
.section{width:100%;margin-left:-15px;padding:2px;padding-left:15px;padding-right:15px;background:#f8f9f9}
.title-price{margin-top:30px;margin-bottom:0;color:black}
.title-attr{margin-top:0;margin-bottom:0;color:black;}
.btn-minus{cursor:pointer;font-size:7px;display:flex;align-items:center;padding:5px;padding-left:10px;padding-right:10px;border:1px solid gray;border-radius:2px;border-right:0;}
.btn-plus{cursor:pointer;font-size:7px;display:flex;align-items:center;padding:5px;padding-left:10px;padding-right:10px;border:1px solid gray;border-radius:2px;border-left:0;}
div.section > div {width:100%;display:inline-flex;}
div.section > div > input {margin:0;padding-left:5px;font-size:10px;padding-right:5px;max-width:18%;text-align:center;}
.attr,.attr2{cursor:pointer;margin-right:5px;height:20px;font-size:10px;padding:2px;border:1px solid gray;border-radius:2px;}
.attr.active,.attr2.active{ border:1px solid orange;}

@media (max-width: 426px) {
    .container {margin-top:0px !important;}
    .container > .row{padding:0 !important;}
    .container > .row > .col-xs-12.col-sm-5{
        padding-right:0 ;    
    }
    .container > .row > .col-xs-12.col-sm-9 > div > p{
        padding-left:0 !important;
        padding-right:0 !important;
    }
    .container > .row > .col-xs-12.col-sm-9 > div > ul{
        padding-left:10px !important;
        
    }            
    .section{width:104%;}
    .menu-items{padding-left:0;}
}
    </style>
    <script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>





</head>
<body>
<jsp:include page="/WEB-INF/views/Header.jsp"></jsp:include>
<br><br><br>


<div class="container">
<div class= "form-horizontal">
<div class="col-xs-4 item-photo">



<img src="${pageContext.request.contextPath }/resources/${product.imgname}"
          style="max-width:100% ; margin-top:50px;">
</div>
<div class="col-xs-5" style="border:0px solid gray">



 <h3>Product Details</h3>  
 
<div class="section" style="margin-top:50px;">
<fieldset>

<div class="form-group">
<label class="col-md-4 control-label" for="name">Product Name</label>
<div class="col-md-4">
<label class="col-md-4 control-label" for="name">${product.name}</label>
</div>
</div>
<div class="form-group">
<label class="col-md-4 control-label" for="name">Product Description</label>
<div class="col-md-4">
<label class="col-md-4 control-label" for="name">${product.description}</label>
</div>
</div>
<div class="form-group">
<label class="col-md-4 control-label" for="name">Product Price</label>
<div class="col-md-4">
<label class="col-md-4 control-label" for="name">${product.price}</label>
</div>
</div>
<div class="form-group">
<label class="col-md-4 control-label" for="name">Product Stock</label>
<div class="col-md-4">
<label class="col-md-4 control-label" for="name">${product.stock}</label>
</div>
</div>
<%-- <div class="form-group">
<label class="col-md-4 control-label" for="name">Product Vendor</label>
<div class="col-md-4">
<label class="col-md-4 control-label" for="name">${product.sup.suppliername}</label>
</div>
</div> --%>






             <!--        
                    <div class="section" style="padding-bottom:5px;">
                        <h6 class="title-attr"><small>CAPACIDAD</small></h6>                    
                        <div>
                            <div class="attr2">16 GB</div>
                            <div class="attr2">32 GB</div>
                        </div>
                    </div>   
 -->



<form action="${pageContext.request.contextPath }/cart/addToCart" method="post">

<input type="hidden" value="${product.pid }" name="pId"/>
<input type="hidden" value="${product.name }" name="name"/><br>
<input type="hidden" value="${product.price }" name="pPrice"/><br>
<input type="hidden" value="${product.stock }" name="pStock"/><br>
<%-- <input type="hidden" value="${product.sup.suppliername }" name="pSupplier"/><br> --%>
<input type="hidden" value="${product.imgname }" name="imgname"/><br>



<security:authorize access="hasRole('ROLE_USER')">

<input type="number" min="1" step="1" class="form-control" name="quant" required/><br>





<label>Mention quantity of product for purchase:</label><br>
<input class="btn btn-primary btn-lg" type="submit" value="Add to cart">
</security:authorize>



</form>
</fieldset>


<h6><span class="glyphicon glyphicon-heart-empty" style="cursor:pointer;"></span>Wish List</h6>
</div></div></div>

<div class="col-xs-9">

<hr>
<p>The Products are certified by Indian Govt.</p>
</div>
</div>







<script>
$(document).ready(function(){
$('input').focusout(function(){
	var max = $(this).val();
	var available = ${product.stock};
	if(max > available){
		$(this).val(available-1);
	alert("Maximum is" + available);
	}
})
});

</script>


</body>
</html>