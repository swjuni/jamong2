<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../incs/top_main.jsp" %>
<!-- 각 화면별 내용 코딩-->
<script type="text/javascript">
	var markS = ${bookmarkExist};
	var userNo = "${sessionScope.userNo}"; 
	
	$(function(){
		if(userNo!=""){
			if(markS){
				//alert("${bookmarkExist}"+"트루가 와야함");
				$('#bookmarkBtn').prepend("<i class='fa fa-heart' id='bookmarkTag' style='color: red;'></i>");
			}else if(!markS ){
				//alert("${bookmarkExist}"+"펄스가 와야함");
				$('#bookmarkBtn').prepend("<i class='fa fa-heart-o' id='bookmarkTag'></i>");
			}
		}
		
	});
		
	function report(){
		location.href="<c:url value='/mypage/reportAdd.do?expertNo=${menuinfoVo.expertNo}&productNo=${param.productNo}'/>";
	}
	
	function bookmark(){
		//ajax아닌 일반 전송 (이경우 컨트롤러에서도 일부값 변경해야함)
		//location.href="<c:url value='/mypage/bookmarkExist.do?expertNo=${menuinfoVo.expertNo}'/>";
		//ajax 방식 사용
		if(userNo!=""){
			if(markS){
				if(!confirm("즐겨찾기 삭제하시겠습니까?")){
					return false;
				}
			}else if(!markS ){
				if(!confirm("즐겨찾기 등록하시겠습니까?")){
					return false;
				}
			}
			
			$.ajax({
				url:"<c:url value='/mypage/bookmarkExist.do'/>",
				type:"get",
				data:{
					expertNo:"${menuinfoVo.expertNo}",
					},
				success:function(res){
					if(res==0){
						$('#bookmarkTag').attr("class",'fa fa-heart-o').css('color','black');
						markS=false;
					}else if(res==1){
						$('#bookmarkTag').attr("class",'fa fa-heart').css('color','red');
						markS=true;
					}
				},
				error:function(xhr,status, error){
					alert(status+":"+error);
				}
			});
		}else{
			alert("먼저 로그인 하세요");
		}
	}
	
	function replyOpen(index){
		$('#replyWrite'+index).show();
		$('#replyId'+index).attr("onclick","replyClose("+index+")").text("cancel");
	}
	function replyClose(index){
		$('#replyWrite'+index).hide();
		$('#replyId'+index).attr("onclick","replyOpen("+index+")").text("reply");
	}
	
	function evalReplyOpen(indexI,indexJ){
		$('#evalReplyWriteI'+indexI+"J"+indexJ).show();
		$('#evalReplyIdI'+indexI+"J"+indexJ).attr("onclick","evalReplyClose("+indexI+","+indexJ+")").text("cancel");
	}
	function evalReplyClose(indexI,indexJ){
		$('#evalReplyWriteI'+indexI+"J"+indexJ).hide();
		$('#evalReplyIdI'+indexI+"J"+indexJ).attr("onclick","evalReplyOpen("+indexI+","+indexJ+")").text("reply");
	}
	
</script>
<style type="text/css">
.productImages{
    background-color: #ffffff;
    border-top: 1px solid #eeeeee;
    padding: 10px;
    overflow: hidden;
    position: relative;
}
.client-box{
    height: 120px;
}
.client-box img {
	height: 100%;
	width: 100%;
}
.case-single .case-box{
	border: 0px;
}
.optionSt{
	padding: 10px;
	background-color: white;
	border-bottom: 1px solid #efefef;
    border-left: 1px solid #efefef;
    border-right: 1px solid #efefef;
}
.pricing-details li{
    border-bottom: 1px solid #efefef;
    border-left: 0px;
    border-right: 0px;
}
img.cloudzoom {
	width:100%;
}

