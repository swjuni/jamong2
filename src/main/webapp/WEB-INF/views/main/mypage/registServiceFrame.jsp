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
<link href="<c:url value='/assets/css/lib/font-awesome.min.css'/>" rel="stylesheet">
<link href="<c:url value='/assets/css/lib/themify-icons.css'/>" rel="stylesheet">
<link href="<c:url value='/assets/css/lib/bootstrap.min.css'/>" rel="stylesheet">

<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
<script type="text/javascript">
$(function(){
	var firstNo=$("#firstCategory").val();
	var secondNo=$("#secondCategory").val();
	$.ajax({
		url:"<c:url value='/registExpert/submajor.do'/>",
		type:"get",
		data:"categoryLNo="+firstNo,
		dataType:"json",
		success:function(res){
			$.each(res, function(idx, item){
				if(secondNo==item.categoryNoM){
					$("div #categoryM").append("<label for='"+item.categoryName+"'> <input checked='checked' type='radio' value='"+item.categoryNoM+"' required='required' id='"+item.categoryName+"' name='categoryTypeNo'>"+item.categoryName+"</label>");
				}else{
					$("div #categoryM").append("<label for='"+item.categoryName+"'> <input type='radio' value='"+item.categoryNoM+"' required='required' id='"+item.categoryName+"' name='categoryTypeNo'>"+item.categoryName+"</label>");
				}
			});
		},
		error:function(xhr, status, error){
			alert(status+":"+error);
		}
	});//ajax
	
	$("#categoryNameL").change(function(){
		var categoryNo=$(this).val();
		$.ajax({
			url:"<c:url value='/registExpert/submajor.do'/>",
			type:"get",
			data:"categoryLNo="+categoryNo,
			dataType:"json",
			success:function(res){
				$("div #categoryM label").remove();
				$.each(res, function(idx, item){
					$("div #categoryM").append("<label for='"+item.categoryName+"'> <input type='radio' value='"+item.categoryNoM+"' required='required' id='"+item.categoryName+"' name='categoryTypeNo'>"+item.categoryName+"</label>");
				});
			},
			error:function(xhr, status, error){
				alert(status+":"+error);
			}
		});//ajax
	})
})
</script>
<style type="text/css">
input[type=checkbox]{
}

#categoryM label{
	margin-right: 17px;
    padding: 2px 8px;
    border: 1px #f47664 solid;
	border-radius: 10px;
}

.btn{
	background-image: linear-gradient(45deg, #f46c63 1%,  #f7ba6d 100%);
    color: white;
    width: 77px;
    border-radius: 25px;
}
button:hover{
	background-image: linear-gradient(45deg, #f7ba6d 1%, #f46c63 100%);
}
</style>
</head>
<body>
	<input type="hidden" 
	<c:if test='${empty savedCategory }'>
	value="${list[0].categoryNo }" 
	</c:if>
	<c:if test='${!empty savedCategory }'>
	value="${savedCategory }" 
	</c:if>
	id="firstCategory">
	<input type="hidden" value="${menuVo.categoryTypeNo }" id="secondCategory">
	<form name="frm" role="form" class="contactform" action="<c:url value='/registService/registService.do'/>" method="post">
	<div class="row">
	    <div class="col-lg-6">
	        <div class="form-group">
	            <label>상품 제목</label>
				<input type="text" class="form-control" placeholder="등록하실 상품의 제목을 입력해주세요" required="required" name="productName" value="${menuVo.productName }">
			</div>
			<div class="form-group">
				<label>카테고리 선택</label>
				<select class="form-control" id="categoryNameL">
				<c:forEach var="categoryLvo" items="${list }">
					<option value="${categoryLvo.categoryNo }" 
					<c:if test='${savedCategory==categoryLvo.categoryNo }'>
					selected="selected"
					</c:if>
					>${categoryLvo.categoryNameL }</option>
				</c:forEach>
				</select>
				<br>
			<label>상세 카테고리 선택</label>
			<div id="categoryM">
			</div>
		</div>
	</div>
	</div>
	<div class="divbtn" style="margin-left: 235px;">
	<button type="submit" id="save" class="btn btn-rounded"
	>저장</button>
	<button type="button" id="next" class="btn btn-rounded"
	<c:if test='${empty menuVo }'>
	disabled="disbled"
	</c:if>
	onclick="location.href='<c:url value="/registService/serviceFrame2.do"/>'"
	>다음</button>
	</div>
	<input type="hidden" value="${expert.expertNo }" name="expertNo">
</form>
</body>
</html>