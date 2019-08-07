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
$(function(){
	$("#1").on("click",".sma",function(){
		$(this).parent().remove();
	})
	$("#2").on("click",".sma",function(){
		$(this).parent().remove();
	})
	$("#choice1").click(function(){
		var name=$("#name").val();
		var major=$("#major").val();
		var state=$("#state option:selected").val();
		if(name==""){
			alert("학교명을 입력하세요.");
			$("#name").focus();
			return false;
		}else if(major==""){
			alert("전공을 입력하세요.");
			$("#major").focus();
			return false;
		}
		var res=name+"."+major+"."+state;
		$(".college").append("<span class='ddd'><input style='width:80%;' readonly='readonly' type=text name='college' value='"+res+"'><small class='sma' style='cursor:pointer;'>x</small></span>")
		$("#name").val("");
		$("#major").val("");
		$("#state").find("option:eq(0)").prop("selected", true);
	})
	$("#choice2").click(function(){
		var cname=$("#cname").val();
		var cdept=$("#cdept").val();
		var date=$("#cyear option:selected").val()+" "+$("#cmonth option:selected").val();
		if(cname==""){
			alert("회사명을 입력하세요.");
			$("#cname").focus();
			return false;
		}else if(cdept==""){
			alert("근무부서를 입력하세요.");
			$("#cdept").focus();
			return false;
		}else if(date=="0년 0개월"){
			alert("근무일을 입력하세요.");
			$("#cyear").focus();
			return false;
		}
		var res=cname+"."+cdept+"."+date;
		$(".career").append("<span class='ddd'><input style='width:80%;' readonly='readonly' type=text name='career' value='"+res+"'><small class='sma' style='cursor:pointer;'>x</small></span>")
		$("#cname").val("");
		$("#cdept").val("");
		$("#cyear").find("option:eq(0)").prop("selected", true);
		$("#cmonth").find("option:eq(0)").prop("selected", true);
	})
	
	$("#frm").submit(function(){
		if($("input[name=college]").length==0&&$("input[name=career]").length==0){
			alert("저장할 데이터가 없습니다.");
			return false;
		}
	})
})
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
	<form id="frm" name="frm" role="form" class="contactform" action="<c:url value='/mypage/registCareerData.do'/>" method="post">
		<div class="form-group">
			<h3 style="font-size: 22px; font-weight: bold; color: #232323b8;">학력 . 경력</h3>
			<div class="country" style="margin: 30px 10px;" id="country">
			<h4 style="margin-left: 43%;"><학력></h4>
				<span class="span">학교명</span>
				<span class="span">전공</span>
				<span class="span">상태</span>
				<input type="text" style="width: 28%; height: 45px; margin-left: 27px; margin-top: 10px;" id="name">
				<input type="text" style="width: 28%; height: 45px; margin-left: 27px; margin-top: 10px;" id="major">
				<select style="width: 28%; height: 45px; margin-left: 27px; margin-top: 10px;" id="state">
					<option>재학</option>
					<option>휴학</option>
					<option>이수</option>
					<option>졸업</option>
				</select>
				<input class="btn btn2 btn-primary" type="button" id="choice1" value="입력">
			</div>
			<div class="self">
				<h4 style="margin-left: 43%;"><경력></h4>
				<span class="span">회사명</span>
				<span class="span">근무부서</span>
				<span class="span">근무일</span>
				<input type="text" style="width: 28%; height: 45px; margin-left: 27px; margin-top: 10px;" id="cname">
				<input type="text" style="width: 28%; height: 45px; margin-left: 27px; margin-top: 10px;" id="cdept">
				<select id="cyear" style="width: 12%; height: 45px; margin-left: 27px; margin-top: 10px;">
				<c:forEach begin="0" end="12" var="i">
				<option>${i }년</option>
				</c:forEach>
				</select>
				<select id="cmonth" style="width: 12%; height: 45px; margin-left: 10px; margin-top: 10px;">
				<c:forEach begin="0" end="12" var="i">
				<option>${i }개월</option>
				</c:forEach>
				</select>
				<input class="btn btn2 btn-primary" type="button" id="choice2" value="입력">
			</div>
		</div>
		<div id="1" class="college" style="margin-bottom:25px; padding: 12px 12px; background: #f5f5f5;">
		<h4>학력</h4>
		<c:if test="${!empty college }">
		<c:forEach var="li" items="${college }">
		<span class='ddd'><input readonly="readonly" style='width:80%;' type=text name='college' value='${li }'><small class='sma' style='cursor:pointer;'>x</small></span>
		</c:forEach>
		</c:if>
		</div>
		<div id="2" class="career" style="margin-bottom:25px; padding: 12px 12px; background: #f5f5f5;">
		<h4>경력</h4>
		<c:if test="${!empty career }">
		<c:forEach var="li" items="${career }">
		<span class='ddd'><input readonly="readonly" style='width:80%;' type=text name='career' value='${li }'><small class='sma' style='cursor:pointer;'>x</small></span>
		</c:forEach>
		</c:if>
		</div>
		<button type="button" id="next" name="next" class="btn btn-primary btn1" onclick="parent.location.href='/jamong/mypage/service.do'" style="margin-right: 160px; width: 30%;">서비스 등록하러가기</button>
		<button type="submit" id="submit" name="submit" class="btn btn-primary btn1">저장</button>
	</form>
</div>
<div hidden="hidden">
${license1 }
</div>
</body>
</html>