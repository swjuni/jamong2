<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../incs/top_mypage.jsp" %>


<!-- 아래부터 mypage 각자 코딩내용 작성 -->
<link href="<c:url value='/assets/css/style2.css'/>" rel="stylesheet">
<link href="<c:url value='/assets/css/lib/themify-icons.css'/>" rel="stylesheet">
<style>
.header{
	margin-left: 0px;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$('#check').click(function(){
		var $checkid = $('#email').val();
		$.ajax({
    		url :"<c:url value='/main/userlogin/userCheckId.do'/>",
    		type: 'post',
    		data:{
    			id:$checkid
    		},
    		dataType: "json",
    		success : function(res) {
    		if(res>0){
    			alert("회원 이메일 입니다. 이메일 발송을 진행해주세요");
    			$('#email').attr('readonly','readonly');
    		}else{
    			alert("회원 이메일이 아닙니다");
    		}
    		}
    		});
	});
	
});
</script>

 <div style="width: 30%;height: 60%;margin: auto;" >
					<div class="login-content">
                        <div class="login-logo">
                            <a href="index.html"><span>Focus</span></a>
                        </div>
                        <div class="login-form">
                            <h4>회원 비밀번호 찾기</h4>
                            <form action="<c:url value='/main/userlogin/SearchPwd.do'/>" method="POST">
                                <div class="form-group">
                                    <label>이메일</label>
                                    <input type="email" class="form-control" placeholder="EMAIL" id="email" name="email">
                                    <input type="button" class="btn btn-primary btn-flat m-b-30 m-t-30" style="width:40%;margin-left:30%" id="check" value="이메일 확인">
                                <!-- <div class="form-group">
                                    <label>현재 비밀번호</label>
                                    <input type="text" class="form-control" placeholder="현재 비밀번호">
                                </div>
                                <div class="form-group">
                                    <label>변경할 비밀번호</label>
                                    <input type="text" class="form-control" placeholder="변경할 비밀번호">
                                </div> -->
                                
                                <button type="submit" class="btn btn-primary btn-flat m-b-30 m-t-30">이메일 발송하기</button>
                            </form>
                        </div>
                    </div>
                   </div>

<!--아래는 mypage 공통 사용 코드  -->
			
					</div>
				</div>
			</div>
		</section>

<%@include file="../incs/bottom_main.jsp" %>
<!-- 화면별 고유 하단js 포함할 위치 -->
	<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/resources/js/parallax.js'/>"></script>
	<script src="<c:url value='/resources/js/animate.js'/>"></script>
	<script src="<c:url value='/resources/js/custom.js'/>"></script>
	
	<!-- jquery vendor -->
    <script src="<c:url value='/assets/js/lib/jquery.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/jquery.nanoscroller.min.js'/>"></script>
    <!-- nano scroller -->
    <script src="<c:url value='/assets/js/lib/preloader/pace.min.js'/>"></script>
    <!-- sidebar -->
    
    <!-- bootstrap -->

    <script src="<c:url value='/assets/js/lib/bootstrap.min.js'/>"></script><script src="<c:url value='/assets/js/scripts.js'/>"></script>
    <!-- scripit init-->

</body>
</html>