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
<form name="frmPage" method="post" action="<c:url value='/mypage/payList/payList.do'/>" >
	<input type="hidden" name="startDay" value="${param.startDay }">
	<input type="hidden" name="endDay" value="${param.endDay }">
	<input type="hidden" name="currentPage">	
</form>
<!-- 페이징 처리 form 끝 -->

<div style="font-size:30px;  font-weight:bolder; float: left;">구매관리</div>
<br><br>
<p>${sessionScope.userName }님의 구매내역입니다.</p>
<form name="frm1" method="post" action="<c:url value='/mypage/payList/payList.do'/>" >
	<!-- 조회기간 include -->
	<c:import url="../incs/dateTerm.jsp"></c:import>
</form>
<br><br>
<div class="clearfix"></div>
<c:if test="${!empty param.startDay}">
	<div>${param.startDay } ~ ${param.endDay }까지의 주문내역, 총 ${pagingInfo.totalRecord }건 입니다.</div>
</c:if>

<br>
<div>
	<table class="table table-striped table-hover"
		summary="구매내역에 관한 표로써      에 대한 정보를 제공합니다.">
		<colgroup>
			<col style="width: 10%" />
			<col style="width: 15%" />
			<col style="width: 40%" />
			<col style="width: 20%" />
			<col style="width: 15%" />
		</colgroup>
		<thead class="thead-light">
			<tr>
				<th class="text-center" scope="col">결제번호</th>
				<th class="text-center" scope="col">결제일자</th>
				<th class="text-center" scope="col">상품명</th>
				<th class="text-center" scope="col">결제금액</th>
				<th class="text-center" scope="col">결제수단</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty list }">
				<tr>
					<td colspan="5" class="text-center">결제 내역이 없습니다</td>
				</tr>
			</c:if>
			<c:if test="${!empty list }">
				<!-- 반복 시작 -->
				<c:forEach var="map" items="${list }">
					<tr>
						<td class="text-right" >${map['PAY_NO'] }</td>
						<td class="text-center" ><fmt:formatDate value="${map['REGDATE'] }"
								pattern="yyyy-MM-dd" /></td>
						<td >${map['PRODUCT_NAME'] }( ${map['PACK_NAME']} )</td>
						<td class="text-center" ><fmt:formatNumber value="${map['PRICE'] }"
								pattern="#,###" />원</td>
						<td class="text-center" >${map['PAY_METHOD'] }</td>
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