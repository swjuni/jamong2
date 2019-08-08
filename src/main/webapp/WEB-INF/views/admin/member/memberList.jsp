<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 관리자 홈 top include -->
<%@include file="../inc/admin_top.jsp"%>
<link
	href="<c:url value='/assets/css/lib/jsgrid/jsgrid-theme.min.css'/>"
	rel="stylesheet" />
<link href="<c:url value='/assets/css/lib/jsgrid/jsgrid.min.css'/>"
	type="text/css" rel="stylesheet" />
<script type="text/javascript" src="<c:url value='/assets/js/lib/jquery-ui/jquery-3.4.1.min.js'/>"></script>
<script type="text/javascript">
	function pageFunc(curPage){
		document.frmUserInfo.currentPage.value=curPage;
		document.frmUserInfo.submit();
	}
	
	$(function(){
		$("input[name=chkAll]").click(function(){
			$("input[type=checkbox]").not("input[name=chkAll]").prop("checked",this.checked);
		});
		
		$("#outstate").click(function(){
			if($("input[name=searchUseYn]").val()=="STAY"){
				$("input[name=searchUseYn]").val("OUT");
			}else if($("input[name=searchUseYn]").val()=="OUT"){
				$("input[name=searchUseYn]").val("");
			}else{
				$("input[name=searchUseYn]").val("STAY");
			}
			
			$("input[name=currentPage]").val("1");
			$("form[name=frmUserInfo]").submit();
		});
		
		$("#activation").click(function(){
			if($("input[name=searchUseYn]").val()=="ACTIVATE"){
				$("input[name=searchUseYn]").val("NONACTIVATE");
			}else if($("input[name=searchUseYn]").val()=="NONACTIVATE"){
				$("input[name=searchUseYn]").val("");
			}else{
				$("input[name=searchUseYn]").val("ACTIVATE");
			}
			
			$("input[name=currentPage]").val("1");
			$("form[name=frmUserInfo]").submit();
		});
		
		$("#btInactiveMulti").click(function(){
			if($("input[type=checkbox]:checked").length<1){
				alert("선택중지할 목록을 선택하여 주세요");
				return;
			}
			
			var searchUseYn=$("input[name=searchUseYn]").val();
			var searchKeyword=$("input[name=searchKeyword]").val();
			var searchCondition=$("input[name=searchCondition]").val();
			var currentPage=$("input[name=currentPage2]").val();
			$("form[name=frmList]").prop('action','<c:url value="/admin/member/inactiveMulti.do?searchUseYn='+searchUseYn+'&searchKeyword='+searchKeyword+'&searchCondition='+searchCondition+'&currentPage='+currentPage+'"/>');
			$("form[name=frmList]").submit();
		});
		
		$("#btActiveMulti").click(function(){
			if($("input[type=checkbox]:checked").length<1){
				alert("선택중지할 목록을 선택하여 주세요");
				return;
			}
			
			var searchUseYn=$("input[name=searchUseYn]").val();
			var searchKeyword=$("input[name=searchKeyword]").val();
			var searchCondition=$("input[name=searchCondition]").val();
			var currentPage=$("input[name=currentPage2]").val();
			$("form[name=frmList]").prop('action','<c:url value="/admin/member/activeMulti.do?searchUseYn='+searchUseYn+'&searchKeyword='+searchKeyword+'&searchCondition='+searchCondition+'&currentPage='+currentPage+'"/>');
			$("form[name=frmList]").submit();
		});
	})
