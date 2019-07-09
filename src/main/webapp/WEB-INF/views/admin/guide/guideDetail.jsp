<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!-- 관리자 홈 top include -->
<%@include file="../inc/admin_top.jsp" %>
<style type="text/css">

</style>
<script type="text/javascript" src="<c:url value='/assets/js/lib/jquery.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#del').click(function(){
			if(confirm("삭제하시겠습니까?")){
				location.href="<c:url value='/admin/guide/guideDelete.do?guideNo=${vo.guideNo }'/>";
			}else{  //삭제 취소
				event.preventDefault();
			}			
		});
	});
</script>
<!-- 각자가 분담해서 디자인할 바디 태그 -->
    <div class="content-wrap">
        <div class="main">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-8 p-r-0 title-margin-right">
                        <div class="page-header">
                            <div class="page-title">
                                <h1>안내 페이지 <span>관리화면</span></h1>
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
                                    <h4></h4>
                                </div>
                                <div class="card-body">
									<div class="user-profile">
                    					<div class="row">
                   							<div class="user-profile-name">${vo.pageName }</div>
                    						<div class="col-lg-12">
                    							<div style="float: left;"><span>${vo.adminNo }</span></div>
                    							<br>
                    							<hr>
                    							<br>
                   								${vo.content }
                    						</div>
                   						</div>
               						</div>
                                    <br><br>
									<!-- <button class="btn btn-primary" type="submit">등록</button> -->
									<div class="text-center">
							            <input type = "button" value="수정" class="btn btn-primary"
							            onclick="location.href='<c:url value='/admin/guide/guideEdit.do?guideNo=${vo.guideNo }'/>'">&nbsp;&nbsp;
										<input type = "Button" value="글삭제" class="btn btn-danger" id="del">&nbsp;&nbsp;
							            <input type = "Button" value="글목록" class="btn btn-primary"
							            onclick="location.href='<c:url value='/admin/guide/guideList.do'/>'">
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