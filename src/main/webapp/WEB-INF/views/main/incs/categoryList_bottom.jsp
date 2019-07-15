<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${!empty btCatList }">
	<c:forEach var="vo" items="${btCatList }">
		<li><a href="#">${vo.categoryNameL }</a></li>
	</c:forEach>
</c:if>
