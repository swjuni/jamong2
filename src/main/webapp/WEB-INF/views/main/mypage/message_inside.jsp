<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<aside class="lg-side">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                          <div class="inbox-head">
                            <h3 class="input-text">쪽지함</h3>
                            <form action="#" class="pull-right position">
                              
                            </form>
                          </div>
                          <div class="mail-option">
                            

                            <ul class="unstyled inbox-pagination pagination-list">
                              <li><span>1-50 of 234</span></li>
                              <li>
                                <a class="np-btn" href="#"><i class="fa fa-angle-left  pagination-left"></i></a>
                              </li>
                              <li>
                                <a class="np-btn" href="#"><i class="fa fa-angle-right pagination-right"></i></a>
                              </li>
                            </ul>
                          </div>
                            <div aria-hidden="true" role="dialog" tabindex="-1" id="myModal2" class="modal fade">
                              <div class="modal-dialog">
                                <div class="modal-content text-left">
                                  <div class="modal-header">
                                    <button aria-hidden="true" data-dismiss="modal" class="close" type="button"><i class="ti-close"></i></button>
                                    <h4 class="modal-title"><c:if test="${param.type != 2}">받은 쪽지</c:if> <c:if test="${param.type == 2}">보낸 쪽지</c:if></h4>
                                  </div>
                                  <div class="modal-body">
                                    <form class="form-horizontal" action="<c:url value='/main/mypage/message_send.do'/>" method="POST" enctype="multipart/form-data">
                                      <div class="form-group">
                                        <label class="col-lg-2 control-label">보낸사람</label>
                                        <div class="col-lg-10">
                                          <input type="text" placeholder="보낸 사람(이메일)" id="modalsId" name="userId" class="form-control" readonly="readonly">
                                        </div>
                                      </div>
                                      <div class="form-group">
                                        <label class="col-lg-2 control-label">받는사람</label>
                                        <div class="col-lg-10">
                                          <input type="text" placeholder="받는 사람(이메일)" id="modalrId" name="userId2" class="form-control" readonly="readonly">
                                        </div>
                                      </div>
                                      <div class="form-group">
                                        <label class="col-lg-2 control-label">내용</label>
                                        <div class="col-lg-10">
                                          <textarea rows="10" cols="30" class="form-control" id="modalcontents" name="contents" readonly="readonly"></textarea>
                                        </div>
                                      </div>

                                      <div class="form-group">
                                        <div class="col-lg-offset-2 col-lg-10">
                                          <span class="btn green fileinput-button"><i class="fa fa-plus fa fa-white"></i>
																	<span>첨부</span>
                                          <!-- <input type="file" name="files[]" multiple="multiple"> -->
                                          </span>
                                        </div>
                                      </div>
                                    </form>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <%-- modal --%>
                          <div class="table-responsive">
                            <table class="table table-inbox table-hover table-responsive">
                              <tbody>
                             	<c:if test="${empty list }">
	                             	<tr>
	                             		<td colspan="5">데이터가 존재하지 않습니다.</td>
	                                </tr>
                             	</c:if>
                             	<c:if test="${!empty list }">
                             	<c:forEach var="vo" items="${list }">
                             	<tr>
                                  
                                  <td class="inbox-small-cells"><i class="ti-star"></i></td>
                                  <td class="view-message  dont-show"><a href="#myModal2" data-toggle="modal" class="modaldata" data-no=${vo.messageNo } data-user1="${vo.userId }" data-user2="${vo.userId2 }" data-contents="${vo.contents }" data-regdate="${vo.regdate }">
                                  
                                  <c:if test="${param.type != 2}">${vo.userId }</c:if>
                                  <c:if test="${param.type == 2}">${vo.userId2 }</c:if>
                                  </a></td>
                                  <td class="view-message ">${vo.contents }</td>
                                  <td class="view-message  inbox-small-cells"><fmt:formatDate value="${vo.regdate }" type="both" pattern="yyyy-MM-dd HH:mm:ss "/></td>
                                  <td class="view-message  text-right">
                                  <c:if test=" ${fn:length(vo.fileName)>0 }">${vo.fileName }</c:if>
                                  </td>
                                  
                                  <td class="inbox-small-cells">
                                  	<c:if test="${param.type == 1}"><a href="<c:url value='/main/mypage/messageup1.do?messageNo=${vo.messageNo }'/>" data-no=${vo.messageNo }> 휴지통 </a></c:if>
                                  	<c:if test="${param.type == 2}"><a href="<c:url value='/main/mypage/messageup2.do?messageNo=${vo.messageNo }'/>" data-no=${vo.messageNo }> 삭제 </a></c:if>
                                  	<c:if test="${param.type == 3}"><a href="<c:url value='/main/mypage/messageup3.do?messageNo=${vo.messageNo }'/>" data-no=${vo.messageNo }> 삭제 </a></c:if>
                                  	<c:if test="${param.type == 3}"><a href="<c:url value='/main/mypage/messageup4.do?messageNo=${vo.messageNo }'/>" data-no=${vo.messageNo }> 복구 </a></c:if>
                                  </td>
                                
                                </tr>
                                </c:forEach>
                             	</c:if>
                                
                              </tbody>
                            </table>
                          </div>

                        </aside>