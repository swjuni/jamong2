<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<!--[if IE 9]> <html class="no-js ie9 fixed-layout" lang="en"> <![endif]-->
<!--[if gt IE 9]><!--> <html class="no-js " lang="en"> <!--<![endif]-->
<head>
<%@include file="head.jsp" %>

<script type="text/javascript">
	$(function(){
		$(".categoryNo").mouseenter(function(){
			var $t=$(this);
			$.ajax({
					url:"<c:url value='/main/showCategoryM.do'/>",
					type:"get",
					data:"no="+$(this).val(),
					dataType:"json",
					success:function(res){
						if(res.length>0){
							var str="<div class='subCategory' name='subCategory'><ul>";
								 $.each(res, function(idx, item){
									str+="<li><a>"+item.categoryName+"</a></li>";
								});
							str+="</ul></div>";
							$t.find("a").append(str);
						}
				},
				error:function(xhr, status, error){
					alert(status+":"+error);
				}
			});//ajax
		});//categoryNo.mouseover
		
		$(".categoryNo").mouseleave(function(){
			$(this).find("hr").remove();
			$("div[name=subCategory]").remove();
		})
		
	})//document.ready
</script>
<style type="text/css">
	.categoryNo{
		padding-left: 20px;
	}
	li .subCategory{
		position: absolute;
		width: 170px;
		left:-10px;
		background: white;
		padding-bottom:15px;
		z-index: 1;
	}
	
	.subCategory li{
		list-style: none;
		margin-top: 15px;
		margin-left:-25px;
	}
	
	.subCategory li a{
		color: #595959;
	}
	
	.subCategory li:nth-child(1){
		border-top:3px solid #30acbf;
		width: 100%;
		padding-top:15px;
	}

</style>
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
                                <li><a>로그인</a></li>
                                <li><a>회원가입</a></li>
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
							<a class="navbar-brand" href="<c:url value='/index.html'/>"><img src="<c:url value='/resources/images/logo.png'/>" alt="Linda"></a>
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