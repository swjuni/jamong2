<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<!--[if IE 9]> <html class="no-js ie9 fixed-layout" lang="en"> <![endif]-->
<!--[if gt IE 9]><!--> <html class="no-js " lang="en"> <!--<![endif]-->
<head>
<%@include file="head_mypage.jsp" %>

<script type="text/javascript">

</script>
<style type="text/css">

</style>
</head>
<body>
	
	<div id="wrapper">
		<header class="header site-header header-transparent">
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
				            <a class="navbar-brand" href="<c:url value='/index.html'/>"><img src="<c:url value='/resources/images/logo.png'/>" alt="Linda"></a>
				        </div>
				        <div id="navbar" class="navbar-collapse collapse">
				            <ul class="nav navbar-nav navbar-right">
				                <li><a href="#">메시지</a></li>
				                <li class="dropdown yamm-fw hasmenu active">
				                    <a href="#" class="dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				                    	마이자몽</a>
									<ul class="dropdown-menu" style="margin-top: -5px;">
		                    			<li><a href="service-01.html">나의정보</a></li>
		                    			<li><a href="service-02.html">인증정보</a></li>
		                    			<li><a href="service-02.html">로그아웃</a></li>
		                    		</ul>
				                </li>
				                
				                
                            </ul>
							
				        </div><!--/.nav-collapse -->
				    </div><!--/.container-fluid -->
				</nav><!-- end nav -->
			</div><!-- end container -->
		</header><!-- end header -->
		
		<section class="section normalhead bgcolor">
		</section><!-- end section -->
