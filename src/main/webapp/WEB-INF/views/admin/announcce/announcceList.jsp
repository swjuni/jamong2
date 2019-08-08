<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!-- 관리자 홈 top include -->
<%@include file="../inc/admin_top.jsp" %>
<style type="text/css">
	.dt-buttons{
		margin-bottom: 0;
	}
	.dataTables_info{
		margin-right: 50px;
	}
	.paginate_button{
		margin-left: 5px;
		margin-right: 5px;
	}
	.paginate_button.active a{
		color: red;
	}
	.table{
		margin-top: 15px;
		margin-bottom: 15px;
	}	
</style>

<script type="text/javascript" src="<c:url value='/assets/js/lib/jquery.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('input[name=chkAll]').click(function(){
			$('#chk input[type=checkbox]').prop('checked',this.checked);
		});
		
		$('#btDelMulti').click(function(){
			var len = $('#chk input[type=checkbox]:checked').length;
			if(len<1){
				alert('먼저 삭제할 상품을 체크하세요!!');
				return;
			}
			if(confirm("정말로 삭제하시겠습니까?")){
				$('form[name=frmList]').submit();
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
                                <h1>공지사항 <span>관리화면</span></h1>
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
                                <div class="bootstrap-data-table-panel">
                                    <div class="table-responsive">
	                                    <form name="frmList" method="post" action="<c:url value='/admin/announcce/deleteMulti.do'/>">
	                                        <table id="bootstrap-data-table-export" class="table table-bordered table-hover" style="margin-top: 15px;">
	                                            <thead>
	                                                <tr style="background-color: #C8D0FE; text-align: center;">
	                                                    <th style="width: 6%">No</th>
	                                                    <th style="width: 35%">제목</th>
	                                                    <th style="width: 12%">첨부파일</th>
	                                                    <th style="width: 10%">조회수</th>
	                                                    <th style="width: 23%">작성일</th>
	                                                    <th style="width: 10%">작성자</th>
	                                               		<th style="width: 4%; text-align: center;"><input type="checkbox" name="chkAll"></th>
	                                                </tr>
	                                            </thead>
	                                            <tbody>
	                                            	<c:set var="idx" value="0"></c:set>
	                                            	<c:forEach var="vo" items="${list }">
		                                                <tr>
		                                                    <td style="text-align: right;">${vo.announceNo }</td>
		                                                    <td>
		                                                    	<a href="<c:url value='/admin/announcce/countUpdate.do?announceNo=${vo.announceNo }'/>" class="text-primary">
		                                                    		<!-- 제목이 긴 경우 30글자만 보여주기 -->
																	<c:if test="${fn:length(vo.title) >=30 }">
																		${fn:substring(vo.title, 0,30)}...
																	</c:if>
																	<c:if test="${fn:length(vo.title) <30 }">					
																		${vo.title}
																	</c:if>
																	
																	<!-- 24시간이내의 글인 경우 new 이미지 보여주기 -->
																	<c:if test="${vo.newImgTerm<24 }">
																		<img src="<c:url value='/assets/images/new.gif'/>" alt="new이미지">
																	</c:if>
		                                                    	</a>
		                                                    </td>
		                                                    <td style="text-align: center;">
			                                                    <c:if test="${!empty vo.fileName }">첨부</c:if>
		                                                    </td>
		                                                    <td style="text-align: center;">${vo.readCount }</td>
		                                                    <td style="text-align: center;"><fmt:formatDate value="${vo.regDate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		                                                    <td style="text-align: center;">${vo.adminNo }</td>
		                                            		<td style="text-align: center;" id="chk" >
		                                            			<input type="checkbox" name="announcceItems[${idx }].announceNo" value="${vo.announceNo }"> <!-- 선택한 상품 번호값 -->
		                                            			<input type="hidden" name="announcceItems[${idx }].fileName" value="${vo.fileName }"> <!-- 선택한 상품 파일이름 -->
		                                            		</td>
		                                                </tr>
	                                                	<c:set var="idx" value="${idx+1 }"></c:set>
	                                            	</c:forEach>
	                                            </tbody>
	                                        </table>
	                                        <div class="text-right">
	                                        	<input type="button" value="선택한 글 삭제" class="btn btn-danger" id="btDelMulti"><br><br>
	                                        </div>
	                                    </form>
                                    </div>
                                </div>
                            </div>
                            <!-- /# card -->
                        </div>
                        <!-- /# column -->
                    </div>
                    <div class="row">
                    	<div class="col-lg-12 text-center">
                    		<button type="button" class="btn btn-primary m-b-10 m-l-5"
                    			onclick="location.href='<c:url value='/admin/announcce/announcceAdd.do'/>'">공지사항 등록</button>
                    	</div>
                    </div>
                </section>
            </div>
        </div>
    </div>
	


	<!-- 관리자 홈 공통 bottom include -->
	<%@include file="../inc/bottom_js.jsp" %>
	
	<!-- 화면별 고유 scripit init -->
    <script src="<c:url value='/assets/js/lib/data-table/datatables.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/dataTables.buttons.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/buttons.flash.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/jszip.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/pdfmake.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/vfs_fonts.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/buttons.html5.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/buttons.print.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/datatables-init.js'/>"></script>

<%@include file="../inc/admin_bottom.jsp" %>    