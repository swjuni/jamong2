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
<title>profileFrame</title>
<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
<script type="text/javascript">
</script>
<style type="text/css">
body {
	background: white;
}
.contactform .form-control {
    background-color: white;
    border: 1px solid #80808040;
    height: 45px;
    width: 570px;
	margin: 10px 15px;
}

h4{
	margin-top: 20px;
}

h4{
	color: #f46f63;
}

.span {
    margin-left: 83px;
    margin-right: 63px;
    color: #f58e67;
}
.btn2{
	margin-left: 40%;
    background: #f58e6773;
    border-radius: 3px;
    margin-top: 13px;
}
.btn2:focus{
	margin-left: 40%;
    background: #f58e6773;
    border-radius: 3px;
    margin-top: 13px;
}
.ddd input[type=text]{
    border: 1px solid #faccba;
    width: auto;
    background: #faccbab8;
    color: gray;
    margin-top: 10px;
}
.ddd{
    margin-right: 10px;
    border-radius: 5px;
}
.btn2:hover{
	background: #f5f5f5;
	color: black;
}
small{
	font-size: 25px;
    margin-left: 5px;
}
.btn1{
	margin-right:22px;
	float: right;
	width: 80px;
	padding:10px;
}
</style>
</head>
<body>
<div>
	<form id="frm" name="frm" role="form" class="contactform" action="<c:url value='/mypage/registLicense.do'/>" method="post">
		<div class="form-group">
			<h3 style="font-size: 22px; font-weight: bold; color: #232323b8;">학력 . 경력</h3>
			<div class="country" style="margin: 30px 10px;" id="country">
			<h4 style="margin-left: 35%;"><학력></h4>
			<h4>대분류</h4>
				<select class="dae form-control" >
					<option value="">선택하세요</option>
				</select>
			<h4>소분류</h4>
				<select class="so form-control">
					<option value="">선택하세요</option>
				</select>
			<h4>선택</h4>
				<select class="soso form-control">
					<option value="">선택하세요</option>
				</select>
			</div>
			<div class="self">
				<h4 style="margin-left: 43%;"><경력></h4>
				<span class="span">자격증명</span>
				<span class="span">발급일</span>
				<span class="span">발급기관</span>
				<input type="text" style="width: 28%; height: 45px; margin-left: 27px; margin-top: 10px;" id="name">
				<input type="text" style="width: 28%; height: 45px; margin-left: 27px; margin-top: 10px;" id="date">
				<input type="text" style="width: 28%; height: 45px; margin-left: 27px; margin-top: 10px;" id="agency">
				<input class="btn btn2 btn-primary" type="button" id="choice" value="입력">
			</div>
		</div>
		<div id="33" class="mylicense" style="margin-bottom:25px; padding: 12px 12px; background: #f5f5f5; height: 150px;">
		<c:if test="${!empty license }">
		<c:forEach var="li" items="${license }">
		<span class='ddd'><input readonly="readonly" type=text name='license' value='${li }'><small class='sma' style='cursor:pointer;'>x</small></span>
		</c:forEach>
		</c:if>
		</div>
		<button type="button" id="next" name="next" class="btn btn-primary btn1" onclick="location.href='/jamong/mypage/major.do?userNo=14'" style="margin-right: 245px;">다음</button>
		<button type="submit" id="submit" name="submit" class="btn btn-primary btn1">저장</button>
	</form>
</div>
<div hidden="hidden">
${license1 }
</div>
</body>
</html>