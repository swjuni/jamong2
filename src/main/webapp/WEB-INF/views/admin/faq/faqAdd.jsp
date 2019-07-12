<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!-- 관리자 홈 top include -->
<%@include file="../inc/admin_top.jsp" %>
<style type="text/css">

</style>
<script type="text/javascript" src="<c:url value='/assets/js/lib/jquery.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/se2/js/service/HuskyEZCreator.js'/>" charset="utf-8"></script><!-- 스마트에디터 js -->
<script type="text/javascript">
	function submitContents(form_name) {
		var cat = document.getElementById("faqCateNo").selectedIndex; 
		if(cat==0){
			alert('카테고리를 선택하세요');
			event.preventDefault();
			document.getElementById("faqCateNo").focus();
		}
		
		// 에디터의 내용이 textarea에 적용된다.
		oEditors.getById["faqContent"].exec("UPDATE_CONTENTS_FIELD", []);
	
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
                                <h1>FAQ <span>관리화면</span></h1>
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
                                    <h4>FAQ 등록</h4>
                                </div>
                                <div class="card-body">
                                    <div class="basic-form">
                                        <form name="frmWrite" method="post" action="<c:url value='/admin/faq/faqAdd.do'/>">
                                        	<fieldset>
												<legend></legend>
												<div class="form-group">
													<select name="faqCateNo" id="faqCateNo" class="form-control">
														<option>카테고리 선택</option>
														<c:forEach var="vo" items="${list }" >
															<option value="${vo.faqCateNo }">${vo.faqName }</option>
														</c:forEach>
													</select><br>
						            				<input type="text" id="faqTitle" name="faqTitle" class="form-control input-default" maxlength="100" placeholder="제목을 입력하세요" required="required"/>
												</div>
                                                    	                                            
										        <div class="form-group">  
										 			<textarea id="faqContent" name="faqContent" class="form-control" style="width: 90%"></textarea>
										        </div>
												<script type="text/javascript">
													//스마트에디터2 생성 코드
													var oEditors = [];
													nhn.husky.EZCreator.createInIFrame({
														oAppRef: oEditors,
														elPlaceHolder: "faqContent",
														sSkinURI: "<c:url value='/se2/SmartEditor2Skin.html'/>",
														fCreator: "createSEditor2"
													});
												</script>
										        
						        				<br><br>
										        
												<div class="text-center">
										            <input type = "submit" value="등록" class="btn btn-primary" onclick="submitContents(frmWrite)">&nbsp;&nbsp;
										            <input type = "reset" value="취소" class="btn btn-danger">&nbsp;&nbsp;
										            <input type = "Button" value="글목록" class="btn btn-primary"
										            onclick="location.href='<c:url value='/admin/faq/faqList.do'/>'">
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