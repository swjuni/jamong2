<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 관리자 홈 top include -->
<%@include file="../inc/admin_top.jsp"%>

<!-- 버튼 클릭 이벤트 -->
<!-- <script>
$(document).ready(function(){
	$('#logTable').DataTable();
	$('#search').click(function(){
		$.ajax({
			url :"<c:url value='/admin/manage/grade_delete.do'/>",
			type: 'post',
			data:{list:$list}
			,
			dataType: "json",
			success : function(res) {
			alert("뿅");
			}
			});
	});
});

</script> -->

<!-- 각자가 분담해서 디자인할 바디 태그 -->
<div class="col-lg-6" style="margin: auto;">
	<div class="card" >
	<form action="<c:url value='/admin/manage/logSelect.do'/>">
		<div class="card-title">
			<h4>회원 로그 기록</h4>
			<div style="float: right">
			<input type="text" name="userNo"><button type="submit" class="adminedit btn btn-info m-b-10 m-l-5">검색</button>
			</div>
		</div>
	</form>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-hover " id="logTable">

					<thead>
						<tr>
							<th>회원번호</th>
							<th>IP</th>
							<th>OS</th>
							<th>시간</th>
						</tr>
					</thead>
					<tbody>
					<c:if test="${empty list }">	 
					 	<tr>
					 		<td>데이터가 존재하지 않습니다.</td>
					 	</tr>
					</c:if> 
					<c:if test="${!empty list }">
						<c:forEach var="vo" items="${list }">
						<tr>
							<td class="authorno1">${vo.userNo }</td>
							<td class="name1">${vo.loginIp }</td>
							<td class="desc1">${vo.loginOs }</td>
							<td class="authorlev1">${vo.loginTime }</td>
							
						</tr>
						</c:forEach>
					</c:if>
					</tbody>

				</table>
			</div>
		</div>
	</div>
	<!-- /# card -->

</div>
<!-- /# column -->

<!-- 관리자 홈 공통 bottom include -->
<%@include file="../inc/bottom_js.jsp"%>


<%@include file="../inc/admin_bottom.jsp"%>
