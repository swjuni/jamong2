<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Jamong 회원 로그인</title>

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
    <link href="<c:url value="/assets/css/lib/themify-icons.css"/>" rel="stylesheet">
    <link href="<c:url value="/assets/css/lib/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/assets/css/lib/helper.css"/>" rel="stylesheet">
    <link href="<c:url value="/assets/css/style.css"/>" rel="stylesheet">
    <link href="<c:url value="/assets/js/lib/jeoncss/loginWaveBack.css"/>" rel="stylesheet">
    <script type="text/javascript" src="<c:url value="/resources/js/jquery.min.js"/>"></script>
</head>
<style>
#gradient
{
  width: 100%;
  height: 800px;
  padding: 0px;
  margin: 0px;
}
</style>
<body class='box'><!--  id="gradient" -->

    <div class="unix-login" style="width: 300000em;">
        <div class="container-fluid">
        
            <div class="row justify-content-center">
            
                <div class="col-lg-6" style="display:contents;">
                    <div class="login-content">
                    
                        <div class="login-logo">
                        
                            <a href="<c:url value="/main/index_main.do"/>"><span style="color: #dc3545;font-weight: bold;">Jamong 메인 페이지</span></a>
                        </div>
                        <div class="login-form">
                            <h4>Jamong 회원 로그인</h4>
                            <form action="<c:url value='/main/userlogin/login.do'/>" method="post">
                            	<div class='wave -one'></div>
  								<div class='wave -two'></div>
  								<div class='wave -three'></div>
                                <div class="form-group">
                                    <label>아이디</label>
                                    <input type="email" class="form-control" placeholder="이메일 (ex@jamong.com)" id="userId" name="userId"
                                    value=${cookie.ck_userid.value }>
                                </div>
                                <div class="form-group">
                                    <label>비밀번호</label>
                                    <input type="password" class="form-control" placeholder="비밀번호" id="pwd" name="pwd">
                                </div>
                                <div class="checkbox">
                                    <label>
										<input type="checkbox" id="saveId" name="saveId" <c:if test="${!empty cookie.ck_userid }">
						checked="checked"
					</c:if>> 아이디를 기억
									</label>
                                    <label class="pull-right">
										<a href="<c:url value="/main/userlogin/SearchPwd.do"/>">비밀번호를 잊어버렸나요???</a>
									</label>

                                </div>
                                <button type="submit" class="btn btn-primary btn-flat m-b-30 m-t-30">로그인</button>
                                <div class="social-login-content">
                                    <div class="social-button">
                                    </div>
                                </div>
                                <div class="register-link m-t-15 text-center">
                                    <p>회원가입 하셨나요? <a href="<c:url value="/main/userlogin/userRegist.do"/>"> 회원가입 GOGO!</a></p>
                                </div>
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