<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<aside class="lg-side">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                          <div class="inbox-head">
                            <h3 class="input-text">쪽지함</h3>
                            <form action="#" class="pull-right position">
                              <div class="input-append inner-append">
                                <input type="text" class="sr-input" placeholder="메일 검색">
                                <button class="btn sr-btn append-btn" type="button"><i class="fa fa-search"></i></button>
                              </div>
                            </form>
                          </div>
                          <div class="mail-option">
                            <div class="chk-all chk-group">
                              <input type="checkbox" class="mail-checkbox mail-group-checkbox" id="checkAll" />
                              <div class="btn-group">
                                <a data-toggle="dropdown" href="#" class="btn mini all m-l-10" aria-expanded="false">All<i class="fa fa-angle-down "></i></a>
                                <ul class="card-option-dropdown dropdown-menu">
                                  <li><a href="#"> None</a></li>
                                  <li><a href="#"> Read</a></li>
                                  <li><a href="#"> Unread</a></li>
                                </ul>
                              </div>
                            </div>

                            <div class="btn-group">
                              <a data-original-title="Refresh" data-placement="top" data-toggle="dropdown" href="#" class="btn mini tooltips">
                                                            <i class=" fa fa-refresh"></i>
                                                        </a>
                            </div>
                            <div class="btn-group hidden-phone">
                              <a data-toggle="dropdown" href="#" class="btn mini blue" aria-expanded="false"> More<i class="fa fa-angle-down "></i></a>

                              <ul class="card-option-dropdown dropdown-menu">
                                <li><a href="#"><i class="ti-pencil"></i> Mark as Read</a></li>
                                <li><a href="#"><i class="ti-menu-alt"></i>Spam</a></li>
                                <li><a href="#"><i class="ti-trash"></i>Delete</a></li>
                              </ul>
                            </div>
                            <div class="btn-group">
                              <a data-toggle="dropdown" href="#" class="btn mini blue">Move to<i class="fa fa-angle-down "></i></a>
                              <ul class="card-option-dropdown dropdown-menu">
                                <li><a href="#">Draft</a></li>
                                <li><a href="#">Spam</a></li>
                                <li><a href="#"> Delete</a></li>
                              </ul>
                            </div>

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
                             	<tr class="unread">
                                  <td class="inbox-small-cells">
                                    <input type="checkbox" class="mail-checkbox">
                                  </td>
                                  <td class="inbox-small-cells"><i class="ti-star"></i></td>
                                  <td class="view-message  dont-show">${vo.userId2 }</td>
                                  <td class="view-message ">${vo.contents }</td>
                                  <td class="view-message  inbox-small-cells"><i class="fa fa-paperclip"></i></td>
                                  <td class="view-message  text-right">${vo.regdate }</td>
                                </tr>
                                </c:forEach>
                             	</c:if>
                                <tr class="unread">
                                  <td class="inbox-small-cells">
                                    <input type="checkbox" class="mail-checkbox">
                                  </td>
                                  <td class="inbox-small-cells"><i class="ti-star"></i></td>
                                  <td class="view-message  dont-show">김이박</td>
                                  <td class="view-message ">이 편지는 영국으로부터 시작되어....</td>
                                  <td class="view-message  inbox-small-cells"><i class="fa fa-paperclip"></i></td>
                                  <td class="view-message  text-right">19.07.03</td>
                                </tr>
                                <tr class="unread">
                                  <td class="inbox-small-cells">
                                    <input type="checkbox" class="mail-checkbox">
                                  </td>
                                  <td class="inbox-small-cells"><i class="ti-star"></i></td>
                                  <td class="view-message dont-show">최박사 </td>
                                  <td class="view-message">이 편지는 반송되어....</td>
                                  <td class="view-message inbox-small-cells"></td>
                                  <td class="view-message text-right">19.07.23</td>
                                </tr>
                                <tr class="">
                                  <td class="inbox-small-cells">
                                    <input type="checkbox" class="mail-checkbox">
                                  </td>
                                  <td class="inbox-small-cells"><i class="ti-star"></i></td>
                                  <td class="view-message dont-show">읽어본 강실장</td>
                                  <td class="view-message">읽어봤다</td>
                                  <td class="view-message inbox-small-cells"></td>
                                  <td class="view-message text-right">19.06.13</td>
                                </tr>
                                
                              </tbody>
                            </table>
                          </div>

                        </aside>