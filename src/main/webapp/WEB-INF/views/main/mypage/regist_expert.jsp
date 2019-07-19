<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../incs/top_mypage.jsp"%>
<style type="text/css">
	.col-md-3{
		width: 290px;
    	margin-right: -40px;
	}
	
	.col-md-9{
		margin-left: 42px;
		margin-top: 21px;
	}
	
	.mb30 {
	    width: 250px;
	    height: 1000px;
	}

	.col-md-5 {
		margin-top: -3px;
	    width: 500px;
	    height: 1000px;
	}
	
	.agreement{
		width: 685px;
	    height: 390px;
	    margin-left: -215px;
	    margin-top: 95px;
	}
	
	.form-group {
		margin-bottom: 35px;
	}
	
	.contact-details li{
   	 margin-bottom: 42px;
   	 border-bottom: none;
	}
</style>
<%@include file="../incs/side_mypage.jsp"%>
<!-- 아래부터 mypage 각자 코딩내용 작성 -->
				<div class="col-md-3 mb30">
					<div class="contact-details">
						<ul>
							<li><i class="fa fa-phone"></i> <span>이름</span></li>
							<li><i class="fa fa-phone"></i> <span>휴대폰 인증하기</span></li>
							<li><i class="fa fa-fax"></i> <span>주민등록번호</span></li>
							<li><i class="fa fa-envelope"></i> <span>수익금 출금 은행</span></li>
							<li><i class="fa fa-twitter"></i> <span>계좌번호</span></li>
							<li><h4 style="color:#f46c63;">&nbsp;&nbsp;약관 동의 및 서명</h4></li>
						</ul>
					</div>
					<!-- end contact details -->
				</div>
				<div class="col-md-5">
					<form role="form" class="contactform">
						<div class="form-group">
							<input type="text" class="form-control" id="name" name="name" placeholder="Name" required="">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" id="email" name="email"	placeholder="Email" required="">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" id="phone" name="phone"	placeholder="Phone" required="">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" id="subject" name="subject"	placeholder="Subject" required="">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" id="subject" name="subject"	placeholder="Subject" required="">
						</div>
						<div class="form-group agreement" >
							  <iframe name='hipinfo' frameborder='0' src='<%=request.getContextPath() %>/resources/agreement.html' scrolling="auto" border="no" maginwidth="0" marginheight="0" frameborder="0" style="height: 100%; width: 100%">
							<textarea class="form-control" id="message" placeholder="Message" maxlength="140" rows="7"></textarea>
						</div>
						<button type="button" id="submit" name="submit"	class="btn btn-primary">Submit Form</button>
					</form>
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