</script>
<!-- 각자가 분담해서 디자인할 바디 태그 -->
<div class="content-wrap">
	<div class="main">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-8 p-r-0 title-margin-right">
					<div class="page-header">
						<div class="page-title">
							<h1>개인회원 관리</h1>
						</div>
					</div>
				</div>
					<div class="card container-fluid row divSearch" style="margin-left: 10px; width: 1463px;">
						<form name="frmUserInfo" method="post"
							action='<c:url value="/admin/member/memberList.do"/>'>
							<!-- 현재 페이지 hidden에 넣기 -->
							<input type="hidden" name='currentPage' value="1">
							<input type="hidden" name='currentPage2' value="${param.currentPage }">
							<select class="form-control" style="margin-right: 10px; float:left; border-color:lightgrey; width: 120px; height:35px; font-size: 14px;"
								name="searchCondition">
								<option value="user_id"
									<c:if test="${param.searchCondition=='user_id'}">
            		selected="selected"
            	</c:if>>아이디</option>
								<option value="user_name"
									<c:if test="${param.searchCondition=='user_name'}">
            		selected="selected"
            	</c:if>>이름</option>
							</select> <input class="form-control input-flat" style="width:500px; height:35px; border-color: lightgrey;float: left; margin-right:10px;" type="text" name="searchKeyword" title="검색어 입력"
								value="${param.searchKeyword }"> <input type="submit" class="btn-outline btn btn-default btn-flat" style="height:30px; font-size: 13px; margin-top: 3px;"
								value="검색">
								<input type="hidden" name="searchUseYn" value="${param.searchUseYn }">
						</form>
					</div>
				<div id="main-content">
					<div class="row">
						<div class="col-lg-12">
							<div class="card">
								<div class="jsgrid-table-panel">
									<div id="jsGrid" class="jsgrid"
										style="position: relative; height: 100%; width: 100%;">
										<div class="jsgrid-grid-header jsgrid-header-scrollbar">
											<table class="jsgrid-table">
												<tbody>
													<tr class="jsgrid-header-row">
														<th
															class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
															style="width: 5%;"><input type="checkbox" name="chkAll"></th>
														<th
															class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
															style="width: 20%;">회원아이디/이메일</th>
														<th
															class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
															style="width: 14%;">이름</th>
														<th
															class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
															style="width: 15%;">가입일</th>
														<th
															class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
															style="width: 10%;background: #96909263;" id="outstate">가입상태</th>
														<th
															class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
															style="width: 10%;background: #96909263;" id="activation">활성화</th>
														<th
															class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
															style="width: 10%;" id="activation">최근접속날짜</th>
															
														<th
															class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
															style="width: 9%;">권한</th>
														<th
															class="jsgrid-header-cell jsgrid-control-field jsgrid-align-center"
															style="width: 7%;"><span
															class="jsgrid-button jsgrid-mode-button jsgrid-insert-mode-button ti-plus"
															type="button"></span></th>
													</tr>
												</tbody>
											</table>
										</div>
										<form name="frmList" method="post">
										<div class="jsgrid-grid-body" style="height: 541px;">
											<table class="jsgrid-table">
												<tbody>
													<c:if test="${empty list }">
														<tr class="jsgrid-row">
															<td colspan="8" class="jsgrid-cell jsgrid-align-center">데이터가 없습니다.</td>
															<td style="width:0%;"></td>
														</tr>
													</c:if>
													<c:forEach var="map" items="${list }">
														<tr class="jsgrid-row">
															<td class="jsgrid-cell jsgrid-align-center"
																style="width: 5%;"><input type="checkbox" name="chk" value="${map['USER_NO'] }"></td>
															<td class="jsgrid-cell jsgrid-align-center"
																style="width: 20%;">${map['USER_ID']}</td>
															<td class="jsgrid-cell jsgrid-align-center"
																style="width: 14%;">${map['USER_NAME']}</td>
															<td class="jsgrid-cell jsgrid-align-center"
																style="width: 15%;">
																<fmt:formatDate value="${map['REGDATE']}" pattern="yyyy-MM-dd"/>
																</td>
															<td class="jsgrid-cell jsgrid-align-center"
																style="width: 10%;"><c:if
																	test="${empty map['OUTDATE']}">가입</c:if> <c:if
																	test="${!empty map['OUTDATE']}">탈퇴</c:if></td>
															<td class="jsgrid-cell jsgrid-align-center"
																style="width: 10%;"><c:if
																	test="${map['ACTIVATION']=='Y' }">활성화</c:if> <c:if
																	test="${map['ACTIVATION']=='N' }">비활성화</c:if></td>
															<td class="jsgrid-cell jsgrid-align-center"
																style="width: 10%;">
																<fmt:formatDate value="${map['LOGTIME']}" pattern="yyyy-MM-dd"/>
																</td>
															<td class="jsgrid-cell jsgrid-align-center"
																style="width: 9%;">${map['AUTHOR_NAME'] }</td>
															<td
																class="jsgrid-cell jsgrid-align-center"
																style="width: 7%;">
															<c:if test="${map['ACTIVATION']=='Y' }">
																<a style="color: red;" href="<c:url value='/admin/member/inactive.do?userNo=${map["USER_NO"] }'>
																	<c:param name='searchKeyword' value='${param.searchKeyword }'></c:param>
																	<c:param name='searchCondition' value='${param.searchCondition }'></c:param>
																	<c:param name='searchUseYn' value='${param.searchUseYn}'></c:param>
																	<c:param name='currentPage' value='${param.currentPage }'></c:param>
																</c:url>
																">사용중지</a>
															</c:if>
															<c:if test="${map['ACTIVATION']=='N' }">
																<a style="color: blue;" href="<c:url value='/admin/member/active.do?userNo=${map["USER_NO"] }'>
																	<c:param name='searchKeyword' value='${param.searchKeyword }'></c:param>
																	<c:param name='searchCondition' value='${param.searchCondition }'></c:param>
																	<c:param name='searchUseYn' value='${param.searchUseYn}'></c:param>
																	<c:param name='currentPage' value='${param.currentPage }'></c:param>
																</c:url>">
																사용재개</a>
															</c:if>
															</td>
															<td style="width:0px;"></td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
										</form>
										<!-- 페이징 처리 -->
										<!-- <div class="jsgrid-pager-container" style="display: block;">
											<div class="jsgrid-pager">
												<span><a href="">First</a></span> <span
													class="jsgrid-pager-nav-button jsgrid-pager-nav-inactive-button"><a
													href="javascript:void(0);">1</a></span>
											</div>
										</div>
										------------------------------ -->
										<div class="jsgrid-pager-container" style="display: block;">
											<div class="jsgrid-pager">
												<!-- 이전블럭으로 이동하기 -->
												<c:if test="${pagingInfo.firstPage>1 }">
													<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})">
														<span>Previous</span>
													</a>
												</c:if>
												<!-- 페이지 번호 추가 -->
												<!-- [1][2][3][4][5][6][7][8][9][10] -->
												<c:forEach var="i" begin="${pagingInfo.firstPage }"
													end="${pagingInfo.lastPage }">
													<c:if test="${i==pagingInfo.currentPage }">
														<span style="color: orange; font-size: 1em">${i }</span>
													</c:if>
													<c:if test="${i!=pagingInfo.currentPage }">
														<a href="#" onclick="pageFunc(${i})">${i}</a>
													</c:if>
												</c:forEach>
												<!--  페이지 번호 끝 -->

												<!-- 다음 블럭으로 이동하기 -->
												<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
													<a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})">
														<span>Next</span>
													</a>
												</c:if>
											</div>
										</div>
										<!-- 페이징처리 끝 -->
										<div class="jsgrid-align-center">
											<input style="color:red; width:75px; height:40px; padding-right: 66px;" class="btn btn-grau btn-flat m-b-10 m-l-5" type="button" id="btInactiveMulti" value="선택중지">
											<input style="color:blue; width:75px; height:40px; padding-right: 68px;" class="btn btn-gray btn-flat m-b-10 m-l-5" type="button" id="btActiveMulti" value="선택재개">
										</div>
									</div>
								</div>
							</div>
							<!-- /# card -->
						</div>
						<!-- /# column -->
					</div>
					<!-- /# row -->
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="footer">
							<p>
								2018 © Admin Board. - <a href="#">jamong.com</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>



<!-- 관리자 홈 공통 bottom include -->
<%@include file="../inc/bottom_js.jsp"%>
<!-- 화면별 고유 scripit init -->


<%@include file="../inc/admin_bottom.jsp"%>