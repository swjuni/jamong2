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

<link rel="canonical" href="https://quilljs.com/standalone/full/">
<link type="application/atom+xml" rel="alternate" href="https://quilljs.com/feed.xml" title="Quill - Your powerful rich text editor">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.7.1/katex.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/styles/monokai-sublime.min.css">
<link href="//cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$("form[name=frm]").submit(function(){
			var summary=$("#editor-container .ql-editor").html().replace(/<p>/gi,"");
			var summary2=summary.replace(/<&#47;p>/gi,"");
			var detailDesc=$("#editor-container2 .ql-editor").html().replace(/<p>/gi,"");
			var detailDesc2=detailDesc.replace(/<&#47;p>/gi,"");
			if($("#agreement").val()!="Y"){
				alert("이용약관에 동의하셔야 저장가능합니다.");
				return false;
			}
			if($("#editor-container .ql-editor").text().length<100){
				alert("상품 설명을100자 이상입력해주세요.");
				setTimeout(function() {
					$("#editor-container .ql-editor").focus();
				}, 0);
				return false;
			}
			if($("#editor-container2 .ql-editor").text().length<10){
				alert("수정 안내를 10자 이상입력해주세요.");
				setTimeout(function() {
					$("#editor-container2 .ql-editor").focus();
				}, 0);
				return false;
			}
			$("input[name=summary]").val(summary2);
			$("input[name=detailDesc]").val(detailDesc2);
		})
		
		$("input[type=checkbox]").click(function(){
			if($("input[type=checkbox]").is(":checked")){
				$("#agreement").val("Y");
			}else{
				$("#agreement").val("N");
			}
		})
		
		$("#next").click(function(){
			location.href="<c:url value='/mypage/uploadImageView.do?productNo=${menuVo.productNo }'/>";
		})
	})
</script>
<!-- Include the Quill library -->
<script src="https://cdn.quilljs.com/1.0.0/quill.js"></script>
 
<!-- Initialize Quill editor -->
<style>
  body > #standalone-container {
    margin: 50px auto;
    max-width: 720px;
  }
  #editor-container {
    height: 350px;
  }
</style>
<script type="text/javascript">
</script>
<style type="text/css">
.btn{
	background-image: linear-gradient(45deg, #f46c63 1%,  #f7ba6d 100%);
    color: white;
    width: 77px;
    border-radius: 25px;
    margin-top: 20px;
}
button:hover{
	background-image: linear-gradient(45deg, #f7ba6d 1%, #f46c63 100%);
}
#standalone-container{
	float:left;
	width: 80%;
	border: 1px solid #f46c63;
	margin-bottom: 35px;
}
#editor-container {
    height: 250px;
    border: 1px solid #f7ba6d;
}
#editor-container2 {
    height: 200px;
    border: 1px solid #f7ba6d;
}
label{
	float:left;
	margin-right: 54px;
}
.col-sm-10 {
    max-width: 100%;
}
.divbtn{
	margin-left: 268px;
}
.form-control{
	width: 82%;
	height: 200px;
	background-image: linear-gradient(45deg, #f7ba6d12 1%, #f46c6312100%);
}
</style>
</head>
<body>
<form name="frm" role="form" class="contactform" action="<c:url value='/mypage/registService2.do'/>" method="post">
	<div class="row">
	    <div class="col-lg-6">
	<!--  -->
	<label>상품 설명</label>
	<div id="standalone-container">
		  <div id="toolbar-container" class="ql-toolbar ql-snow">
		    <span class="ql-formats">
		      <button class="ql-bold" type="button"><svg viewBox="0 0 18 18"> <path class="ql-stroke" d="M5,4H9.5A2.5,2.5,0,0,1,12,6.5v0A2.5,2.5,0,0,1,9.5,9H5A0,0,0,0,1,5,9V4A0,0,0,0,1,5,4Z"></path> <path class="ql-stroke" d="M5,9h5.5A2.5,2.5,0,0,1,13,11.5v0A2.5,2.5,0,0,1,10.5,14H5a0,0,0,0,1,0,0V9A0,0,0,0,1,5,9Z"></path> </svg></button>
		      <button class="ql-italic" type="button"><svg viewBox="0 0 18 18"> <line class="ql-stroke" x1="7" x2="13" y1="4" y2="4"></line> <line class="ql-stroke" x1="5" x2="11" y1="14" y2="14"></line> <line class="ql-stroke" x1="8" x2="10" y1="14" y2="4"></line> </svg></button>
		      <button class="ql-underline" type="button"><svg viewBox="0 0 18 18"> <path class="ql-stroke" d="M5,3V9a4.012,4.012,0,0,0,4,4H9a4.012,4.012,0,0,0,4-4V3"></path> <rect class="ql-fill" height="1" rx="0.5" ry="0.5" width="12" x="3" y="15"></rect> </svg></button>
		    </span>
		  <div id="editor-container" class="ql-container ql-snow"><div class="ql-editor" data-gramm="false" contenteditable="true">
		  <c:if test="${!empty menuVo}">
		  ${menuVo.summary }
		  </c:if>
		  </div><div class="ql-clipboard" contenteditable="true" tabindex="-1"></div></div>
		</div>	    
    </div>   
	<!--  -->
	<label>수정 안내</label>
		<div id="standalone-container">
		  <div id="toolbar-container" class="ql-toolbar ql-snow">
		  <div id="editor-container2" class="ql-container ql-snow"><div class="ql-editor" data-gramm="false" contenteditable="true">
		   <c:if test="${!empty menuVo}">
		  ${menuVo.detailDesc }
		  </c:if>
		  </div><div class="ql-clipboard" contenteditable="true" tabindex="-1"></div></div>
		</div>	    
	</div>
	<label style="margin-top: 30px;">취소 및 환불 정책</label>
	<iframe frameborder="0" src="/jamong/resources/cancelFrame.html" scrolling="auto" border="no" maginwidth="0" marginheight="0" style="height: 250px; width: 100%; background: #f0f1f2;"></iframe>
	<c:if test="${empty summarySaved}">
	<label style="float:right; margin: 3px;"><small>크몽의 취소 및 환불 정책을 확인하였으며 이에 동의합니다.</small><input type="checkbox"></label>
	</c:if>
	<c:if test="${!empty summarySaved}">
	<small style="float:right;">이미 동의하셨습니다.</small>
	</c:if>
	<c:if test="${!empty summarySaved}">
	<input type="hidden" id="agreement" value="Y">
	</c:if>
	<c:if test="${empty summarySaved}">
	<input type="hidden" id="agreement" value="N">
	</c:if>
	<input type="hidden" name="summary">
	<input type="hidden" name="detailDesc">
	</div>
</div>
	<div class="divbtn" style="margin-left: 235px;">
	<button type="submit" id="save" class="btn btn-rounded"
	>저장</button>
	<button type="button" id="next" class="btn btn-rounded"
	<c:if test="${empty summarySaved}">
	disabled="disabled"
	</c:if>
	>다음</button>
	</div>
</form>
<script src="https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.7.1/katex.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/highlight.min.js"></script>
<script src="//cdn.quilljs.com/1.3.6/quill.min.js"></script>
<script>
  var quill = new Quill('#editor-container', {
    modules: {
      formula: true,
      syntax: true,
      toolbar: '#toolbar-container'
    },
    placeholder: '상품에 대한 설명을 입력해주세요',
    theme: 'snow'
  });
  
</script>
</body>
</html>