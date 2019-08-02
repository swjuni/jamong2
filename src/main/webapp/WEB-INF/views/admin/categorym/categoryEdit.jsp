<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!-- 카테고리 홈 top include -->
<%@include file="../inc/admin_top.jsp" %>
<style type="text/css">

</style>
<script type="text/javascript" src="<c:url value='/assets/js/lib/jquery.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/se2/js/service/HuskyEZCreator.js'/>" charset="utf-8"></script><!-- 스마트에디터 js -->
<script type="text/javascript">
	$(function(){
		$('#file_name').change(function(){
			var fileName = $(this).val();
			$(this).next().html(fileName);
			//$('#file_name').html(fileName);
			//$('#file_name').append("<br>"+ fileName.subString(fileName.lastIndexOf("\\")+1));
		});
	});
	
	function submitContents(form_name) {
		// 에디터의 내용이 textarea에 적용된다.
		oEditors.getById["categoryDesc"].exec("UPDATE_CONTENTS_FIELD", []);
	
		// 에디터의 내용에 대한 값 검증은 이곳에서
		// document.getElementById("content").value를 이용해서 처리한다.
	 try {
	     form_name.form.submit();
	 } catch(e) {}
	 }
</script>

<!-- 각자가 분담해서 디자인할 바디 태그 -->
    <div class="content-wrap">
        <div class="main">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-8 p-r-0 title-margin-right">
                        <div class="page-header">
                            <div class="page-title">
                                <h1>카테고리 <span>관리화면</span></h1>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                    <div class="col-lg-4 p-l-0 title-margin-left">
                        <div class="page-header">
                            <div class="page-title">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Table-Export</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                </div>
                <!-- /# row -->
                
                <section id="main-content">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-title">
                                    <h4>카테고리 수정</h4>
                                </div>
                                <div class="card-body">
                                    <div class="basic-form">
                                        <form name="frmWrite" method="post" action="<c:url value='/admin/categorym/categoryEdit.do'/>" enctype="multipart/form-data">
                                        	<fieldset>
												<legend></legend>
												<div>
												카테고리(대) 선택 : 
													<select name="categoryNoL">
														<c:forEach var="list" items="${list }">
															<option value="${list.categoryNo}" <c:if test="${vo.categoryNoL == list.categoryNo }">selected</c:if>>${list.categoryNameL }</option>														
														</c:forEach>
													</select>
													<!-- 선택된 카테고리 값 불러오기  -->
												</div><br>
	                                            <div class="form-group">
						            				<input type="text" id="categoryName" name="categoryName" class="form-control input-default" maxlength="100" placeholder="${vo.categoryName }" required="required"/>
	                                            </div>
	                                            
										        <div class="form-group">  
										 			<textarea id="categoryDesc" name="categoryDesc" rows="8" cols="100" class="form-control">${vo.categoryDesc }</textarea>
										        </div>
												<script type="text/javascript">
													//스마트에디터2 생성 코드
													var oEditors = [];
													nhn.husky.EZCreator.createInIFrame({
														oAppRef: oEditors,
														elPlaceHolder: "categoryDesc",
														sSkinURI: "<c:url value='/se2/SmartEditor2Skin.html'/>",
														fCreator: "createSEditor2"
													});
												</script>
										        
										        <c:if test="${!empty vo.imgName }">
										        	<hr>
                    								<div>첨부이미지 : ${vo.imgName }</div>
                    								<div style="color: red;">첨부이미지를 변경하면 기존 파일은 삭제됩니다.</div>
                    								<hr> 
											        <div class="form-group">
											 			<img class="img-fluid" src="<c:url value='/upload/categoryM/${vo.imgName }'/>" alt=""/>
											        </div>
												</c:if>
										        
										        <div class="form-group">
										 			<img src="">
										        </div>
										        <div class="form-group">
											        <div class="custom-file">
											            <input type="file" id="file_name" name="file_name" class="custom-file-input" />
											            <label class="custom-file-label" for="file_name">첨부 이미지</label>
											            <!-- 업로드한 파일명 불러오고 새로 추가 할 경우 기존 파일 삭제 -->
											        </div>
										        </div>
										        
												<div class="text-center">
													<input type="hidden" name="oldFileName" value="${vo.imgName}" />
													<input type="hidden" name="categoryNoM" value="${vo.categoryNoM}" />
												
										            <input type = "submit" value="수정" class="btn btn-primary" onclick="submitContents(frmWrite)">&nbsp;&nbsp;
										            <input type = "reset" value="취소" class="btn btn-danger">&nbsp;&nbsp;
										            <input type = "Button" value="목록" class="btn btn-primary"
										            onclick="location.href='<c:url value='/admin/categorym/categoryList.do'/>'">
										        </div>
												
                                            </fieldset>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!-- /# card -->
                        </div>
                        <!-- /# column -->
                    </div>
                </section>
            </div>
        </div>
    </div>



	<!-- 관리자 홈 공통 bottom include -->
	<%@include file="../inc/bottom_js.jsp" %>
	
	<!-- 화면별 고유 scripit init -->


<%@include file="../inc/admin_bottom.jsp" %>    