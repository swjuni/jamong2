<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 관리자 홈 top include -->
<%@include file="inc/admin_top.jsp" %>
	<script>
var sca = '01';
</script>

	<style>
		#canvas {float:left; position:relative; width: 320px; height:400px; margin: 0}
		#south {width: 320px; height:400px; position: absolute; top: 0px; left: 0;}
		
		#canvas h2{ padding:0; margin:0; font-size:12px; }
		
		#seoul, #gygg, #incheon, #gangwon, #chungbuk, #chungnam, #daejeon, #sejong, #jeonbuk, #jeonnam, #gwangju, #gyeongbuk, #gyeongnam, #daegu, #busan, #ulsan, #jeju { display: none; position: absolute; height:16px; background-color:#000; color:#fff; padding:2px 5px; text-align:center;}
		
		#seoul{ left:80px; top:75px; }
		#gygg{ left:80px; top:45px; }
		#incheon{ left:60px; top:75px; }
		#gangwon{ left:150px; top:45px; }
		#chungbuk{ left:120px; top:145px; }
		#chungnam{ left:60px; top:165px; }
		#daejeon{ left:80px; top:165px; }
		#sejong{ left:70px; top:145px; }
		#jeonbuk{ left:60px; top:205px; }
		#jeonnam{ left:60px; top:260px; }
		#gwangju{ left:	60px; top:260px; }
		#gyeongbuk{ left:150px; top:165px; }
		#gyeongnam{ left:130px; top:240px; }
		#daegu{ left:170px; top:210px; }
		#busan{ left:190px; top:250px; }
		#ulsan{ left:200px; top:225px; }
		#jeju{ left:80px; top:340px; }
		
		h2{
			color:white;
		}
		table{
			display: inline;
		}
		tr{
			font-weight: bold;
		}
	</style>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$.ajax({
	    		url :"<c:url value='/admin/index_adminData.do'/>",
	    		type: 'post',
	    		dataType: "json",
	    		success : function(res) {
	    			$('#totalsale').text(res[0]+"원");
	    			$('#newUser').text(res[1]+"명");
	    			$('#totalMenu').text(res[2]+"개");
	    		}
	    		});	
			
			$.ajax({
	    		url :"<c:url value='/admin/locationUser.do'/>",
	    		type: 'post',
	    		dataType: "json",
	    		success : function(res) {
	    			$('#l0').text(res[0]);
	    			$('#l1').text(res[1]);
	    			$('#l2').text(res[2]);
	    			$('#l3').text(res[3]);
	    			$('#l4').text(res[4]);
	    			$('#l5').text(res[5]);
	    			$('#l6').text(res[6]);
	    			$('#l7').text(res[7]);
	    			$('#l8').text(res[8]);
	    			$('#l9').text(res[9]);
	    			$('#l10').text(res[10]);
	    			$('#l11').text(res[11]);
	    			$('#l12').text(res[12]);
	    			$('#l13').text(res[13]);
	    			$('#l14').text(res[14]);
	    			$('#l15').text(res[15]);
	    		}
	    		});	
			
		});
	</script>

	<!-- 각자가 분담해서 디자인할 바디 태그 -->
	<div class="content-wrap">
	    <div class="main" style="margin: auto;">
	        <div class="container-fluid">
	            <div class="row">
	                <div class="col-lg-8 p-r-0 title-margin-right">
	                    <div class="page-header">
	                        <div class="page-title">
	                            <h1>Hello, <span>Welcome Jamong</span></h1>
	                        </div>
	                    </div>
	                </div>
	                <!-- /# column -->
	                <div class="col-lg-4 p-l-0 title-margin-left">
	                    <div class="page-header">
	                        <div class="page-title">
	                            <ol class="breadcrumb">
	                                <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
	                                <li class="breadcrumb-item active">Home</li>
	                            </ol>
	                        </div>
	                    </div>
	                </div>
	                <!-- /# column -->
	            </div>
	            <!-- /# row -->
	            <section id="main-content">
	                <div class="row">
	                    <div class="col-lg-3">
	                        <div class="card">
	                            <div class="stat-widget-one">
	                                <div class="stat-icon dib"><i class="ti-money color-success border-success"></i></div>
	                                <div class="stat-content dib">
	                                    <div class="stat-text">총 매출액</div>
	                                    <div class="stat-digit" id="totalsale"></div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="col-lg-3">
	                        <div class="card">
	                            <div class="stat-widget-one">
	                                <div class="stat-icon dib"><i class="ti-user color-primary border-primary"></i></div>
	                                <div class="stat-content dib">
	                                    <div class="stat-text">신규 회원(1달 이내)</div>
	                                    <div class="stat-digit" id="newUser"></div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="col-lg-3">
	                        <div class="card">
	                            <div class="stat-widget-one">
	                                <div class="stat-icon dib"><i class="ti-layout-grid2 color-pink border-pink"></i></div>
	                                <div class="stat-content dib">
	                                    <div class="stat-text">상품 개수</div>
	                                    <div class="stat-digit" id="totalMenu"></div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    
	                </div>
	                <div class="row" style="height:500px">
						<div style="width:70%;height:400px;margin:auto">
						<div id="canvas">
							
							<div id="south"></div>
							<div id="seoul"><h2>서울특별시</h2></div>
							<div id="gygg"><h2>경기도</h2></div>
							<div id="incheon"><h2>인천광역시</h2></div>
							<div id="gangwon"><h2>강원도</h2></div>
							<div id="chungbuk"><h2>충청북도</h2></div>
							<div id="chungnam"><h2>충청남도</h2></div>
							<div id="daejeon"><h2>대전광역시</h2></div>
							<div id="sejong"><h2>세종특별자치시</h2></div>
							<div id="gwangju"><h2>광주광역시</h2></div>
							<div id="jeonbuk"><h2>전라북도</h2></div>
							<div id="jeonnam"><h2>전라남도</h2></div>
							<div id="gyeongbuk"><h2>경상북도</h2></div>
							<div id="gyeongnam"><h2>경상남도</h2></div>
							<div id="daegu"><h2>대구광역시</h2></div>
							<div id="busan"><h2>부산광역시</h2></div>
							<div id="ulsan"><h2>울산광역시</h2></div>
							<div id="jeju"><h2>제주특별자치도</h2></div>
						</div>
                            <div class="card" style="width:max-content">
                                <div class="card-title">
                                    <h4>지역별 회원수</h4>
                                    
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-striped">
                                            <thead>
                                                <tr>
                                                    <th>지역</th>
                                                    <th>회원수</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <th scope="row">서울</th>
                                                    <td class="color-primary" id="l0"></td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">경기</th>
                                                    <td class="color-success" id="l1"></td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">인천</th>
                                                    <td class="color-danger" id="l2"></td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">강원</th>
                                                    <td class="color-warning" id="l3"></td>
                                                </tr>
                                                
                                            </tbody>
                                        </table>
                                        <table class="table table-striped">
                                            <thead>
                                                <tr>
                                                    <th>지역</th>
                                                    <th>회원수</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                
                                                <tr>
                                                    <th scope="row">충북</th>
                                                    <td class="color-primary" id="l4"></td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">충남</th>
                                                    <td class="color-success" id="l5"></td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">대전</th>
                                                    <td class="color-danger" id="l6"></td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">광주</th>
                                                    <td class="color-warning" id="l7"></td>
                                                </tr>
                                                
                                                
                                            </tbody>
                                        </table>
                                        <table class="table table-striped">
                                            <thead>
                                                <tr>
                                                    <th>지역</th>
                                                    <th>회원수</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <th scope="row">전북</th>
                                                    <td class="color-primary" id="l8"></td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">전남</th>
                                                    <td class="color-success" id="l9"></td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">경북</th>
                                                    <td class="color-danger" id="l10"></td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">경남</th>
                                                    <td class="color-warning" id="l11"></td>
                                                </tr>
                                                
                                            </tbody>
                                        </table>
                                        <table class="table table-striped">
                                            <thead>
                                                <tr>
                                                    <th>지역</th>
                                                    <th>회원수</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <th scope="row">대구</th>
                                                    <td class="color-primary" id="l12"></td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">부산</th>
                                                    <td class="color-success"id="l13"></td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">울산</th>
                                                    <td class="color-danger" id="l14"></td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">제주</th>
                                                    <td class="color-warning" id="l15"></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
						</div>
	                </div>
	                
	                
	            
	            
	                <div class="row">
	                    <div class="col-lg-12">
	                        <div class="footer">
	                            <p>2018 © Admin Board. - <a href="#">jamong.com</a></p>
	                        </div>
	                    </div>
	                </div>
	            </section>
	        </div>
	    </div>
	</div>


	
	<!-- 관리자 홈 공통 bottom include -->
	<%@include file="inc/bottom_js.jsp" %>
	<!-- 화면별 고유 scripit init -->
	<script src="<c:url value='/assets/js/lib/jeoncss/raphael_min.js'/>"></script>
	<script src="<c:url value='/assets/js/lib/jeoncss/raphael_path_s.korea.js'/>"></script>


<%@include file="inc/admin_bottom.jsp" %>