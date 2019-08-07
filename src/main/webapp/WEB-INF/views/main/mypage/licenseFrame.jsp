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
	$("jmcd").remove();
	$("mdobligfldcd").remove();
	$("obligfldcd").remove();
	$("qualgbcd").remove();
	$("seriescd").remove();
	$("qualgbnm").remove();
	$("mdobligfldnm").remove();
	var op="";
	$("seriesnm").each(function (index, item) {
		var te=$(this).text();
		if(op.indexOf(te)==-1){
			$(".dae").append("<option>"+te+"</option>");
			op+=te+"/";
		}
	})
	op="";
	
	var op2="";
	$("#country").on("change",".dae",function(){
		$(".so").html("<option>선택하세요</option>");
		$("seriesnm").each(function (index, item) {
			if($(".dae option:selected").text()==$(this).text()){
				var te=$(this).prev().text();
				if(op2.indexOf(te)==-1&&te!=" "){
					$(".so").append("<option>"+te+"</option>");
					op2+=te+"/";
				}
			}//if
		});//each
		op2="";
		if($(".so option").length==1){
			$(".so").append("<option>없음</option>");
		}
	})//daeChanged
	
	var op3="";
	$("#country").on("change",".so",function(){
		$(".soso").html("<option>선택하세요</option>");
		var sel=$(".so option:selected").text();
		if(sel=="없음"){
			sel=" ";
		}
		$("obligfldnm").each(function (index, item) {
			if(sel==$(this).text()&&$(".dae option:selected").text()==$(this).next().text()){
				var te=$(this).prev().text();
				if(op3.indexOf(te)==-1){
					$(".soso").append("<option>"+te+"</option>");
					op3+=te+"/";
				}
			}//if
		});//each
		op3="";
	})//soChanged
	
	$("#country").on("change",".soso",function(){
		var res=$(".soso option:selected").text();
		$(".mylicense").append("<span readonly='readonly' class='ddd'><input type=text name='license' value='"+res+"'><small class='sma' style='cursor:pointer;'>x</small></span>")
	});
	$("#choice").click(function(){
		var name=$("#name").val();
		var date=$("#date").val();
		var agency=$("#agency").val();
		if(name==""){
			alert("자격증명을 입력하세요.");
			$("#name").focus();
			return false;
		}else if(date==""){
			alert("발급일을 입력하세요.");
			$("#date").focus();
			return false;
		}else if(agency==""){
			alert("발급기관을 입력하세요.");
			$("#agency").focus();
			return false;
		}
		var res=name+"."+date+"."+agency;
		$(".mylicense").append("<span class='ddd'><input readonly='readonly' type=text name='license' value='"+res+"'><small class='sma' style='cursor:pointer;'>x</small></span>");
		$("#name").val("");
		$("#date").val("");
		$("#agency").val("");
		
	})
	$("#33").on("click",".sma",function(){
		$(this).parent().remove();
	})
	$("#frm").submit(function(){
		if($("input[name=license]").length==0){
			alert("저장할 데이터가 없습니다.");
			return false;
		}
	})
})//function
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
			<h3 style="font-size: 22px; font-weight: bold; color: #232323b8;">자격증 선택</h3>
			<div class="country" style="margin: 30px 10px;" id="country">
			<h4 style="margin-left: 35%;"><국가기술자격증></h4>
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
				<h4 style="margin-left: 43%;"><직접입력></h4>
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
		<button type="button" id="next" name="next" class="btn btn-primary btn1" onclick="location.href='/jamong/mypage/registCareer.do'" style="margin-right: 245px;">다음</button>
		<button type="submit" id="submit" name="submit" class="btn btn-primary btn1">저장</button>
	</form>
</div>
<div hidden="hidden">
${license1 }
</div>
</body>
</html>