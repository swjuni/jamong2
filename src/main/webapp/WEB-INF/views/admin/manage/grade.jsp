<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 관리자 홈 top include -->
<%@include file="../inc/admin_top.jsp"%>

<!-- 버튼 클릭 이벤트 -->
<script type="text/javascript">
	$(document).ready(function(){
		//관리자 추가 버튼
		$('.addd1').click(function(){
			$('.gradeinserttr1').css('visibility','visible');
		});
		$('.addd2').click(function(){
			$('.gradeinserttr2').css('visibility','visible');
		});
		$('.addd3').click(function(){
			$('.gradeinserttr3').css('visibility','visible');
		});

		//수정버튼
		$('.edit1').click(function(){//목록 텍스트를 input타입으로 변경
			/* $(this).siblings().contents().wrap( '<p class="myclass">aa</p>' ); */
			$(this).parent().siblings('.name1').contents().remove();
			$(this).parent().siblings('.authorlev1').contents().remove();
			$(this).parent().siblings('.name1').append('<input type="text" class="mid">');
			$(this).parent().siblings('.authorlev1').append('<input type="text" class="mid">');
			$('.ok1').css('display','unset');
			$(this).css('display','none');
			$(this).siblings('.del1').css('display','none');
		});
		$('.edit2').click(function(){//목록 텍스트를 input타입으로 변경
			$(this).parent().siblings('.name2').contents().remove();
			$(this).parent().siblings('.authorlev2').contents().remove();
			$(this).parent().siblings('.name2').append('<input type="text" class="mid">');
			$(this).parent().siblings('.authorlev2').append('<input type="text" class="mid">');
			$('.ok2').css('display','unset');
			$(this).css('display','none');
			$(this).siblings('.del2').css('display','none');
		});
		$('.edit3').click(function(){//목록 텍스트를 input타입으로 변경
			/* $(this).siblings().contents().wrap( '<p class="myclass">aa</p>' ); */
			$(this).parent().siblings('.name3').contents().remove();
			$(this).parent().siblings('.authorlev3').contents().remove();
			$(this).parent().siblings('.name3').append('<input type="text" class="mid">');
			$(this).parent().siblings('.authorlev3').append('<input type="text" class="mid">');
			$('.ok3').css('display','unset');
			$(this).css('display','none');
			$(this).siblings('.del3').css('display','none');
		});
		
		
		//수정확인
		//수정확인버튼
		$('.ok1').click(function(){
			var $authorNo = $(this).parent().siblings('.authorno1').html();
			var $authorName = $(this).parent().siblings('.name1').children().val();
			var $authorDesc = $(this).parent().siblings('.desc1').html();
			var $authorLev = $(this).parent().siblings('.authorlev1').children().val();
			alert($authorNo+","+$authorName+","+$authorDesc+","+$authorLev);
			$.ajax({
	    		url :"<c:url value='/admin/manage/admin_grade_update.do'/>",
	    		type: 'post',
	    		data:{
	    			authorNo:$authorNo,
	    			authorName:$authorName,
	    			authorDesc:$authorDesc,
	    			authorLev:$authorLev
	    		},
	    		
	    		dataType: "json",
	    		success : function(res) {
	    		alert("관리자 등급 수정이 완료되었습니다");
	    		location.href="<c:url value='/admin/manage/grade.do'/>";
	    		}
	    		});
		});
		//수정확인버튼
		$('.ok2').click(function(){
			var $authorNo = $(this).parent().siblings('.authorno2').html();
			var $authorName = $(this).parent().siblings('.name2').children().val();
			var $authorDesc = $(this).parent().siblings('.desc2').html();
			var $authorLev = $(this).parent().siblings('.authorlev2').children().val();
			alert($authorNo+","+$authorName+","+$authorDesc+","+$authorLev);
			$.ajax({
	    		url :"<c:url value='/admin/manage/admin_grade_update.do'/>",
	    		type: 'post',
	    		data:{
	    			authorNo:$authorNo,
	    			authorName:$authorName,
	    			authorDesc:$authorDesc,
	    			authorLev:$authorLev
	    		},
	    		
	    		dataType: "json",
	    		success : function(res) {
	    		alert("전문가 등급 수정이 완료되었습니다");
	    		location.href="<c:url value='/admin/manage/grade.do'/>";
	    		}
	    		});
		});
		//수정확인버튼
		$('.ok3').click(function(){
			var $authorNo = $(this).parent().siblings('.authorno3').html();
			var $authorName = $(this).parent().siblings('.name3').children().val();
			var $authorDesc = $(this).parent().siblings('.desc3').html();
			var $authorLev = $(this).parent().siblings('.authorlev3').children().val();
			alert($authorNo+","+$authorName+","+$authorDesc+","+$authorLev);
			$.ajax({
	    		url :"<c:url value='/admin/manage/admin_grade_update.do'/>",
	    		type: 'post',
	    		data:{
	    			authorNo:$authorNo,
	    			authorName:$authorName,
	    			authorDesc:$authorDesc,
	    			authorLev:$authorLev
	    		},
	    		
	    		dataType: "json",
	    		success : function(res) {
	    		alert("일반회원 등급 수정이 완료되었습니다");
	    		location.href="<c:url value='/admin/manage/grade.do'/>";
	    		}
	    		});
		});
		
		//관리자 등급 등록 버튼
		$('.insertok1').click(function(){
			var $authorName = $(this).parent().siblings().children('.gradename1').val();
			var $authorDesc = $(this).parent().siblings().children('.gradedesc1').val();
			var $authorLev = $(this).parent().siblings().children('.gradelev1').val();
			alert($authorName+","+$authorDesc+","+$authorLev);
			
			$.ajax({
	    		url :"<c:url value='/admin/manage/grade_insert.do'/>",
	    		type: 'post',
	    		data:{
	    			authorName:$authorName,
	    			authorDesc:"관리자",
	    			authorLev:$authorLev
	    		},
	    		
	    		dataType: "json",
	    		success : function(res) {
	    		alert("등급 등록이 완료되었습니다");
	    		location.href="<c:url value='/admin/manage/grade.do'/>";
	    		}
	    		});
		});
		
		//전문가 등급 등록 버튼
		$('.insertok2').click(function(){
			var $authorName = $(this).parent().siblings().children('.gradename2').val();
			var $authorDesc = $(this).parent().siblings().children('.gradedesc2').val();
			var $authorLev = $(this).parent().siblings().children('.gradelev2').val();
			alert($authorName+","+$authorDesc+","+$authorLev);
			
			$.ajax({
	    		url :"<c:url value='/admin/manage/grade_insert.do'/>",
	    		type: 'post',
	    		data:{
	    			authorName:$authorName,
	    			authorDesc:"전문가",
	    			authorLev:$authorLev
	    		},
	    		
	    		dataType: "json",
	    		success : function(res) {
	    		alert("등급 등록이 완료되었습니다");
	    		location.href="<c:url value='/admin/manage/grade.do'/>";
	    		}
	    		});
		});
		
		//일반회원 등급 등록 버튼
		$('.insertok3').click(function(){
			var $authorName = $(this).parent().siblings().children('.gradename3').val();
			var $authorDesc = $(this).parent().siblings().children('.gradedesc3').val();
			var $authorLev = $(this).parent().siblings().children('.gradelev3').val();
			alert($authorName+","+$authorDesc+","+$authorLev);
			
			$.ajax({
	    		url :"<c:url value='/admin/manage/grade_insert.do'/>",
	    		type: 'post',
	    		data:{
	    			authorName:$authorName,
	    			authorDesc:"일반회원",
	    			authorLev:$authorLev
	    		},
	    		
	    		dataType: "json",
	    		success : function(res) {
	    		alert("등급 등록이 완료되었습니다");
	    		location.href="<c:url value='/admin/manage/grade.do'/>";
	    		}
	    		});
		});
		
		//관리자 등급 삭제 버튼
		$('.del1').click(function(){
			var $authorName = $(this).parent().siblings('.name1').html();
			alert($authorName);
			
			$.ajax({
	    		url :"<c:url value='/admin/manage/grade_delete.do'/>",
	    		type: 'post',
	    		data:{name:$authorName}
	    		,
	    		dataType: "text",
	    		success : function(res) {
	    		alert("관리자 등급 삭제가 완료되었습니다");
	    		location.href="<c:url value='/admin/manage/grade.do'/>";
	    		}
	    		});
		});
		//전문가 등급 삭제 버튼
		$('.del2').click(function(){
			var $authorName = $(this).parent().siblings('.name2').html();
			alert($authorName);
			
			$.ajax({
	    		url :"<c:url value='/admin/manage/grade_delete.do'/>",
	    		type: 'post',
	    		data:{name:$authorName}
	    		,
	    		dataType: "text",
	    		success : function(res) {
	    		alert("전문가 등급 삭제가 완료되었습니다");
	    		location.href="<c:url value='/admin/manage/grade.do'/>";
	    		}
	    		});
		});
		//관리자 등급 삭제 버튼
		$('.del3').click(function(){
			var $authorName = $(this).parent().siblings('.name3').html();
			alert($authorName);
			
			$.ajax({
	    		url :"<c:url value='/admin/manage/grade_delete.do'/>",
	    		type: 'post',
	    		data:{name:$authorName}
	    		,
	    		dataType: "text",
	    		success : function(res) {
	    		alert("일반회원 등급 삭제가 완료되었습니다");
	    		location.href="<c:url value='/admin/manage/grade.do'/>";
	    		}
	    		});
		});
	});
