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
		document.frmReport.currentPage.value=curPage;
		document.frmReport.searchUseYn.value=document.getElementById("approve").value;
		document.frmReport.searchKeyword.value=document.getElementById("searchK").value;
		document.frmReport.searchCondition.value=document.getElementById("searchC").value;
		document.frmReport.submit();
	}
	
	$(function(){
		$("#report_state").click(function(){
			if($("#approve").val()=='Y'){
				$("#approve").val('N');
			}else if($("#approve").val()=='N'){
				$("#approve").val('');
			}else{
				$("#approve").val('Y');
			}
			$("input[name=currentPage]").val("1");
			$("input[name=searchUseYn]").val($("#approve").val());
			$("form[name=frmReport]").submit();
		})
		
		$("input[name=chkAll]").click(function(){
			$("input[type=checkbox]").not("input[name=chkAll]").prop("checked",this.checked);
		});
		
		$("table tbody tr").not(".detail").on('click',function(){
			$(".detail").not($(this).nextUntil("tr:not(.detail)")).attr("style","display:none");
			$(this).nextUntil("tr:not(.detail)").toggle();
		});
		
		$("select[name=searchCondition]").change(function(){
			if($("select[name=searchCondition] option:selected").val()=='delflag'){
				$("input[name=searchKeyword]").attr('type','hidden');
				$("input[name=searchKeyword]").val("Y");
				$("select[name=delflagOption]").removeAttr('hidden');
			}else{
				$("input[name=searchKeyword]").val("");
				$("input[name=searchKeyword]").attr('type','text');
				$("select[name=delflagOption]").attr('hidden','hidden');
			}
		});
		
		$("select[name=delflagOption]").change(function(){
			if($("select[name=delflagOption] option:selected").val()=='Y'){
				$("input[name=searchKeyword]").val("Y");
			}else{
				$("input[name=searchKeyword]").val("N");
			}
		});
		
		$("#btAcceptMulti").click(function(){
			if($("input[type=checkbox]:checked").length<1){
				alert("승인목록을 선택하여 주세요");
				return;
			}
			var searchUseYn=$("input[name=searchUseYn2]").val();
			var searchKeyword=$("#searchK").val();
			var searchCondition=$("#searchC").val();
			var currentPage=$("input[name=currentPage2]").val();
			$("form[name=frmList]").prop('action','<c:url value="/admin/expert/acceptMulti.do?searchUseYn='+searchUseYn+'&searchKeyword='+searchKeyword+'&searchCondition='+searchCondition+'&currentPage='+currentPage+'"/>');
			$("form[name=frmList]").submit();
		});
		
		$("#btRefuseMulti").click(function(){
			if($("input[type=checkbox]:checked").length<1){
				alert("거부목록을 선택하여 주세요");
				return;
			}
			var searchUseYn=$("input[name=searchUseYn2]").val();
			var searchKeyword=$("#searchK").val();
			var searchCondition=$("#searchC").val();
			var currentPage=$("input[name=currentPage2]").val();
			$("form[name=frmList]").prop('action','<c:url value="/admin/expert/refuseMulti.do?searchUseYn='+searchUseYn+'&searchKeyword='+searchKeyword+'&searchCondition='+searchCondition+'&currentPage='+currentPage+'"/>');
			$("form[name=frmList]").submit();
		});
		
		$(".colorr td").mouseenter(function(){
			var me=$(this);
			$(this).siblings().each(function(idx,item){
				me.css("background","#96909263");
				$(this).css("background","#96909263");
			})
		})
		$(".colorr td").mouseleave(function(){
			var me=$(this);
			$(this).siblings().each(function(idx,item){
				me.css("background","white");
				$(this).css("background","white");
			})
		})
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
							<h1>전문가 신고 목록</h1>
						</div>
					</div>
				</div>
					<div class="card container-fluid row divSearch" style="margin-left: 10px; width: 1463px;">
						<form name="frmReport" method="post"
							action='<c:url value="/admin/expert/reportedExpert.do"/>'>
							<!-- 현재 페이지 hidden에 넣기 -->
							<input type="hidden" name='currentPage' value="1">
							<input type="hidden" name='currentPage2' value="${param.currentPage }">
							<select class="form-control" style="margin-right: 10px; float:left; border-color:lightgrey; width: 120px; height:35px; font-size: 14px;"
								name="searchCondition">
								<option value="report_type"
									<c:if test="${param.searchCondition=='repor_type'}">
            		selected="selected"
            	</c:if>>신고타입</option>
								<option value="id"
									<c:if test="${param.searchCondition=='id'}">
            		selected="selected"
            	</c:if>>닉네임</option>
								<option value="expert_no"
									<c:if test="${param.searchCondition=='expert_no'}">
            		selected="selected"
            	</c:if>>전문가 번호</option>
								<option value="delflag"
									<c:if test="${param.searchCondition=='delflag'}">
            		selected="selected"
            	</c:if>>처리결과</option>
							</select>
				
				<input class="form-control input-flat" style="width:500px; height:35px; border-color: lightgrey;float: left; margin-right:10px;"
				<c:if test="${param.searchCondition=='delflag'}">
				type="hidden"
				</c:if>
				<c:if test="${param.searchCondition!='delflag'}">
				type="text"
				</c:if>
				name="searchKeyword" title="검색어 입력" value="${param.searchKeyword }">
				
				<select class="form-control" style="margin-right: 10px; float:left; border-color:lightgrey; width: 500px; height:35px; font-size: 14px;"
				<c:if test="${param.searchCondition!='delflag'}">
				hidden="hidden"
				</c:if>
				name="delflagOption"><option value="Y" 
				<c:if test="${param.searchKeyword=='Y' }">
				selected="selected"
				</c:if>
				>승인</option>
				<option value="N"
				<c:if test="${param.searchKeyword=='N' }">
				selected="selected"
				</c:if>
				>거부</option></select>
				<input type="submit" value="검색" class="btn-outline btn btn-default btn-flat" style="height:30px; font-size: 13px; margin-top: 3px;">
								<input type="hidden" name="searchUseYn">
								<input type="hidden" value="${param.searchUseYn }" name="searchUseYn2" id="approve">
								<input type="hidden" value="${ param.searchKeyword}" id="searchK">
								<input type="hidden" value="${ param.searchCondition}" id="searchC">
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
															style="width: 5%;">번호</th>
														<th
															class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
															style="width: 5%; background: #96909263;" id="report_state">승인여부	</th>
														<th
															class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
															style="width: 20%;">신고타입</th>
														<th
															class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
															style="width: 7%;">전문가번호</th>
														<th
															class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
															style="width: 10%;">닉네임</th>
														<th
															class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
															style="width: 25%;">신고상품 보러가기</th>
														<th
															class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
															style="width: 8%;">처리결과</th>
														<th
															class="jsgrid-header-cell jsgrid-control-field jsgrid-align-center"
															style="width: 10%;"><span
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
													<c:set var="idx" value="0"/>
													<c:forEach var="map" items="${list }">
														<tr class="jsgrid-row colorr">
															<td class="jsgrid-cell jsgrid-align-center" onclick='event.cancelBubble=true;'
																style="width: 5%;">
																<c:if test="${empty map['DELFLAG']}">
																<input type="checkbox" name="reportCol[${idx }].reportNo" value="${map['REPORT_NO']}">
																<input type="hidden" name="reportCol[${idx }].productNo" value="${map['PRODUCT_NO'] }">
																</c:if>
																<c:if test="${!empty map['DELFLAG']}">
																<img alt="checkedIMG" src="<%=request.getContextPath() %>/assets/images/check-mark.png" style="width: 10px; height: 10px;">
																</c:if>
																</td>
															<td class="jsgrid-cell jsgrid-align-center"
																style="width: 5%;">${map['REPORT_NO'] }</td>
															<td class="jsgrid-cell jsgrid-align-center"
																style="width: 5%;">
																<c:if test="${empty map['DELFLAG']}">
																<img alt="사이렌" src="<%=request.getContextPath() %>/assets/images/sirencolor.png" style="width: 30px; height: 30px;"></td>
																</c:if>
																<c:if test="${!empty map['DELFLAG']}">
																<img alt="사이렌" src="<%=request.getContextPath() %>/assets/images/sirenblack.png" style="width: 22px; height: 25px;"></td>
																</c:if>
															<td class="jsgrid-cell jsgrid-align-center"
																style="width: 20%;">${map['REPORT_TYPE'] }</td>
															<td class="jsgrid-cell jsgrid-align-center"
																style="width: 7%;">${map['EXPERT_NO'] }
																</td>
															<td class="jsgrid-cell jsgrid-align-center"
																style="width: 10%;">${map['ID'] }
																</td>
															<td class="jsgrid-cell jsgrid-align-center"
																style="width: 25%;"><a style="color: #0093ffe8;" href="<c:url value='/main/menuinfo/menuinfo_Detail.do?productNo=${map["PRODUCT_NO"] }'/>">www.jamong/main/menuinfo/menuinfo_Detail.do?productNo=${map["PRODUCT_NO"] }</a>
																</td>
															<td class="jsgrid-cell jsgrid-align-center"
																style="width: 8%;">
																<c:if test="${map['DELFLAG']=='Y'}">
																승인
																</c:if>
																<c:if test="${map['DELFLAG']=='N'}">
																거부
																</c:if>
																</td>
															<td
																class="jsgrid-cell jsgrid-control-field jsgrid-align-center" onclick='event.cancelBubble=true;'
																style="width: 10%;">
																<c:if test="${empty map['DELFLAG'] }">
																<a style="border:1px gray solid; padding: 2px 7px; font-size: 15px;" href="<c:url value='/admin/expert/approveOne.do?productNo=${map["PRODUCT_NO"] }&reportNo=${map["REPORT_NO"] }&searchUseYn=${param.searchUseYn }&searchKeyword=${param.searchKeyword }&searchCondition=${param.searchCondition }&currentPage=${param.currentPage }'/>">승인</a>
																<a style="border:1px pink solid; padding: 2px 7px; font-size: 15px;" href="<c:url value='/admin/expert/refuseOne.do?reportNo=${map["REPORT_NO"] }&searchUseYn=${param.searchUseYn }&searchKeyword=${param.searchKeyword }&searchCondition=${param.searchCondition }&currentPage=${param.currentPage }'/>">거부</a>
																</c:if>
																<c:if test="${!empty map['DELFLAG'] }">
																처리완료
																</c:if>
																</td>
																<td style="width: 0%;"></td>
														</tr>
														<tr class="jsgrid-alt-row detail" style="display:none">
															<td colspan="3" class="jsgrid-cell jsgrid-align-center" style="width: 150px;">
															신고번호</td>
															<td colspan="2" class="jsgrid-cell jsgrid-align-left" style="width: 50px;">
															${map['REPORT_NO'] }</td>
															<td class="jsgrid-cell" style="width: 150px;">
															신고회원</td>
															<td colspan="3" class="jsgrid-cell jsgrid-align-left" style="width: 50px;">
															${map['USER_NO'] }</td>
															<td style="width: 0%"></td>
														</tr>
														<tr class="jsgrid-alt-row detail" style="display:none">
															<td colspan="3" class="jsgrid-cell jsgrid-align-center" style="width: 150px;">
															신고날짜</td>
															<td colspan="2" class="jsgrid-cell jsgrid-align-left" style="width: 50px;">
															<fmt:formatDate value="${map['REPORT_DATE'] }" pattern="yyyy-MM-dd"/></td>
															<td class="jsgrid-cell" style="width: 150px;">
															신고받은전문가</td>
															<td colspan="3" class="jsgrid-cell jsgrid-align-left" style="width: 50px;">
															${map['EXPERT_NO'] }</td>
															<td style="width: 0%"></td>
														</tr>
														<tr class="jsgrid-alt-row detail" style="display:none">
															<td colspan="3" class="jsgrid-cell jsgrid-align-center" style="width: 150px;">
															신고상품</td>
															<td colspan="6" class="jsgrid-cell jsgrid-align-left" style="width: 50px;">
															${map['PRODUCT_NO'] }&nbsp;&nbsp;:&nbsp;&nbsp;<a style="color: #0093ffe8;" href="<c:url value='/main/menuinfo/menuinfo_Detail.do?productNo=${map["PRODUCT_NO"] }'/>">www.jamong/main/menuinfo/menuinfo_Detail.do?productNo=${map["PRODUCT_NO"] }</a>
															</td>
															<td width="0%"></td>
														</tr>
														<tr class="jsgrid-alt-row detail" style="display:none">
															<td colspan="5" class="jsgrid-cell jsgrid-align-center" style="width: 150px;">
															신고내용</td>
															<td class="jsgrid-cell" style="width: 150px;">
															관리자 번호</td>
															<td colspan="3" class="jsgrid-cell jsgrid-align-left" style="width: 50px;">
															${map['ADMIN_NO'] }</td>
															<td style="width: 0%"></td>
														</tr>
														<tr class="jsgrid-alt-row detail" style="display:none">
															<td class="jsgrid-cell jsgrid-align-center" colspan="9" style="height: 200px;">
															${map['reportDesc'] }</td>
															<td style="width: 0%;"></td>
														</tr>
														<c:set var="idx" value="${idx+1 }"/>
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
										<input style="width:75px; height:40px;" class="btn btn-default btn-flat m-b-10 m-l-5" type="button" id="btAcceptMulti" value="승인">
										<input style="width:75px; height:40px;" class="btn btn-pink btn-flat m-b-10 m-l-5" type="button" id="btRefuseMulti" value="거부">
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