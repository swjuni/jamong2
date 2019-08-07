<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<!------ Include the above in your HEAD tag ---------->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
<script type="text/javascript">
$(function(){
	$("#fm").submit(function(){
		if($(".first").find(".remove").length==0){
			alert("메인 이미지는 1개이상 등록하셔야합니다.");
			return false;
		}
	})
	$("#fir").on("click",".remove",function(){
		var num=$(this).parent().parent().prev().find('span').text();
    	$(this).parent().parent().prev().find('span').html(Number(num)-1);
		var i=$(this).parent().parent().find("input[type=file]:last").attr("id")+1;
		if($(this).parent().parent().find(".remove").length==4){
			$(this).parent().parent().append('<div class="main"><label for="'+i+'"><img src="<c:url value="/resources/images/layers.png"/>" class="add" style="margin: 59px;"></label><input type="file" id="'+i+'" accept="image/gif,image/jpeg,image/png,image/jpg" name="imageFiles"></div>');
		}
		$(this).parent().remove();
	});
	$("#sec").on("click",".remove",function(){
		var num=$(this).parent().parent().prev().find('span').text();
    	$(this).parent().parent().prev().find('span').html(Number(num)-1);
		var i=$(this).parent().parent().find("input[type=file]:last").attr("id")+1;
		if($(this).parent().parent().find(".remove").length==9){
			$(this).parent().parent().append('<div class="detail"><label for="'+i+'"><img src="<c:url value="/resources/images/layers.png"/>" class="add" style="margin: 59px;"></label><input type="file" id="'+i+'" accept="image/gif,image/jpeg,image/png,image/jpg" name="imgDetailFiles"></div>');
		}
		$(this).parent().remove();
	});

	//file input 됐을 때
    $('#fm').on('change', "input[type=file]",function() {
    	//숫자 바꿔주기
    	var num=$(this).parent().parent().prev().find('span').text();
    	$(this).parent().parent().prev().find('span').html(Number(num)+1);
    	//메인 이미지 일때
    	if($(this).attr("id").indexOf("main")!=-1){
    		var i=$(this).attr("id")+1;
        	imagesPreview(this, $(this).parent());//이미지 보여주기
        	$(this).prev().hide();//선택된 label 숨기기
        	//4개 초과 하면 안만들기
        	if($(".first div").length==4){
        		return false;
        	}
   			//file input 만들기
   			$(this).parent().after('<div class="main"><label for="'+i+'"><img src="<c:url value="/resources/images/layers.png"/>" class="add" style="margin: 59px;"></label><input type="file" id="'+i+'" accept="image/gif,image/jpeg,image/png,image/jpg" name="imageFiles"></div>')
    	}else{
    		var i=$(this).attr("id")+1;
        	imagesPreview(this, $(this).parent());//이미지 보여주기
        	$(this).prev().hide();//선택된 label 숨기기
        	//9개 초과 하면 안만들기
        	if($(".second div").length==9){
        		return false;
        	}
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
    
    $("#next").click(function(){
    	parent.location.href="<c:url value='/mypage/setpackageFrame.do'/>";
	}) ;
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
	button:disabled{
		opacity:0.7;
		cursor: not-allowed;
	}
</style>
</head>
<body>
<form name="frm" id="fm" action="<c:url value='/mypage/imageUpload.do?productNo=${param.productNo }'/>" method="post" enctype="multipart/form-data" style="margin-top: -13px;">
	<p>메인 이미지(<span>${fn:length(listImage) }</span>/4)</p>
	<div class="first" id="fir">
	<c:if test="${!empty listImage  }">
	<c:forEach var="imageVo" items="${listImage }">
	<div class="img" style="background-image: url('<c:url value="/upload/image/${imageVo.fileName }"/>')">
		<img src="<c:url value="/resources/images/minus.png"/>" class="remove">
		<input name="imageNoR" type="hidden" value="${imageVo.imgNo}">
	</div>
	</c:forEach>
	</c:if>
	<c:if test="${fn:length(listImage)<4 }">
	<div class="main">
		<label for="mainImg"><img src="<c:url value='/resources/images/layers.png'/>" class="add" style="margin: 59px;"></label>
		<input type="file" id="mainImg" accept="image/gif,image/jpeg,image/png,image/jpg" name="imageFiles">
	</div>
	</c:if>
	</div>
	
	<!-- ----------------------------------------------상세 이미지----------------------------------------------- -->
	<p>상세 이미지(<span>${fn:length(listImgDetail) }</span>/9)</p>
	<div class="second" id="sec">
	<c:if test="${!empty listImgDetail  }">
	<c:forEach var="imgDetailVo" items="${listImgDetail }">
	<div class="img" style="background-image: url('<c:url value="/upload/img_detail/${imgDetailVo.fileName }"/>')">
		<img src="<c:url value="/resources/images/minus.png"/>" class="remove">
		<input type="hidden" name="imgDetailNoR" value="${imgDetailVo.detailImgNo }">
	</div>
	</c:forEach>
	</c:if>
	<c:if test="${fn:length(listImgDetail)<9 }">
		<div class="detail">
			<label for="DetailImg"><img src="<c:url value='/resources/images/layers.png'/>" class="add" style="margin: 59px;"></label>
			<input type="file" id="DetailImg" accept="image/gif,image/jpeg,image/png,image/jpg" name="imgDetailFiles">
		</div>
	</c:if>
	</div>
	<div class="divbtn" style="margin-left: 235px;">
		<button type="submit" id="save" class="btn btn-rounded">저장</button>
		<button type="button" id="next" class="btn btn-rounded"
		<c:if test="${empty listImage}">
		disabled="disabled"
		</c:if>
		>다음</button>
	</div>
</form>
</body>
</html>