</script>

<!-- 각자가 분담해서 디자인할 바디 태그 -->

<div class="col-lg-6" style="margin: auto;">
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
									class="addd1 btn btn-success m-b-10 m-l-5" name="add">추가</button></th>
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
							<td class="authorno1">${vo.authorNo }</td>
							<td class="name1">${vo.authorName }</td>
							<td class="desc1">${vo.authorDesc }</td>
							<td class="authorlev1">${vo.authorLev }</td>
							<td><button type="button" class="del1 btn btn-danger m-b-10 m-l-5">삭제</button>
								<button type="button" class="edit1 btn btn-info m-b-10 m-l-5" >수정</button>
								<button type="button" class="ok1 btn btn-info m-b-10 m-l-5" style="display: none" >확인</button>
							</td>
						</tr>
						</c:forEach>
					</c:if>
						<tr style="visibility: hidden" class="gradeinserttr1">
							<td><input type="text" class="gradename1" placeholder="권한명"></td>
							<td><input type="text" class="gradedesc1" value="관리자" disabled="disabled"></td>
							<td><input type="text" class="gradelev1" placeholder="권한 레벨"></td>
							<td><button type="button" class="insertok1 btn btn-info m-b-10 m-l-5">등록</button></td>
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
									class="addd2 btn btn-success m-b-10 m-l-5" name="add">추가</button></th>
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
							<td class="authorno2">${vo.authorNo }</td>
							<td class="name2">${vo.authorName }</td>
							<td class="desc2">${vo.authorDesc }</td>
							<td class="authorlev2">${vo.authorLev }</td>
							<td><button type="button" class="del2 btn btn-danger m-b-10 m-l-5">삭제</button>
								<button type="button" class="edit2 btn btn-info m-b-10 m-l-5" >수정</button>
								<button type="button" class="ok2 btn btn-info m-b-10 m-l-5"  style="display: none"  >확인</button>
							</td>
						</tr>
						</c:forEach>
					</c:if>
						
						<tr style="visibility: hidden" class="gradeinserttr2">
							<td><input type="text" class="gradename2" placeholder="권한명"></td>
							<td><input type="text" class="gradedesc2" value="전문가" disabled="disabled"></td>
							<td><input type="text" class="gradelev2" placeholder="권한 레벨"></td>
							<td><button type="button" class="insertok2 btn btn-info m-b-10 m-l-5">등록</button></td>
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
									class="addd3 btn btn-success m-b-10 m-l-5" name="add">추가</button></th>
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
							<td class="authorno3">${vo.authorNo }</td>
							<td class="name3">${vo.authorName }</td>
							<td class="desc3">${vo.authorDesc }</td>
							<td class="authorlev3">${vo.authorLev }</td>
							<td><button type="button" class="del3 btn btn-danger m-b-10 m-l-5">삭제</button>
								<button type="button" class="edit3 btn btn-info m-b-10 m-l-5" >수정</button>
								<button type="button" class="ok3 btn btn-info m-b-10 m-l-5"  style="display: none" >확인</button>
							</td>
						</tr>
						</c:forEach>
					</c:if>
						
						<tr style="visibility: hidden" class="gradeinserttr3">
							<td><input type="text" class="gradename3" placeholder="권한명"></td>
							<td><input type="text" class="gradedesc3" value="일반회원" disabled="disabled"></td>
							<td><input type="text" class="gradelev3" placeholder="권한 레벨"></td>
							<td><button type="button" class="insertok3 btn btn-info m-b-10 m-l-5">등록</button></td>
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
