<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${!empty btCatList }">
	<c:forEach var="vo" items="${btCatList }">
		<li><a href="<c:url value='/main/menuinfo/menuinfo_List.do?categoryNoL=${vo.categoryNo }'/>">
		${vo.categoryNameL }</a></li>
	</c:forEach>
</c:if>
