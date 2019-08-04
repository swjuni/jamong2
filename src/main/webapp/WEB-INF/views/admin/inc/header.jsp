<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- header -->
<div class="header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class="float-left">
                    <div class="hamburger sidebar-toggle">
                        <span class="line"></span>
                        <span class="line"></span>
                        <span class="line"></span>
                    </div>
                </div>
                <div class="float-right">
                    
                    <div>
                        <div class="header-icon">
                        <c:if test="${!empty adminName }">
                        <span class="user-avatar">관리자 : ${adminName}님
                            </span>
                        </c:if>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--/ header -->