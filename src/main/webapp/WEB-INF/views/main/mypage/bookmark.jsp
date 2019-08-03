<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../incs/top_mypage.jsp" %>
<%@include file="../incs/side_mypage.jsp" %>

<!-- 아래부터 mypage 각자 코딩내용 작성 -->
<script type="text/javascript" src="<c:url value='/resources/js/jquery.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var tag=0;
		$('#chkAll').click(function(){
			if(tag==0){
				$('.chk input[type=checkbox]').prop('checked','checked');
				$('#chkAll').prop('value','선택해제');
				tag=1;
			}else{
				$('.chk input[type=checkbox]').prop('checked','');
				$('#chkAll').prop('value','전체선택');
				tag=0;
			}
		});
		
		$('#chkDel').click(function(){
			var len = $('.chk input[type=checkbox]:checked').length;
			if(len<1){
				alert('먼저 삭제할 항목을 체크하세요!!');
				return;
			}
			if(confirm("선택한 즐겨찾기 항목을 삭제하시겠습니까?")){
				$('form[name=frmList]').submit();
			}else{  //삭제 취소
				event.preventDefault();
			}	
		});
	});
</script>
<style>
	#ch{
		width:24px;
		height:24px;
	}
</style>
			<div style="font-size:30px;  font-weight:bolder; float: left;">즐겨찾기</div>
			<div style="float: right;">
				<input type="button" name="chkAll" id="chkAll" class="btn btn-warning" value="전체선택">&nbsp;&nbsp;
				<input type="button" name="chkDel" id="chkDel" class="btn btn-danger" value="선택삭제">
			</div>   
			<div style="clear: both;"></div>
			<form name="frmList" method="post" action="<c:url value='/mypage/bookmarkDel.do'/>">
				<c:if test="${!empty list }">
					<c:set var="idx" value="0"></c:set>
					<c:forEach var="map" items="${list }">
						<div class="col-md-6 col-sm-6">
							<div class="ebook-details copybox row">
								<div class="col-md-4">
									<a href="<c:url value='/main/menuinfo/menuinfo_List.do?expertNo=${map["EXPERT_NO"] }'/>">
										<img src="<c:url value='/upload/expert/${map["FILE_NAME"] }'/>" alt="전문가 이미지" class="img-responsive"
										onerror="this.onerror=null;this.src='/jamong/upload/expert/2.png'">
										
									</a>
								</div>
								<div class="col-md-8">
									<div class="chk" style="float: right;">
										<input type="checkbox" name="bookmarkItems[${idx }].bookmarkNo" id="ch"
											value="${map['BOOKMARK_NO']}" >
									</div>
									<div class="book-details">
										<small style="font-weight: bold;">${map['MAJOR'] }</small>
										<h3>${map['ID'] }</h3>
										<p style="font-size: 0.9em; ">
										${fn:substring(map['INTRODUCTION'],0,36) }</p>
										<!-- <a href="#" class="btn btn-transparent">View All</a> -->
									</div><!-- end details -->
								</div><!-- end col -->
							</div><!-- end ebook-details -->
						</div><!-- end col -->
						<c:set var="idx" value="${idx+1 }"></c:set>
					</c:forEach>
				</c:if>
			</form>
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