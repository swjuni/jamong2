<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../incs/top_mypage.jsp"%>
<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
<script type="text/javascript">

</script>
<style type="text/css">
.iconRound{
	border-radius: 100px;
	text-align: center;
	font-size: 14px;
	display: inline-block;
	width: 30px;
	margin-right: 10px;
	height: 30px;
	line-height: 30px;
	background: linear-gradient(45deg, #f46c63 1%, #f7ba6d 100%);
	border: 0;
	color: #ffffff;
}
</style>
<%@include file="../incs/side_mypage.jsp"%>
<!-- 아래부터 mypage 각자 코딩내용 작성 -->
			<div style="font-size:30px;  font-weight:bolder; margin-bottom: 30px;">상품 신고</div>
			<div style="clear: both;"></div>

				<form name="frm" role="form" class="contactform" method="post" action="<c:url value='/mypage/reportAdd.do'/>">
					<input type="hidden" name="expertNo" value="${expertVo.expertNo }">
					<input type="hidden" name="productNo" value="${menuinfoVo.productNo }">
					<div class="col-md-10 col-sm-10">
						<div class="row">
							<div class="col-md-4">
								<i class="fa fa-phone iconRound"></i> <span>전문가 닉네임</span>
							</div>
							<div class="col-md-8">
								<div class="form-group">
									<input type="text" class="form-control" id="id" name="id" value="${expertVo.id }" disabled="disabled">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-4">
								<i class="fa fa-twitter iconRound"></i> <span>상품명</span>
							</div>
							<div class="col-md-8">
								<div class="form-group">
									<input type="text" class="form-control" id="productName" name="productName" value="${menuinfoVo.productName }" disabled="disabled">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-4">
								<i class="fa fa-twitter iconRound"></i> <span>신고유형</span>
							</div>
							<div class="col-md-8">
								<div class="form-group">
									<select class="form-control" id="reportType" name="reportType" required="required">
										<option value="">신고유형을 선택하세요</option>
										<option value="욕설">욕설</option>
										<option value="전문성 부족">전문성 부족</option>
										<option value="마감기한 초과">마감기한 초과</option>
										<option value="저작권 위반">저작권 위반</option>
										<option value="외부거래 유도">외부거래 유도</option>
										<option value="계산서 미발행">계산서 미발행</option>
									</select>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-4">
									<i class="fa fa-envelope iconRound"></i> <span>신고내용</span>
							</div>
							<div class="col-md-8">
								<div class="form-group">
									<textarea rows="10" id="reportDesc" name="reportDesc" required="required" style="width: 100%; resize: none;"></textarea>
								</div>
							</div>
						</div>
						<div class="row" style="text-align: center; margin-top: 20px;">
							<button type="submit" id="submit" name="submit"	class="btn btn-primary">정보 저장</button>
						</div>
					</div>
				</form>
				<!--아래는 mypage 공통 사용 코드  -->
			</div><!-- end col -->
		</div><!-- end row -->
	</div><!-- end container -->
</section><!-- end section -->

<%@include file="../incs/bottom_main.jsp"%>
<!-- 화면별 고유 하단js 포함할 위치 -->
<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/resources/js/parallax.js'/>"></script>
<script src="<c:url value='/resources/js/animate.js'/>"></script>
<script src="<c:url value='/resources/js/custom.js'/>"></script>

</body>
</html>