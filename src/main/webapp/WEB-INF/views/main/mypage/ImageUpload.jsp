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
		var files = document.getElementById("mainImg").files;

		 alert(files.length);
	});

    $('input[type=file]').on('change', function() {
        imagesPreview(this, $(this).parent().parent());
    });
	
	 //이미지 업로드 프리뷰
    var imagesPreview = function(input, div) {

        if (input.files) {
            var filesAmount = input.files.length;

            for (i = 0; i < filesAmount; i++) {
                var reader = new FileReader();

                reader.onload = function(event) {
                	$($.parseHTML('<img src="<c:url value="/resources/images/minus.png"/>" class="remove">')).prependTo(div);
                    $($.parseHTML('<img class="img">')).attr('src', event.target.result).prependTo(div);
                }

                reader.readAsDataURL(input.files[i]);
            }
        }

    };
})
</script>
<style type="text/css">
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
	.main ,.img {
		float: left;
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
<form name="frm" id="fm" action="<c:url value='/mypage/imageUpload.do'/>" method="post" enctype="multipart/form-data" style="margin-top: -13px;">
			<p>메인 이미지</p>
	<div class="first" dropzone="first">
		<div class="main">
			<label for="mainImg"><img src="<c:url value='/resources/images/layers.png'/>" class="add" style="margin: 59px;"></label>
			<input type="file" id="mainImg" accept="image/gif,image/jpeg,image/png,image/jpg" multiple="multiple" name="imageFiles" dropzone="first">
		</div>
	</div>
	
	<!-- ----------------------------------------------상세 이미지----------------------------------------------- -->
	<p>상세 이미지</p>
	<div class="second">
		<div class="main">
			<label for="DetailImg"><img src="<c:url value='/resources/images/layers.png'/>" class="add" style="margin: 59px;"></label>
			<input type="file" id="DetailImg" accept="image/gif,image/jpeg,image/png,image/jpg" multiple="multiple" name="imgDetailFiles">
		</div>
	</div>
</form>
</body>
</html>