<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!------ Include the above in your HEAD tag ---------->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
<script type="text/javascript">
$(function(){
	$("#dd").click(function(){
		$("#sub1").after('<input type="file" id="sub" name="files">');
	})
})
	</script>
</head>
<body>
	<form name="frm" role="form" class="contactform" action="<c:url value='/registService/imageUpload.do'/>" method="post" enctype="multipart/form-data">
	<input type="file" id="main" name="files">
	<input type="file" id="sub1" name="files">
	<input type="text" name="productNo" value="${param.productNo }">
	<button type="button" id="dd" value="업로드"></button>
	<button type="submit" value="업로드"></button>
</form>
</body>
</html>