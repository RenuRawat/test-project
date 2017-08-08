<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<!-- <head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, intial-scale=1">

<link href="bootstrap/font-awesome.min.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Welcome</title> -->
<head>
  <title>Online shopping</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="Header.jsp"></jsp:include>
<div class="container">
  <h2>Carousel Example</h2>  
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="https://s.yimg.com/fz/api/res/1.2/bazACWck83_4li0hyoZY2A--/YXBwaWQ9c3JjaGRkO2g9MTA4MDtxPTk1O3c9MTkyMA--/http://i.imgur.com/wbgk6wd.jpg" alt="Los Angeles" style="width:100%;">
      </div>

      <div class="item">
        <img src="http://lol.ingame.de/files/2015/08/League-of-Legends-Clg.jpg" alt="Chicago" style="width:100%;">
      </div>
    
      <div class="item">
        <img src="https://tse3.mm.bing.net/th?id=OIP.zherdcVIpptVQ7Y3yqP1SAEsDh&pid=15.1&P=0&w=209&h=157" alt="New york" style="width:100%;">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
<br>
<br>

<div class=container>
<div class="row">
  <div class="col-sm-5 col-md-3">
    <div class="thumbnail">
      <img src="D:/PROJECT_DT_J2EE/.metadata/.plugins/org.eclipse.wst.server.core/tmp3/wtpwebapps/Online/resources/331.jpg" alt="...">
      <div class="caption">
        <h3>Thumbnail label</h3>
        <p>...</p>
        <p><a href="#" class="btn btn-primary" role="button">Button</a> 
        </p>
      </div>
    </div>
    
  </div>
  
  <div class="col-sm-5 col-md-3">
    <div class="thumbnail">
      <img src="..." alt="...">
      <div class="caption">
        <h3>Thumbnail label</h3>
        <p>...</p>
        <p><a href="#" class="btn btn-primary" role="button">Button</a> 
        </p>
      </div>
    </div>
  </div>
  
  <div class="col-sm-5 col-md-3">
    <div class="thumbnail">
      <img src="..." alt="...">
      <div class="caption">
        <h3>Thumbnail label</h3>
        <p>...</p>
        <p><a href="#" class="btn btn-primary" role="button">Button</a> 
        </p>
      </div>
    </div>
  </div>  
  </div></div>


<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
