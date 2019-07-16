<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<footer class="footer primary-footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 col-sm-4">
                    	<div class="widget clearfix">
                    		<h4 class="widget-title">자몽 사업자 정보</h4>
                    		<div class="newsletter-widget">
								<p>서울시 서초구 서초4동 서초W타워 13층</p>
								<p>대표 : 레몬 | 개인정보보호책임 : 자두</p>
								<p>사업자등록번호 : 100-10-20000</p>
								<p>통신판매업신고 : 2019-서울서초-00000호</p>
								<p>+82 2-532-6500|help@jamong.com</p>
                    		</div><!-- end newsletter -->
                    	</div><!-- end widget -->
                    </div><!-- end col -->
                    <div class="col-md-2 col-sm-2">
                    </div><!-- end col -->
                    
                    <div class="col-md-2 col-sm-2">
                    	<div class="widget clearfix">
                    		<h4 class="widget-title">SERVICE</h4>
                    		<ul>
                   				<c:import url="/main/categoryList_bottom.do"/>
                    		</ul>
                    	</div><!-- end widget -->
                    </div><!-- end col -->

                    <div class="col-md-2 col-sm-2">
                    	<div class="widget clearfix">
                    		<h4 class="widget-title">GUIDE</h4>
                    		<ul>
                    			<c:import url="/main/guide/guideList_bottom.do"/>
                    		</ul>
                    	</div><!-- end widget -->
                    </div><!-- end col -->


                    <div class="col-md-2 col-sm-2">
                    	<div class="widget clearfix">
                    		<h4 class="widget-title">NOTICE</h4>
                    		<ul>
                    			<li><a href="<c:url value="/main/announcce/announcceServiceList.do"/>">공지사항</a></li>
                    			<li><a href="<c:url value="/main/faq/faqServiceList.do"/>">FAQ</a></li>
                    			<li><a href="<c:url value="/main/guide/contact.do"/>">Contact</a></li>
                    		</ul>
                    	</div><!-- end widget -->
                    </div><!-- end col -->
                </div><!-- end row -->
           	</div><!-- end container -->
		</footer><!-- end primary-footer -->

		<footer class="footer secondary-footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <p>2010 - 2018 &copy;The <a href="#">SeoTime</a> SEO Solutions INC. All rights reserved.</p>
                    </div>

                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <ul class="list-inline">
                            <li>Designed: <a href="https://html.design">HTML Design</a></li>
                        </ul>
                    </div><!-- end col -->
                </div><!-- end row -->
            </div><!-- end container -->
		</footer><!-- end second footer -->
	</div><!-- end wrapper -->
