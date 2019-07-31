<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 관리자 홈 top include -->
<%@include file="../inc/admin_top.jsp"%>

<!-- 버튼 클릭 이벤트 -->

<!-- 각자가 분담해서 디자인할 바디 태그 -->

<div style="width: 30%;height: 60%;margin: auto;" >
					<div class="login-content">
                        <div class="login-logo">
                            <a href="index.html"><span>Focus</span></a>
                        </div>
                        <div class="login-form">
                            <h4>단체 쪽지,메시지</h4>
                            <form name="frmLogin" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label>제목</label>
                                    <input type="text" class="form-control" placeholder="Title" name="subjectemail" id="subjectemail">
                                </div>
                                <div class="form-group">
                                    <label>내용</label>
                                    <textarea class="form-control" placeholder="Contents" name="text" id="text"></textarea>
                                     <input type="file" name="files[]" multiple="multiple">
                                </div>
                                <button type="submit" class="btn btn-primary btn-flat m-b-30 m-t-30" formaction="<c:url value='/admin/manage/send_email.do'/>">메일 전송</button>
                                <button type="submit" class="btn btn-primary btn-flat m-b-30 m-t-30" formaction="<c:url value='/admin/manage/send_message.do'/>">쪽지 전송</button>
                            </form>
                        </div>
                    </div>
                   </div>
<!-- /# column -->

<!-- 관리자 홈 공통 bottom include -->
<%@include file="../inc/bottom_js.jsp"%>


<%@include file="../inc/admin_bottom.jsp"%>
