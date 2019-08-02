<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../incs/top_mypage.jsp" %>
<c:import url="/mypage/sideMypage.do"/>
<style type="text/css">

</style>
<script type="text/javascript" src="<c:url value='/assets/js/lib/jquery.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/se2/js/service/HuskyEZCreator.js'/>" charset="utf-8"></script><!-- 스마트에디터 js -->
<script type="text/javascript">
	$(function(){
		$('#file_name').change(function(){
			var fileName = $(this).val();
			$(this).next().html(fileName);
			//$('#file_name').html(fileName);
			//$('#file_name').append("<br>"+ fileName.subString(fileName.lastIndexOf("\\")+1));
		});
		
		/* 
		[{"categoryNoM":8,"categoryNoL":12,"categoryName":"웹 프로그래밍","categoryDesc":"전문적인 웹사이트를 원한다면 전문가와 상의하여 고퀄리티의 웹 사이트를 제작 할 수 있습니다.","imgName":"웹사이트_20190711174822823.JPG","imgOriginalName":"웹사이트.JPG","imgSize":233341},{"categoryNoM":10,"categoryNoL":12,"categoryName":"자바 프로그래밍","categoryDesc":"<p>자바를 이용</p>","imgName":"Chrysanthemum_20190712154136374.jpg","imgOriginalName":"Chrysanthemum.jpg","imgSize":879394}]
		*/
		$('#categoryNoL').change(function(){
			$.ajax({
				url:"<c:url value='/admin/bannerexpoert/ajaxCategoryM.do'/>",
				type:"get",
				data:"categoryNoL="+$(this).val(),
				dataType:"json",
				success:function(res){
					$('#categoryNo').html("");
					if(res.length>0){
						var str = "";
						$.each(res, function(idx, item){
							str="<option value='" + this.categoryNoM + "'>" 
							+ this.categoryName + "</option>";
							$('#categoryNo').append(str);
						});
					}
				},
				error:function(xhr, status, error){
					alert(status+":"+ error);
				}
			});
		});
	});
</script>

<!-- 각자가 분담해서 디자인할 바디 태그 -->
    <div class="content-wrap">
        <div class="main">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-8 p-r-0 title-margin-right">
                        <div class="page-header">
                            <div class="page-title">
                                <h1>배너 <span>관리화면</span></h1>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                    <div class="col-lg-4 p-l-0 title-margin-left">
                        <div class="page-header">
                            <div class="page-title">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Table-Export</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                </div>
                <!-- /# row -->
                
                <section id="main-content">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-title">
                                    <h4>배너 등록</h4>
                                </div>
                                <div class="card-body">
                                    <div class="basic-form">
                                        <form name="frmWrite" method="post" action="<c:url value='/admin/bannerexpoert/bannerEdit.do'/>" enctype="multipart/form-data">
                                        	<fieldset>
												<legend></legend>
												<div>
												카테고리 선택 : 
													<select name="categoryNoL" id="categoryNoL">
														<c:forEach var="vol" items="${list }">
															<option value="${vol.categoryNo }">${vol.categoryNameL }</option>
														</c:forEach>
													</select>
													<select name="categoryNo" id="categoryNo">
														<option>카테고리(대)를 선택하세요.</option>
													</select>
												</div><br>
	                                            <div class="form-group">
	                                            	<label id="expertNo">(임시)전문가 번호를 입력하세요.</label>
						            				<input type="text" id="expertNo" name="expertNo" class="form-control input-default" maxlength="100" placeholder="${voexpertNo }" required="required"/>
	                                            </div>
	                                            <div class="form-group">
	                                            	<label id="requestPeriod">광고 기간을 입력하세요.</label>
						            				<input type="text" id="requestPeriod" name="requestPeriod" class="form-control input-default" maxlength="100" placeholder="${vo.requestPeriod }" required="required"/>
	                                            </div>
										        <div class="form-group">
										 			<img src="">
										        </div>
										         <c:if test="${!empty vo.fileName }">
										        	<hr>
                    								<div>첨부이미지 : ${vo.fileName }</div>
                    								<div style="color: red;">첨부이미지를 변경하면 기존 파일은 삭제됩니다.</div>
                    								<hr> 
											        <div class="form-group">
											 			<img class="img-fluid" src="<c:url value='/upload/banner/${vo.fileName }'/>" alt=""/>
											        </div>
												</c:if>
										        
										        <div class="form-group">
										 			<img src="">
										        </div>
										        <div class="form-group">
											        <div class="custom-file">
											            <input type="file" id="file_name" name="file_name" class="custom-file-input" />
											            <label class="custom-file-label" for="file_name">첨부 이미지</label>
											            <!-- 업로드한 파일명 불러오고 새로 추가 할 경우 기존 파일 삭제 -->
											        </div>
										        </div>

						        				<br><br>
										        
												<!-- <button class="btn btn-primary" type="submit">등록</button> -->
												<div class="text-center">
													<input type="hidden" name="oldFileName" value="${vo.fileName}" />
													<input type="hidden" name="adsNo" value="${vo.adsNo}" />
												
										            <input type = "submit" value="수정" class="btn btn-primary" onclick="submitContents(frmWrite)">&nbsp;&nbsp;
										            <input type = "reset" value="취소" class="btn btn-danger">&nbsp;&nbsp;
										            <input type = "Button" value="목록" class="btn btn-primary"
										            onclick="location.href='<c:url value='/admin/bannerexpoert/bannerList.do'/>'">
										        </div>
										        
                                            </fieldset>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!-- /# card -->
                        </div>
                        <!-- /# column -->
                    </div>
                </section>
            </div>
        </div>
    </div>



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