<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!-- 관리자 홈 top include -->
<%@include file="../inc/admin_top.jsp" %>

<!-- 각자가 분담해서 디자인할 바디 태그 -->
<script type="text/javascript">

	$(document).ready(function(){
		
		//수정버튼
		$('.adminedit').click(function(){//목록 텍스트를 input타입으로 변경
			/* $(this).siblings().contents().wrap( '<p class="myclass">aa</p>' ); */
			$(this).parent().siblings().not( '.adminid' ).contents().remove();
			var $a = $('<input type="text" class="mid">');
			$(this).parent().siblings().not( '.adminid' ).append($a);
			$('.admineditok').css('display','unset');
			$(this).css('display','none');
		});
		
		//수정확인버튼
		$('.admineditok').click(function(){
			var $adminid = $(this).parent().siblings('.adminid').html();
			var $adminpwd = $(this).parent().siblings('.adminpwd').children().val();
			var $adminName = $(this).parent().siblings('.adminname').children().val();
			var $authorNo = $(this).parent().siblings('.adminauthor').children().val();
			alert($adminid+","+$adminpwd+","+$adminName+","+$authorNo);
			$.ajax({
	    		url :"<c:url value='/admin/manage/sub_admin_update.do'/>",
	    		type: 'post',
	    		data:{
	    			adminId:$adminid,
	    			adminPwd:$adminpwd,
	    			adminName:$adminName,
	    			authorNo:$authorNo
	    		},
	    		
	    		dataType: "json",
	    		success : function(res) {
	    		alert("관리자 수정이 완료되었습니다");
	    		location.href="<c:url value='/admin/manage/sub_admin.do'/>";
	    		}
	    		});
		});
		//관리자 등록 버튼
		$('.admininsertok').click(function(){
			var $adminid = $(this).parent().siblings().children('.admininsertid').val();
			var $adminpwd = $(this).parent().siblings().children('.admininsertpwd').val();
			var $adminName = $(this).parent().siblings().children('.admininsertname').val();
			var $authorNo = $(this).parent().siblings().children('.admininsertpok').val();
			alert($adminid+","+$adminpwd+","+$adminName+","+$authorNo);
			
			$.ajax({
	    		url :"<c:url value='/admin/manage/sub_admin_insert.do'/>",
	    		type: 'post',
	    		data:{
	    			adminId:$adminid,
	    			adminPwd:$adminpwd,
	    			adminName:$adminName,
	    			authorNo:$authorNo
	    		},
	    		
	    		dataType: "json",
	    		success : function(res) {
	    		alert("관리자 등록이 완료되었습니다");
	    		location.href="<c:url value='/admin/manage/sub_admin.do'/>";
	    		}
	    		});
		});
		//관리자 삭제 버튼
		$('.admindelete').click(function(){
			var $adminid = $(this).parent().siblings('.adminid').html();
			alert($adminid);
			
			$.ajax({
	    		url :"<c:url value='/admin/manage/sub_admin_delete.do'/>",
	    		type: 'post',
	    		data:{id:$adminid}
	    		,
	    		dataType: "text",
	    		success : function(res) {
	    		alert("관리자 삭제가 완료되었습니다");
	    		location.href="<c:url value='/admin/manage/sub_admin.do'/>";
	    		}
	    		});
		});
		
		//관리자 추가 버튼
		$('.adminadd').click(function(){
			$('.admininserttr').css('visibility','visible');
		});
		
	});
</script>
<div class="content-wrap">
        <div class="main">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-8 p-r-0 title-margin-right">
                        <div class="page-header">
                            <div class="page-title">
                                <h1>어서오세요, <span>부관리자 페이지입니다</span></h1>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                    <div class="col-lg-4 p-l-0 title-margin-left">
                        <div class="page-header">
                            <div class="page-title">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#">대쉬보드</a></li>
                                    <li class="breadcrumb-item active">테이블 행 선택</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                </div>
                <!-- /# row -->
                <section id="main-content" >
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-title">
                                    <h4>부 관리자 관리 페이지 </h4>
                                    
                                </div>
                                <div class="bootstrap-data-table-panel">
                                    <div class="table-responsive" >
                                        <table id="row-select" class="display table table-borderd table-hover">
                                            <thead>
                                                <tr>
                                                    <th>id</th>
                                                    <th>pwd</th>
                                                    <th>name</th>
                                                    <th>position</th>
                                                    <th><button type="button"
													class="adminadd btn btn-success m-b-10 m-l-5" name="add">추가</button></th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                                
                                                <c:if test="${empty list }">
                                                	<tr>
                                                		<td>데이터가 존재하지 않습니다</td>
                                                	</tr>
                                                </c:if>
                                                <c:if test="${!empty list }">
                                                <c:forEach var="vo" items="${list }">
                                                <tr>
                                                
                                                    <td class="adminid">${vo.adminId }</td>
                                                    <td class="adminpwd">${vo.adminPwd }</td>
                                                    <td class="adminname">${vo.adminName }</td>
                                                    <td class="adminauthor">${vo.authorNo }</td>
                                                    <td>
                                                    <button type="button" class="adminedit btn btn-info m-b-10 m-l-5">수정</button>
                                                    <button type="button" class="admineditok btn btn-info m-b-10 m-l-5" style="display: none">확인</button>
                                                    <button type="button" class="admindelete btn btn-danger m-b-10 m-l-5" >삭제</button>
                                                    </td>
                                                </tr>
                                                </c:forEach>
                                                
                                                </c:if>
                                                <tr style="visibility: hidden" class="admininserttr">
	                                                <td><input type="text" class="admininsertid"></td>
													<td><input type="text" class="admininsertpwd"></td>
													<td><input type="text" class="admininsertname"></td>
													<td><input type="text" class="admininsertpok"></td>
													<td><button type="button" class="admininsertok btn btn-info m-b-10 m-l-5">등록</button></td>
                                                </tr>
                                                
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <th>id</th>
                                                    <th>pwd</th>
                                                    <th>name</th>
                                                    <th>position</th>
                                                    <th style="visibility: hidden;"></th>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <!-- /# card -->
                        </div>
                        <!-- /# column -->
                    </div>
                    <!-- /# row -->
                    <div class="button-list">
                                    
                                   
                                </div>

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="footer">
                                <p>관리자 보드 - <a href="#">example.com</a></p>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>

<!-- 관리자 홈 공통 bottom include -->
<%@include file="../inc/bottom_js.jsp" %>

<!-- 화면별 고유 scripit init -->

<!-- jquery vendor -->
    <script src="<c:url value='/assets/js/lib/jquery.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/jquery.nanoscroller.min.js'/>"></script>
    <!-- nano scroller -->
    <script src="<c:url value='/assets/js/lib/preloader/pace.min.js'/>"></script>
    <!-- sidebar -->
    
    <!-- bootstrap -->

    <script src="<c:url value='/assets/js/lib/bootstrap.min.js'/>"></script><script src="<c:url value='/assets/js/scripts.js'/>"></script>
    <!-- scripit init-->
    <script src="<c:url value='/assets/js/lib/data-table/datatables.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/dataTables.bootstrap.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/dataTables.buttons.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/buttons.bootstrap.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/jszip.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/pdfmake.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/vfs_fonts.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/buttons.html5.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/buttons.print.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/buttons.colVis.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/datatables-init.js'/>"></script>
	

<%@include file="../inc/admin_bottom.jsp" %>    