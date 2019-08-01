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
	$("#fm").on("click",".remove",function(){
		$(this).parent().remove();
	});

	//file input 됐을 때
    $('#fm').on('change', "input[type=file]",function() {
    	//메인 이미지 일때
    	if($(this).attr("id").indexOf("main")!=-1){
    		var i=$(this).attr("id")+1;
        	imagesPreview(this, $(this).parent());//이미지 보여주기
        	$(this).prev().hide();//선택된 label 숨기기
        	//file input 만들기
        	$(this).parent().after('<div class="main"><label for="'+i+'"><img src="<c:url value="/resources/images/layers.png"/>" class="add" style="margin: 59px;"></label><input type="file" id="'+i+'" accept="image/gif,image/jpeg,image/png,image/jpg" name="imageFiles"></div>')
    	}else{
    		var i=$(this).attr("id")+1;
        	imagesPreview(this, $(this).parent());//이미지 보여주기
        	$(this).prev().hide();//선택된 label 숨기기
        	//file input 만들기
        	$(this).parent().after('<div class="detail"><label for="'+i+'"><img src="<c:url value="/resources/images/layers.png"/>" class="add" style="margin: 59px;"></label><input type="file" id="'+i+'" accept="image/gif,image/jpeg,image/png,image/jpg" name="imgDetailFiles"></div>')
    	}
    });
	
	 //이미지 업로드 프리뷰
    var imagesPreview = function(input, div) {

        if (input.files) {
            var filesAmount = input.files.length;

            for (i = 0; i < filesAmount; i++) {
                var reader = new FileReader();

                reader.onload = function(event) {
                    $(div).attr("style","background-image:url('"+event.target.result+"')");
                	$($.parseHTML('<img src="<c:url value="/resources/images/minus.png"/>" class="remove">')).prependTo(div);
                }

                reader.readAsDataURL(input.files[i]);
            }
        }

    };
})
</script>
<style type="text/css">
	.btn{
		background-image: linear-gradient(45deg, #f46c63 1%,  #f7ba6d 100%);
	    color: white;
	    width: 77px;
	    border-radius: 25px;
	    margin-top: 20px;
	    border: 0;
	    height: 36px;
	    cursor: pointer;
	}
	button:hover{
		background-image: linear-gradient(45deg, #f7ba6d 1%, #f46c63 100%);
	}
	input[type="file"] {
		position: absolute;
		width: 1px;
		height: 1px;
		padding: 0;
		margin: -1px;
		overflow: hidden;
		clip: rect(0, 0, 0, 0);
		border: 0;
	}
	.add, .remove{
		cursor: pointer;
	}
	.main ,.img,.detail {
		float: left;
		background-size: 100% 100%;
		background-repeat:no-repeat;
	    border: 3px solid #ddd;
	    width: 180px;
	    height: 180px;
	    margin-bottom: 26px;
	    margin-left: 14px;
	}
	p{
		color: #f46c63;
		font-weight: bold;
		font-size: 1.1em;
		margin-left: 18px;
	}
	img.remove {
	    float: left;
	    margin-left: -18px;
	    margin-top: -14px;
	}
	.first, .second{
		display: inline-block;
		width: 100%;
	}
</style>
</head>
<body>
<form name="frm" id="fm" action="<c:url value='/mypage/imageUpload.do?productNo=${param.productNo }'/>" method="post" enctype="multipart/form-data" style="margin-top: -13px;">
			<p>메인 이미지</p>
	<div class="first">
	<c:if test="${!empty listImage  }">
	<c:forEach var="imageVo" items="${listImage }">
	<div>
		<img src="<c:url value="/resources/images/minus.png"/>" class="remove">
		<img class="img" src="<c:url value='/upload/image/${imageVo.fileName }'/>">
		<input name="imageNo" type="hidden" value="${imageVo.imgNo}">
	</div>
	</c:forEach>
	</c:if>
		<div class="main">
			<label for="mainImg"><img src="<c:url value='/resources/images/layers.png'/>" class="add" style="margin: 59px;"></label>
			<input type="file" id="mainImg" accept="image/gif,image/jpeg,image/png,image/jpg" name="imageFiles">
		</div>
	</div>
	
	<!-- ----------------------------------------------상세 이미지----------------------------------------------- -->
	<p>상세 이미지</p>
	<div class="second">
	<c:if test="${!empty listImgDetail  }">
	<c:forEach var="imgDetailVo" items="${listImgDetail }">
	<div>
		<img src="<c:url value="/resources/images/minus.png"/>" class="remove">
		<img class="img" src="<c:url value='/upload/img_detail/${imgDetailVo.fileName }'/>">
		<input type="hidden" name="imgDetailNo" value="${imgDetailVo.detailImgNo }">
	</div>
	</c:forEach>
	</c:if>
		<div class="detail">
			<label for="DetailImg"><img src="<c:url value='/resources/images/layers.png'/>" class="add" style="margin: 59px;"></label>
			<input type="file" id="DetailImg" accept="image/gif,image/jpeg,image/png,image/jpg" name="imgDetailFiles">
		</div>
	</div>
	<div class="divbtn" style="margin-left: 235px;">
		<button type="submit" id="save" class="btn btn-rounded">저장</button>
		<button type="button" id="next" class="btn btn-rounded">다음</button>
	</div>
</form>
</body>
</html>