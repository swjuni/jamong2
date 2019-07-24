<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../incs/top_mypage.jsp"%>
<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$("select[name=major] option").dblclick(function(){
			$(this).hide();
			$("<option value='"+$(this).val()+"'>"+$(this).val()+"</option>").appendTo($("select[name=majorSelected]"));
		})
		
		$(document).on("dblclick",("select[name=majorSelected] option"),function(){
			$(this).remove();
			$("select[name=major] option[value='"+$(this).val()+"']").show();
		})
	})
</script>
<style type="text/css">
	.col-md-3{
		width: 290px;
    	margin-right: -40px;
	}
	
	.col-md-9{
		margin-left: 42px;
		margin-top: 5px;
	}
	
	.mb30 {
		margin-top: 12px;
	    width: 250px;
	    height: 1000px;
	}

	.col-md-5 {
		margin-top: 9px;
	    width: 665px;
	    height: 1000px;
	}
	
	.agreement{
		width: 685px;
	    height: 390px;
	    margin-left: -205px;
	    margin-top: 95px;
	}
	
	.form-group {
		margin-bottom: 35px;
	}
	
	.contact-details li{
   		margin-bottom: 42px;
   	 	border-bottom: none;
	}
	
	button{
		margin-left: 70px;
	}
	
	.service-list .col-md-4 {
	    width: 241px;
	}
	
	h4{
		font-size: 18px;
		padding: 0;
	}
	li div{
		margin-left:16px;
		width: 100%;
	}
	.major{
		background: #f0f1f2;
		width: 600px;
		height: 248px;
		padding: 26px;
		margin-left: 0;	
	}
	.submajor{
		background: #f0f1f2;
		width: 600px;
		padding: 10px;
		margin-left: 0;
		float:left;
	}
	.submajor span{
		background: #f58866;
		color: white;
		padding: 5px 10px;
		margin: 7px;
		border-radius: 10px;
		float:left;
	}
	
	option:hover {
		background:#f7b96d66;
	}
</style>
<%@include file="../incs/side_mypage.jsp"%>
<!-- 아래부터 mypage 각자 코딩내용 작성 -->
<div class="row service-list text-center">
					<div class="col-md-4 col-sm-12 col-xs-12 first">
						<div class="service-wrapper wow fadeIn" style="visibility: visible; animation-name: fadeIn;">	
							<i class="flaticon-competition"></i>
							<div class="service-details">
								<h4><a 
								<c:if test="${param.state=='expert' }">
									style="color:#f47664;"
								</c:if>
								 href="<c:url value='/registExpert/registExpert.do?state=expert&userNo=${sessionScope.userNo }'/>">전문가 등록</a></h4>
							</div>
						</div><!-- end service-wrapper -->
					</div><!-- end col -->

					<div class="col-md-4 col-sm-12 col-xs-12">
						<div class="service-wrapper wow fadeIn" style="visibility: visible; animation-name: fadeIn;">	
							<i class="flaticon-content"></i>
							<div class="service-details">
								<h4><a style="cursor: default;"
								<c:if test="${param.state=='profile' }">
									style="color:#f47664;"
								</c:if>
								href="<c:url value='/registExpert/registProfile.do?state=profile&userNo=${sessionScope.userNo }'/>">프로필 작성</a></h4>
							</div>
						</div><!-- end service-wrapper -->
					</div><!-- end col -->

					<div class="col-md-4 col-sm-12 col-xs-12 last">
						<div class="service-wrapper wow fadeIn" style="visibility: visible; animation-name: fadeIn;">	
							<i class="flaticon-html"></i>
							<div class="service-details">
								<h4><a href="service-02.html">서비스 등록</a></h4>
							</div>
						</div><!-- end service-wrapper -->
					</div><!-- end col -->
				</div>
				
					<!-- end contact details -->
				<div class="col-md-5">
					<form name="frm" role="form" class="contactform" action="<c:url value='/registExpert/regist.do'/>">
						<div class="contact-details">
							<ul>
								<li><img src="/jamong/resources/images/userinfo.png" alt="" class="img-thumbnail" style="width: 100px; border-radius: 50%; float: left; margin-left:10px;">
								<div style="padding: 13px 115px;">
								<span><a>닉네임</a></span>
								<input style="width:300px;" type="text" class="form-control" id="id" name="id" value="${expert.id }" required="required">
								</div>
								</li>
								<li>
								<div style="margin-top:-25px;">
								<span><a>&nbsp;자기소개</a></span>
								<textarea style="width:600px;height:250px;margin-top:13px;" class="form-control" id="message" placeholder="Message" maxlength="450" rows="10"></textarea>
								</div>
								<div style="margin-top:30px;">
									<p><a>&nbsp;전문분야 선택</a></p>
									<div class="major">
										<select name="major" multiple="multiple" style="width: 200px;height: 200px; float: left;">
										<c:forEach var="cateLvo" items="${list }">
											<option value="${cateLvo.categoryNameL }">${cateLvo.categoryNameL }</option>
										</c:forEach>
										</select>
										<br>
										<p style="margin-top: 52px; float: left;"><a style="margin-left: 55px;">▶▶</a></p>
										<select name="majorSelected" multiple="multiple" style="width: 200px;height: 200px; margin-top: -28px;margin-left: 55px;">
										</select>
									</div>
								</div>
								</li>
								<li>
									<div style="margin-top:30px;">
									<p><a>&nbsp;상세분야 선택</a></p>
									<div class="submajor" style="">
										<p><a>&nbsp;디자인</a></p>
										<span>ddddddddddd</span>
										<span>dddddddddddd</span>
										<span>ddddddddddd</span>
										<span>ddddddddddd</span>
										<span>dddddddddddd</span>
										<span>dddddddddddddd</span>
										<span>ddddddddddd</span>
									</div>
									<div class="submajor" style="">
										<p><a>&nbsp;디자인</a></p>
										<span>ddddddddddd</span>
										<span>dddddddddddd</span>
										<span>ddddddddddd</span>
										<span>ddddddddddd</span>
										<span>dddddddddddd</span>
										<span>dddddddddddddd</span>
										<span>ddddddddddd</span>
									</div>
								</div>
								</li>
							</ul>
						</div>
							
							<!-- <button type="submit" id="submit" name="submit"	class="btn btn-primary" style="margin-left: 29px;">저장하고 다음으로</button> -->
						</form>
				</div>
					<!--아래는 mypage 공통 사용 코드  -->
			</div>
<!-- end col -->
		</div>
<!-- end row -->
	</div>
<!-- end container -->
</section>
<!-- end section -->

<%@include file="../incs/bottom_main.jsp"%>
<!-- 화면별 고유 하단js 포함할 위치 -->
<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/resources/js/parallax.js'/>"></script>
<script src="<c:url value='/resources/js/animate.js'/>"></script>
<script src="<c:url value='/resources/js/custom.js'/>"></script>

</body>
</html>