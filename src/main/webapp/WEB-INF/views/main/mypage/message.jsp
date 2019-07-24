<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../incs/top_mypage.jsp" %>
<%@include file="../incs/side_mypage.jsp" %>


<!-- 아래부터 mypage 각자 코딩내용 작성 -->
<link href="<c:url value='/assets/css/style2.css'/>" rel="stylesheet">
<div class="main-content">
            <div class="row">
              <div class="col-lg-12">
                <div class="card">
                  <div class="card-body">
                    <div class="compose-email">
                      <div class="mail-box">
                        <aside class="sm-side">
                          <div class="user-head">
                            <a class="inbox-avatar" href="javascript:;">
                                                        <img src="assets/images/user.jpg" alt="">
                                                    </a>
                            <div class="user-name">
                              <h5><a href="#">${userName }</a></h5>
                              <span><a href="#">${userId }</a></span>
                            </div>
                          </div>
                          <div class="inbox-body text-center">
                            <!-- Modal -->
                            <div aria-hidden="true" role="dialog" tabindex="-1" id="myModal" class="modal fade">
                              <div class="modal-dialog">
                                <div class="modal-content text-left">
                                  <div class="modal-header">
                                    <button aria-hidden="true" data-dismiss="modal" class="close" type="button"><i class="ti-close"></i></button>
                                    <h4 class="modal-title">쪽지 보내기</h4>
                                  </div>
                                  <div class="modal-body">
                                    <form class="form-horizontal" action="<c:url value='/main/mypage/message_send.do'/>" method="POST" enctype="multipart/form-data">
                                      <div class="form-group">
                                        <label class="col-lg-2 control-label">보내는사람</label>
                                        <div class="col-lg-10">
                                          <input type="text" placeholder="받는 사람(이메일)" id="userId" name="userId" class="form-control" readonly="readonly"
                                          value=${userId }>
                                        </div>
                                      </div>
                                      <div class="form-group">
                                        <label class="col-lg-2 control-label">받는사람</label>
                                        <div class="col-lg-10">
                                          <input type="text" placeholder="받는 사람(이메일)" id="userId2" name="userId2" class="form-control">
                                        </div>
                                      </div>
                                      <div class="form-group">
                                        <label class="col-lg-2 control-label">내용</label>
                                        <div class="col-lg-10">
                                          <textarea rows="10" cols="30" class="form-control" id="contents" name="contents"></textarea>
                                        </div>
                                      </div>

                                      <div class="form-group">
                                        <div class="col-lg-offset-2 col-lg-10">
                                          <span class="btn green fileinput-button"><i class="fa fa-plus fa fa-white"></i>
																	<span>첨부</span>
                                          <input type="file" name="files[]" multiple="">
                                          </span>
                                          <button class="btn btn-primary" type="submit">보내기</button>
                                        </div>
                                      </div>
                                    </form>
                                  </div>
                                </div>
                                <!-- /.modal-content -->
                              </div>
                              <!-- /.modal-dialog -->
                            </div>
                            <!-- /.modal -->
                          </div>
                          <ul class="inbox-nav inbox-divider">
                            <li class="breadcrumb-item active">
                              <a href="<c:url value='/main/mypage/messageT.do?type=1'/>"><i class="fa fa-inbox"></i> 쪽지함</a>
                            </li>
                            <li>
                              <a href="<c:url value='/main/mypage/messageT.do?type=2'/>"><i class="fa fa-envelope-o"></i> 보낸 쪽지</a>
                            </li>
                            <li>
                              <a href="<c:url value='/main/mypage/messageT.do?type=3'/>"><i class=" fa fa-trash-o"></i> 휴지통</a>
                            </li>
                          </ul>


                          <div class="inbox-body text-center">
                            <div class="btn-group">
                              <a class="btn mini btn-primary" href="#myModal" data-toggle="modal">
                                                            쪽지보내기
                                                        </a>
                            </div>
                          </div>

                        </aside>
                        <%@include file="message_inside.jsp" %>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-lg-12">
                <div class="footer">
                  <p>2019 © Jamong Board. - <a href="#">new.com</a></p>
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
	
	<!-- jquery vendor -->
    <script src="<c:url value='/assets/js/lib/jquery.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/jquery.nanoscroller.min.js'/>"></script>
    <!-- nano scroller -->
    <script src="<c:url value='/assets/js/lib/preloader/pace.min.js'/>"></script>
    <!-- sidebar -->
    
    <!-- bootstrap -->

    <script src="<c:url value='/assets/js/lib/bootstrap.min.js'/>"></script><script src="<c:url value='/assets/js/scripts.js'/>"></script>
    <!-- scripit init-->

</body>
</html>