.comments .media-list li {
    margin: 3px 0;
    padding: 0px 10px;
}
.comments .btn {
	margin: 4px 0;
}
</style>
<section class="section lb">
	<div class="container">
		<div class="row case-single">
			<div class="col-md-7 col-sm-7 col-xs-12">
				<div class="pitem">
					<!-- <div class="case-box"> -->
					<div class="">
						<!-- <img src="/jamong/resources/upload/case_03.png" alt="" class="img-responsive"> -->
						<img class="img-responsive cloudzoom" alt ="Cloud Zoom small image" id ="zoom1"
							src="/jamong/upload/product/Jellyfish.jpg"
							data-cloudzoom='
								zoomSizeMode:"image",
								startMagnification: 2,
								<%-- disableZoom: "auto", --%>
								autoInside: 550 
							'>
					</div><!-- end case-box -->
					<div class="productImages">
						<div class="row text-center">
							<div class="col-md-3 col-sm-3 col-xs-6">
								<div class="client-box">
									<!-- <a href="#"><img src="/jamong/resources/upload/client_01.png" alt="" class="img-responsive"></a> -->
									<img class = 'cloudzoom-gallery' src = "/jamong/upload/product/Jellyfish.jpg" 
									data-cloudzoom = "useZoom: '.cloudzoom', image: '/jamong/upload/product/Jellyfish.jpg' " >
								</div>
							</div><!-- end col -->
							<div class="col-md-3 col-sm-3 col-xs-6">
								<div class="client-box">
									<!-- <a href="#"><img src="/jamong/resources/upload/client_02.png" alt="" class="img-responsive"></a> -->
				        			<img class = 'cloudzoom-gallery' src = "/jamong/upload/product/2.png" 
				        			data-cloudzoom = "useZoom: '.cloudzoom', image: '/jamong/upload/product/2.png' " >
								</div>
							</div><!-- end col -->
							<div class="col-md-3 col-sm-3 col-xs-6">
								<div class="client-box">
									<!-- <a href="#"><img src="/jamong/resources/upload/client_03.png" alt="" class="img-responsive"></a> -->
				        			<img class = 'cloudzoom-gallery' src = "/jamong/upload/product/3.png" 
				        			data-cloudzoom = "useZoom: '.cloudzoom', image: '/jamong/upload/product/3.png' " >
								</div>
							</div><!-- end col -->	
							<div class="col-md-3 col-sm-3 col-xs-6">
								<div class="client-box">
									<!-- <a href="#"><img src="/jamong/resources/upload/client_04.png" alt="" class="img-responsive"></a> -->
				        			<img class = 'cloudzoom-gallery' src = "/jamong/upload/product/4.png" 
				        			data-cloudzoom = "useZoom: '.cloudzoom', image: '/jamong/upload/product/4.png' " >
								</div>
							</div><!-- end col -->
						</div>
					</div>
					


					<div class="content blog-alt">
						<div class="blog-box clearfix">
							<div class="blog-single"><br><br>
								<h3 class="post-title">서비스 설명</h3>
								<p>The plugin will automatically include the most commonly used words in the text as a label. This way you gain backlinks within the site. In addition, one of the best features is that the words in the article are automatically linked to the label page. In this case, the article..</p>
								<p>The plugin will automatically include the most commonly used words in the text as a label. This way you gain backlinks within the site. In addition, one of the best features is that the words in the article are automatically linked to the label page. In this case, the article..</p>

								<div class="tags">
									<a class="readmore" href="#">web design</a>
									<a class="readmore" href="#">web development</a>
									<a class="readmore" href="#">seo</a>
									<a class="readmore" href="#">wordpress seo</a>
								</div>
							</div><!-- end blog-desc -->
						</div><!-- end blogbox -->

						<c:if test="${!empty evalList }">
                        <div class="blog-box clearfix">
                            <div class="custom-title">
                                <h4>${evalList.size()} Comments</h4>
                                <hr>
                            </div><!-- end -->

                            <div class="row">
                                <div class="col-md-12" style="background: white;">
                                    <div class="panel panel-info" style="margin-top:20px;">
                                        <div class="panel-body comments">
                                        	<c:set var="i" value="0"></c:set>
                                        	<c:forEach var="vo" items="${evalList }"><!-- 평가글 목록 -->
                                            <ul class="media-list">
                                                <li class="media">
                                                    <div class="comment">
                                                        <div class="media-body">
                                                            <strong class="text-success">${vo.userId }</strong>
                                                            <span class="text-muted" style="float: right;">
                                                            	<small class="text-muted"><fmt:formatDate value="${vo.col }" pattern="yyyy-MM-dd"/></small>
                                                           	</span> 
															<div class="progress">
															 	<div class="progress-bar progress-bar-striped active" 
															 	role="progressbar" aria-valuenow="${vo.evalScore }" aria-valuemin="0" aria-valuemax="100"
															 	 style="width:${vo.evalScore }%">
															  	</div>
															</div>
                                                            <p>${vo.review }</p>
                                                            <a href="javascript:void(0)" class="btn btn-primary btn-sm" style="float: right; width: 70px;"
                                                            	onclick="replyOpen(${i})" id="replyId${i }">Reply</a>
                                                            
															<div class="clearfix"></div>
															
															<!-- 평가글의 댓글 쓰기 -->
                                                            <div class="comment" id="replyWrite${i }" style="display: none;">
																<ul class="media-list" style="background: aliceblue;">
	                                                        		<li class="media" style="padding-bottom: 10px;">
																		<form class="row" name="frmEvalComment" method="post" 
																			action="<c:url value='/main/menuinfo/evaluationReply.do'/>">
											                            	<input type="hidden" name="evalNo" value="${vo.evalNo }"/>
										                                    <div class="col-md-12 col-sm-12">
										                                        <label for="evalComment">Reply <span class="required">*</span></label>
																				<span class="text-muted" style="float: right; color:#3f51b5;">
																				<b>${sessionScope.userId }</b></span> 
										                                        <textarea class="form-control" rows="3" name="evalComment" id="evalComment"
										                                        	placeholder="" style="resize: none; background: white;"></textarea>
										                                    </div>
										                                    <div class="col-md-12 col-sm-12" style="text-align: right;">
										                                        <input type="submit" id="evalCommentSubmit" name="evalCommentSubmit"
										                                         class="btn btn-primary btn-sm" style="float: right; width: 70px;" value="OK"/>
										                                    </div>
										                                </form>
	                                                            	</li>
																</ul>
                                                           	</div>
                                                            
                                                        </div>
                                                        <div class="clearfix"></div>
                                                    </div>

												<!-- 평가글의 댓글 목록 -->
												<c:if test="${!empty evalCommentList }">
												<c:forEach var="evalCommentVo" items="${evalCommentList }">
													<c:if test="${!empty evalCommentVo }">
														<c:set var="j" value="0"/>
														<c:forEach var="ecVo" items="${evalCommentVo }">
															<c:if test="${vo.evalNo == ecVo.evalNo }">
																<div style="float:right; width: ${100-(ecVo.step*3)}%;">
																	<c:if test="${ecVo.step==0 }">
																		<ul class="media-list" style="background: lemonchiffon">
																	</c:if>
																	<c:if test="${ecVo.step!=0 }">
																		<ul class="media-list" style="background: aliceblue">
																	</c:if>
																	
																	<c:if test="${ecVo.delflag=='N' }">
																		<li class="media">
																			<div class="comment">
																				<div class="media-body">
																					<strong class="text-success">${ecVo.userId }</strong>
																					<span class="text-muted" style="float: right;">
																						<small class="text-muted"><fmt:formatDate value="${ecVo.regdate }"
																						pattern="yyyy-MM-dd"/></small></span>
																					<p>${ecVo.evalComment }</p>
																					<c:if test="${ecVo.userNo==sessionScope.userNo }">
																					<a href="<c:url value='/main/menuinfo/evaluationReplyDel.do?evalCNo=${ecVo.evalCNo }
																						&productNo=${param.productNo }'/>" class="btn btn-primary btn-sm" style="float: right; width: 70px;">삭제</a>
																					</c:if>
																					<a href="javascript:void(0)" class="btn btn-primary btn-sm" style="float: right; width: 70px;"
																					onclick="evalReplyOpen(${i},${j})" id="evalReplyIdI${i }J${j}">Reply</a>
																				</div>
																				<div class="clearfix"></div>
																			</div>
																		</li>
																	</c:if>
																	<c:if test="${ecVo.delflag=='Y' }">
																		<li class="media">
																			<div class="comment">
																				<div class="media-body">
																					<p>삭제된 글입니다.</p>
																				</div>
																				<div class="clearfix"></div>
																			</div>
																		</li>
																	</c:if>
																	
																	<!-- 평가글 댓글의 reply 쓰기 -->
																		<li class="media" id="evalReplyWriteI${i }J${j }" style="display: none;">
																			<form class="row" name="frmEvalReplyComment" method="post" 
																				action="<c:url value='/main/menuinfo/evaluationReplyAdd.do'/>">
																				<input type="hidden" name="evalNo" value="${ecVo.evalNo }"/>
																				<input type="hidden" name="groupNo" value="${ecVo.groupNo }"/>
																				<input type="hidden" name="step" value="${ecVo.step }"/>
																				<input type="hidden" name="sortNo" value="${ecVo.sortNo }"/>
																				<div class="col-md-12 col-sm-12" style="background: #8dcfdee8;">
																					<label for="evalComment">Reply <span class="required">*</span></label>
																					<span class="text-muted" style="float: right; color:#3f51b5;">
																					<b>${sessionScope.userId }</b></span> 
																					<textarea class="form-control" rows="3" name="evalComment" id="evalComment"
																						placeholder="" style="resize: none; background:white; ;"></textarea>
																				</div>
																				<div class="col-md-12 col-sm-12" style="text-align: right; background: #8dcfdee8;">
																					<input type="submit" id="evalReplyCommentSubmit" name="evalReplyCommentSubmit"
																						class="btn btn-primary btn-sm" style="float: right; width: 70px;" value="OK"/>
																				</div>
																			</form>
																		</li>
																	</ul>
																</div>
															</c:if>
														<c:set var="j" value="${j+1 }"></c:set>
														</c:forEach>
													</c:if>
												</c:forEach>
												</c:if>
													
                                                </li>
                                            </ul>
                                            <c:set var="i" value="${i+1 }"></c:set>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div><!-- end postpager -->
						</c:if>

						<c:if test="${!empty sessionScope.userNo }">
                        <div class="blog-box clearfix">
                            <div class="custom-title">
                                <h4>Leave a Comment</h4>
                            </div><!-- end about -->

                            <div class="contact_form comment-form">
	                            <form class="row" name="frmWrite" method="post" action="<c:url value='/main/menuinfo/evaluationAdd.do'/>" style="background: white;">
	                            	<input type="hidden" name="productNo" value="${param.productNo }"/>
                                    <div class="col-md-4 col-sm-12" style="margin-top: 15px;">
                                        <label>서비스 평가 <span class="required">*</span></label>
                                        <select class="form-control" name="evalScore" required="required" style="color: black; font-weight: bold;">
                                        	<option value="" style="color: black; font-weight: bold;">평점을 선택하세요</option>
                                        	<option value="100" style="color: red;">★★★★★</option>
                                        	<option value="80" style="color: red;">★★★★</option>
                                        	<option value="60" style="color: red;">★★★</option>
                                        	<option value="40" style="color: black;">★★</option>
                                        	<option value="20" style="color: black;">★</option>
                                        </select>
                                    </div>
                                    <div class="col-md-12 col-sm-12">
                                        <label>Comment <span class="required">*</span></label>
                                        <textarea class="form-control" name="review" placeholder=""></textarea>
                                    </div>
                                    <div class="col-md-12 col-sm-12" style="margin-bottom: 15px; text-align: right;">
                                        <input type="submit" id="submit" name="submit" class="btn btn-primary" />
                                    </div>
                                </form>
                            </div><!-- end commentform -->
                        </div><!-- end postpager -->
						</c:if>
					</div><!-- end content -->



					
					
					
					
				</div><!-- end pitem -->
			</div><!-- end col -->

			<div class="col-md-5 col-sm-5 col-xs-12">
				<div class="pitem">
					<div class="pricing-box clearfix">
						<div class="pricing-header" style="padding: 20px 0;">
							<h4 style="color:black; text-align: left;">${menuinfoVo.productName }</h4>
						</div><!-- end pricing-header -->
						<div class="panel-group" id="accordion">
							<div class="panel panel-default">
					            <a data-toggle="collapse" data-parent="#accordion" href="#collapseA">
									<div class="pricing-header firstch">
										<h4 class="panel-title">
								            STANDARD <i class="fa fa-angle-down"></i>
								        </h4>
									</div><!-- end pricing-header -->
					            </a>
							    <div id="collapseA" class="panel-collapse collapse">
							        <div class="panel-body">
										<div class="pricing-top secondch">
											<i class="flaticon-crown"></i>
											<p>$500/Month</p>
										</div><!-- end pricing-top -->
										<div class="pricing-details">
											<ul>
												<li><a href="#">Link Building</a> Analysis <span><i class="fa fa-check"></i></span></li>
												<li>Sectoral Agreement Limit <span><i class="fa fa-close"></i></span></li>
												<li>Support <span><i class="fa fa-phone"></i></span></li>
											</ul>
										</div><!-- end pricing-details -->
										<div class="d-block p-2 bg-primary text-center optionSt">
											<select name="optionsNo" class="border border-warning "
											 style="width: 90%; height: 33px; color:black;background: linear-gradient(30deg, #ffffff 1%, #adadad 300%);">
												<option value="0">옵션을 선택하세요</option>
												<option value="1">옵션1</option>
												<option value="2">옵션2</option>
												<option value="3">옵션3</option>
											</select>
										</div>
										<div class="pricing-footer text-center">
											<div class="case-box">
												<a href="#" class="btn btn-primary c1btn">주문하기</a>
											</div>
										</div>
							        </div>
							    </div>
							    
							    
							    <!-- 패키지 구분 -->
					            <a data-toggle="collapse" data-parent="#accordion" href="#collapseB">
									<div class="pricing-header threech">
										<h4 class="panel-title">
								            DELUXE <i class="fa fa-angle-down"></i>
								        </h4>
									</div><!-- end pricing-header -->
					            </a>
							    <div id="collapseB" class="panel-collapse collapse">
							        <div class="panel-body">
										<div class="pricing-top fourch">
											<i class="flaticon-crown"></i>
											<p>$500/Month</p>
										</div><!-- end pricing-top -->
										<div class="pricing-details">
											<ul>
												<li><a href="#">Link Building</a> Analysis <span><i class="fa fa-check"></i></span></li>
												<li>Sectoral Agreement Limit <span><i class="fa fa-close"></i></span></li>
												<li>Support <span><i class="fa fa-phone"></i></span></li>
											</ul>
										</div><!-- end pricing-details -->
										<div class="pricing-footer text-center">
											<div class="case-box">
												<a href="#" class="btn btn-primary c2btn">주문하기</a>
											</div>
										</div>
							        </div>
							    </div>
							    
							    
							    <!-- 패키지 구분 -->
					            <a data-toggle="collapse" data-parent="#accordion" href="#collapseC">
									<div class="pricing-header sixch">
										<h4 class="panel-title">
								            PREMIUM <i class="fa fa-angle-down"></i>
								        </h4>
									</div><!-- end pricing-header -->
					            </a>
							    <div id="collapseC" class="panel-collapse collapse">
							        <div class="panel-body">
										<div class="pricing-top sevench">
											<i class="flaticon-crown"></i>
											<p>$500/Month</p>
										</div><!-- end pricing-top -->
										<div class="pricing-details">
											<ul>
												<li><a href="#">Link Building</a> Analysis <span><i class="fa fa-check"></i></span></li>
												<li>Sectoral Agreement Limit <span><i class="fa fa-close"></i></span></li>
												<li>Support <span><i class="fa fa-phone"></i></span></li>
											</ul>
										</div><!-- end pricing-details -->
										<div class="pricing-footer text-center">
											<div class="case-box">
												<a href="#" class="btn btn-primary c3btn">주문하기</a>
											</div>
										</div>
							        </div>
							    </div>
						    </div>
					    </div>
					</div><!-- end pricing-box -->

					<div class="pricing-box clearfix" style="border: 1px solid #efefef;">
						<div class="pricing-top" style="color: black; padding: 20px; background: white;">
							<button id="bookmarkBtn" type="button" class="inline-block" onclick="bookmark()"
								style="border: 0px; background: transparent; position: absolute; font-size: 16px; right: 40px;">
								<!-- ajax 방식으로 사용할 경우 아래 위치에 ajax 태그 입력시키기-->
								
								
								
								<!-- ajax 방식으로 사용 안할 경우 아래 태그 사용-->
								<%-- 
								<c:if test="${bookmarkExist }">
									<i class="fa fa-heart" style="color: red;"></i>
								</c:if>
								<c:if test="${!bookmarkExist }">
									<i class="fa fa-heart-o"></i>
								</c:if>
								 --%>
								<span style="font-size: 15px;"> 찜하기</span> 
							</button>
							
							<button id="reportkBtn" type="button" class="inline-block" onclick="report()"
								style="border: 0px; background: transparent; position: absolute; font-size: 16px; right: 40px; bottom:-20px;">
								<!-- if문 처리할 곳 -->
								<i class="fa fa-exclamation-circle" style="color: red;"></i>
								<!-- /if-->
								<span style="font-size: 15px;"> 신고하기</span> 
							</button>
							
							<c:if test="${!empty list }">
								<i class="flaticon-crown"></i>
							</c:if>
							<div class="client-box" style="width: 120px; display: inline-block;">
								<c:if test="${empty expertVo.fileName }">
									<a href="#"><img src="/jamong/assets/images/bookingSystem/2.png" alt="" class="img-responsive"></a>
								</c:if>
								<c:if test="${!empty expertVo.fileName }">
									<a href="<c:url value='/main/menuinfo/menuinfo_List.do?expertNo=${expertVo.expertNo }'/>">
									<img src="<c:url value='/upload/expert/${expertVo.fileName }'/>" alt="" class="img-responsive"></a>
								</c:if>
							</div> 
							<h4 style="font-weight: bold;">${expertVo.id}</h4>
							<div style="font-size: 14px;">연락가능시간 : </div>
							<div style="font-size: 14px;">${expertVo.serviceableTime }</div>
						</div><!-- end pricing-top -->
						<div class="pricing-details">
							<div class="pricing-footer text-center">
								<div style="background: white;" >  
									<a href="#" class="btn btn-primary" style="background:#4d4d4d; border-radius: 7px; width: 80%;
									padding: 8px; font-size: 13px; border-left: 1px solid #efefef; border-right: 1px solid #efefef;">
									<i class="fa fa-envelope" style="color: white; margin-right: 8px; font-size: 1.1em;"></i>
									전문가에게 문의</a>
								</div> 
							</div>
							<ul>
								<li>Competition power <span><i class="fa fa-check"></i></span></li>
								<li>Competition power <span><i class="fa fa-check"></i></span></li>
								<li>Keyword <span>3</span></li>
							</ul>
						</div><!-- end pricing-details -->
						<div style="background-color: #ffffff;padding: 10px 20px;">
							<span><b>전문가 소개</b></span><br>
							<span>${expertVo.introduction }</span>
						</div>
					</div><!-- end pricing-box -->
				</div>
			</div><!-- end col -->
		</div><!-- end row -->
	</div><!-- end container -->
</section><!-- end section -->



<%@include file="../incs/bottom_main.jsp" %>
<!-- 화면별 고유 하단js 포함할 위치 -->
</body>
</html>