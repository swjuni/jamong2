<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<!--[if IE 9]> <html class="no-js ie9 fixed-layout" lang="en"> <![endif]-->
<!--[if gt IE 9]><!--> <html class="no-js " lang="en"> <!--<![endif]-->
<head>
<%@include file="head_mypage.jsp" %>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.min.js"/>"></script>
<script type="text/javascript">
 		$(document).ready(function(){
 		});
    	function zipcode123(){
        new daum.Postcode({
            oncomplete: function(data) {
            	var zip=document.getElementById('zipcode');
            	var addr=document.getElementById('address');
               	zip.value=data.zonecode;
               	addr.value=data.roadAddress;
               	zip.readOnly = true;
               	addr.readOnly = true;
               	
            }
        }).open();
    	}
    	
    	function inputPhoneNumber(obj) {/* 전화번호 하이픈(-) 자동삽입 */
    	    var number = obj.value.replace(/[^0-9]/g, "");
    	    var phone = "";

    	    if(number.length < 4) {
    	        return number;
    	    } else if(number.length < 7) {
    	        phone += number.substr(0, 3);
    	        phone += "-";
    	        phone += number.substr(3);
    	    } else if(number.length < 11) {
    	        phone += number.substr(0, 3);
    	        phone += "-";
    	        phone += number.substr(3, 3);
    	        phone += "-";
    	        phone += number.substr(6);
    	    } else {
    	        phone += number.substr(0, 3);
    	        phone += "-";
    	        phone += number.substr(3, 4);
    	        phone += "-";
    	        phone += number.substr(7);
    	    }
    	    obj.value = phone;
    	}
    	var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    	$(function(){
    		$('#name').focusout(function(){//값 없을시 필수입력이라는 표시 출력
    			if($(this).val().length==0){
    				$(this).css("border","2px solid red");
    				$(this).attr( 'placeholder', '성명(필수 입력값입니다)' );
    			}else{
    				$(this).css("border","2px solid skyblue");
    			}
    		});
    		$('#pwd').focusout(function(){
    			if($(this).val().length==0){
    				$(this).css("border","2px solid red");
    				$(this).attr( 'placeholder', '필수 입력값입니다' );
    			}else{
    				$(this).css("border","2px solid skyblue");
    			}
    		});
    		
    		$('#pwdchk').focusout(function(){
    			if(!($('#pwd').val()==$('#pwdchk').val())){
    				$(this).css("border","2px solid red");
    			}else{
    				$(this).css("border","2px solid skyblue");
    			}
    		});
    		
    	//가입 누를때 입력 안된사항들 체크
    	$('#sign').click(function(){
			if($('#name').val().length==0){
				alert('성명을 입력해주세요');
				event.preventDefault();
				$('#name').focus();
			}
			else if($('#pwd').val().length==0){
				alert('비밀번호를 입력해주세요');
				event.preventDefault();
				$('#pwd').focus();
			}
			else if(!($('#pwd').val()==$('#pwdchk').val())){
				alert('비밀번호가 같은지 확인하세요');
				event.preventDefault();
				$('#pwdchk').focus();
			}
				
		});
    	
    	
    });
 
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
				                <!-- <li><a href="#">알림</a></li> -->
				                <li class="dropdown yamm-fw hasmenu active">
				                    <a href="#" class="dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				                    	${userId}</a>
									<ul class="dropdown-menu" style="margin-top: -5px; min-width:120px;">
		                    			<li><a href="<c:url value="/mypage/mypage.do?userNo=${sessionScope.userNo }"/>">마이페이지</a></li>
		                    			<li><a href="<c:url value="/main/mypage/myInfo.do"/>">나의정보</a></li>
		                    			<li><a href="<c:url value="/main/userlogin/logout.do"/>">로그아웃</a></li>
		                    		</ul>
				                </li>
                            </ul>
				        </div><!--/.nav-collapse -->
				    </div><!--/.container-fluid -->
				</nav><!-- end nav -->
			</div><!-- end container -->
		</header><!-- end header -->
		
		<!-- 최근 본 페이지  링크 필요한 곳에 붙여 포함시키면 구동됨-->
		<c:import url="/todayList.do"/>
		
		
		<section class="section normalhead bgcolor">
		</section><!-- end section -->