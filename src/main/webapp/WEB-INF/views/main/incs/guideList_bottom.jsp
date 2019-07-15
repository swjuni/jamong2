<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${!empty list }">
	<c:forEach var="vo" items="${list }">
		<li><a href="<c:url value="/main/guide/guideIntro.do?guideNo=${vo.guideNo }"/>">${vo.pageName }</a></li>
	</c:forEach>
</c:if>
