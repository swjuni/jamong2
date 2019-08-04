<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../incs/top_mypage.jsp"%>
<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
	$(function() {
		var IMP = window.IMP; // 생략가능
		IMP.init('imp02924051'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

		$("#pay").click(function() {
			var price=$("#price").val();
			IMP.request_pay({
				pg : 'inicis', // version 1.1.0부터 지원.
				pay_method : 'card',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : '주문명:결제테스트',
				amount : price*150,
				buyer_email : 'iamport@siot.do',
				buyer_name : '구매자이름',
				buyer_tel : '010-1234-5678',
				buyer_addr : '서울특별시 강남구 삼성동',
				buyer_postcode : '123-456',
				m_redirect_url : 'https://www.yourdomain.com/payments/complete'
			}, function(rsp) {
				if (rsp.success) {
					// jQuery로 HTTP 요청
					jQuery.ajax({
						url : "https://www.myservice.com/payments/complete", // 가맹점 서버
						method : "POST",
						headers : {
							"Content-Type" : "application/json"
						},
						data : {
							imp_uid : rsp.imp_uid,
							merchant_uid : rsp.merchant_uid
						}
					}).done(function(data) {
						 app.use(bodyParser.json());
						  // "/payments/complete"에 대한 POST 요청을 처리
						  app.post("/payments/complete", async (req, res) => {
						    try {
						      const { imp_uid, merchant_uid } = req.body; // req의 body에서 imp_uid, merchant_uid 추출
						      const getToken = await axios({
						          url: "https://api.iamport.kr/users/getToken",
						          method: "post", // POST method
						          headers: { "Content-Type": "application/json" }, // "Content-Type": "application/json"
						          data: {
						            imp_key: "imp_apikey", // REST API키
						            imp_secret: "ekKoeW8RyKuT0zgaZsUtXXTLQ4AhPFW3ZGseDA6bkA5lamv9OqDMnxyeB9wqOsuO9W3Mx9YSJ4dTqJ3f" // REST API Secret
						          }
						        });
						        const { access_token } = getToken.data.response; // 인증 토큰
						        ...
						        // imp_uid로 아임포트 서버에서 결제 정보 조회
						        const getPaymentData = await axios({
						          url: \`https://api.iamport.kr/payments/\${imp_uid}\`, // imp_uid 전달
						          method: "get", // GET method
						          headers: { "Authorization": access_token } // 인증 토큰 Authorization header에 추가
						        });
						        const paymentData = getPaymentData.data.response; // 조회한 결제 정보
						        ...
						    } catch (e) {
						      res.status(400).send(e);
						    }
						  });
					})
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
				}
				alert(msg);
			});
		});
	});
</script>
<style type="text/css">
.outer {
	margin-top: 105px;
	width: 100%;
	height: 100%;
	text-align: center;
}

.inner {
	width: 1000px;
	display: inline-block;
}

h3 {
	font-weight: bold;
	color: #f46c63;
	margin-left: -900px;
	margin-bottom: 45px;
	margin-top: 0;
}

.img {
	width: 150px;
	height: 100px;
	float: left;
}

table {
	float: left;
	margin-top: 20px;
	margin-left: 15px;
	width: 100%;
}
</style>
<div class="outer">
	<div class="inner">
		<h3>주문하기</h3>
		<div class="row callout bgcolor"
			style="background: #f7ba6d36; color: #323030;">
			<div class="col-md-9">
				<div>
					<img src="<c:url value='/upload/image/${img.fileName }'/>"
						class="img" />
					<p class="lead"
						style="float: left; margin-top: -25px; font-size: 20px; font-weight: bold;">[${map['CATEGORY_NAME']}]
						${map['PRODUCT_NAME'] }</p>
					<p
						style="float: left; font-size: 17px; padding: 0; margin-top: 70px; margin-left: -224px;">${expertVo.id }</p>
				</div>
			</div>
			<div style="clear: both;">
				<table>
					<tr style="background: lightgray;">
						<th style="padding: 7px;">패키지</th>
						<th>작업일</th>
						<th>수정횟수</th>
						<th>가격</th>
					</tr>
					<tr>
						<th style="padding: 7px;">${packVo.packLevel}</th>
						<th>${packVo.workingPeriod}</th>
						<th>${packVo.modifyCount}</th>
						<th>${packVo.packPrice}</th>
					</tr>
				</table>
			</div>
		</div>
		<div class="row callout bgcolor"
			style="background: #f7ba6d36; color: #323030; margin-top: 40px; margin-bottom: 40px;">
			<div class="col-md-9" style="width: 100%;">
				<div>
					<p class="lead"
						style="float: left; margin-top: -25px; font-size: 20px; font-weight: bold; margin-left: -37px; padding-bottom: 50px;">결제금액</p>
					<p class="lead"
						style="float: left; margin-top: -25px; font-size: 17px; font-weight: bold; margin-left: -37px; clear: both; width: 50%; text-align: left;">
						서비스 금액: <span style="float: right;">${packVo.packPrice}원</span>
					</p>
					<p class="lead"
						style="float: left; margin-top: -25px; font-size: 17px; font-weight: bold; margin-left: -37px; clear: both; width: 50%; text-align: left; padding-top: 65px;">
						회원 등급 할인:
						<c:if test="${userMap.AUTHOR_NAME=='일반' }">
							<span style="float: right;">2%</span>
						</c:if>
						<c:if test="${userMap.AUTHOR_NAME=='우수' }">
							<span style="float: right;">5%</span>
						</c:if>
					</p>
				</div>
				<div style="float: right; margin-top: -47px; width: 15%;">
					<p class="lead"
						style="float: left; margin-top: -25px; font-size: 20px; font-weight: bold; margin-left: -37px; padding-bottom: 50px;">총
						결제금액</p>
					<c:set var="per" value="0.98" />
					<c:if test="${userMap.AUTHOR_NAME=='우수' }">
						<c:set var="per" value="0.95" />
					</c:if>
					<p class="lead"
						style="float: left; margin-top: -25px; font-size: 30px; color: #f46c63; font-weight: bold; margin-left: -37px; clear: both; text-align: left;">${packVo.packPrice*per}원</p>
				</div>
			</div>
		</div>
			<div class="col-md-3" style="width: 100%;">
				<div class="button-wrap text-center" style="width: 107%; margin-left:-31px;">
					<a id="pay" class="btn btn-transparent btn-light btn-lg" style="width: 100%;font-size: 25px;letter-spacing: 10px; background: linear-gradient(45deg, #f46c63 1%,  #f7ba6d 100%); border: none;margin-bottom: 60px;border-radius: 5px;">결제하기</a>
				</div>
	</div>
	</div>
	<input type="hidden" name="price" value="${packVo.packPrice*per}" id="price">
</div>
<%@include file="../incs/bottom_main.jsp"%>
