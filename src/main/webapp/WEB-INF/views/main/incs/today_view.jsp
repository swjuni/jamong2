<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style type="text/css">
/* 오늘 본 상품(왼쪽) */
#stv2 {
	z-index:1001;
	right:0px;
	width:100px;
	position: fixed; /*최상단으로 나오게 - 스크롤에 따라 위아래로 이동*/
	margin:150px 0 0; 
}
#stv2_list {
	position:absolute;
	width:74px;
	border:0px solid #aaa;/*background:#fff*/
}
#stv2_list h2 {
	margin:0px auto;
	padding:7px 0 5px;
	background:#f58e67;
	border-bottom:0px /*solid*/dotted #aaa;
	width:100%;
	font-weight:bold;
	font-size:12px;
	font-family:Malgun Gothic;
	color:#fff;
	text-align:center;
	letter-spacing:-0.1em
}
#stv2_list h3 {
    margin: 0px auto;
    padding: 2px;
    background: linear-gradient(0deg, black, transparent);
    width: 100%;
    font-size: 10px;
    color: #fff;
    text-align: center;
    opacity: 0.6;
    cursor: pointer;
}
			   
/* 육각도형 */
.hexagon2 {
    position: relative;
    width: 74px;
    height: 65px;
    background-color: gainsboro;
    margin: 2px 0;
    padding-top: 10px;
    border-left: solid 0px #bbb;
    border-right: solid 0px #bbb;
    float: left;
}
.hexagon2:hover {
    position: relative;
    width: 74px;
    height: 65px;
    background-color: gold;
    margin: 2px 0;
    padding-top: 10px;
    border-left: solid 0px #bbb;
    border-right: solid 0px #bbb;
    float: left;
}
/* 
.hexagon2:before,
.hexagon2:after {
  content: "";
  position: absolute;
  z-index: 1;
  width: 53.03px;
  height: 53.03px;
  -webkit-transform: scaleY(0.5774) rotate(-45deg);
  -ms-transform: scaleY(0.5774) rotate(-45deg);
  transform: scaleY(0.5774) rotate(-45deg);
  background-color: inherit;
  left: 10px;
}

.hexagon2:before {
  top: -26.5165px;
    border-top: solid 1px #bbb;
    border-right: solid 1px #bbb;
}

.hexagon2:after {
  bottom: -26.5165px;
    border-bottom: solid 1px #bbb;
    border-left: solid 1px #bbb;
}
 */
/* 육각형 연결라인 */
.hexagon2-line {
    float: left;
    width: 10px;
    height: 0px;
    background: #888;
    margin-top: 60px; margin-bottom: 30px;
}

/* 육각형 연결라인 */
.hexagon2-line2 {
    float: left;
    width: 10px;
    height: 0px;
    background: #888;
    margin-top: 60px; margin-bottom: 30px;
}

