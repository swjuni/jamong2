<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../incs/top_mypage.jsp"%>
<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$("#agree").click(function(){
			if($("#agree").is(":checked")){
				$("#agreeText").val("Y");
			}else{
				$("#agreeText").val("N");
			}
		})
		$("form[name=frm]").submit(function(){
			if($("#agreeText").val()!="Y"){
				alert("이용약관에 동의하셔야 저장가능합니다.");
				return false;
			}
		}); 
	})
</script>
<style type="text/css">
	.col-md-3{
		width: 290px;
    	margin-right: -40px;
	}
	
	.col-md-9{
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
	    width: 500px;
	    height: 1000px;
	}
	
	.agreement{
		width: 685px;
	    height: 390px;
	    margin-left: -205px;
	    margin-top: 95px;
	}
	
	.form-group {
		margin-bottom: 35px;
	}
	
	.contact-details li{
   		margin-bottom: 42px;
   	 	border-bottom: none;
	}
	
	button{
		margin-left: 70px;
	}
	
	.service-list .col-md-4 {
	    width: 241px;
	}
	
	h4{
		font-size: 18px;
		padding: 0;
	}
</style>
<%@include file="../incs/side_mypage.jsp"%>
<!-- 아래부터 mypage 각자 코딩내용 작성 -->
<div class="row service-list text-center">
					<div class="col-md-4 col-sm-12 col-xs-12 first">
						<div class="service-wrapper wow fadeIn" style="visibility: visible; animation-name: fadeIn;">	
							<i class="flaticon-competition"></i>
							<div class="service-details">
								<h4><a 
								<c:if test="${param.state=='expert' }">
									style="color:#f47664;"
								</c:if>
								 href="<c:url value='/registExpert/registExpert.do?state=expert&userNo=${sessionScope.userNo }'/>">전문가 등록</a></h4>
							</div>
						</div><!-- end service-wrapper -->
					</div><!-- end col -->

					<div class="col-md-4 col-sm-12 col-xs-12">
						<div class="service-wrapper wow fadeIn" style="visibility: visible; animation-name: fadeIn;">	
							<i class="flaticon-content"></i>
							<div class="service-details">
								<h4><a 
								<c:if test="${param.state=='profile' }">
									style="color:#f47664;"
								</c:if>>프로필 작성</a></h4>
							</div>
						</div><!-- end service-wrapper -->
					</div><!-- end col -->

					<div class="col-md-4 col-sm-12 col-xs-12 last">
						<div class="service-wrapper wow fadeIn" style="visibility: visible; animation-name: fadeIn;">	
							<i class="flaticon-html"></i>
							<div class="service-details">
								<h4><a href="service-02.html">서비스 등록</a></h4>
							</div>
						</div><!-- end service-wrapper -->
					</div><!-- end col -->
				</div>
				<div class="col-md-3 mb30">
					<div class="contact-details">
						<ul>
							<li><i class="fa fa-phone"></i> <span>이름</span></li>
							<li><i class="fa fa-phone"></i> <span>휴대폰 인증하기</span></li>
							<li><i class="fa fa-envelope"></i> <span>수익금 출금 은행</span></li>
							<li><i class="fa fa-twitter"></i> <span>계좌번호</span></li>
							<li><h4 style="color:#f46c63;">&nbsp;&nbsp;약관 동의 및 서명</h4></li>
						</ul>
					</div>
					<!-- end contact details -->
				</div>
				<div class="col-md-5">
					<form name="frm" role="form" class="contactform" action="<c:url value='/registExpert/regist.do'/>">
					<input type="hidden" name="userNo" value="${param.userNo }">
					<input type="hidden" name="id" value="${userInfo.userId }">
						<div class="form-group">
							<input type="text" class="form-control" id="userName" name="userName" value="${userInfo.userName }" disabled="disabled">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" id="hp" name="hp" value="${userInfo.hp }" disabled="disabled" style="width: 80%; float: left;">
							<span id="confirm" class="btn btn-primary" style="width: 20%; padding: 12px 0px; border-radius: 3px;">인증하기</span>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" id="subject" name="bankName" required="required"
							<c:if test="${!empty expert }">
								value="${expert.bankName }"
							</c:if>
							>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" id="subject" name="accountNo" required="required"
							<c:if test="${!empty expert }">
								value="${expert.accountNo }"
							</c:if>
							>
						</div>
						<div class="form-group agreement" >
							  <iframe name='hipinfo' frameborder='0' src='<%=request.getContextPath() %>/resources/agreement.html' scrolling="auto" border="no" maginwidth="0" marginheight="0" frameborder="0" style="height: 100%; width: 100%; background: #f0f1f2;">
							  </iframe>
							<small><strong>* 본인은 위 약관의 내용을 모두 확인하였으며, 동의합니다.&nbsp;</strong></small> <label  style="float: right;">
							<c:if test="${empty expert }">
							<small>동의합니다&nbsp;</small>
							<input type="checkbox" name="agree" id="agree"></label>
							</c:if>
							<c:if test="${!empty expert }">
							<small>이미 동의하셨습니다</small>
							</c:if>
							<input type="hidden" name="agreeText" id="agreeText"
							<c:if test="${!empty expert }">
							value='Y'
							</c:if>
							>
						</div>
						<br> 
						<button type="submit" id="submit" name="submit"	class="btn btn-primary" style="margin-left: 29px;">저장하고 다음으로</button>
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