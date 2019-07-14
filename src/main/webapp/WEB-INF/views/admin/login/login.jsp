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
<!-- 각자가 분담해서 디자인할 바디 태그 -->
   				<div style="width: 30%;height: 60%;margin: auto;" >
					<div class="login-content">
                        <div class="login-logo">
                            <a href="index.html"><span>Focus</span></a>
                        </div>
                        <div class="login-form">
                            <h4>관리자 로그인</h4>
                            <form name="frmLogin" method="post" 
							action="<c:url value='/admin/login/login.do'/>">
                                <div class="form-group">
                                    <label>아이디</label>
                                    <input type="text" class="form-control" placeholder="ID" name="userid" id="userid"
                                    value=${cookie.ck_admin_userid.value }>
                                </div>
                                <div class="form-group">
                                    <label>비밀번호</label>
                                    <input type="password" class="form-control" placeholder="Password" name="pwd" id="pwd">
                                </div>
                                <div class="checkbox">
                                    <label>
										<input type="checkbox" id="saveId" name="saveId" <c:if test="${!empty cookie.ck_admin_userid }">
						checked="checked"
					</c:if>> 관리자 아이디 기억하기
									</label>
                                    <label class="pull-right">
										<!-- <a href="#">비밀번호를 잊어버렸나요???</a> -->
									</label>

                                </div>
                                <button type="submit" class="btn btn-primary btn-flat m-b-30 m-t-30">로그인</button>
                                
                                
                            </form>
                        </div>
                    </div>
                   </div>

	<!-- 관리자 홈 공통 bottom include -->
	<%@include file="../inc/bottom_js.jsp" %>
	
	<!-- 화면별 고유 scripit init -->
    <script src="<c:url value='/assets/js/lib/data-table/datatables.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/buttons.dataTables.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/dataTables.buttons.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/buttons.flash.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/jszip.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/pdfmake.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/vfs_fonts.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/buttons.html5.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/buttons.print.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/datatables-init.js'/>"></script>

<%@include file="../inc/admin_bottom.jsp" %>    