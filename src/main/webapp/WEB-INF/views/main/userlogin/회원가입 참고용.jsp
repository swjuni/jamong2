<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 // 유저 정보 db작업  전체 조회 
 
%>
<!DOCTYPE html>
<html>
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Majestic Admin</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="../../vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="../../vendors/base/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="../../css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="../../images/favicon.png" />
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"2715",secure:"2720"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script><script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"2715",secure:"2720"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="../../js/jquery-3.3.1.min.js"></script>
<script>

	
	function zipcode111(){
    new daum.Postcode({
        oncomplete: function(data) {
        	var zip=document.getElementById('zipcode');
        	var addr=document.getElementById('uAddr1');
           	zip.value=data.zonecode;
           	addr.value=data.roadAddress;
           	zip.disabled = true ;
           	addr.disabled = true ;
           	
        }
    }).open();
	}
	
	function inputPhoneNumber(obj) {/* 전화번호 하이픈(-) 자동삽입 */
	    var number = obj.value.replace(/[^0-9]/g, "");
	    var phone = "";

	    if(number.length < 4) {
	        return number;
	    } else if(number.length < 7) {
	        phone += number.substr(0, 3);
	        phone += "-";
	        phone += number.substr(3);
	    } else if(number.length < 11) {
	        phone += number.substr(0, 3);
	        phone += "-";
	        phone += number.substr(3, 3);
	        phone += "-";
	        phone += number.substr(6);
	    } else {
	        phone += number.substr(0, 3);
	        phone += "-";
	        phone += number.substr(3, 4);
	        phone += "-";
	        phone += number.substr(7);
	    }
	    obj.value = phone;
	}
	
	
	$(function(){
		$('#uName').focusout(function(){//값 없을시 필수입력이라는 표시 출력
			if($(this).val().length==0){
				$(this).css("border","2px solid red");
				$(this).attr( 'placeholder', '성명(필수 입력값입니다)' );
			}else{
				$(this).css("border","2px solid skyblue");
			}
		});
		$('#uId').focusout(function(){
			if($(this).val().length==0){
				$(this).css("border","2px solid red");
				$(this).attr( 'placeholder', '아이디(필수 입력값입니다)' );
			}else{
			$(this).css("border","2px solid skyblue");
		}
		});
		$('#uPwd').focusout(function(){
			if($(this).val().length==0){
				$(this).css("border","2px solid red");
				$(this).attr( 'placeholder', '필수 입력값입니다' );
			}else{
				$('#uPwd').css("border","2px solid skyblue");
			}
		});
		
		$('#uPwd2').focusout(function(){
			var a = $(this).val();
			var b = $('#uPwd').val();
			if(a!="" || b!=""){
				if(a==b){
					$('#bad').hide();
					$('#good').show();
					$('#uPwd2').css("border","2px solid skyblue");
					
				}else{
					$('#good').hide();
					$('#bad').show();
					$('#uPwd2').css("border","2px solid red");
				}
			}
		});
		
		$('#sign').click(function(){
			if($('#uName').val().length==0){
				alert('성명을 입력해주세요');
				event.preventDefault();
				$('#uName').focus();
			}
			else if($('#uId').val().length==0){
				alert('아이디를 입력해주세요');
				event.preventDefault();
				$('#uId').focus();
			}
			else if($('#uPwd').val().length==0){
				alert('비밀번호를 입력해주세요');
				event.preventDefault();
				$('#uPwd').focus();
			}
			else if(!($('#uPwd').val()==$('#uPwd2').val())){
				alert('비밀번호가 같은지 확인하세요');
				event.preventDefault();
				$('#uPwd2').focus();
			}else if($('#chkId').val()!='Y'){
				alert('아이디 중복확인을 하세요');
				event.preventDefault();
				$('#uId').focus();
			}else if(!$('#agree').is(':checked')){
				alert('가입진행에 동의해주세요');
				event.preventDefault();
				$('#agree').focus();
			}
				
		});
		
		var checkid;
		$('#uId').keyup(function(){
			var s = $('#uId').val();
		     iWin.location.href="<%=request.getContextPath()%>/main/A/register/idChk.jsp?id="+s;

		});
	});
	
	
</script>

