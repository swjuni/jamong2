<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../incs/top_mypage.jsp" %>
<c:import url="/mypage/sideMypage.do"/>

<!-- 아래부터 mypage 각자 코딩내용 작성 -->
<script type="text/javascript">
function pageFunc(curPage){
	$('input[name="currentPage"]').val(curPage);
	$("form[name=frmPage]").submit();
}

function progressChange(orderNo, orderId,progress, message){
	if(confirm(message)){
		location.href="<c:url value='/mypage/orders/updateProgress.do?orderId="+orderId+"&orderNo="+orderNo+"&progress="+progress+"'/>";
	}
}

</script>
<style type="text/css">
.divLeft{
	float: left;
}
.divLeft input{
	border-radius: 0; 
}
.divRight{ 
	float: right; 
}
.divRight input{ 
	border-radius: 0; 
}
.divRight .searchInput{
	width: 100px;
	border: 1px solid silver;
    vertical-align: middle;
    text-align: center;
}
</style>

<!-- 페이징 처리를 위한 form 시작-->
<form name="frmPage" method="post" action="<c:url value='/mypage/orders/sellList.do'/>" >
	<input type="hidden" name="startDay" value="${param.startDay }">
	<input type="hidden" name="endDay" value="${param.endDay }">
	<input type="hidden" name="currentPage">	
</form>
<!-- 페이징 처리 form 끝 -->

<div style="font-size:30px;  font-weight:bolder; float: left;">판매관리</div>
<br><br>
<p>${sessionScope.userName }님의 판매내역입니다.</p>
<form name="frm1" method="post" action="<c:url value='/mypage/orders/sellList.do'/>" >
	<!-- 조회기간 include -->
	<c:import url="../incs/dateTerm.jsp"></c:import>
</form>
<br><br>
<div class="clearfix"></div>
<c:if test="${!empty param.startDay}">
	<div>${param.startDay } ~ ${param.endDay }까지의 판매내역, 총 ${pagingInfo.totalRecord }건 입니다.</div>
</c:if>

<br>
<div style="overflow-x: scroll; height: 400px;">
	<table class="table table-striped table-hover"
		summary="판매내역에 관한 표로써      에 대한 정보를 제공합니다." style="width: 1200px;">
		<colgroup>
			<col style="width: 8%" />
			<col style="width: 8%" />
			<col style="width: 12%" />
			<col style="width: 8%" />
			<col style="width: 8%" />
			<col style="width: 8%" />
			<col style="width: 8%" />
			<col style="width: 8%" />
			<col style="width: 8%" />
			<col style="width: 8%" />
			<col style="width: 8%" />
			<col style="width: 8%" />
		</colgroup>
		<thead class="thead-light">
			<tr style="FONT-SIZE: 13PX;">
				<th class="text-center" scope="col">주문번호</th>
				<th class="text-center" scope="col">주문일</th>
				<th class="text-center" scope="col">상품/패키지명</th>
				<th class="text-center" scope="col">결제금액</th>
				<th class="text-center" scope="col">구매자ID</th>
				<th class="text-center" scope="col">구매자명</th>
				<th class="text-center" scope="col">연락처</th>
				<th class="text-center" scope="col">판매확정일</th>
				<th class="text-center" scope="col">거래종료일</th>
				<th class="text-center" scope="col">진행상태</th>
				<th class="text-center" scope="col">판매결정</th>
				<th class="text-center" scope="col">판매거부</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty list }">
				<tr>
					<td colspan="12" class="text-center">판매 내역이 없습니다</td>
				</tr>
			</c:if>
			<c:if test="${!empty list }">
				<!-- 반복 시작 -->
				<c:forEach var="map" items="${list }">
					<tr style="FONT-SIZE: 13PX;">
						<td class="text-right" >${map['ORDER_NO'] }</td>
						<td class="text-center" ><fmt:formatDate value="${map['ORDER_DATE'] }" pattern="yyyy-MM-dd" /></td>
						<td><a href="<c:url value='/main/menuinfo/menuinfo_Detail.do?productNo=${map["PRODUCT_NO"] }'/>" >
						${map['PRODUCT_NAME'] }( ${map['PACK_NAME']} )</a></td>
						<td class="text-center" ><fmt:formatNumber value="${map['PRICE'] }" pattern="#,###" />원</td>
						<td class="text-center" >${map['USER_ID'] }</td>
						<td class="text-center" >${map['USER_NAME'] }</td>
						<td class="text-center" >${map['HP'] }</td>
						<td class="text-center" ><fmt:formatDate value="${map['CONFIRM_DATE'] }" pattern="yyyy-MM-dd" /></td>
						<td class="text-center" ><fmt:formatDate value="${map['FINISH_DATE'] }" pattern="yyyy-MM-dd" /></td>
						<td class="text-center" >
							<c:if test="${map['PROGRESS'] =='W'}">주문요청중</c:if>
							<c:if test="${map['PROGRESS'] =='C'}">거래취소</c:if>
							<c:if test="${map['PROGRESS'] =='P'}">진행중</c:if>
							<c:if test="${map['PROGRESS'] =='F'}">거래완료</c:if>
						</td>
						<td class="text-center" >
							<c:if test="${map['PROGRESS'] =='W'}">
								<button type="button" onclick="progressChange(${map['ORDER_NO'] },'${map['ORDER_ID'] }', 'P', '계약을 체결하시겠습니까?' )">확정</button>
							</c:if>
						</td>
						<td class="text-center" >
							<c:if test="${map['PROGRESS'] =='W'}">
								<button type="button" onclick="progressChange(${map['ORDER_NO'] },'${map['ORDER_ID'] }', 'C', '거래 요청을 거부하시겠습니다?')">거부</button>
							</c:if>
						</td>
					</tr>
				</c:forEach>
				<!-- 반복 끝 -->
			</c:if>
		</tbody>
	</table>
</div>

<div class="pagination-wrapper row text-center">
 	<ul class="pagination col-md-12">
		<!-- 이전블럭으로 이동하기 -->
		<c:if test="${pagingInfo.firstPage>1 }">
			<li><a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})">&lt;</a></li>
		</c:if>
		
		<!-- 페이지 번호 추가 -->		
		<!-- [1][2][3][4][5][6][7][8][9][10] -->

		<c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage }">
			<c:if test="${i==pagingInfo.currentPage }">
				<li class="active"><a href="#" style="color:red;" >${i}</a></li>
			</c:if>
			<c:if test="${i!=pagingInfo.currentPage }">
				<li><a href="#" onclick="pageFunc(${i})">${i}</a></li>
			</c:if>
		</c:forEach>
		<!--  페이지 번호 끝 -->
		
		<!-- 다음 블럭으로 이동하기 -->
		<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage}">
			<li><a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})">&gt;</a></li>
		</c:if>
	</ul>
</div>







			
<!--아래는 mypage 공통 사용 코드  -->
					</div><!-- end col -->
				</div><!-- end row -->
			</div><!-- end container -->
		</section><!-- end section -->

<%@include file="../incs/bottom_main.jsp" %>
<!-- 화면별 고유 하단js 포함할 위치 -->
	<script src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/resources/js/parallax.js'/>"></script>
	<script src="<c:url value='/resources/js/animate.js'/>"></script>
	<script src="<c:url value='/resources/js/custom.js'/>"></script>

</body>
</html>