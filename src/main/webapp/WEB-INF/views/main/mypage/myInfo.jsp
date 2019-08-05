<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../incs/top_mypage.jsp" %>
<c:import url="/mypage/sideMypage.do"/>


<!-- 아래부터 mypage 각자 코딩내용 작성 -->

<div class="unix-login">
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <div class="login-content" style="margin: auto;">
                        
                        <div class="login-form" style="padding: 10%">
                            <h4>Jamong 회원정보수정</h4>
                            <form action="<c:url value='/main/mypage/myInfo.do'/>" method="post">
                                <div class="form-group">
                                    <label>아이디(이메일)</label>
                                    <input type="email" class="form-control" id="id" name="userId" value=${userId } readonly="readonly">
                                    <p style="color:red;visibility:hidden; "  id="overlap">중복된 아이디(이메일)입니다</p>
                                </div>
                                <div class="form-group">
                                    <label>비밀번호</label>
                                    <input type="password" class="form-control" placeholder="Password" id="pwd" name="userPwd">
                                </div>
                                <div class="form-group">
                                    <label>비밀번호 확인</label>
                                    <input type="password" class="form-control" placeholder="Password" id="pwdchk">
                                </div>
                                <div class="form-group">
                                    <label>이름</label>
                                    <input type="text" class="form-control" placeholder="Name" id="name" name="userName">
                                </div>
                                <div class="form-group">
                                    <label>휴대폰번호</label>
                                    <input type="tel" class="form-control" placeholder="HP" onkeyup="inputPhoneNumber(this)" maxlength="13" name="hp">
                                </div>
                                <div class="form-group">
                                    <label style="display:block">우편번호</label>
                                    <input type="text" class="form-control" placeholder="Zipcode" style="width:40%;display:inline;" id="zipcode" name="zipcode">
                                    <button type="button" class="btn btn-primary btn-flat m-b-30 m-t-30" onclick="zipcode123()" style="display:inline;">우편번호</button>
                                </div>
                                <div class="form-group">
                                    <label>주소</label>
                                    <input type="text" class="form-control" placeholder="Address" id="address" name="address">
                                </div>
                                <div class="form-group">
                                    <label>상세 주소</label>
                                    <input type="text" class="form-control" placeholder="AddressDetail" id="addressDetail" name="addressDetail">
                                </div>
                                
                                <button type="submit" class="btn btn-primary btn-flat m-b-30 m-t-30" id="sign">정보 수정</button>
                           
                                
                                <input type ="hidden" name="chkId" id="chkId" value="N">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<!--아래는 mypage 공통 사용 코드  -->
			
					</div><!-- end col -->
				</div><!-- end row -->
			</div><!-- end container -->
		</section><!-- end section -->

<%@include file="../incs/bottom_main.jsp" %>
<!-- 화면별 고유 하단js 포함할 위치 -->
	<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/resources/js/parallax.js'/>"></script>
	<script src="<c:url value='/resources/js/animate.js'/>"></script>
	<script src="<c:url value='/resources/js/custom.js'/>"></script>

</body>
</html>