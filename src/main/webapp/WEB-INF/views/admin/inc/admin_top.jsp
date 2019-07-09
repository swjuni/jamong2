<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Jamong: Admin UI</title>
        
	    <!-- 관리자 홈 head link include -->
		<%@include file="top_link.jsp" %>

    </head>
    <body>
    <!-- 관리자 홈 좌측 사이드 메뉴 include -->
	<%@include file="sidebar.jsp" %>
    <!-- 관리자 홈 상단 헤더 메뉴 include -->
	<%@include file="header.jsp" %>
	<script type="text/javascript" src="<c:url value='/assets/js/lib/jquery.min.js'/>"></script>
