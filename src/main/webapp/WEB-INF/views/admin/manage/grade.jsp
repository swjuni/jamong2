<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 관리자 홈 top include -->
<%@include file="../inc/admin_top.jsp"%>

<!-- 버튼 클릭 이벤트 -->
<script type="text/javascript">
	$(document).ready(function(){
		$('button[name=add]').click(function(){
			if($(this).html()=='추가'){
			$(this).parents().eq(2).next().children().last().css("display", "contents");
			$(this).html('취소');
			}else{
			$(this).parents().eq(2).next().children().last().css("display", "none");
			$(this).html('추가');
			}
		});
	});
</script>

<!-- 각자가 분담해서 디자인할 바디 태그 -->

<div class="col-lg-6" style="margin-left: 20%;width: 60%">
	<div class="card" >
		<div class="card-title">
			<h4>등급 관리(관리자)</h4>

		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-hover ">

					<thead>
						<tr>
							<th>관리자</th>
							<th>권한명</th>
							<th>권한 설명</th>
							<th>권한 레벨</th>
							<th><button type="button"
									class="btn btn-success m-b-10 m-l-5" name="add">추가</button></th>
						</tr>
					</thead>
					<tbody>
					<c:if test="${empty list1 }">	 
					 	<tr>
					 		<td>데이터가 존재하지 않습니다.</td>
					 	</tr>
					</c:if> 
					<c:if test="${!empty list1 }">
						<c:forEach var="vo" items="${list1 }">
						<tr>
							<th scope="row"><span class="admin1">${vo.authorNo }</span></th>
							<td><span class="txt">${vo.authorName }</span><input type="text" class="edit" placeholder="${vo.authorName }"></td>
							<td><span class="txt">${vo.authorDesc }</span><input type="text" class="edit" placeholder="${vo.authorDesc }"></td>
							<td><span class="badge badge-primary txt" style="margin-left: 15px">${vo.authorLev }</span>
								<input type="text" class="edit" placeholder="${vo.authorLev }">
							</td>
							<td><button type="button"
									class="btn btn-danger m-b-10 m-l-5"
									onclick = "location.href = '#' ">삭제</button>
								<button type="button" class="btn btn-info m-b-10 m-l-5" 
								onclick = "location.href = '#' " >수정</button>
								<button type="button" class="btn btn-info m-b-10 m-l-5" 
								onclick = "location.href = '#' " style="display: none">확인</button>
							</td>
						</tr>
						</c:forEach>
					</c:if>
						<tr style="display:none">
							<th scope="row"></th>
							<td><input type="text" name=""></td>
							<td><input type="text"></td>
							<td><input type="text"></td>
							<td><button type="button" class="btn btn-info m-b-10 m-l-5"
								onclick = "location.href = '<c:url value='#'/>' ">등록</button></td>
						</tr>

					</tbody>

				</table>
			</div>
		</div>
	</div>
	<!-- /# card -->
	<div class="card">
		<div class="card-title">
			<h4>등급 관리(전문가)</h4>

		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-hover ">
					<thead>
						<tr>
							<th>전문가</th>
							<th>권한명</th>
							<th>권한 설명</th>
							<th>권한 레벨</th>
							<th><button type="button"
									class="btn btn-success m-b-10 m-l-5" name="add">추가</button></th>
						</tr>
					</thead>
					<c:if test="${empty list2 }">	 
					 	<tr>
					 		<td>데이터가 존재하지 않습니다.</td>
					 	</tr>
					</c:if> 
					<c:if test="${!empty list2 }">
						<c:forEach var="vo" items="${list2 }">
						<tr>
							<th scope="row">${vo.authorNo }</th>
							<td>${vo.authorName }</td>
							<td>${vo.authorDesc }</td>
							<td><span class="badge badge-primary" style="margin-left: 15px">${vo.authorLev }</span></td>
							<td><button type="button"
									class="btn btn-danger m-b-10 m-l-5"
									onclick = "location.href = '#' ">삭제</button>
								<button type="button" class="btn btn-info m-b-10 m-l-5" 
								onclick = "location.href = '#' ">수정</button>
							</td>
						</tr>
						</c:forEach>
					</c:if>
						
						<tr style="display:none">
							<th scope="row"></th>
							<td><input type="text" name=""></td>
							<td><input type="text"></td>
							<td><input type="text"></td>
							<td><button type="button" class="btn btn-info m-b-10 m-l-5"
								onclick = "location.href = '<c:url value='#'/>' ">등록</button></td>
						</tr>

					</tbody>
				</table>
			</div>
		</div>
	</div>


	<!--  -->
	<div class="card">
		<div class="card-title">
			<h4>등급 관리(일반 회원)</h4>

		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-hover ">
					<thead>
						<tr>
							<th>일반회원</th>
							<th>권한명</th>
							<th>권한 설명</th>
							<th>권한 레벨</th>
							<th><button type="button"
									class="btn btn-success m-b-10 m-l-5" name="add">추가</button></th>
						</tr>
					</thead>
					<tbody>
						
						
						<c:if test="${empty list3 }">	 
					 	<tr>
					 		<td>데이터가 존재하지 않습니다.</td>
					 	</tr>
					</c:if> 
					<c:if test="${!empty list3 }">
						<c:forEach var="vo" items="${list3 }">
						<tr>
							<th scope="row">${vo.authorNo }</th>
							<td>${vo.authorName }</td>
							<td>${vo.authorDesc }</td>
							<td><span class="badge badge-primary" style="margin-left: 15px">${vo.authorLev }</span></td>
							<td><button type="button"
									class="btn btn-danger m-b-10 m-l-5"
									onclick = "location.href = '#' ">삭제</button>
								<button type="button" class="btn btn-info m-b-10 m-l-5" 
								onclick = "location.href = '#' ">수정</button>
							</td>
						</tr>
						</c:forEach>
					</c:if>
						
						<tr style="display:none">
							<th scope="row"></th>
							<td><input type="text" name=""></td>
							<td><input type="text"></td>
							<td><input type="text"></td>
							<td><button type="button" class="btn btn-info m-b-10 m-l-5"
								onclick = "location.href = '<c:url value='#'/>' ">등록</button></td>
						</tr>
						

					</tbody>
				</table>
			</div>
		</div>
	</div>

</div>
<!-- /# column -->

<!-- 관리자 홈 공통 bottom include -->
<%@include file="../inc/bottom_js.jsp"%>


<%@include file="../inc/admin_bottom.jsp"%>
