<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../incs/top_mypage.jsp"%>
<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
<script type="text/javascript">
$(function(){
	$(".add").hide();
	$("input[type=text]").on("keyup", function() {
	    $(this).val($(this).val().replace(/[^0-9]/g,""));
	});
	$(".remove").click(function(){
		$(this).hide();
		$(this).parent().next(".add").show();
		$(this).parent().attr("style","opacity:0.2;");
		$(this).parent().parent().attr("style","width:23%;");
		$(this).parent().find("textarea").attr("disabled",true);
		$(this).parent().find("input[type=text]").attr("disabled",true);
		$(this).parent().find("select").attr("style","background:#ebebe4;");
		$(this).parent().find("select").attr("disabled",true);
	})
	$(".dd").find("li").click(function(){
		$(this).parent().parent().find(".remove").show();
		$(this).parent().parent().next(".add").hide();
		$(this).parent().parent().attr("style","opacity:1;");
		$(this).parent().parent().parent().attr("style","width:23%;");
		$(this).parent().parent().find("textarea").attr("disabled",false);
		$(this).parent().parent().find("input[type=text]").attr("disabled",false);
		$(this).parent().parent().find("select").attr("style","background:white;");
		$(this).parent().parent().find("select").attr("disabled",false);
	})
})
</script>
<style type="text/css">
.col-md-3 {
	width: 290px;
	margin-right: -40px;
}

.col-md-9 {
	margin-left: 42px;
	margin-top: 5px;
}

.mb30 {
	margin-top: 12px;
	width: 250px;
	height: 1000px;
}

.col-md-5 {
	margin-top: 9px;
	width: 665px;
	height: 1200px;
}

.form-group {
	margin-bottom: 35px;
}

.contact-details li {
	margin-bottom: 42px;
	border-bottom: none;
}

button {
	margin-left: 70px;
}

form .btn{
	margin-right: 22px;
	padding: 10px;
	width: 80px;
	float:right;
}

.service-list .col-md-4 {
	width: 241px;
}

textarea{
	width: 100%;
	height: 100%;
	border: 1px solid #80808029;
}
.big-pricing li{
	height:100px;
	background-color: #fce3cf4a;
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
.add{
	width: 100px;
	cursor: pointer;
	margin-top: -505px;
}
</style>
<c:import url="/mypage/sideMypage.do"/>
<!-- 아래부터 mypage 각자 코딩내용 작성 -->
<div class="row service-list text-center">
<%@include file="../incs/registService.jsp"%>
</div>
<form action="<c:url value='/mypage/registPackage.do'/>" name="form" method="post" style="margin-left: 80px; margin-top: 20px;">
<div class="row big-pricing">
								<div class="col-md-4 col-sm-6 col-xs-12 colon1 nopad" style="width: 10%;">
									<div class="pricing-header firstch c0" style="height: 146px; background-color: #f6a76b52 !important;">
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
									<div class="pricing-header firstch c1" style=" background-color: #f69b69a3 !important;">
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
										<select name="workingPeriod" required="required">
										<option value="">선택해주세요</option>
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
								<div class="col-md-2 dd col-sm-6 col-xs-12 colon1 nopad text-center" style="width: 23%;">
								<div>
									<img alt="" src="<c:url value='/resources/images/multiply2.png'/>" style="width:25px; float: right; cursor: pointer;" class="remove">
									<div class="pricing-header firstch c2" style="background-color: #f58f68c9 !important;">
										<p>DELUXE</p>
									</div><!-- end pricing-header -->
									<ul>
										<li><textarea name="packName" required="required"></textarea></li>
										<li><textarea name="packDesc" required="required"></textarea></li>
										<li><input type="text" name="packPrice" onkeypress="onlyNumber();">원</i></li>
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
										<select name="workingPeriod" required="required">
										<option value="">선택해주세요</option>
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
									</div>
									<img alt="" src="<c:url value='/resources/images/add_package.png'/>" class="add">
								</div><!-- end col -->
								<div class="col-md-2 dd col-sm-6 col-xs-12 colon1 nopad text-center" style="width: 23%;">
								<div>
								<img alt="" src="<c:url value='/resources/images/multiply2.png'/>" style="width:25px; float: right; cursor: pointer;" class="remove">
									<div class="pricing-header firstch c3" style="background-color: #f47764db !important;">
										<p>PREMIUM</p>
									</div><!-- end pricing-header -->
								<ul>
										<li><textarea name="packName" required="required"></textarea></li>
										<li><textarea name="packDesc" required="required"></textarea></li>
										<li><input type="text" name="packPrice" onkeypress="onlyNumber();">원</i></li>
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
										<select name="workingPeriod" required="required">
										<option value="">선택해주세요</option>
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
									</div>
									<img alt="" src="<c:url value='/resources/images/add_package.png'/>" class="add">
									<a class="btn btn-primary" style="width: 230px; margin-right: 355px; margin-top: 60px;"><input type="submit" value="서비스등록하기" style="background: none; border: none; "></a>
									<input type="text" name="productNo" value="${param.productNo }">
									</form>
<!--아래는 mypage 공통 사용 코드  -->
</div>
<!-- end col -->
</div>
<!-- end row -->
</div>
<!-- end container -->
</section>
<!-- end section -->

<%@include file="../incs/bottom_main.jsp"%>
<!-- 화면별 고유 하단js 포함할 위치 -->
<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/resources/js/parallax.js'/>"></script>
<script src="<c:url value='/resources/js/animate.js'/>"></script>
<script src="<c:url value='/resources/js/custom.js'/>"></script>

</body>
</html>