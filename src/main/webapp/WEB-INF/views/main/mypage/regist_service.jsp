<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../incs/top_mypage.jsp"%>
<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
<script type="text/javascript">
$(function(){
	$("select[name=cateL]").change(function(){
		var cateNo=$(this).val();
		$(".category").find("select[name='cateM']").remove();
		$("#submit").attr("disabled",false);
		$.ajax({
			url:"<c:url value='/registExpert/submajor.do'/>",
			type:"get",
			data:"categoryLNo="+cateNo,
			dataType:"json",
			success:function(res){
				var str="<select name='cateM'>"
				$.each(res, function(idx, item){
					if(idx==0){
						str+="<option selected='selected' value='"+item.categoryNoM+"'>"+item.categoryName+"</option>";
					}else{
						str+="<option value='"+item.categoryNoM+"'>"+item.categoryName+"</option>";
					}
				});
				str+="</select>";
				$(".category").append(str);
				
			},
			error:function(xhr, status, error){
				alert(status+":"+error);
			}
		});//ajax
	});
	
	$("#submit").click(function(){
		$("input[name=categoryTypeNo]").val($("select[name=cateM]").find("option:eq(0)").val());
	})
});
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
	margin-top: 9px;
	width: 665px;
	height: 1000px;
}

.agreement {
	width: 685px;
	height: 390px;
	margin-left: -205px;
	margin-top: 95px;
}

.form-group {
	margin-bottom: 35px;
}

.contact-details li {
	margin-bottom: 42px;
	border-bottom: none;
}

button {
	margin-left: 70px;
}

form .btn{
	margin-right: 22px;
	padding: 10px;
	width: 80px;
	float:right;
}

.service-list .col-md-4 {
	width: 241px;
}

h4 {
	font-size: 18px;
	padding: 0;
}

li div {
	margin-left: 16px;
	width: 100%;
}

.section {
	padding-bottom: 40rem;
}
</style>
<%@include file="../incs/side_mypage.jsp"%>
<!-- 아래부터 mypage 각자 코딩내용 작성 -->
<div class="row service-list text-center">
	<div class="col-md-4 col-sm-12 col-xs-12 first">
		<div class="service-wrapper wow fadeIn"
			style="visibility: visible; animation-name: fadeIn;">
			<i class="flaticon-competition"></i>
			<div class="service-details">
				<h4>
					<a
						<c:if test="${param.state=='expert' }">
									style="color:#f47664;"
								</c:if>
						href="<c:url value='/registExpert/registExpert.do?state=expert&userNo=${sessionScope.userNo }'/>">전문가
						등록</a>
				</h4>
			</div>
		</div>
		<!-- end service-wrapper -->
	</div>
	<!-- end col -->

	<div class="col-md-4 col-sm-12 col-xs-12">
		<div class="service-wrapper wow fadeIn"
			style="visibility: visible; animation-name: fadeIn;">
			<i class="flaticon-content"></i>
			<div class="service-details">
				<h4>
					<a style="cursor: inherit;"
						<c:if test="${param.state=='profile' }">
									style="color:#f47664;"
								</c:if>
						>프로필 작성</a>
				</h4>
			</div>
		</div>
		<!-- end service-wrapper -->
	</div>
	<!-- end col -->

	<div class="col-md-4 col-sm-12 col-xs-12 last">
		<div class="service-wrapper wow fadeIn"
			style="visibility: visible; animation-name: fadeIn;">
			<i class="flaticon-html"></i>
			<div class="service-details">
				<h4>
					<a
						href="<c:url value='/registExpert/service.do?userNo=${expert.expertNo }'/>">서비스
						등록</a>
				</h4>
			</div>
		</div>
		<!-- end service-wrapper -->
	</div>
	<!-- end col -->
</div>

<!-- end contact details -->
<div class="col-md-5">
<form name="frm" role="form" class="contactform" action="<c:url value='/registExpert/registService.do'/>" method="post">
	<input type="text" value="${param.expertNo }" name="expertNo">
	<c:if test="${!empty menuVo }">
	<input type="text" value="${menuVo.productNo }" name="productNo">
	</c:if>
	<input type="hidden" name="categoryTypeNo">
	<div class="category">
		상품 제목<input type="text" name="productName" required="required"
		<c:if test="${!empty menuVo }">
		value="${menuVo.productName }"
		</c:if>
		> 카테고리
		<select name="cateL">
			<c:forEach var="cateLVo" items="${list }">
				<option value="${cateLVo.categoryNo }">${cateLVo.categoryNameL }</option>
			</c:forEach>
		</select>
	</div>

	<button type="button" id="next" name="next" class="btn btn-primary"
		onclick="location.href='<c:url value="/registExpert/licenseView.do?expertNo=${expert.expertNo }"/>'"
		<c:if test='${empty menuVo }'>
			disabled="disabled"
		</c:if>>다음</button>
	<button type="submit" id="submit" name="submit" class="btn btn-primary">저장</button>
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