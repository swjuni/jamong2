<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript">
	var $flag = 0;
	function left(){
		if ($flag == 0) {
			$flag=1;	//연속 클릭 이벤트 중복 방지 플레그
			$("#todayDiv div").first().animate({"margin-top": '-=65'},"slow", function(){
				$("#todayDiv div").first().appendTo("#todayDiv");
				$("#todayDiv div").attr("style","margin: 2px 0;");
				$flag=0;
			});
			
		}
	}  
	
	function right(){
		if ($flag == 0) {
			$flag=1;	//연속 클릭 이벤트 중복 방지 플레그
			$("#todayDiv div").last().prependTo("#todayDiv");
			$("#todayDiv div").first().attr("style","margin-top: -65px;");
			$("#todayDiv div").first().animate({"margin-top": '+=65'},"slow", function(){
				$("#todayDiv div").attr("style","margin: 2px 0;");
				$flag=0;
			});    
		}
	}
	
</script>
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
    font-size: 12px;
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
    margin-left: 20px;
    font-size:12px;
    font-family: Malgun Gothic,'맑은 고딕',dotum, 돋움, sans-serif;
    font-weight:bold;
    color:#666;
}
.intext-text1-korean2 {
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
.intext-text1-korean2:hover {color:#FF6173;}

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
    margin-left: 7px;
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
#todayDiv{
	overflow: hidden;
    height: 210px;
    width: inherit;
    position: absolute;
    overflow-x: auto;
}
</style>
	<div id="stv2">
		<div id="stv2_list">
			<!-- 장바구니, 관심상품, 구매하기 -->
			<h2>빠른이동</h2>
			<div style="position: absolute;">
				<div class="hexagon2">
					<a href="<c:url value="/mypage/mypage.do?userNo=${sessionScope.userNo }"/>">
					<span class="intext-text3">
					<img src="/jamong/resources/images/l_3.png" style="opacity: 0.5"
							onmouseover="this.style.opacity='0.9'"
							onmouseout="this.style.opacity='0.5'" alt="자료실">
					</span>
					<span class="intext-text3-korean">마이페이지</span></a>
				</div>

				<div class="hexagon2">
					<a href="<c:url value='/mypage/bookmark.do'/>">
					<span class="intext-text2">
					<img src="/jamong/resources/images/l_2.png" style="opacity: 0.5"
							onmouseover="this.style.opacity='0.9'"
							onmouseout="this.style.opacity='0.5'" alt="즐겨찾기"></span>
					<span class="intext-text2-korean">즐겨찾기</span></a>
				</div>
				<c:if test="${empty sessionScope.userNo }">
					<div class="hexagon2">
						<a href="<c:url value="/main/userlogin/login.do"/>">
						<span class="intext-text1">
						<img src="/jamong/resources/images/l_1.png" style="opacity: 0.5"
								onmouseover="this.style.opacity='0.9'"
								onmouseout="this.style.opacity='0.5'" alt="구매관리"></span>
						<span class="intext-text1-korean">로그인</span></a>
					</div>
				</c:if>
				<c:if test="${!empty sessionScope.userNo }">
					<div class="hexagon2">
						<a href="<c:url value="/main/userlogin/logout.do"/>">
						<span class="intext-text1">
						<img src="/jamong/resources/images/l_1.png" style="opacity: 0.5"
								onmouseover="this.style.opacity='0.9'"
								onmouseout="this.style.opacity='0.5'" alt="구매관리"></span>
						<span class="intext-text1-korean2">로그아웃</span></a>
					</div>
				</c:if>
				
				<!-- <div class="hexagon2-line2"></div> -->
			</div>
			
			<!-- 최근 본 상품 -->
			<c:if test="${!empty ckMenuList }">
				<c:if test="${fn:length(ckMenuList) >0 }">
					<h2 style="position: absolute; top: 240px;">최근본상품</h2>
				</c:if>
				
				<c:if test="${fn:length(ckMenuList) >3 }">
					<h3 style="position: absolute; top: 265px;"
						onmouseover="this.style.opacity='1'"
						onmouseout="this.style.opacity='0.6'" onclick="left()">▲</h3>
				</c:if> 
				
				<div style="position: absolute; top: 265px; height: 210px;" id="todayDiv">
				<script type="text/javascript">
					var t = document.getElementById("todayDiv");
					if(${fn:length(ckMenuList)}>3){
						t.style.top="282px";
					};
				</script>
				<!-- 최근본 상품 반복문 -->
					<c:forEach var="i" begin="0" end="${(fn:length(ckMenuList))-1 }">
						<div class="todayview">
							<a href="<c:url value='/main/menuinfo/menuinfo_Detail.do?productNo=${ckMenuList[i].productNo}'/>">
							<img src="/jamong/upload/image/${ckImageList[i].fileName }" style="opacity: 0.5; width: 100%; height: 100%"
									onmouseover="this.style.opacity='1'"
									onmouseout="this.style.opacity='0.7'" alt="${ckMenuList[i].productName }"></a>
						</div>
					</c:forEach>
				</div>
				<c:if test="${fn:length(ckMenuList) >3 }">
					<h3 style="position: absolute; top: 490px;"
						onmouseover="this.style.opacity='1'"
						onmouseout="this.style.opacity='0.6'" onclick="right()">▼</h3> 
				</c:if>
			</c:if>
		</div>
	</div> 
	<!-- } 오늘 본 상품 끝 -->