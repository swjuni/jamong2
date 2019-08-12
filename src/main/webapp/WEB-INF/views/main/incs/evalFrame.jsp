<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<!--[if IE 9]> <html class="no-js ie9 fixed-layout" lang="en"> <![endif]-->
<!--[if gt IE 9]><!--> <html class="no-js " lang="en"> <!--<![endif]-->
<head>
<meta charset="UTF-8">
<title>profileFrame</title>
<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
<script type="text/javascript">
$(function(){
	var no=0;
	var func=function(){
		if($(".evNo:first").length){
			no=$(".evNo:first").val();
		}
		$.ajax({
			url:"<c:url value='/main/selectRecentOne.do'/>",
			type:"get",
			data:"no="+no,
			success:function(res){
				if(res!=""){
					$(".none").remove();
					var idx=res.USER_ID.indexOf("@");
					sub=res.USER_ID.substring(idx-3,idx);
					id=res.USER_ID.replace(sub,'***');
					var num=res.EVAL_SCORE;
					var star="";
					for(var i=num;i<100;i+=20){
						star=star+"☆ ";
					}
					for(var i=0;i<num;i+=20){
						star=star+"★ ";
					}
					$("body").prepend('<input type="hidden" value="'+res.EVAL_NO+'" class="evNo"><div class="review"><div class="lineone"><span class="fir">'+res.CATEGORY_NAME_L+'</span><span class="sec">   '+id+'</span><span class="time">  방금</span><span class="third">'+star+'</span></div><br><div class="linetwo"><span class="fourth">'+res.REVIEW+'</span></div></div>');
					var height=$("div:first").css("height");
					height=height.replace("px","");
					height=Number(height)+15;
					height=height+"px";
					$("body").animate({"margin-top": '-='+height},0)
					$("body").animate({"margin-top": '+='+height},1000,function(){
						window.setTimeout('window.location.reload()',60000); //60초마다 새로고침
					});
				}else{
					return false;
				}
			},
			error:function(xhr, status, error){
				alert(status+":"+error);
			}
		});//ajax
	};
	if(!$("body").is(':animated')){
		window.setTimeout('window.location.reload()',60000); //60초마다 새로고침
	}
	setInterval(func,1000);
})
</script>
<style type="text/css">
.fir{
    border: 2px solid #f46c6396;
    padding: 7px 12px;
    padding-top: 8px;
    border-radius: 20px;
    font-family: monospace;
}
.review{
	width: 500px;
    background: #0000000d;
    padding: 20px 20px;
    margin-bottom: 15px;
}
.linetwo{
	padding: 2px 5px;
}
.third{
	float: right;
    margin-right: 15px;
    color: #f46c63;
}
.sec{
	font-size: 13px;
}
.none{
    font-size: 99px;
    color: #f58e67;
}
.time{
	font-size: 12px;
    color: #2196f3bf;
}
</style>
</head>
<body>
<c:if test="${empty evalList }">
<span class="none">
오늘 작성된 서비스 평가가 없습니다.
</span>
</c:if>
<c:if test="${!empty evalList }">
<c:forEach var="map" items="${evalList }">
<input type="hidden" value="${map['EVAL_NO']}" class="evNo">
<div class="review">
	<div class="lineone">
		<span class="fir">${map["CATEGORY_NAME_L"] }</span>
		<c:set var="user_id" value="${map['USER_ID'] }"/>
		<c:set var="index" value="${fn:indexOf(user_id,'@') }"/>
		<c:set var="subst" value="${fn:substring(user_id,index-3,index) }"/>
		<c:set var="hide_id" value="${fn:replace(user_id,subst,'***') }"/>
		<span class="sec">${hide_id }</span>
		<c:if test="${map['COL'] <1}">
		<span class="time">방금</span>
		</c:if>
		<c:if test="${map['COL'] >=1 && map['COL']<60}">
		<span class="time">${map['COL'] }분 전</span>
		</c:if>
		<c:forEach begin="60" end="1440" step="60" var="ti">
		<c:if test="${ti<=map['COL'] && map['COL']<ti+60}">
		<span class="time"><fmt:formatNumber value="${ti/60}" pattern="##"/>시간 전</span>
		</c:if>
		</c:forEach>
		<span class="third">
		<c:forEach begin="${map['EVAL_SCORE']+20 }" end="100" step="20">
		★
		</c:forEach>
		<c:forEach begin="20" end="${map['EVAL_SCORE'] }" step="20">
		☆
		</c:forEach>
		</span>
	</div>
	<br>
	<div class="linetwo">
		<span class="fourth">${map["REVIEW"] }</span>
	</div>
</div>
</c:forEach>
</c:if>
</body>
</html>