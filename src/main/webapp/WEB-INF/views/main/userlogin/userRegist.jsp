<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Jamong 회원가입</title>

    <!-- ================= Favicon ================== -->
    <!-- Standard -->
    <link rel="shortcut icon" href="http://placehold.it/64.png/000/fff">
    <!-- Retina iPad Touch Icon-->
    <link rel="apple-touch-icon" sizes="144x144" href="http://placehold.it/144.png/000/fff">
    <!-- Retina iPhone Touch Icon-->
    <link rel="apple-touch-icon" sizes="114x114" href="http://placehold.it/114.png/000/fff">
    <!-- Standard iPad Touch Icon-->
    <link rel="apple-touch-icon" sizes="72x72" href="http://placehold.it/72.png/000/fff">
    <!-- Standard iPhone Touch Icon-->
    <link rel="apple-touch-icon" sizes="57x57" href="http://placehold.it/57.png/000/fff">

    <!-- Styles -->
    <link href="<c:url value="/assets/css/lib/font-awesome.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/assets/css/lib/themify-icons.css"/>"  rel="stylesheet">
    <link href="<c:url value="/assets/css/lib/bootstrap.min.css"/>"  rel="stylesheet">
    <link href="<c:url value="/assets/css/lib/helper.css"/>"  rel="stylesheet">
    <link href="<c:url value="/assets/css/style.css"/>"  rel="stylesheet">
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/jquery.min.js"/>"></script>
    <script type="text/javascript">
 		$(document).ready(function(){
 		});
    	function zipcode123(){
        new daum.Postcode({
            oncomplete: function(data) {
            	var zip=document.getElementById('zipcode');
            	var addr=document.getElementById('address');
               	zip.value=data.zonecode;
               	addr.value=data.roadAddress;
               	zip.readOnly = true;
               	addr.readOnly = true;
               	
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
    	
    	var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    	$(function(){
    		$('#name').focusout(function(){//값 없을시 필수입력이라는 표시 출력
    			if($(this).val().length==0){
    				$(this).css("border","2px solid red");
    				$(this).attr( 'placeholder', '성명(필수 입력값입니다)' );
    			}else{
    				$(this).css("border","2px solid skyblue");
    			}
    		});
    		$('#id').focusout(function(){
    			if($(this).val().length==0){
    				$(this).css("border","2px solid red");
    				$(this).attr( 'placeholder', '아이디(필수 입력값입니다)' );
    			}else{
    			$(this).css("border","2px solid skyblue");
    		}
    		});
    		$('#pwd').focusout(function(){
    			if($(this).val().length==0){
    				$(this).css("border","2px solid red");
    				$(this).attr( 'placeholder', '필수 입력값입니다' );
    			}else{
    				$(this).css("border","2px solid skyblue");
    			}
    		});
    		
    		$('#pwdchk').focusout(function(){
    			if(!($('#pwd').val()==$('#pwdchk').val())){
    				$(this).css("border","2px solid red");
    			}else{
    				$(this).css("border","2px solid skyblue");
    			}
    		});
    		
    	//가입 누를때 입력 안된사항들 체크
    	$('#sign').click(function(){
			if($('#name').val().length==0){
				alert('성명을 입력해주세요');
				event.preventDefault();
				$('#name').focus();
			}
			else if($('#id').val().length==0){
				alert('아이디를 입력해주세요');
				event.preventDefault();
				$('#id').focus();
			}else if(!emailRule.test($('#id').val())){
				alert('아이디는 이메일 형식을 따라 입력해주세요');
				event.preventDefault();
				$('#id').focus();
			}
			else if($('#pwd').val().length==0){
				alert('비밀번호를 입력해주세요');
				event.preventDefault();
				$('#pwd').focus();
			}
			else if(!($('#pwd').val()==$('#pwdchk').val())){
				alert('비밀번호가 같은지 확인하세요');
				event.preventDefault();
				$('#pwdchk').focus();
			}else if($('#chkId').val()!='Y'){
				alert('중복된 아이디입니다');
				event.preventDefault();
				$('#id').focus();
			}else if(!$('#agree').is(':checked')){
				alert('가입진행에 동의해주세요');
				event.preventDefault();
				$('#agree').focus();
			}else if($('#emailCheckA').val()!='true'){
				alert('이메일 인증을 완료해주세요, 완료하셨다면 새로고침');
				event.preventDefault();
				$('#id').focus();
			}
				
		});
    	var $address="";
    	$('#id').keyup(function(){
    		var $checkid = $(this).val();
    		var $mailc = "window.open('http://172.16.146.14:9090/jamong/main/userlogin/userRegistMail.do?email="+$('#id').val()+
    				"','체크','width=430,height=500,location=no,status=no,scrollbars=yes');";
    		$('#emailCkButton').attr('onclick',$mailc);
    		$.ajax({
	    		url :"<c:url value='/main/userlogin//userCheckId.do'/>",
	    		type: 'post',
	    		data:{
	    			id:$checkid
	    		},
	    		dataType: "json",
	    		success : function(res) {
	    		if(res>0){
	    			$('#chkId').val('N');
	    			$('#overlap').css('visibility','visible');
	    		}else{
	    			$('#chkId').val('Y');
	    			$('#overlap').css('visibility','hidden');
	    		}
	    		}
	    		});
    	});
    	
    	setInterval(function(){
    		var $abcd='${email}';
       		if($abcd.length>0){
       			$('#emailCheckA').val('true');
       			$('#emailCkButton').css('display','none');
       			$('#emailOkButton').css('display','inline');
       			$('#id').val($abcd);
       			$('#id').prop('readonly','readonly');
       		}	
       		},1000);
    	
    	
    });
    </script>
</head>

<body id="gradient">

    <div class="unix-login">
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <div class="login-content" style="width:70%;margin: auto;">
                        <div class="login-logo">
                            <a href="<c:url value="/main/index_main.do"/>"><span>Jamong 메인 페이지</span></a>
                        </div>
                        <div class="login-form" style="padding: 10%">
                            <h4>Jamong 회원가입</h4>
                            <form action="<c:url value='/main/userlogin/userRegist.do'/>" method="post">
                                <div class="form-group">
                                    <label>아이디(이메일)</label>
                                    <input type="email" class="form-control" placeholder="Email(ex@jamong.com)" id="id" name="userId"
                                    value=>
                                    <input type="text" value="false" id="emailCheckA" style="display: none;">
                                    <p style="color:red;visibility:hidden; " id="overlap">중복된 아이디(이메일)입니다</p>
                                   	<button type="button" value="확인 메일 전송" class="btn btn-primary btn-flat m-b-30 m-t-30" id="emailCkButton" 
                                   	 onclick=""> 이메일 확인 </button>
                                   	<button type="button" value="확인 되었습니다" class="btn btn-success m-b-10 m-l-5" id="emailOkButton" style="display: none">확인 되었습니다</button>
                                   	
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
                                    <button type="button" class="btn btn-primary btn-flat m-b-30 m-t-30" onclick="zipcode123()" style="width:40%;display:inline;">우편번호</button>
                                </div>
                                <div class="form-group">
                                    <label>주소</label>
                                    <input type="text" class="form-control" placeholder="Address" id="address" name="address">
                                </div>
                                <div class="form-group">
                                    <label>상세 주소</label>
                                    <input type="text" class="form-control" placeholder="AddressDetail" id="addressDetail" name="addressDetail">
                                </div>
                                
                                <div class="checkbox">
                                    <label>
										<input type="checkbox" id="agree"> 가입에 동의합니다
									</label>
                                </div>
                                <button type="submit" class="btn btn-primary btn-flat m-b-30 m-t-30" id="sign">회원가입</button>
                           
                                <div class="register-link m-t-15 text-center">
                                    <p>회원가입 하셨다구요 ? <a href="<c:url value="/main/userlogin/login.do"/>"> 로그인하러 가기</a></p>
                                   
                                </div>
                                <input type ="hidden" name="chkId" id="chkId" value="N">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
<script src="<c:url value='/assets/js/lib/jeoncss/loginback.js'/>"></script>

</html>