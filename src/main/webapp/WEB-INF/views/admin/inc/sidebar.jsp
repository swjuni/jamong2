<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="sidebar sidebar-hide-to-small sidebar-shrink sidebar-gestures">
    <div class="nano">
        <div class="nano-content">
            <div class="logo"><a href="<c:url value='/admin/index_admin.do'/>"><!-- <img src="assets/images/logo.png" alt="" /> --><span>Jamong</span></a></div>
            <ul>
                <li class="label">Main</li>
                <li><a class="sidebar-sub-toggle"><i class="ti-home"></i> 마이페이지 <span class="sidebar-collapse-icon ti-angle-down"></span></a>
                    <ul>
                        <li><a href="<c:url value='/admin/index_admin.do'/>">메인페이지로 이동</a></li>
                        <li><a href="<c:url value='/admin/login/logout.do'/>">로그아웃</a></li>
                    </ul>
                </li>
                <li class="label">회원 관리</li>
                <li><a class="sidebar-sub-toggle"><i class="ti-user"></i>관리자  <span class="sidebar-collapse-icon ti-angle-down"></span></a>
                    <ul>
		                <li><a href="<c:url value='/admin/manage/grade.do'/>"><i class="ti-user"></i>등급 관리</a></li>
		                <li><a href="<c:url value='/admin/manage/sub_admin.do'/>"><i class="ti-user"></i>부 관리자 등록</a></li>
                	</ul>
                </li>
                <li><a href="<c:url value='/admin/member/memberList.do'/>"><i class="ti-user"></i>개인회원</a></li>
                <li><a class="sidebar-sub-toggle"><i class="ti-user"></i>전문가회원  <span class="sidebar-collapse-icon ti-angle-down"></span></a>
                    <ul>
		                <li><a href="<c:url value='/admin/expert/expertList.do'/>"><i class="ti-user"></i>전문가 목록</a></li>
		                <li><a href="<c:url value='/admin/expert/reportedExpert.do'/>"><i class="ti-user"></i>신고 목록</a></li>
                	</ul>
                </li>
                
                <li class="label">서비스</li>
                <li><a class="sidebar-sub-toggle"><i class="ti-layout"></i> 상품/카테고리 <span class="sidebar-collapse-icon ti-angle-down"></span></a>
                    <ul>
                        <li><a href="<c:url value='/admin/categoryl/categoryList.do'/>">카테고리 대구분</a></li>
                        <li><a href="<c:url value='/admin/categorym/categoryList.do'/>">카테고리 중구분</a></li>
                        <li><a href="<c:url value='/admin/menuinfo/menuinfoList.do'/>">상품 목록</a></li>
                    </ul>
                </li>

                <li class="label">게시판</li>
                <li><a class="sidebar-sub-toggle"><i class="ti-layout-grid4-alt"></i> 기본 게시판 <span class="sidebar-collapse-icon ti-angle-down"></span></a>
                    <ul>
                        <li><a href="<c:url value='/admin/announcce/announcceList.do'/>">공지사항</a></li>
                        <li><a href="<c:url value='/admin/faq/faqList.do'/>">FAQ</a></li>
                        <li><a href="<c:url value='/admin/evaluation/evaluationList.do'/>">서비스 평가</a></li>
                        <li><a href="<c:url value='/admin/guide/guideList.do'/>">안내 페이지 관리 </a></li>
                    </ul>
                </li>
                
                <li class="label">기타관리</li>
      
                
	            <li><a href="<c:url value='/admin/bannerexpoert/bannerList.do'/>"><i class="ti-panel"></i> 전문가 배너</a></li>
                
                <li><a class="sidebar-sub-toggle"><i class="ti-bar-chart-alt"></i> 통계 <span class="sidebar-collapse-icon ti-angle-down"></span></a>
                    <ul>
                        <li><a href="<c:url value='/admin/statistics/User_statistics.do'/>">회원</a></li>
                        <li><a href="<c:url value='/admin/statistics/Sales_statistics.do'/>">매출</a></li>
                    </ul>
                </li>
                <li><a href="<c:url value='/admin/manage/send.do'/>"><i class="ti-email"></i> 회원 메일 발송</a></li>
            </ul>
        </div>
    </div>
</div>
<!-- /# sidebar -->