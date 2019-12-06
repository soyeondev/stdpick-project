<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>STUDER-PICK</title>

<!-- Plugins CSS -->
<link href="css/plugins/plugins.css" rel="stylesheet">
<!-- REVOLUTION STYLE SHEETS -->
<link rel="stylesheet" type="text/css"
	href="revolution/css/settings.css">
<!-- REVOLUTION LAYERS STYLES -->
<link rel="stylesheet" type="text/css" href="revolution/css/layers.css">
<!-- REVOLUTION NAVIGATION STYLES -->
<link rel="stylesheet" type="text/css"
	href="revolution/css/navigation.css">
<!-- load css for cubeportfolio -->
<link rel="stylesheet" type="text/css"
	href="cubeportfolio/css/cubeportfolio.min.css">
<link href="css/style.css" rel="stylesheet">

	<!-- Bootstrap-->
<link href="admin-dashboardUi/lib/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!--Common Plugins CSS -->
<link href="admin-dashboardUi/css/plugins/plugins.css" rel="stylesheet">
<!--fonts-->
<link href="admin-dashboardUi/lib/line-icons/line-icons.css" rel="stylesheet">
<link href="admin-dashboardUi/lib/font-awesome/css/fontawesome-all.min.css" rel="stylesheet">
<link href="admin-dashboardUi/lib/select2/dist/css/select2.min.css" rel="stylesheet">
<link href="admin-dashboardUi/css/select2-custom.css" rel="stylesheet">
<link href="admin-dashboardUi/css/style.css" rel="stylesheet">
<link href="admin-dashboardUi/lib/dt-picker/jquery.datetimepicker.min.css" rel="stylesheet">
<link href="admin-dashboardUi/lib/chartist/chartist.min.css" rel="stylesheet" />
<link href="admin-dashboardUi/css/chartist-custom.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/dist/css/style.css">
 <style type="text/css">
  .ct-series-a .ct-line, .ct-series-a .ct-point{ stroke: #23cc62; }
  .ct-series-b .ct-line, .ct-series-b .ct-point{ stroke: #FF5029; }
  .ct-series-c .ct-line, .ct-series-c .ct-point{ stroke: #FFCE40; }
  .ct-series-d .ct-line, .ct-series-d .ct-point{ stroke: #2d82e3; }
  .ct-series-e .ct-line, .ct-series-e .ct-point{ stroke: #572BC9; }
  
  .chartist-tooltip {
  position: absolute;
  display: block;
  width: 100px;
  padding: .5rem;
  border-radius: 10px;
  opacity: 0;
  background: #0084ff;
  color: #e5f2ff;
  font-size: 16px;
  font-weight: 700;
  text-align: center;
  pointer-events: none;
  z-index: 1000;
  -webkit-transition: opacity .2s linear;
  -moz-transition: opacity .2s linear;
  -o-transition: opacity .2s linear;
  transition: opacity .2s linear; 
  }
 </style>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- jQuery first, then Tether, then Bootstrap JS. -->
<script src="js/plugins/plugins.js"></script>
<script src="js/assan.custom.js"></script>
<!-- Common plugins -->
<script type="text/javascript"
	src="admin-dashboardUi/js/plugins/plugins.js"></script>
<script type="text/javascript"
	src="admin-dashboardUi/js/appUi-custom.js"></script>
<script type="text/javascript"
	src="admin-dashboardUi/lib/peity/jquery.peity.min.js"></script>
<script src="admin-dashboardUi/lib/select2/dist/js/select2.min.js"></script>
<script type="text/javascript"
	src="admin-dashboardUi/js/dashboard02-custom.js"></script>
<script src="admin-dashboardUi/lib/chartist/chartist.min.js"></script>
<script src="admin-dashboardUi/lib/chartist/chartist-tooltip.js"></script>
<script type="text/javascript"
	src="admin-dashboardUi/lib/dt-picker/jquery.datetimepicker.full.min.js"></script>
	
<script type="text/javascript"
	src="admin-dashboardUi/lib/chartjs/dist/chart.min.js"></script>

<script type="text/javascript">
	$(function() {
		//변수 선언 ====================================================================
		var provider_no = $("#loginID").val();
		var MONTHS = [ 'January', 'February', 'March', 'April', 'May', 'June',
				'July', 'August', 'September', 'October', 'November', 'December' ];
//		var chartColor = ['#23cc62','#FF5029 ', '#FFCE40','#2d82e3 ', '#572BC9' ];
		var chartColor = ['rgba(35, 204, 98, 1)','rgba(255, 80, 41, 1) ', 
				'rgba(255, 206, 64, 1)','rgba(45, 130, 227, 1) ', 'rgba(87, 43, 201, 1)' ];
		var myDoughnutChart ="";
		var myBarChart ="";
		var myLineChart ="";
		
		//$("#date_timepicker_start").datetimepicker();
		//$("#date_timepicker_end").datetimepicker();

		//===========================================================================
		
		//초기값 설정 > 1년전부터 현재까지 수익 
		var today = new Date();
		var today_year = today.getFullYear();
		var today_month = today.getMonth()+1;	//지금 10월이니까 9반환 + 1
		var today_date = today.getDate();	
		
		var endDate = today_year+"/"+today_month+"/"+today_date;
		var startDate = Number(today_year-1)+"/"+today_month+"/"+today_date;
		
		getEarning(startDate, endDate);

		$("#btnDaySearch").click(function() {
			startDate = $("#date_timepicker_start").val();
			endDate = $("#date_timepicker_end").val();
			getEarning(startDate, endDate);
		});
		
		
		
		//Filter Earinings 선택될때 >> 매출그래프 다시 띄우기
		function getEarning(startDate, endDate) {
			$("#listCafe").empty();			
			if(myBarChart != "") {
				myBarChart.destroy();
				myDoughnutChart.destroy();
				myLineChart.update();
			}

			var arr_startDate = startDate.split("/");
			var arr_endDate = endDate.split("/");
			
			var startDate_year = arr_startDate[0];
			var startDate_month = arr_startDate[1];
			var endDate_year = arr_endDate[0];
			var endDate_month = arr_endDate[1];
			var gap_year = endDate_year - startDate_year;
			
			var label_count = endDate_month - startDate_month + 1 + gap_year*12;  //개월수 계산
																	//11 - 11 + 1 + 12 = 13
			var sm = startDate_month;
			//막대그래프 labels 만들기	>>barChart, LineChart에 쓸 것
			var labels = new Array();
			for(var i=0; i<label_count; i++) {
				if(Number(sm) +i-1 > 11 ) {
					sm -= 12;	
				}
				labels.push( MONTHS[Number(sm)+i-1] );
			}
			

			var cafe_names = new Array();
			var backgroundColor = new Array();
			var yearIncome = new Array();
			var month_datasets = new Array();
			var year_datasets;
			var series = new Array();

			$.ajax({url:"getProvCafe",data:{"provider_no":provider_no},dataType:"JSON", async:false,
				success:function(data) {
					$.each(data, function(idx, item) {
						//BarChart 데이터 만들기
						var monthIncome;	//월별 수익을 배열형식으로 저장
						$.ajax({url:"listMonthIncome", 
							data:{"cafe_no":item.cafe_no, "startDate":startDate, "endDate":endDate}, 
							async:false, success:function(r) {
								monthIncome = r;
						}});

	 					var dataset = {label:item.cafe_name, data: monthIncome,
	 							backgroundColor:chartColor[idx], hoverBackgroundColor:chartColor[idx], fill : false};
	 					month_datasets.push(dataset);	//datasets에 생성된 객체 삽입
	 					
	 					//lineChart 데이터 만들기
	 					series.push(monthIncome);
	 					
	 					//doughnutChart 데이터 만들기
	 					cafe_names.push(item.cafe_name);
	 					backgroundColor.push(chartColor[idx]);
	 					$.ajax({url:"listYearIncome", 
	 						data:{"cafe_no" : item.cafe_no, "startDate":startDate, "endDate":endDate}, 
	 						async:false, success:function(r) {
	 							yearIncome.push(r);	
	 					}});
	
	 					//카페리스트 뿌리기
	 					var col =  12 / data.length;
	 					var div1 = $("<div class='col-lg-"+col+" mb-6 col-md-6 mb-30'></div>");
	 					var div2 = $("<div class='list border1 rounded overflow-hidden'></div>");
	 					var div3 = $("<div class='list-item'></div>");
	 					var div4 = $("<div class='list-thumb bg-warning-active text-warning-light avatar rounded-circle avatar60 shadow-sm'></div>");
	 					var i = $("<i class='icon-Coffee'></i>");
	 					var div5 = $("<div class='list-body text-right'></div>");
	 					var span1 = $("<span class='list-title fs17'>"+item.cafe_name+"</span>");
	 					var span2 = $("<span class='list-content fs14'>"+item.cafe_loc+"</span>");
	 					
	 					var a = $("<a href='provMyCafeView.do?cafe_no="+item.cafe_no+"'></a>");
	 			
	 					$(div5).append(span1, span2);
	 					$(div4).append(i);
	 					$(div3).append(div4, div5);
	 					$(div2).append(div3);
	 					$(a).append(div2);
	 					$(div1).append(a);
	 					
	 					$("#listCafe").append(div1);
	 					
					});			
			}});
			//alert(JSON.stringify(month_datasets));
			
			// 차트 뿌리기 ================================================================
			myBarChart = new Chart(document.getElementById("barChart"), {
				type : 'bar',
				data : {
					labels : labels,			//달
	 				datasets : month_datasets
				}
			});

			myDoughnutChart = new Chart(document.getElementById("doughnutChart"), {
				type : 'pie',
				data : {
					labels : cafe_names,
					datasets : [ {
						data : yearIncome,
						backgroundColor : backgroundColor,
						hoverBackgroundColor:backgroundColor
						
					} ]
				}
			});
			
			myLineChart = new Chartist.Line('.ct-chart', {
				  labels: labels,
				  series: series
				}, {
			 	  plugins: [
				    Chartist.plugins.tooltip()
				  ],
				  fullWidth: true,
				  chartPadding: {
				    right: 40
				  }
			});
			
		}
		
		
		
		
		//최근판매목록 ==================================================================
		$.ajax({url:"listProvAllSale", data:{"provider_no":provider_no, "start":1, "end":10}, dataType:"JSON",
			success:function(data) {
			$.each(data, function(idx, item) {
				var tr = $("<tr></tr>");
				var td1 = $("<td></td>").html(item.pay_no);
				var td2 = $("<td></td>").html(item.cafe_name);
				var td3 = $("<td></td>").html(item.product);
				var td4 = $("<td></td>").html(item.totalprice);
				var td5 = $("<td></td>").html(item.id);
				
				
				$(tr).append(td1, td2, td3, td4, td5);
				$("#tb").append(tr);
			});
		}});
	});
</script>


</head>

<body>


	<!--/preloader-->
	<div id="preloader">
		<div id="preloader-inner"></div>
	</div>
	<!-- Site Overlay -->
	<div class="site-overlay"></div>
	<!-- Site Overlay -->


  		<nav class="navbar navbar-expand-lg navbar-light navbar-transparent bg-faded nav-sticky">
		<div class="search-inline">
			<form>
				<input type="text" class="form-control"
					placeholder="Type and hit enter...">
				<button type="submit">
					<i class="ti-search"></i>
				</button>
				<a href="javascript:void(0)" class="search-close"><i
					class="ti-close"></i></a>
			</form>
		</div>
		<!--/search form-->
		<div class="container">

			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarNavDropdown"
				aria-controls="navbarNavDropdown" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<a class="navbar-brand" href="index.do"> <img class='logo logo-dark' style="top:-25px;" src="images/logo.png" alt=""> <!--                    <img class='logo logo-light hidden-md-down' style="top:-20px;" src="images/logo-light.png" alt=""> 아래 검은로고로 대체함-->
			<img class='logo logo-light hidden-md-down' style="top:-20px;" src="images/logo.png" alt="">
			</a>
			<div id="navbarNavDropdown" class="navbar-collapse collapse">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item dropdown dropdown-full-width"><a
						class="nav-link" href="intro"
						aria-haspopup="true" aria-expanded="false"><font style="color: black;">스투더픽소개 </font> </a></li>
					<li class="nav-item dropdown dropdown-full-width"><a
						class="nav-link" href="cafeList1.do"
						aria-haspopup="true" aria-expanded="false"> <font style="color: black;">스터디카페</font> </a></li>
					<li class="nav-item dropdown dropdown-full-width"><a
						class="nav-link"  href="listStd.do"
						aria-haspopup="true" aria-expanded="false"> <font style="color: black;">스투더</font> </a></li>
					<li class="nav-item dropdown"><a class="nav-link"
						 aria-haspopup="true" aria-expanded="false"
						href="diningSch"><font style="color: black;">맛집찾기</font></a></li>
					<li class="nav-item dropdown">
					   <c:if test="${!empty loginVo }">
                        	<c:choose>
                        		<c:when test="${loginVo.role eq 'customer' }">
                        			<a id="SNS" class="nav-link" aria-haspopup="true" aria-expanded="false" href="snsMyPageView.do?cust_no=${loginVo.no }&provider_no=-1" ><font style="color: black;">SNS</font></a>
                        		</c:when>
                        		<c:otherwise>
                        			<a id="SNS" class="nav-link" aria-haspopup="true" aria-expanded="false" href="snsMyPageView.do?cust_no=-1&provider_no=${loginVo.no }" ><font style="color: black;">SNS</font></a>	
                        		</c:otherwise>
                        	</c:choose>
                        </c:if>
                        <c:if test="${empty loginVo }">
                        	<a class="nav-link" aria-haspopup="true" aria-expanded="false" href="login" ><font style="color: black;">SNS</font></a>
                        </c:if>
					<li class="nav-item dropdown" ><a
						class="nav-link  dropdown-toggle" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false" href="#" style="color: black!important;"><font style="color: black;">고객지원</font></a>
						<ul class="dropdown-menu" style="background-color: #212121!important">
							<li><a tabindex="-1" href="listNotice.do" class="dropdown-item">공지사항</a>

							</li>
							<li><a tabindex="-1" href="listQa.do" class="dropdown-item">Q&A</a>

							</li>
							<li><a tabindex="-1" href="listEvt.do" class="dropdown-item">프로모션</a>

							</li>
						</ul></li>
				</ul>
				<ul class="nav flex-row order-lg-2 ml-auto nav-icons">
					  <c:choose>
                            <c:when test="${not empty loginVo}">
                                <li class="nav-item dropdown user-dropdown align-items-center">
                                    <a class="nav-link" href="#" id="dropdown-user" role="button"
                                       data-toggle="dropdown" style="color: black!important">
                                <span class="user-states states-online">
                                    <img src="cust_img/${loginVo.cust_img }" width="35" height="35px!important" alt="" class="rounded-circle">
                                </span>
                                        <span class="ml-2 h-lg-down dropdown-toggle">
                                                <font style="color: black;">${loginVo.nick_name}</font>
                                        </span>
                                    </a>
                                    
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdown-user" style="background-color: #212121!important">
                                        <a class="dropdown-item" href="profile"><i class="icon-User"></i>My Profile</a>
                                        <c:choose>
                                        	<c:when test="${loginVo.role eq 'customer' }">
                                        		 <a class="dropdown-item" href="custMyPage?cust_no=${loginVo.no }"><i class="icon-User"></i>고객 My Page</a>
                                        	</c:when>
                                        	<c:otherwise>
                                        		<a class="dropdown-item" href="provMyPageView.do?cust_no=${loginVo.no }"><i class="icon-User"></i>사업자 My Page</a>
                                        	</c:otherwise>
                                        </c:choose>
                                        <!--추가하면 되는 부분  -->
                                        <a class="dropdown-item" href="logout"><i class="icon-Power"></i>
                                            Log Out</a>

                                    </div>
                                </li>
                                <li class="h-lg-up nav-item">
                                    <a href="#" class=" nav-link collapsed" data-toggle="collapse"
                                       data-target="#navbarToggler" aria-expanded="false">
                                        <i class="icon-Magnifi-Glass2"></i>
                                    </a>
                                </li>
                            </c:when>
                            <c:otherwise>
                               <li><a href="login"><font style="color: #F4923D">Join Us</font></a></li>
                            </c:otherwise>
                        </c:choose>
				</ul>
			</div>
			<div class="navbar-right-elements" style="margin: 30px"></div>
			<!--right nav icons-->
		</div>

	</nav>

	<!-- 상단 메뉴바? 이미지 -->
	<br>
	<br>
	<br>
	<div class="page-titles title-dark pt30 pb20 mb30">
		<div class="container">
			<div class="row">
				<div class=" col-md-6">
					<h4>
						<span>My Page</span>
					</h4>
				</div>
				<div class=" col-md-6 mb0">
					<ol class="breadcrumb text-md-right" style="background-color: #323232;">
						<li class="breadcrumb-item">Home</li>
						<li class="breadcrumb-item active">My Page</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	<!--page title end-->

	<!-- ###################################################################### -->
	<input id="loginID" type="hidden" value="${loginVo.no }">
	<!-- 요기에 넣어!!!!!-->
	

	
	<div class="page-wrapper" id="page-wrapper">
		<main class="content">
		<div class="page-content ">
			<div class="row align-items-center mb-30 pt-30">
				<div class="col-md-12 mr-auto ml-auto">
					<div class="mb-0">
						<a href='insertLicenseNumber.do' class='float-right btn btn-sm btn-info btn-icon' style="background-color: #F4923D; border-color: #FEA65A;">
							<i class="fa fa-plus" aria-hidden="true"></i>&nbsp;&nbsp;카페 개설
						</a>
						<h4>환영합니다, <span>${loginVo.nick_name }</span>님 !</h4>
					</div>
				</div>
			</div>
			
			<!-- 날짜 필터링 -->
			<div class="nav pb-3 pt-30">
				<span class="pr-2 pt-2"><i
					class="fa fa-filter mr-2 text-muted"></i>Filter Earnings</span>
				<div class="nav-item p-1">
					<input placeholder="From" type="text" class="form-control"
						id="date_timepicker_start">
				</div>
				<div class="nav-item p-1">
					<input placeholder="To" type="text" class="form-control"
						id="date_timepicker_end">
				</div>
				<div class="nav-item p-1">
					<button id="btnDaySearch" class="btn btn-outline-warning mb5">검색</button>
				</div>
				
			</div>
			
			<div class="row">
				<!-- 월매출 -->
				<div class="col-lg-7">
					<div class="portlet-box mb-30">
						<div
							class="portlet-header bg-light flex-row b-b flex d-flex align-items-center">
							<div class="flex d-flex flex-column  bg-light">
								<h3>월매출</h3>
							</div>
						</div>
						<div class="portlet-body" align="center">
							<canvas id="barChart"></canvas>
						</div>
					</div>
				</div>

				<!-- 기간 총 매출 -->
				<div class="col-lg-5 mb-30 ">
					<div class="portlet-box bg-trans  flex full-height">
						<div
							class="portlet-header bg-light flex-row b-b flex d-flex align-items-center">
							<div class="flex d-flex flex-column  bg-light">
								<h3>기간 총 매출</h3>
							</div>
						</div>
						<div class="portlet-body  flex full-height" align="center" >
							<canvas id="doughnutChart" style="margin-top: 10%; margin-bottom: 10%;"></canvas>
						</div>
					</div>
				</div>
			</div> 
			
			<div class="row">
				<!-- 라인 차트 -->
				<div class="col-lg-12 mb-30 ">
					<div class="portlet-box bg-trans  flex full-height">
						<div
							class="portlet-header bg-light flex-row b-b flex d-flex align-items-center">
							<div class="flex d-flex flex-column  bg-light">
								<h3>증감 그래프</h3>
							</div>
						</div>
						<div class='chartist flex full-height'>
							<div style="height: 300px;" class="ct-chart"></div>
						</div>
					</div>
				</div>
			</div>
			
			

			<!-- 보유 카페 목록 -->
			<div class="row" id="listCafe">
				<!-- col-lg-n : n:열 // mb:밑마진  // col-md:옆마진 인듯~  -->
			</div>
			<!--/row-->
			
			<div class="row">
				<div class="col-lg-12">
					<div class="portlet-box portlet-fullHeight mb-30">
						<div
							class="portlet-header bg-light flex-row flex d-flex align-items-center">
							<div class="flex d-flex flex-column">
								<h3>최근 판매 목록</h3>
							</div>
							<div class="portlet-tools">
								<ul class="nav">
									<li class="nav-item pl-3"><a href="provSaleListView.do" class="btn btn-link">
											전체 판매 목록 보기</a></li>
								</ul>
							</div>
						</div>
						<div class="portlet-body no-padding">

							<div class="table-responsive">
								<table class="table mb-0">
									<thead>
										<tr>
											<th>주문번호</th>	<!-- pay_no -->
											<th>카페</th>
											<th>상품</th>
											<th>가격</th>
											<th>구매자<th>
										</tr>
									</thead>
									<tbody id="tb"></tbody>
								</table>
							</div>
						</div>
					</div>
					<!--portlet-->
				</div>
				<!--col-->
			</div>
		</div>
		<!-- page content end-->
	</main>
	</div>
	

	<!-- ###################################################################### -->





	<br>
	 <footer class="footer footer-dark pt50 pb30">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6  ml-auto mr-auto text-center">
                        <ul class="social-icons list-inline">
                            <li class="list-inline-item">
                                <a href="#">
                                    <i class="fa fa-facebook"></i>Facebook
                                </a>
                            </li>
                            <li class="list-inline-item">
                                <a href="#">
                                    <i class="fa fa-twitter"></i>twitter
                                </a>
                            </li>
                            <li class="list-inline-item">
                                <a href="#">
                                    <i class="fa fa-instagram"></i>instagram
                                </a>
                            </li>
                            <li class="list-inline-item">
                                <a href="#">
                                    <i class="fa fa-behance"></i>Behance
                                </a>
                            </li>
                        </ul>
                        <h4><i class="fa fa-phone"></i>010-6868-9295</h4>
                        <h4><i class="fa fa-envelope"></i>msb9876@naver.com</h4>
                        <p>© Copyright  by Team BoB</p>
                    </div>
                </div>
            </div>
        </footer><!--/footer-->

	<!--back to top-->
	<a href="#" class="back-to-top hidden-xs-down" id="back-to-top"><i
		class="ti-angle-up"></i></a>
	<script src="js/plugins/plugins.js"></script>
	<script src="js/assan.custom.js"></script>
	<script src="admin-dashboardUi/js/appUi-custom.js"></script>



</body>

</html>
