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
				location.href="<c:url value='/admin/announcce/announcceDelete.do?announceNo=${vo.announceNo }&fileName=${vo.fileName}'/>";
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
                                <h1>공지사항 <span>상세보기</span></h1>
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
                                </div>
                                <div class="card-body">
									<div class="user-profile">
                    					<div class="row">
                   							<div class="user-profile-name">${vo.title }</div>
                    						<div class="col-lg-12">
                    							<div style="float: left;"><span>${vo.adminNo }</span>&nbsp;&nbsp;|&nbsp;&nbsp;<span><fmt:formatDate value="${vo.regDate }" pattern="yyyy-MM-dd HH-mm-ss"/> </span></div>
                    							<div style="float: right;" >조회수 : ${vo.readCount }</div>
                    							<c:if test="${!empty fileInfo }">
                    								<div class="text-right">첨부파일 : ${fileInfo }&nbsp;&nbsp;|&nbsp;&nbsp;</div>
                    							</c:if>
                    							<c:if test="${empty fileInfo }">
                    								<div class="text-right">&nbsp;</div>
                    							</c:if>
                    							<hr>
                    							<br>
                   								${vo.content }
                    						</div>
                   						</div>
               						</div>
                                    
									<c:if test="${!empty vo.fileName }">
										<div class="user-photo m-b-30">
	                          					<img class="img-fluid" src="<c:url value='/upload/announcce/${vo.fileName }'/>" alt=""/>
										</div>
									</c:if>
							        
									<!-- <button class="btn btn-primary" type="submit">등록</button> -->
									<div class="text-center">
							            <input type = "button" value="수정" class="btn btn-primary"
							            onclick="location.href='<c:url value='/admin/announcce/announcceEdit.do?announceNo=${vo.announceNo }'/>'">&nbsp;&nbsp;
										<input type = "Button" value="글삭제" class="btn btn-danger" id="del">&nbsp;&nbsp;
							            <input type = "Button" value="글목록" class="btn btn-primary"
							            onclick="location.href='<c:url value='/admin/announcce/announcceList.do'/>'">
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