<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-78" data-genuitec-path="<%=request.getContextPath() %> /A/register/register.jsp" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-3" data-genuitec-path="/Jeon190608/WebContent/A/register/register.jsp">
<jsp:useBean id="u_vo" class="com.brar3.model.user.UserInfoVO" scope="session"><jsp:setProperty property="*" name="u_vo"/></jsp:useBean>

  <div class="container-scroller" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-78" data-genuitec-path="/JeonSemi/WebContent/A/register/register.jsp" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-3" data-genuitec-path="/Jeon190608/WebContent/A/register/register.jsp">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth px-0">
        <div class="row w-100 mx-0">
          <div class="col-lg-6 mx-auto">
            <div class="auth-form-light text-left py-5 px-4 px-sm-5" style="width: 600px">
              <div class="brand-logo">
                <img src="../../images/logo.svg" alt="logo">
              </div>
              <h4>처음이신가요???</h4>
              <h6 class="font-weight-light">회원가입을 진행합니다</h6>
              <form class="pt-3" name="frm1" method="post" action="register_ok.jsp">
              <fieldset>
              <legend>회원 가입</legend>
                <div class="form-group">
                  <input type="text" class="form-control form-control-lg" id="uName" name="uName" placeholder="성명" style="width: 300px">
                </div>
                <div class="form-group">
                  <input type="text" class="form-control form-control-lg" id="uId" name="uId" placeholder="아이디" style="width: 300px;display: inline">
                  <iframe style="width:150px; height:30px; background-color: white" id="iframe" src="#" name="iWin" scrolling="no"
                   frameborder=0 framespacing=0 marginheight=0 marginwidth=0 vspace=0></iframe>  <!--아이디 확인 -->
                </div>
                <div class="form-group">
                  <input type="password" class="form-control form-control-lg" id="uPwd" name="uPwd" placeholder="비밀번호" style="width: 400px">
                </div>
                <div class="form-group">
                  <input type="password" class="form-control form-control-lg" id="uPwd2" name="uPwd2" placeholder="비밀번호 확인" style="width: 400px">
                	<br>
                	<button type="button" class="btn btn-primary btn-icon-text" id="good" style="display: none">
                          <i class="mdi mdi-file-check btn-icon-prepend" style="margin: 0px"></i>
                         	 잘했어요
                    </button>
                    
                    <button type="button" class="btn btn-success btn-icon-text" style="background-color: red;display: none" id="bad">
                          <i class="mdi mdi-alert btn-icon-prepend" style="margin: 0px"></i>                                                    
                          불일치
                    </button>
                </div>
                <div class="form-group">
                <div>
                	
                </div>
                  <input type="text" class="form-control form-control-lg" id="zipcode" name="zipcode "placeholder="우편번호" style="width: 300px;display: inline">&nbsp;
                  <button type="button" class="btn btn-success btn-lg" onclick="zipcode111()" style="width: 150px;display: inline">검색</button>
                </div>
                <div class="form-group">
                  <input type="text" class="form-control form-control-lg" id="uAddr1" name="uAddr1" placeholder="주소">
                </div>
                <div class="form-group">
                  <input type="text" class="form-control form-control-lg" id="uAddr2" name="uAddr2" placeholder="상세주소(직접입력)">
                </div>
                <div class="form-group">
                  <input type="text" class="form-control form-control-lg" id="phone" name="phone" placeholder="전화번호(최대 13자리)" onkeyup="inputPhoneNumber(this)" maxlength="13">
                </div>
                <div class="form-group">
                  <input type="email" class="form-control form-control-lg" id="email" name="email" placeholder="이메일">
                </div>
                <div class="mb-4">
                  <div class="form-check">
                    <label class="form-check-label text-muted">
                      <input type="checkbox" class="form-check-input" id="agree">
                      가입 진행에 동의합니다
                    </label>
                  </div>
                </div>
                <div class="mt-3">
                	<input type="submit" value="회원가입" id="sign" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn">
                </div>
                <div class="text-center mt-4 font-weight-light">
                  이미 가입된 아이디가 있나요? <a href="../login/login.jsp" class="text-primary">Login</a>
                </div>
                </fieldset>
                <input type ="hidden" name="chkId" id="chkId" value="Y">
              </form>
            </div>
          </div>
        </div>
      </div>
      <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
  <!-- plugins:js -->
  <script src="../../vendors/base/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- inject:js -->
  <script src="../../js/off-canvas.js"></script>
  <script src="../../js/hoverable-collapse.js"></script>
  <script src="../../js/template.js"></script>
  <!-- endinject -->
</body>
</html>