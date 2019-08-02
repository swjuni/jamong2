<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!-- 카테고리 홈 top include -->
<%@include file="../inc/admin_top.jsp" %>
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
					}else{
						str="<option value=''>카테고리(대)를 선택하세요.</option>";
						$('#categoryNo').append(str);
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
                                        <form name="frmWrite" method="post" action="<c:url value='/admin/bannerexpoert/bannerAdd.do'/>" enctype="multipart/form-data">
                                        	<fieldset>
												<legend></legend>
												<div>
												카테고리 선택 : 
													<select name="categoryNoL" id="categoryNoL">
															<option value="">선택</option>
														<c:forEach var="vo" items="${list }">
															<option value="${vo.categoryNo }">${vo.categoryNameL }</option>
														</c:forEach>
													</select>
													<select name="categoryNo" id="categoryNo">
														<option>카테고리(대)를 선택하세요.</option>
													</select>
												</div><br>
	                                            <div class="form-group">
						            				<input type="text" id="expertNo" name="expertNo" class="form-control input-default" maxlength="100" placeholder="(임시)전문가 번호를 입력하세요" required="required"/>
	                                            </div>
	                                            <div class="form-group">
						            				<input type="text" id="requestPeriod" name="requestPeriod" class="form-control input-default" maxlength="100" placeholder="광고 기간을 입력하세요." required="required"/>
	                                            </div>
										        <div class="form-group">
										 			<img src="">
										        </div>
										        <div class="form-group">
											        <div class="custom-file">
											            <input type="file" id="file_name" name="file_name" class="custom-file-input" />
											            <label class="custom-file-label" for="file_name">첨부 이미지</label>
											        </div>
										        </div>

						        				<br><br>
										        
												<!-- <button class="btn btn-primary" type="submit">등록</button> -->
												<div class="text-center">
										            <input type = "submit" value="등록" class="btn btn-primary" onclick="submitContents(frmWrite)">&nbsp;&nbsp;
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



	<!-- 관리자 홈 공통 bottom include -->
	<%@include file="../inc/bottom_js.jsp" %>
	
	<!-- 화면별 고유 scripit init -->


<%@include file="../inc/admin_bottom.jsp" %>    