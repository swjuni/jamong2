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
	$("#profileImg").on('change', function(){
		var fileName = $(this).val();
		 
		if (fileName != "") {
		    var ext = fileName.slice(fileName.lastIndexOf(".") + 1).toLowerCase();
		    if (!(ext == "gif" || ext == "jpg" || ext == "png" || ext == "jpeg")) {
		        alert("이미지파일 (.jpg, .png, .gif,.jpeg ) 만 등록 가능합니다.");
		        return false;
		    }
		}
		
        readURL(this);
   	});
	
	$("#id").keyup(function(){
		if($("#id").val()!=""){
			$("button[type=submit]").attr("disabled",false);
		}else{
			$("button[type=submit]").attr("disabled","disabled");
		}
	});
});

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			
			reader.onload = function (e) {
			$('#image').attr('src', e.target.result);
		}
		
		reader.readAsDataURL(input.files[0]);
		}
	}
</script>
<style type="text/css">
	body{
		background: white;
	}

	li div{
		width: 100%;
	}

	.uploadImg{
		width:0px;
		height:0px;
		float:left;
	}
	
	.uploadImg label {
		cursor: pointer;
		margin: 67px -28px;
	}
	
	.uploadImg input[type="file"] {
		position: absolute;
		width: 1px;
		height: 1px;
		padding: 0;
		margin: -1px;
		overflow: hidden;
		clip: rect(0, 0, 0, 0);
		border: 0;
	}
	
	.btn{
		margin-right: 22px;
		padding: 10px;
		width: 80px;
		float:right;
	}
</style>
</head>
<body>
	<form name="frm" role="form" class="contactform" action="<c:url value='/registExpert/basic.do'/>" enctype="multipart/form-data" method="post">
		<div class="contact-details">
			<ul>
			
				<li>
				<img id="image" 
				<c:if test="${empty expert }">
				src="/jamong/resources/images/userinfo.png"
				</c:if>
				<c:if test="${!empty expert }">
				src="<c:url value='/upload/expert/${expert.fileName }'/>"
				</c:if>
				alt="" style="width: 100px; height:100px; border-radius: 50%; float: left; border: 4px solid #f1f6f7;">
					<div class="uploadImg">
					<label for="profileImg"><i class="fa fa-search"></i></label>
					<input type="file" id="profileImg" accept="image/gif,image/jpeg,image/png,image/jpg" multiple="multiple" name="file_Name">
					</div>
					<div style="padding: 13px 115px;">
					<span><a>닉네임</a></span>
					<input style="width:300px;" type="text" class="form-control" id="id" name="id" value="${expert.id }" required="required">
					</div>
				</li>
				<li>
					<div>
					<span><a>&nbsp;자기소개</a></span>
					<textarea name="introduction" style="width:600px;height:250px;margin-top:13px;" class="form-control" id="introduction" maxlength="450" rows="10"><c:if test="${!empty expert }">${expert.introduction }</c:if></textarea>
					</div>
				</li>
			</ul>
		</div>
		<button type="button" id="next" name="next"	class="btn btn-primary"
		<c:if test='${empty expert }'>
		 disabled="disabled"
		</c:if>
		onclick="location.href='<c:url value="/registExpert/major.do?userNo=${sessionScope.userNo }"/>'">다음</button>
		<button type="submit" id="submit" name="submit"	class="btn btn-primary"
		<c:if test='${empty expert }'>
		 disabled="disabled"
		</c:if>
		>저장</button>
		<c:if test="${!empty expert }">
			<input type="hidden" value="${expert.fileName }" name="oldFileName">
		</c:if>
		<br>
		<br>
	</form>
</body>
</html>