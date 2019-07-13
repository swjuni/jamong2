<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach var="vo" items="${list }">
	<li class="dropdown yamm-fw hasmenu categoryNo"  value="${vo.categoryNo }">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="fa fa-angle-down">${vo.categoryNameL}</span></a>
		            <ul class="dropdown-menu">
		                <li>
		                    <div class="yamm-content">
			                    <div class="row"> 
			                    	<div class="col-md-4">
										<ul class="cateM">
			                    		</ul>
			                    	</div>
			                    	<div class="col-md-4">
										<ul>
			                    			<li><a href="page-services.html">All Services</a></li>
			                    			<li><a href="page-pricing.html">Pricing & Plans</a></li>
			                    			<li><a href="page-clients.html">Our Clients</a></li>
			                    			<li><a href="page-testimonials.html">Testimonials</a></li>
			                    			<li><a href="page-ebooks.html">Free E-Books</a></li>
			                    			<li><a href="page-seo-analysis.html">SEO Analysis</a></li>
			                    			<li><a href="case-studies.html">Case Studies</a></li>
			                    			<li><a href="case-studies-alt.html">Case Studies Alt</a></li>
			                    			<li><a href="case-studies-single.html">Case Studies Single</a></li>
			                    		</ul>
			                    	</div>
			                    </div>
		                    </div>
		                </li>
		            </ul>
                </li>
</c:forEach>