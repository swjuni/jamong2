<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!-- 관리자 홈 top include -->
<%@include file="../inc/admin_top.jsp" %>
	<!--  Chart js -->
    <script src="<c:url value='/assets/js/lib/chart-js/Chart.bundle.js'/>"></script>
    <!-- chart api  -->
    
    
    
<style type="text/css">
	.dt-buttons{
		margin-bottom: 0;
	}
	.dataTables_info{
		margin-right: 50px;
	}
	.paginate_button{
		margin-left: 5px;
		margin-right: 5px;
	}
	.paginate_button.active a{
		color: red;
	}
	.table{
		margin-top: 15px;
		margin-bottom: 15px;
	}
</style>
<!-- 각자가 분담해서 디자인할 바디 태그 -->
			<div class="content-wrap">
      <div class="main">
        <div class="container-fluid">
          <div class="row">
            <div class="col-lg-8 p-r-0 title-margin-right">
              <div class="page-header">
                <div class="page-title">
                  <h1>어서오세요, <span>통계 화면</span></h1>
                </div>
              </div>
            </div>
            <!-- /# column -->
            <div class="col-lg-4 p-l-0 title-margin-left">
              <div class="page-header">
                <div class="page-title">
                 
                </div>
              </div>
            </div>
            <!-- /# column -->
          </div>
          <!-- /# row -->
          <section id="main-content">
            <div class="row">
            <!-- 이거 지우면 나머지 차트가 안뜸 -->
              <div class="col-lg-6" style="display: none;">
                <div class="card">
                  <div class="card-title">
                    <h4>Yearly Sales </h4>

                  </div>
                  <div class="sales-chart">
                    <canvas id="sales-chart"></canvas>
                  </div>
                </div>
              </div>
              
              <!--  -->
               <div class="col-lg-6" style="display: none;">
                <div class="card">
                  <div class="panel-heading">
                    <div class="panel-title">
                      <h4>매출 통계</h4>
                    </div>
                  </div>
                  <div class="panel-body">
                    <canvas id="singelBarChart"></canvas>
                  </div>
                </div>
              </div>
              <!-- /# column -->
              <div class="col-lg-6" style="display: none;">
                <div class="card">
                  <div class="panel-title">
                    <h4>매출통계 2 </h4>

                  </div>
                  <div class="sales-chart">
                    <canvas id="team-chart"></canvas>
                  </div>
                </div>
                <!-- /# card -->
              </div>
              <!-- /# column -->
            </div>
            <!-- /# row -->
            <div class="row">
              <!-- Bar Chart -->
              <div class="col-sm-12 col-md-6" style="display: none;">
                <div class="panel">
                  <div class="panel-heading">
                    <div class="panel-title">
                      <h4>Bar chart</h4>
                    </div>
                  </div>
                  <div class="panel-body">
                    <canvas id="barChart"></canvas>
                  </div>
                </div>
              </div>
              <!-- Radar Chart -->
              <div class="col-sm-12 col-md-6">
                <div class="panel">
                  <div class="panel-heading">
                    <div class="panel-title">
                      <h4>카테고리별 상품 개수</h4>
                    </div>
                  </div>
                  <div class="panel-body">
                    <canvas id="radarChart"></canvas>
                  </div>
                </div>
              </div>
              
              <div class="col-sm-6 col-md-4">
                <div class="panel">
                  <div class="panel-heading">
                    <div class="panel-title">
                      <h4>회원/전문가 비율</h4>
                    </div>
                  </div>
                  <div class="panel-body">
                    <canvas id="pieChart"></canvas>
                  </div>
                </div>
              </div>
            </div>
            <div class="row" style="display: none;">
              <!-- Line Chart -->
              <div class="col-sm-12 col-md-8" >
                <div class="panel panel-bd lobidrag">
                  <div class="panel-heading">
                    <div class="panel-title">
                      <h4>Line chart</h4>
                    </div>
                  </div>
                  <div class="panel-body">
                    <canvas id="lineChart"></canvas>
                  </div>
                </div>
              </div>
              <!-- Pie Chart -->
              <div class="col-sm-6 col-md-4">
                <div class="panel">
                  <div class="panel-heading">
                    <div class="panel-title">
                      <h4>Pie chart</h4>
                    </div>
                  </div>
                  <div class="panel-body">
                    <canvas id=""></canvas>
                  </div>
                </div>
              </div>
            </div>
            <div class="row" style="display: none;">
              <!-- Doughnut Chart -->
              <div class="col-sm-6 col-md-4">
                <div class="panel">
                  <div class="panel-heading">
                    <div class="panel-title">
                      <h4>Doughut chart</h4>
                    </div>
                  </div>
                  <div class="panel-body">
                    <canvas id="doughutChart"></canvas>
                  </div>
                </div>
              </div>
              <!-- Polar Chart -->
              <div class="col-sm-6 col-md-4">
                <div class="panel">
                  <div class="panel-heading">
                    <div class="panel-title">
                      <h4>Polar chart</h4>
                    </div>
                  </div>
                  <div class="panel-body">
                    <canvas id="polarChart"></canvas>
                  </div>
                </div>
              </div>
              <!-- Single Bar Chart -->
             
            </div>

            <div class="row">
              <div class="col-lg-12">
                <div class="footer">
                  <p>2018 © Admin Board. - <a href="#">example.com</a></p>
                </div>
              </div>
            </div>
          </section>
        </div>
      </div>
    </div>
              
              

	<!-- 관리자 홈 공통 bottom include -->
	<%@include file="../inc/bottom_js.jsp" %>
	
	<!-- 화면별 고유 scripit init -->
    <script src="<c:url value='/assets/js/lib/data-table/datatables.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/dataTables.buttons.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/buttons.flash.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/jszip.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/pdfmake.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/vfs_fonts.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/buttons.html5.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/buttons.print.min.js'/>"></script>
    <script src="<c:url value='/assets/js/lib/data-table/datatables-init.js'/>"></script>
    
    <!--  Chart js -->
  
  	
  	
	
	
    
    <script type="text/javascript">
    $(document).ready(function(){
    	"use strict";

    	//Team chart
    	var arrName = new Array();
		var arrCount = new Array();
		
    	$.ajax({
		url :"<c:url value='/admin/statistics/User_statistics1.do' />",
		type: 'post',
		dataType: "json",
		success : function(res) {
		
		for(var i=0;i<res[0].length;i++){
			arrName[i]=res[0][i];
			arrCount[i]=res[1][i];
			
			/* alert(typeof(res[0])+"<-타입:"+res[0]);
			alert(typeof(res[0][0])+"<-타입:"+res[0][0]);
			alert(typeof(res[1])+"<-타입:"+res[1]);
			alert(typeof(res[1][0])+"<-타입:"+res[1][0]); */
		}
			myChart.update(); // 데이터를 바꾼 다음, 이렇게 업데이트를 해야 적용된다.
		},
		error: function(xhr, status, error){
		alert('실패');
		}
		
		});
    	
    	

    	var ctx = document.getElementById( "team-chart" );
    	ctx.height = 150;
    	var myChart = new Chart( ctx, {
    		type: 'line',
    		data: {
    			labels: [ "2010", "2011", "2012", "2013", "2014", "2015", "2016" ],
    			type: 'line',
    			defaultFontFamily: 'Montserrat',
    			datasets: [ {
    				data: [ 0, 7, 3, 5, 2, 10, 7 ],
    				label: "Expense",
    				backgroundColor: 'rgba(0,103,255,.15)',
    				borderColor: 'rgba(0,103,255,0.5)',
    				borderWidth: 3.5,
    				pointStyle: 'circle',
    				pointRadius: 5,
    				pointBorderColor: 'transparent',
    				pointBackgroundColor: 'rgba(0,103,255,0.5)',
                        }, ]
    		},
    		options: {
    			responsive: true,
    			tooltips: {
    				mode: 'index',
    				titleFontSize: 12,
    				titleFontColor: '#000',
    				bodyFontColor: '#000',
    				backgroundColor: '#fff',
    				titleFontFamily: 'Montserrat',
    				bodyFontFamily: 'Montserrat',
    				cornerRadius: 3,
    				intersect: false,
    			},
    			legend: {
    				display: false,
    				position: 'top',
    				labels: {
    					usePointStyle: true,
    					fontFamily: 'Montserrat',
    				},


    			},
    			scales: {
    				xAxes: [ {
    					display: true,
    					gridLines: {
    						display: false,
    						drawBorder: false
    					},
    					scaleLabel: {
    						display: false,
    						labelString: 'Month'
    					}
                            } ],
    				yAxes: [ {
    					display: true,
    					gridLines: {
    						display: false,
    						drawBorder: false
    					},
    					scaleLabel: {
    						display: true,
    						labelString: 'Value'
    					}
                            } ]
    			},
    			title: {
    				display: false,
    			}
    		}
    	} );


    	//Sales chart
    	var ctx = document.getElementById( "sales-chart" );
    	ctx.height = 150;
    	var myChart = new Chart( ctx, {
    		type: 'line',
    		data: {
    			labels: [ "2010", "2011", "2012", "2013", "2014", "2015", "2016" ],
    			type: 'line',
    			defaultFontFamily: 'Montserrat',
    			datasets: [ {
    				label: "Foods",
    				data: [ 0, 30, 10, 120, 50, 63, 10 ],
    				backgroundColor: 'transparent',
    				borderColor: 'rgba(220,53,69,0.75)',
    				borderWidth: 3,
    				pointStyle: 'circle',
    				pointRadius: 5,
    				pointBorderColor: 'transparent',
    				pointBackgroundColor: 'rgba(220,53,69,0.75)',
                        }, {
    				label: "Electronics",
    				data: [ 0, 50, 40, 80, 40, 79, 120 ],
    				backgroundColor: 'transparent',
    				borderColor: 'rgba(40,167,69,0.75)',
    				borderWidth: 3,
    				pointStyle: 'circle',
    				pointRadius: 5,
    				pointBorderColor: 'transparent',
    				pointBackgroundColor: 'rgba(40,167,69,0.75)',
                        } ]
    		},
    		options: {
    			responsive: true,

    			tooltips: {
    				mode: 'index',
    				titleFontSize: 12,
    				titleFontColor: '#000',
    				bodyFontColor: '#000',
    				backgroundColor: '#fff',
    				titleFontFamily: 'Montserrat',
    				bodyFontFamily: 'Montserrat',
    				cornerRadius: 3,
    				intersect: false,
    			},
    			legend: {
    				display: false,
    				labels: {
    					usePointStyle: true,
    					fontFamily: 'Montserrat',
    				},
    			},
    			scales: {
    				xAxes: [ {
    					display: true,
    					gridLines: {
    						display: false,
    						drawBorder: false
    					},
    					scaleLabel: {
    						display: false,
    						labelString: 'Month'
    					}
                            } ],
    				yAxes: [ {
    					display: true,
    					gridLines: {
    						display: false,
    						drawBorder: false
    					},
    					scaleLabel: {
    						display: true,
    						labelString: 'Value'
    					}
                            } ]
    			},
    			title: {
    				display: false,
    				text: 'Normal Legend'
    			}
    		}
    	} );







    	//line chart
    	var ctx = document.getElementById( "lineChart" );
    	ctx.height = 150;
    	var myChart = new Chart( ctx, {
    		type: 'line',
    		data: {
    			labels: [ "January", "February", "March", "April", "May", "June", "July" ],
    			datasets: [
    				{
    					label: "My First dataset",
    					borderColor: "rgba(0,0,0,.09)",
    					borderWidth: "1",
    					backgroundColor: "rgba(0,0,0,.07)",
    					data: [ 22, 44, 67, 43, 76, 45, 12 ]
                                },
    				{
    					label: "My Second dataset",
    					borderColor: "rgba(0, 123, 255, 0.9)",
    					borderWidth: "1",
    					backgroundColor: "rgba(0, 123, 255, 0.5)",
    					pointHighlightStroke: "rgba(26,179,148,1)",
    					data: [ 16, 32, 18, 26, 42, 33, 44 ]
                                }
                            ]
    		},
    		options: {
    			responsive: true,
    			tooltips: {
    				mode: 'index',
    				intersect: false
    			},
    			hover: {
    				mode: 'nearest',
    				intersect: true
    			}

    		}
    	} );


    	//bar chart
    	var ctx = document.getElementById( "barChart" );
    	//    ctx.height = 200;
    	var myChart = new Chart( ctx, {
    		type: 'bar',
    		data: {
    			labels: [ "January", "February", "March", "April", "May", "June", "July" ],
    			datasets: [
    				{
    					label: "My",
    					data: [ 65, 59, 80, 81, 56, 55, 40 ],
    					borderColor: "rgba(0, 123, 255, 0.9)",
    					borderWidth: "0",
    					backgroundColor: "rgba(0, 123, 255, 0.5)"
                                },
    				{
    					label: "My Second dataset",
    					data: [ 28, 48, 40, 19, 86, 27, 90 ],
    					borderColor: "rgba(0,0,0,0.09)",
    					borderWidth: "0",
    					backgroundColor: "rgba(0,0,0,0.07)"
                                }
                            ]
    		},
    		options: {
    			scales: {
    				yAxes: [ {
    					ticks: {
    						beginAtZero: true
    					}
                                    } ]
    			}
    		}
    	} );

    	//radar chart//jeon 카테고리별 상품 개수
    	var ctx = document.getElementById( "radarChart" );
    	
    	ctx.height = 160;
    	var myChart1 = new Chart( ctx, {
    		type: 'radar',
    		data: {
    			labels: arrName,
    			datasets: [
    				{
    					label: "My First dataset",
    					data: arrCount,
    					borderColor: "rgba(0, 123, 255, 0.6)",
    					borderWidth: "1",
    					backgroundColor: "rgba(0, 123, 255, 0.4)"
                                }
                            ]
    		},
    		options: {
    			legend: {
    				position: 'top'
    			},
    			scale: {
    				ticks: {
    					beginAtZero: true
    				}
    			}
    		}
    	} );


    	//pie chart//jeon 회원/전문가 비율
    	var ctx = document.getElementById( "pieChart" );
    	ctx.height = 300;
    	var myChart2 = new Chart( ctx, {
    		type: 'pie',
    		data: {
    			datasets: [ {
    				data: [ ${mem}, ${pro} ],
    				backgroundColor: [
                                        "rgba(250, 20, 20,0.9)",
                                        "rgba(0, 123, 255,0.7)"
                                        
                                    ],
    				hoverBackgroundColor: [
                                        "rgba(250, 20, 20,0.9)",
                                        "rgba(0, 123, 255,0.7)"
                                       
                                    ]

                                } ],
    			labels: [
                                "회원",
                                "전문가"
                            ]
    		},
    		options: {
    			responsive: true
    		}
    	} );

    	//doughut chart
    	var ctx = document.getElementById( "doughutChart" );
    	ctx.height = 150;
    	var myChart = new Chart( ctx, {
    		type: 'doughnut',
    		data: {
    			datasets: [ {
    				data: [ 45, 25, 20, 10 ],
    				backgroundColor: [
                                        "rgba(0, 123, 255,0.9)",
                                        "rgba(0, 123, 255,0.7)",
                                        "rgba(0, 123, 255,0.5)",
                                        "rgba(0,0,0,0.07)"
                                    ],
    				hoverBackgroundColor: [
                                        "rgba(0, 123, 255,0.9)",
                                        "rgba(0, 123, 255,0.7)",
                                        "rgba(0, 123, 255,0.5)",
                                        "rgba(0,0,0,0.07)"
                                    ]

                                } ],
    			labels: [
                                "green",
                                "green",
                                "green",
                                "green"
                            ]
    		},
    		options: {
    			responsive: true
    		}
    	} );

    	//polar chart
    	var ctx = document.getElementById( "polarChart" );
    	ctx.height = 150;
    	var myChart = new Chart( ctx, {
    		type: 'polarArea',
    		data: {
    			datasets: [ {
    				data: [ 15, 18, 9, 6, 19 ],
    				backgroundColor: [
                                        "rgba(0, 123, 255,0.9)",
                                        "rgba(0, 123, 255,0.8)",
                                        "rgba(0, 123, 255,0.7)",
                                        "rgba(0,0,0,0.2)",
                                        "rgba(0, 123, 255,0.5)"
                                    ]

                                } ],
    			labels: [
                                "green",
                                "green",
                                "green",
                                "green"
                            ]
    		},
    		options: {
    			responsive: true
    		}
    	} );

    	// single bar chart
    	var ctx = document.getElementById( "singelBarChart" );
    	ctx.height = 150;
    	var myChart = new Chart( ctx, {
    		type: 'bar',
    		data: {
    			labels: [ "Sun", "Mon", "Tu", "Wed", "Th", "Fri", "Sat" ],
    			datasets: [
    				{
    					label: "My Jeon",
    					data: [ 50, 55, 75, 77, 56, 55, 77 ],
    					borderColor: "rgba(0, 123, 255, 0.9)",
    					borderWidth: "0",
    					backgroundColor: "rgba(0, 123, 255, 0.5)"
                                }
                            ]
    		},
    		options: {
    			scales: {
    				yAxes: [ {
    					ticks: {
    						beginAtZero: true
    					}
                                    } ]
    			}
    		}
    	} );
   	setInterval(function(){
   		myChart1.update();
   		myChart2.update();
   		},500 );
    });
    
	</script>
    <!-- // Chart js -->
    <!-- // Chart js -->
    <script src="<c:url value='/assets/js/lib/bootstrap.min.js'/>">
    	
    </script>
    <script src="<c:url value='/assets/js/scripts.js'/>"></script>
    <!-- scripit init-->

<%@include file="../inc/admin_bottom.jsp" %>    