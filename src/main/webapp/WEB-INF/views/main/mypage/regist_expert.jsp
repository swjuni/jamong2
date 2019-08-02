<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../incs/top_mypage.jsp"%>
<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
	$(function(){
		var IMP = window.IMP; // 생략가능
		IMP.init('imp02924051'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		
		$("#pay").click(function(){
			IMP.request_pay({
			    pg : 'inicis', // version 1.1.0부터 지원.
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '주문명:결제테스트',
			    amount : 100,
			    buyer_email : 'iamport@siot.do',
			    buyer_name : '구매자이름',
			    buyer_tel : '010-1234-5678',
			    buyer_addr : '서울특별시 강남구 삼성동',
			    buyer_postcode : '123-456',
			    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
			}, function(rsp) {
			    if ( rsp.success ) {
			    	 // jQuery로 HTTP 요청
			        jQuery.ajax({
			            url: "https://www.myservice.com/payments/complete", // 가맹점 서버
			            method: "POST",
			            headers: { "Content-Type": "application/json" },
			            data: {
			                imp_uid: rsp.imp_uid,
			                merchant_uid: rsp.merchant_uid
			            }
			        }).done(function (data) {
			          // 가맹점 서버 결제 API 성공시 로직
			          alert("성공");
			        })
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }
			    alert(msg);
			});
		});
		
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
</style>
<c:import url="/mypage/sideMypage.do"/>
<!-- 아래부터 mypage 각자 코딩내용 작성 -->
<div class="row service-list text-center">
	<%@include file="../incs/registexpert.jsp"%>
	<input type="button" value="click" id="pay">
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
					<form name="frm" role="form" class="contactform" action="<c:url value='/mypage/regist.do'/>">
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