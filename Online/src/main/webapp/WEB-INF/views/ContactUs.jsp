<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="robots" content="noindex, nofollow">

    <title>Contact Us</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <style type="text/css">
    @import url("https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css");
    </style>
    <script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        window.alert = function(){};
        var defaultCSS = document.getElementById('bootstrap-css');
        function changeCSS(css){
            if(css) $('head > link').filter(':first').replaceWith('<link rel="stylesheet" href="'+ css +'" type="text/css" />'); 
            else $('head > link').filter(':first').replaceWith(defaultCSS); 
        }
        $( document ).ready(function() {
          var iframe_height = parseInt($('html').height()); 
         /*  window.parent.postMessage( iframe_height, 'https://b.com'); */
        });
    </script>
</head>
<body>
<jsp:include page="Header.jsp"></jsp:include>

	<div class="container">
    <div class="jumbotron jumbotron-sm" style="background-color:#339966;margin-top:2%;color:white;">
        <div class="row">
            <div class="col-sm-12 col-lg-12">
                <h1 class="h2" style="margin-top:-2%">
                  Online Direction  
                </h1>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-sm-6">
            <div class="well">
                <h3 style="line-height:20%;"><i class="fa fa-home fa-1x" style="line-height:6%;color:#339966"></i> Address:</h3>               
                <p style="margin-top:6%;line-height:35%">Neelam Flyover, Mathura Rd, Sector 20B, Faridabad, Haryana 121001, India</p>
                <br />
                <br />
                <h3 style="line-height:20%;"><i class="fa fa-envelope fa-1x" style="line-height:6%;color:#339966"></i> E-Mail:</h3>
                <p style="margin-top:6%;line-height:35%">renu.rawat.it09@gmail.com</p>
                <br />
                <br />
                <h3 style="line-height:20%;"><i class="fa fa-user fa-1x" style="line-height:6%;color:#339966"></i> Name:</h3>
                <p style="margin-top:6%;line-height:35%">RENU RAWAT</p>
                <br />
                <br />
<!--                 <h3 style="line-height:20%;"><i class="fa fa-yelp fa-1x" style="line-height:6%;color:#339966"></i> Destek Merkezi:</h3>
                <p style="margin-top:6%;line-height:35%"><a href="siteadresi.com/destek">siteadresi.com/destek</a></p> -->
            </div>
        </div>
        <div class="col-sm-6">
        
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d96690.80542089987!2d29.864461132544537!3d40.77109282810726!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14cb4f66644bfb9d%3A0x82690ee7586b7eb9!2zxLB6bWl0LCBLb2NhZWxp!5e0!3m2!1str!2str!4v1480782606579" width="565" height="430" frameborder="0" style="border:0" allowfullscreen></iframe>
        </div>
    </div>
</div>
       

	<script type="text/javascript">
	
	</script>
</body>
</html>






this is contact us page
<br>
<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>