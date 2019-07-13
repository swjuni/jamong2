<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<!--[if IE 9]> <html class="no-js ie9 fixed-layout" lang="en"> <![endif]-->
<!--[if gt IE 9]><!--> <html class="no-js " lang="en"> <!--<![endif]-->
<head>

<script type="text/javascript">
	$(function(){
		$.ajax({
			url:"<c:url value='/main/showCategoryL.do'/>",
			dateType:"json",
			success:function(res){
				if(res.length>0){
					$.each(res, function(idx, item){
						$(".navbar-nav").append("<li><a>"+item.categoryNameL+"</a></li>")
					});
					/* <li class="dropdown yamm-fw hasmenu categoryNo"  value="${vo.categoryNo }">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="fa fa-angle-down">${vo.categoryNameL}</span></a>
		            <ul class="dropdown-menu">
		                <li>
		                    <div class="yamm-content">
			                    <div class="row"> 
			                    	<div class="col-md-4">
										<ul class="cateM">
			                    		</ul>
			                    	</div>
			                    	<div class="col-md-4">
										<ul>
			                    			<li><a href="page-services.html">All Services</a></li>
			                    			<li><a href="page-pricing.html">Pricing & Plans</a></li>
			                    			<li><a href="page-clients.html">Our Clients</a></li>
			                    			<li><a href="page-testimonials.html">Testimonials</a></li>
			                    			<li><a href="page-ebooks.html">Free E-Books</a></li>
			                    			<li><a href="page-seo-analysis.html">SEO Analysis</a></li>
			                    			<li><a href="case-studies.html">Case Studies</a></li>
			                    			<li><a href="case-studies-alt.html">Case Studies Alt</a></li>
			                    			<li><a href="case-studies-single.html">Case Studies Single</a></li>
			                    		</ul>
			                    	</div>
			                    </div>
		                    </div>
		                </li>
		            </ul>
                </li> */
				}		
			},
			error:function(xhr, status, error){
				alert(status+":"+error);
			}
		});
		
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
                            </ul>
				        </div><!--/.nav-collapse -->
				    </div><!--/.container-fluid -->
				</nav><!-- end nav -->
			</div><!-- end container -->
		</header><!-- end header -->
		</div>
	</body>
</html>
