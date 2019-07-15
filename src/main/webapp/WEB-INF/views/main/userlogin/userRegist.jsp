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
    	function zipcode(){
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
    </script>
</head>

<body class="bg-primary">

    <div class="unix-login">
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <div class="login-content">
                        <div class="login-logo">
                            <a href="<c:url value="/main/index_main.do"/>"><span>Jamong 메인 페이지</span></a>
                        </div>
                        <div class="login-form">
                            <h4>Jamong 회원가입</h4>
                            <form>
                                <div class="form-group">
                                    <label>아이디(이메일)</label>
                                    <input type="email" class="form-control" placeholder="Email(ex@jamong.com)">
                                </div>
                                <div class="form-group">
                                    <label>비밀번호</label>
                                    <input type="password" class="form-control" placeholder="Password">
                                </div>
                                <div class="form-group">
                                    <label>비밀번호 확인</label>
                                    <input type="password" class="form-control" placeholder="Password">
                                </div>
                                <div class="form-group">
                                    <label>이름</label>
                                    <input type="text" class="form-control" placeholder="Name">
                                </div>
                                <div class="form-group">
                                    <label>전화번호</label>
                                    <input type="tel" class="form-control" placeholder="Email">
                                </div>
                                <div class="form-group">
                                    <label style="display:block">우편번호</label>
                                    <input type="text" class="form-control" placeholder="Zipcode" style="width:40%;display:inline;">
                                    <button type="button" class="btn btn-primary btn-flat m-b-30 m-t-30" onclick="zipcode()" style="width:40%;display:inline;">우편번호</button>
                                </div>
                                <div class="form-group">
                                    <label>주소</label>
                                    <input type="text" class="form-control" placeholder="Address">
                                </div>
                                <div class="form-group">
                                    <label>상세 주소</label>
                                    <input type="text" class="form-control" placeholder="AddressDetail">
                                </div>
                                
                                <div class="checkbox">
                                    <label>
										<input type="checkbox"> 약관에 동의합니다
									</label>
                                </div>
                                <button type="submit" class="btn btn-primary btn-flat m-b-30 m-t-30">회원가입</button>
                           
                                <div class="register-link m-t-15 text-center">
                                    <p>회원가입 하셨다구요 ? <a href="<c:url value="/main/userlogin/login.do"/>"> 로그인하러 가기</a></p>
                                   
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>

</html>