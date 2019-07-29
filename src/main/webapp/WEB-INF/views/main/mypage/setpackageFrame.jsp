<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<!--[if IE 9]> <html class="no-js ie9 fixed-layout" lang="en"> <![endif]-->
<!--[if gt IE 9]><!--> <html class="no-js " lang="en"> <!--<![endif]-->
<head>
<%@include file="../incs/head_mypage.jsp" %>
<meta charset="UTF-8">
<title>setpackageFrame</title>
<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
<script type="text/javascript">
$(function(){
	$("form").submit(function(){
		opener.parent.location.href='<c:url value="/registExpert/registExpert.do?state=expert"/>';
	    window.close();
	})
	$("input[type=text]").on("keyup", function() {
	    $(this).val($(this).val().replace(/[^0-9]/g,""));
	});
})
</script>
<style type="text/css">
textarea{
	width: 100%;
	height: 100%;
	border: 1px solid #80808029;
}
.big-pricing li{
	height:100px;
}
.big-pricing li:nth-of-type(3){
	height:50px;
}
.big-pricing li:nth-of-type(4){
	height:50px;
}
.big-pricing li:nth-of-type(5){
	height:50px;
}
input[type=text]{
	border:none;
}
select{
	width: 100%;
	border: none;
}
.big-pricing{
	width: 1298px;
}
</style>
</head>
<body>
<form action="<c:url value='/registService/registPackage.do'/>" name="form" method="post">
<div class="row big-pricing">
								<div class="col-md-4 col-sm-6 col-xs-12 colon1 nopad" style="width: 30%;">
									<div class="pricing-header firstch c0">
									<p>패키지</p>
									</div><!-- end pricing-header -->
									<ul class="first-colon">
										<li><label>제목</label></li>
										<li>설명</li>
										<li>가격</li>
										<li>수정횟수</li>
										<li>작업기간</li>
									</ul>
								</div><!-- end col -->
								<div class="col-md-2 col-sm-6 col-xs-12 colon1 nopad text-center" style="width: 23%;">
									<div class="pricing-header firstch c1">
										<p>STANDARD</p>
									</div><!-- end pricing-header -->
									<ul>
										<li><textarea name="packName" required="required"></textarea></li>
										<li><textarea name="packDesc" required="required"></textarea></li>
										<li><input type="text" name="packPrice" required="required">원</i></li>
										<li>
										<select name="modifyCount" required="required">
										<option value="">선택해주세요</option>
										<option value="1">1회</option>
										<option value="2">2회</option>
										<option value="3">3회</option>
										<option value="4">4회</option>
										<option value="5">5회</option>
										<option value="6">6회</option>
										<option value="7">7회</option>
										<option value="8">8회</option>
										<option value="9">9회</option>
										<option value="10">10회</option>
										<option value="11">11회</option>
										<option value="12">12회</option>
										<option value="13">13회</option>
										<option value="14">14회</option>
										<option value="15">15회</option>
										<option value="nonlimited">제한없음</option>
										</select>
										</li>
										<li>
										<select name="workingPeriod">
										<option value="none">선택해주세요</option>
										<option value="1">1일</option>
										<option value="2">2일</option>
										<option value="3">3일</option>
										<option value="4">4일</option>
										<option value="5">5일</option>
										<option value="6">6일</option>
										<option value="7">7일</option>
										<option value="8">8일</option>
										<option value="9">9일</option>
										<option value="10">10일</option>
										<option value="11">11일</option>
										<option value="12">12일</option>
										<option value="13">13일</option>
										<option value="14">14일</option>
										<option value="15">15일</option>
										<option value="16">16일</option>
										<option value="17">17일</option>
										<option value="18">18일</option>
										<option value="19">19일</option>
										<option value="20">20일</option>
										<option value="21">21일</option>
										<option value="22">22일</option>
										<option value="23">23일</option>
										<option value="24">24일</option>
										<option value="25">25일</option>
										<option value="26">26일</option>
										<option value="27">27일</option>
										<option value="28">28일</option>
										<option value="29">29일</option>
										<option value="30">30일</option>
										<option value="31">30일 이상</option>
										</select>
										</li>
									</ul>
								</div><!-- end col -->
								<div class="col-md-2 col-sm-6 col-xs-12 colon1 nopad text-center" style="width: 23%;">
									<div class="pricing-header firstch c2">
										<p>DELUXE</p>
									</div><!-- end pricing-header -->
									<ul>
										<li><textarea name="packName" required="required"></textarea></li>
										<li><textarea name="packDesc" required="required"></textarea></li>
										<li><input type="text" name="packPrice" required="required" onkeypress="onlyNumber();">원</i></li>
										<li>
										<select name="modifyCount" required="required">
										<option value="">선택해주세요</option>
										<option value="1">1회</option>
										<option value="2">2회</option>
										<option value="3">3회</option>
										<option value="4">4회</option>
										<option value="5">5회</option>
										<option value="6">6회</option>
										<option value="7">7회</option>
										<option value="8">8회</option>
										<option value="9">9회</option>
										<option value="10">10회</option>
										<option value="11">11회</option>
										<option value="12">12회</option>
										<option value="13">13회</option>
										<option value="14">14회</option>
										<option value="15">15회</option>
										<option value="nonlimited">제한없음</option>
										</select>
										</li>
										<li>
										<select name="workingPeriod">
										<option value="none">선택해주세요</option>
										<option value="1">1일</option>
										<option value="2">2일</option>
										<option value="3">3일</option>
										<option value="4">4일</option>
										<option value="5">5일</option>
										<option value="6">6일</option>
										<option value="7">7일</option>
										<option value="8">8일</option>
										<option value="9">9일</option>
										<option value="10">10일</option>
										<option value="11">11일</option>
										<option value="12">12일</option>
										<option value="13">13일</option>
										<option value="14">14일</option>
										<option value="15">15일</option>
										<option value="16">16일</option>
										<option value="17">17일</option>
										<option value="18">18일</option>
										<option value="19">19일</option>
										<option value="20">20일</option>
										<option value="21">21일</option>
										<option value="22">22일</option>
										<option value="23">23일</option>
										<option value="24">24일</option>
										<option value="25">25일</option>
										<option value="26">26일</option>
										<option value="27">27일</option>
										<option value="28">28일</option>
										<option value="29">29일</option>
										<option value="30">30일</option>
										<option value="31">30일 이상</option>
										</select>
										</li>
									</ul>
								</div><!-- end col -->
								<div class="col-md-2 col-sm-6 col-xs-12 colon1 nopad text-center" style="width: 23%;">
									<div class="pricing-header firstch c3">
										<p>PREMIUM</p>
									</div><!-- end pricing-header -->
								<ul>
										<li><textarea name="packName" required="required"></textarea></li>
										<li><textarea name="packDesc" required="required"></textarea></li>
										<li><input type="text" name="packPrice" required="required" onkeypress="onlyNumber();">원</i></li>
										<li>
										<select name="modifyCount" required="required">
										<option value="">선택해주세요</option>
										<option value="1">1회</option>
										<option value="2">2회</option>
										<option value="3">3회</option>
										<option value="4">4회</option>
										<option value="5">5회</option>
										<option value="6">6회</option>
										<option value="7">7회</option>
										<option value="8">8회</option>
										<option value="9">9회</option>
										<option value="10">10회</option>
										<option value="11">11회</option>
										<option value="12">12회</option>
										<option value="13">13회</option>
										<option value="14">14회</option>
										<option value="15">15회</option>
										<option value="nonlimited">제한없음</option>
										</select>
										</li>
										<li>
										<select name="workingPeriod">
										<option value="none">선택해주세요</option>
										<option value="1">1일</option>
										<option value="2">2일</option>
										<option value="3">3일</option>
										<option value="4">4일</option>
										<option value="5">5일</option>
										<option value="6">6일</option>
										<option value="7">7일</option>
										<option value="8">8일</option>
										<option value="9">9일</option>
										<option value="10">10일</option>
										<option value="11">11일</option>
										<option value="12">12일</option>
										<option value="13">13일</option>
										<option value="14">14일</option>
										<option value="15">15일</option>
										<option value="16">16일</option>
										<option value="17">17일</option>
										<option value="18">18일</option>
										<option value="19">19일</option>
										<option value="20">20일</option>
										<option value="21">21일</option>
										<option value="22">22일</option>
										<option value="23">23일</option>
										<option value="24">24일</option>
										<option value="25">25일</option>
										<option value="26">26일</option>
										<option value="27">27일</option>
										<option value="28">28일</option>
										<option value="29">29일</option>
										<option value="30">30일</option>
										<option value="31">30일 이상</option>
										</select>
										</li>
									</ul>
								</div><!-- end col -->
								<div class="pricing-footer text-center" style="width: 1298px;">
										<a class="btn c1" style="width: 100%;"><input type="submit" value="서비스등록하기" style="background: none; border: none; "></a>
									</div>
									<input type="hidden" name="productNo" value="${param.productNo }">
							</div>
									</form>
</body>
</html>