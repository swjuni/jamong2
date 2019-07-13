<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<!--[if IE 9]> <html class="no-js ie9 fixed-layout" lang="en"> <![endif]-->
<!--[if gt IE 9]><!--> <html class="no-js " lang="en"> <!--<![endif]-->
<head>

    <!-- Basic -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    
    <!-- Mobile Meta -->
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    
    <!-- Site Meta -->
    <title>SEOTime HTML5 Business Template</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <!-- Site Icons -->
    <link rel="shortcut icon" href="<c:url value='/resoucrces/images/favicon.ico'/>" type="image/x-icon" />
    <link rel="apple-touch-icon" href="<c:url value='/resoucrces/images/apple-touch-icon.png'/>">

	<!-- Google Fonts -->
 	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,600,700" rel="stylesheet"> 

	<!-- Custom & Default Styles -->
	<link rel="stylesheet" href="<c:url value='/resources/css/font-awesome.min.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/css/animate.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/css/carousel.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/style.css'/>">

	<!--[if lt IE 9]>
		<script src="js/vendor/html5shiv.min.js"></script>
		<script src="js/vendor/respond.min.js"></script>
	<![endif]-->
	
	<!-- jQuery Files -->
	<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/resources/js/parallax.js'/>"></script>
	<script src="<c:url value='/resources/js/animate.js'/>"></script>
	<script src="<c:url value='/resources/js/owl.carousel.js'/>"></script>
	<script src="<c:url value='/resources/js/custom.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$(".categoryNo").mouseover(function(){
			$.ajax({
				url:"<c:url value='/main/showCategoryM.do'/>",
				type:"get",
				data:"no="+$(this).val(),
				dataType:"json",
				success:function(res){
					if(res.length>0){
						$.each(res, function(idx, item){
							alert(item.categoryName);
						});
					}		
				},
				error:function(xhr, status, error){
					alert(status+":"+error);
				}
			});
		});
	})
</script>
</head>
<body>
	
	<div id="wrapper">
        <div class="topbar">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-sm-6 hidden-xs">
                        <nav class="topbar-menu">
                            <ul class="list-inline">
                            	<li>Follow us: </li>
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                            </ul><!-- end list -->
                        </nav><!-- end menu -->
                    </div><!-- end col -->

                    <div class="col-md-6 col-sm-6">
                        <nav class="topbar-menu">
                            <ul class="list-inline text-right navbar-right">
                                <li class="dropdown">
                                    <a class="dropdown-toggle" data-toggle="dropdown" href="#"><img src="<c:url value='/resources/images/us.png'/>" alt=""> English
                                    <span class="fa fa-angle-down"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#"><img src="<c:url value='/resources/images/tr.png'/>" alt=""> Turkish</a></li>
                                        <li><a href="#"><img src="<c:url value='/resources/images/si.png'/>" alt=""> Spanish</a></li>
                                        <li><a href="#"><img src="<c:url value='/resources/images/it.png'/>" alt=""> Italian</a></li>
                                        <li><a href="#"><img src="<c:url value='/resources/images/ae.png'/>" alt=""> Arabic</a></li>
                                        <li><a href="#"><img src="<c:url value='/resources/images/de.png'/>" alt=""> German</a></li>
                                    </ul>
                                </li>
                                <li class="hidden-xs"><i class="fa fa-clock-o"></i> 08:00 - 17:00</li>
                                <li><i class="fa fa-phone"></i> +90 987 665 55 44</li>
                            </ul><!-- end list -->
                        </nav><!-- end menu -->
                    </div><!-- end col -->
                </div><!-- end row -->
            </div><!-- end container -->
        </div><!-- end topbar -->

		<header class="header site-header">
			<div class="container">
				<nav class="navbar navbar-default yamm">
				    <div class="container-fluid">
				        <div class="navbar-header">
				            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
				                <span class="sr-only">Toggle navigation</span>
				                <span class="icon-bar"></span>
				                <span class="icon-bar"></span>
				                <span class="icon-bar"></span>
				            </button>
							<a class="navbar-brand" href="index.html"><img src="<c:url value='/resources/images/logo.png'/>" alt="Linda"></a>
				        </div>
				        <div id="navbar" class="navbar-collapse collapse">
				            <ul class="nav navbar-nav">
				            <c:import url="/main/showCategoryL.do"/>
                            </ul>
				        </div><!--/.nav-collapse -->
				    </div><!--/.container-fluid -->
				</nav><!-- end nav -->
			</div><!-- end container -->
		</header><!-- end header -->
		</div>
	</body>
</html>
