<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../incs/top_mypage.jsp" %>
<c:import url="/mypage/sideMypage.do"/>


<!-- 아래부터 mypage 각자 코딩내용 작성 -->
<link href="<c:url value='/assets/css/style2.css'/>" rel="stylesheet">
<link href="<c:url value='/assets/css/lib/themify-icons.css'/>" rel="stylesheet">
<style>
.header{
	margin-left: 0px;
}
</style>
<%-- <script type="text/javascript">
	$(document).ready(function(){
		$.ajax({
    		url :"<c:url value='/main/mypage/filesUser.do'/>",
    		type: 'post',
    		data:{userno:${sessionScope.userNo}}
    		,
    		dataType: "json",
    		success : function(res) {
    			var $userfilelist=res;
    		}
    		});
	});
	
	$(document).ready(function(){
		
		$.ajax({
    		url :"<c:url value='/main/mypage/filesExpert.do'/>",
    		type: 'post',
    		data:{userno:${sessionScope.userNo}}
    		,
    		dataType: "json",
    		success : function(res) {
    			alert(res.length);
    			var $exfilelist=res;
    		}
    		});
	});
</script> --%>
		<div class="col-md-6" style="margin-left: 10%;width: inherit;">
			<div class="card">
						<div class="card-body p-b-0">
							<h4 class="card-title">${userName }님 자료실</h4>
						<!-- Nav tabs -->
						<ul class="nav nav-tabs customtab" role="tablist">
							<li class="nav-item"> <a class="nav-link active" data-toggle="tab" href="#home2" role="tab"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">내가 보낸 자료</span></a> </li>
							<li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#profile2" role="tab"><span class="hidden-sm-up"><i class="ti-user"></i></span> <span class="hidden-xs-down">전문가에게 받은 자료</span></a> </li>
							<!-- <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#messages2" role="tab"><span class="hidden-sm-up"><i class="ti-email"></i></span> <span class="hidden-xs-down">전문가 별 받은 자료</span></a> </li> -->
						</ul>
						<!-- Tab panes -->
						<div class="tab-content">
							<div class="tab-pane active" id="home2" role="tabpanel">
								<div class="p-20">
                                <div class="card-title">
                                    <h4>전문가 자료실 </h4>
                                    
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>상품 번호</th>
                                                    <th>상품 이름</th>
                                                    <th>파일 이름</th>
                                                    <th>다운로드</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            	<c:if test="${empty list1 }">
                                            	<tr>
                                                		<td>데이터가 존재하지 않습니다</td>
                                                	</tr>
                                                </c:if>
                                                 <c:if test="${!empty list1 }">
                                                <c:forEach var="vo" items="${list1 }">
                                                <tr>
                                                    <th scope="row">${vo['PRODUCT_NO'] }</th>
                                                    <td>${vo['PRODUCT_NAME'] }</td>
                                                    <td><span class="badge badge-danger">${vo['ORIGINAL_FILE_NAME'] }</span></td>
                                                    <td><a href="<c:url value='/main/mypage/filesdownload.do?fileName='/>${vo['FILES_NAME'] }" download="${vo['ORIGINAL_FILE_NAME'] }"><c:if test="${!empty vo['FILES_NAME'] }"><span class="ti-import"></span></c:if></a></td>
                                                </tr>
                                                </c:forEach>
                                                </c:if>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
								</div>
							</div>
							<div class="tab-pane  p-20" id="profile2" role="tabpanel">
								<div class="card-title">
                                    <h4>회원 자료실 </h4>
                                    
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>상품 번호</th>
                                                    <th>상품 이름</th>
                                                    <th>파일 이름</th>
                                                    <th>다운로드</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            	<c:if test="${empty list2 }">
                                            	<tr>
                                                		<td>데이터가 존재하지 않습니다</td>
                                                	</tr>
                                                </c:if>
                                                 <c:if test="${!empty list2 }">
                                                <c:forEach var="vo" items="${list2 }">
                                                <tr>
                                                    <th scope="row">${vo['PRODUCT_NO'] }</th>
                                                    <td>${vo['PRODUCT_NAME'] }</td>
                                                    <td><span class="badge badge-danger">${vo['ORIGINAL_FILE_NAME'] }</span></td>
                                                    <td><a href="<c:url value='/main/mypage/filesdownload.do?fileName='/>${vo['FILES_NAME'] }" download="${vo['ORIGINAL_FILE_NAME'] }"><c:if test="${!empty vo['FILES_NAME'] }"><span class="ti-import"></span></c:if></a></td>
                                                </tr>
                                                </c:forEach>
                                                </c:if>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
							</div>
							<div class="tab-pane p-20" id="messages2" role="tabpanel">3</div>
						</div>
					</div>
				</div>
		</div>
<!--아래는 mypage 공통 사용 코드  -->
			
					</div><!-- end col -->
				</div><!-- end row -->
			</div><!-- end container -->
		</section><!-- end section -->

<%@include file="../incs/bottom_main.jsp" %>
<!-- 화면별 고유 하단js 포함할 위치 -->
	<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/resources/js/parallax.js'/>"></script>
	<script src="<c:url value='/resources/js/animate.js'/>"></script>
	<script src="<c:url value='/resources/js/custom.js'/>"></script>

</body>
</html>