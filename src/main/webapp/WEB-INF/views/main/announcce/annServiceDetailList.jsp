<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${!empty list }">
	<c:forEach var="map" items="${list }">
		<c:if test="${map['announceNo'] == param.announceNo }">
			<li style="color:#0C529F; margin: 10px 0;"><span style="color:#125687; font-size: 1.1em; font-weight: bold;">
			${map['announceNo'] } ${map['title'] }</span></li>
		</c:if>
		<c:if test="${map['announceNo'] != param.announceNo }">
			<li style="color:#2EA8BE; font-size: 0.9em;">${map['announceNo'] }
			<a href="<c:url value='/main/announcce/countUpdate.do?announceNo=${map["announceNo"] }'/>"
			 style="color:#2EA8BE; font-size: 0.9em; font-weight: bold;">${map['title'] }</a></li>
		</c:if>
	</c:forEach>
</c:if>	