/* 텍스트 - text1 */
.intext-text1 {
    float: left;
	position:absolute;
    z-index: 11;
    margin-top: -3px;
    margin-left: 26px;
    font-size: 22px;
    color:#696969;
}
.intext-text1:hover {color:#FF6173;}

/* 텍스트 - text1 */
.intext-text1-korean {
    float: left;
	position:absolute;
    z-index: 11;
    margin-top: 25px;
    margin-left: 13px;
    font-size:12px;
    font-family: Malgun Gothic,'맑은 고딕',dotum, 돋움, sans-serif;
    font-weight:bold;
    color:#666;
}
.intext-text1-korean:hover {color:#FF6173;}

/* 텍스트 - text2 */
.intext-text2 {
    float: left;
	position:absolute;
    z-index: 11;
    margin-top: -4px;
    margin-left: 27px;
    font-size: 22px;
    color:#696969;
}
.intext-text2:hover {color:#FF6173;}

/* 텍스트 - text2 */
.intext-text2-korean {
    float: left;
	position:absolute;
    z-index: 11;
    margin-top: 24px;
    margin-left: 13px;
    font-size:12px;
    font-family: Malgun Gothic,'맑은 고딕',dotum, 돋움, sans-serif;
    font-weight:bold;
    color:#666;
}
.intext-text2-korean:hover {color:#FF6173;}

/* 텍스트 - text3 */
.intext-text3 {
    float: left;
	position:absolute;
    z-index: 11;
    margin-top: -4px;
    margin-left: 27px;
    font-size: 22px;
    color:#696969;
}
.intext-text3:hover {color:#FF6173;}

/* 텍스트 - 관심상품 */
.intext-text3-korean {
    float: left;
	position:absolute;
    z-index: 11;
    margin-top: 25px;
    margin-left: 19px;
    font-size:12px;
    font-family: Malgun Gothic,'맑은 고딕',dotum, 돋움, sans-serif;
    font-weight:bold;
    color:#666;
}
.intext-text3-korean:hover {color: #FF6173;}

.todayview {
    position: relative;
    width: 74px;
    height: 65px;
    margin: 2px 0;
    float: left;
    text-align: center;
}
</style>
	<div id="stv2">
		<div id="stv2_list">
			<!-- 장바구니, 관심상품, 구매하기 -->
			<h2>빠른이동</h2>
			<div style="position: absolute;">
				<div class="hexagon2">
					<a href="#">
					<span class="intext-text1">
					<img src="/jamong/resources/images/l_1.png" style="opacity: 0.5"
							onmouseover="this.style.opacity='0.9'"
							onmouseout="this.style.opacity='0.5'" alt="구매관리"></span>
					<span class="intext-text1-korean">구매관리</span></a>
				</div>

				<div class="hexagon2">
					<a href="#">
					<span class="intext-text2">
					<img src="/jamong/resources/images/l_2.png" style="opacity: 0.5"
							onmouseover="this.style.opacity='0.9'"
							onmouseout="this.style.opacity='0.5'" alt="즐겨찾기"></span>
					<span class="intext-text2-korean">즐겨찾기</span></a>
				</div>

				<!-- <div class="hexagon2-line2"></div> -->
				<div class="hexagon2">
					<a href="#">
					<span class="intext-text3">
					<img src="/jamong/resources/images/l_3.png" style="opacity: 0.5"
							onmouseover="this.style.opacity='0.9'"
							onmouseout="this.style.opacity='0.5'" alt="자료실">
					</span>
					<span class="intext-text3-korean">자료실</span></a>
				</div>
			</div>
			
			<!-- 최근 본 상품 -->
			<h2 style="position: absolute; top: 240px;">최근본상품</h2>
			<h3 style="position: absolute; top: 265px;"
				onmouseover="this.style.opacity='1'"
				onmouseout="this.style.opacity='0.6'" onclick="">▲</h3> 
			<div style="position: absolute; top: 280px;">

			<!-- 최근본 상품 반복문 -->
				<c:forEach var="i" begin="0" end="${fn:length(ckMenuList) }">
					<div class="todayview">
						<a href="#">
						<img src="/jamong/upload/categoryM/${ckImageList[i].fileName }" style="opacity: 0.5; width: 100%; height: 100%"
								onmouseover="this.style.opacity='0.9'"
								onmouseout="this.style.opacity='0.5'" alt="${ckMenuList[i].productName }"></a>
					</div>
				</c:forEach>
			</div>
			<h3 style="position: absolute; top: 485px;"
				onmouseover="this.style.opacity='1'"
				onmouseout="this.style.opacity='0.6'" onclick="">▼</h3> 
			<button type="button" onclick="addCookie(2)" style="position: absolute; top: 585px; font-size: 0.9em;">쿠키추가</button> 
		</div>
	</div>
	<!-- } 오늘 본 상품 끝 -->
<script src="<c:url value='/resources/js/addCookie.js'/>"></script>