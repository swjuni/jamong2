<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../incs/top_mypage.jsp"%>
<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
<script type="text/javascript">
function pageFunc(curPage){
	document.frm.currentPage.value=curPage;
	document.frm.submit();
}
$(function(){
	$("#go").click(function(){
		location.href="<c:url value='/mypage/service.do'/>";
	})
	
	$(".del").click(function(){
		$.ajax({
			url:"<c:url value='/mypage/expert/delete.do'/>",
			type:"get",
			datatype:"xml",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
			data:"no="+$(this).prev().val(),
			success:function(res){
				if(res=='s'){
					alert('삭제되었습니다.')
					location.reload();
				}else{
					alert('삭제에 실패하였습니다.')
				}
			},
			error:function(xhr, status, error){
				alert(status+":"+error);
			}
		});//ajax
	})
	
	$("#search").change(function(){
		$("input[name=searchKeyword]").val($("#search option:selected").val());
		$("form[name=frm]").submit();
	})
})
</script>
<style type="text/css">
.col-md-3 {
	width: 290px;
	margin-right: -40px;
}

.col-md-9 {
	margin-left: 42px;
	margin-top: 5px;
}

.mb30 {
	margin-top: 12px;
	width: 250px;
	height: 1000px;
}

.col-md-5 {
	margin-left:8%;
	margin-top: 15px;
	width: 665px;
	height: 1200px;
}

.contact-details li {
	    float: left;
	}
	h4{
		font-size: 18px;
		padding: 0;
	}
	.service-list .col-md-4 {
	    margin-left: 100px;
	    margin-right: 8px;
	}
	
	.pdImg{
		width: 30%;
	    height: 100%;
	    float: left;
		clear: both;
	}
	.di{
		width: 146%;
	    height: 17%;
	    margin-bottom: 5%;
	    border: 1px solid #f6ab6b66;
		padding: 3px 3px;
    }
	.no{
	    font-size: 22px;
	    font-weight: bold;
	    margin-left: 3%;
	    margin-right: 5%;
	    float: left;
	}
	.category{
	    font-size: 16px;
	    margin-left:-2%;
	    float: left;
		border-left: 1px solid #f46e63;
	    padding-left: 7%;
	}
	.name{
	    font-size: 21px;
	    font-weight: bold;
	    display: block;
	    margin-left: 24%;
	    float: left;
	}
	.price{
	    font-size: 25px;
	    float: left;
	    font-weight: 600;
	    display: block;
	    margin-top: 40px;
	    margin-left: -10%;
	}
	.regdate{
		margin-top:-4%;
		float: left;
	    margin-left: 20%;
	    font-size: 20px;
	    font-weight: 500;
	}
	.lb{
		clear: both;
	    float: left;
	    color: #f46f63;
	    margin-left: 15%;
	    margin-top: 4%;
	}
	.state{
	    float: right;
	    color: white;
	    padding: 4px 11px;
	}
	#go{
		margin-left: 295%;
	    background: #f46c63c7;
	    color: white;
	}
	#search{
		float: left;
	    margin-top: -7%;
	    width: 25%;
	    height: 3%;
	}
</style>
<c:import url="/mypage/sideMypage.do"/>
<!-- 아래부터 mypage 각자 코딩내용 작성 -->
<div class="row service-list text-center">
<div class="col-md-4 col-sm-12 col-xs-12">
						<div class="service-wrapper wow fadeIn" style="visibility: visible; animation-name: fadeIn; margin-left: -37px;">	
							<i class="flaticon-content" style="float: left;"></i>
							<div class="service-details">
								<h4 style="padding: 10px 35px 10px;"><a style="color:#f47664;">나의 서비스</a></h4>
							</div>
						</div><!-- end service-wrapper -->
						<button type="button" id="go" class="btn btn-rounded">등록하러가기</button>
					</div><!-- end col -->
<div class="col-md-5">
<select name="sel" id="search">
	<option value="P"
	<c:if test="${sk=='P' }">
	selected="selected"
	</c:if>
	>승인 대기중</option>
	<option value="Y"
	<c:if test="${sk=='Y' }">
	selected="selected"
	</c:if>
	>판매 중</option>
	<option value="N"
	<c:if test="${sk=='N' }">
	selected="selected"
	</c:if>
	>승인 거부</option>
</select>
	<c:if test="${!empty list }">
	<c:forEach var="map" items="${list }">
	<div class="di">
	<img class="pdImg" alt="" src="<c:url value='/upload/image/${map["FILE_NAME"] }'/>">
	<div>
	<span class="no">#${map['PRODUCT_NO'] }</span><span class="category">${map['CATEGORY_NAME_L'] }&nbsp;>&nbsp;${map['CATEGORY_NAME'] }</span>
	<input type="hidden" value="${map['PRODUCT_NO'] }">
	<span class="state del" style="background: red; cursor: pointer">
	삭제
	</span>
	<c:if test="${map['ACTIVATION']=='Y' }">
	<span class="state" style="background: #0000ff9e;">
	판매중
	</span>
	</c:if>
	<c:if test="${map['ACTIVATION']=='P' }">
	<span class="state" style="background: purple;">
	승인 대기중
	</span>
	</c:if>
	<c:if test="${map['ACTIVATION']=='N' }">
	<span class="state" style="background: red;">
	승인 거부
	</span>
	</c:if>
	<br>
	</div>
	<div style="margin-top: 20px; float: left;">
	<span class="name"><a href="<c:url value='/main/menuinfo/menuinfo_Detail.do?productNo=${map["PRODUCT_NO"] }'/>">${map['PRODUCT_NAME'] }</a></span>
	<label class="lb">price</label>
	<span class="price">${map['PACK_PRICE'] }&nbsp;~</span>
	<label class="lb">regdate</label>
	<span class="regdate"><fmt:formatDate value="${map['REGDATE'] }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
	</div>

	</div>
	</c:forEach>
	</c:if>
	<c:if test="${empty list }">
	서비스가 존재하지 않습니다.
	</c:if>
<form action="<c:url value='/mypage/expert/menuList.do'/>" name="frm" method="post">
<div class="jsgrid-pager-container" style="display: block;    MARGIN-LEFT: 52%;">
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
														<span style="background:#f58e67; BORDER: 1PX SOLID #f58e67;color: WHITE;font-size: 1em; PADDING: 4PX 10PX; MARGIN-RIGHT: 8PX;">${i }</span>
													</c:if>
													<c:if test="${i!=pagingInfo.currentPage }">
														<a href="#" onclick="pageFunc(${i})" style="BORDER: 1PX SOLID #f58e67;color: orange;font-size: 1em; PADDING: 4PX 10PX; MARGIN-RIGHT: 8PX;">${i}</a>
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
										<input type="hidden" name='currentPage' value="1">
										<input type="hidden" name='searchKeyword' value="${sk }">
										</form>
</div>
<!--아래는 mypage 공통 사용 코드  -->
</div>
<!-- end col -->
</div>
<!-- end row -->
</div>
<!-- end container -->
</section>
<!-- end section -->

<%@include file="../incs/bottom_main.jsp"%>
<!-- 화면별 고유 하단js 포함할 위치 -->
<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/resources/js/parallax.js'/>"></script>
<script src="<c:url value='/resources/js/animate.js'/>"></script>
<script src="<c:url value='/resources/js/custom.js'/>"></script>

</body>
</html>
</body>
</html>