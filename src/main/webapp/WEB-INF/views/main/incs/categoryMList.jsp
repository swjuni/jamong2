<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach begin="0" end="7" var="vo" items="${list }">
	<div class="case-box cateM">
		<img src="<c:url value='/upload/categoryM/${vo.imgName }'/>" alt="" style="width: 100%; height: 100%;">
		<p>${vo.categoryName }</p>
		<div class="magnifier">
			<a href="<c:url value='/main/menuinfo/menuinfo_List.do?categoryNoL=
					${vo.categoryNoL }&categoryNoM=${vo.categoryNoM }'/>"><i class="fa fa-link"></i></a> 
		</div>
	</div>
</c:forEach>
