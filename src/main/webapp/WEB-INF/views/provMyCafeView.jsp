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
<link href="admin-dashboardUi/lib/line-icons/line-icons.css"
	rel="stylesheet">
<link
	href="admin-dashboardUi/lib/font-awesome/css/fontawesome-all.min.css"
	rel="stylesheet">

<link href="admin-dashboardUi/lib/select2/dist/css/select2.min.css"
	rel="stylesheet">
<link href="admin-dashboardUi/css/select2-custom.css" rel="stylesheet">
<link href="admin-dashboardUi/css/style.css" rel="stylesheet">

<link href="admin-dashboardUi/lib/fullcalendar/fullcalendar.min.css"
	rel="stylesheet">


<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="js/jquery.weekly-schedule-plugin.js"></script>

<!-- jQuery first, then Tether, then Bootstrap JS. -->
<script src="js/plugins/plugins.js"></script>
<script src="js/assan.custom.js"></script>
<!-- Common plugins -->
<script type="text/javascript"
	src="admin-dashboardUi/js/appUi-custom.js"></script>
<script type="text/javascript"
	src="admin-dashboardUi/lib/peity/jquery.peity.min.js"></script>
<script src="admin-dashboardUi/lib/select2/dist/js/select2.min.js"></script>
<script type="text/javascript"
	src="admin-dashboardUi/js/dashboard02-custom.js"></script>


<script src="admin-dashboardUi/lib/fullcalendar/moment.js"></script>
<script src="admin-dashboardUi/lib/fullcalendar/fullcalendar.min.js"></script>

<script type="text/javascript">
	$(function() {
		//=================================================================
		var cafe_no = $("#cafe_no").val();
		var cafe_name = $("#cafe_name").val();
		var selDate = "";
		
		var room_nos = new Array();
		var room_names = new Array();
		//================================================================
			
		//해당 카페의 룸명 가져오는 함수
		function getRoomName(cafe_no) {
			$.ajax({url:"getRoom", data:{cafe_no:cafe_no}, dataType : "json", async:false,
			success: function(data) {
				$.each(data, function(idx, d) {
					room_names.push(d.room_name);
					room_nos.push(d.room_no);
				});
			}});
	  	}
		getRoomName(cafe_no);	
		
		// 영업시간(룸예약가능한시간) 가져오는 함수
		function getRoomTime(room_no) {
			var str = "";
			var start_time;
			var end_time;
			$.ajax({url:"getRoomTime", data:{room_no:room_no}, dataType : "json", async:false,
			success: function(data) {
				start_time = data[0].start_time + ":00";
				end_time = Number(data[data.length-1].end_time - 1) +":00";
				
			}});
			str = start_time+"-"+end_time;
			return str;
	  	}
			
		//이미 예약된 시간(정보) 가져오는 메소드! 클릭 hover 다 막기!!
		function getRoomReser(reser_date) {
			$.ajax({url:"getRoomReser",
				data:{cafe_no:cafe_no, reser_date:reser_date}, dataType : "json", async:false,
				success:function(r) {
					$.each(r, function(idx, rr) {
						var room_name = rr.room_name;
						var id = rr.id;
						for(var i=0; i<rr.reser_time; i++) {
							var time_reserved = Number(rr.reser_start + i);
							if(time_reserved > 12) {
								time_reserved = Number(time_reserved-12) + "\\:00PM"
							}else if(time_reserved == 12) {
								time_reserved = time_reserved + "\\:00PM"
							}
							else {
								time_reserved = time_reserved + "\\:00AM"
							}	
							$('.'+room_name).find('.'+time_reserved).css('background','#ff6619');
							if(i==0) {
								$('.'+room_name).find('.'+time_reserved).html(id).css('color','white');
							}
							
							$('.hour').css("pointer-events", "none").css("cursor", "default");
						}
					});
			}});
		}
		
		//캘린더에 이벤트 추가 ============================================================
		var COLOR = ['#30ff68', '#3686ff', '#c229ff']; 	//1, 2, 3건
		
		function getReserCount() {
			var eventSources = new Array();

			$.ajax({url:"getReserCount", data:{"cafe_no":cafe_no}, async:false, dataType : "json",
				success:function(data) {
					$.each(data, function(idx, item) {
	
						var reser_date = item.reser_date;
						var arr = reser_date.split(" ");
						var start = arr[0];
						
						var events = new Array();
						var event = {title:item.reser_count+"건", start:start};
						events.push(event);
						
						var backColor="";
						if(item.reser_count == 1 ){
							backColor = COLOR[0];
						}else if(item.reser_count == 2) {
							backColor = COLOR[1];
						}else {
							backColor = COLOR[2];
						}
						
						var eventSource = {events:events, color: backColor, textColor:"#000000" };
						eventSources.push(eventSource);						
					});

			}});
			return eventSources;
		}
		
// 		var result = JSON.stringify(getReserCount());
// 		alert(result);

		//화면에 가져온 정보들 뿌리기. 캘린더, 타임테이블 생성 =========================================
		$("#span_cafe_name").html(cafe_name);
		
		$('#calendar').fullCalendar({
			eventSources : getReserCount(),
			dayClick : function(date, jsEvent, view) {
				var selDate = date.format();
				$("#selDate").html("선택한 날짜 : "+selDate);
				
				//날짜 바꾸면 색깔 다시 돌려놓기
				$(".hour").html("");
				$(".hour").css('background','#DDDDDD');
				
				getRoomReser(selDate);
			}
		});
		//캘린더 이벤트 클릭 못하게 막기. day만 클릭하도록. 안그러면 href 이상한데로 감ㅠㅠ
		$('.fc-event-container>a').css("pointer-events", "none").css("cursor", "default");
		//다음달, 이전달 눌렀을때도 <a>태그 막기
		$(".fc-button").click(function() {
			$('.fc-event-container>a').css("pointer-events", "none").css("cursor", "default");
		});
			
		
		var $j = jQuery.noConflict();
		$('#mySchedule').weekly_schedule({
			
			  days: room_names, 
			  hours: getRoomTime(room_nos[0]), 
			  fontFamily: "Montserrat", 
			  fontColor: "black", 
			  fontWeight: "100", 
			  fontSize: "15px", 
			  
			  hoverColor: "#727bad", 
			  selectionColor: "#9aa7ee", 
			  headerBackgroundColor: "transparent",
		});
		$('.hour').css("pointer-events", "none").css("cursor", "default");
		
		// 구매목록 테이블 페이징 메소드 ==========================================================
		//이용권 목록 뿌리는 메소드 - 페이징
		function listCafePassSale(cafe_no, start, end) {
			$("#tb").empty();
			$.ajax({url:"listCafePassSale",
				data:{"cafe_no":cafe_no, "start":start, "end":end }, dataType : "json", async:false,
				success:function(data) {
					$.each(data, function(idx, item) {
						var tr = $("<tr></tr>");
						var td1 = $("<td></td>").html(item.pay_no);
						var td2 = $("<td></td>").html(item.product);
						var td3 = $("<td></td>").html(item.totalprice);
						var td4 = $("<td></td>").html(item.id);
						
						$(tr).append(td1,td2,td3,td4);
						$("#tb").append(tr);
					});
			}});	
		}
		
		//페이지 출력 하는 메소드
		function paging() {
			$("#pagination").empty();
			$("#btn_prev").empty();
			$("#btn_next").empty();
			//한 화면에 보여줄 시작페이지, 끝페이지 구하기
			var startPage = parseInt(currentPage/pageGROUP) * pageGROUP + 1;
			if(currentPage % 5 == 0) {
				startPage = (parseInt(currentPage/pageGROUP)-1) * pageGROUP + 1;
			}
			var endPage = startPage + pageGROUP - 1;
			
			if(endPage > totalPage) {
				endPage = totalPage;
			}
	
			for(var i=startPage; i<=endPage; i++) {
				var a = $("<a style='margin-right:8px;'>"+i+"</a>");
				$("#pagination").append(a);
			}

			$("a").click(function() {
				currentPage = $(this).html();
				start = (currentPage-1) * pageSIZE +1;
				end = currentPage * pageSIZE;
				listCafePassSale(cafe_no, start, end);
				paging();
			});
			
			if(currentPage > pageGROUP) {
				var btn_prev = $("<button class='btn-primary' style='padding:5px; border-radius: 10px;'>이전</button>");
				$("#btn_prev").append(btn_prev);
				$(btn_prev).click(function() {
					currentPage = startPage - 1;
					start = (currentPage-1) * pageSIZE +1;
					end = currentPage * pageSIZE;
					listCafePassSale(cafe_no, start, end);
					paging();
				});
			}
			
			if(currentPage < totalPage && endPage+1<=totalPage) {
				var btn_next = $("<button class='btn-primary' style='padding:5px; border-radius: 10px;'>다음</button>");
				$("#btn_next").append(btn_next);
				$(btn_next).click(function() {
					currentPage = endPage + 1;
					start = (currentPage-1) * pageSIZE +1;
					end = currentPage * pageSIZE;
					listCafePassSale(cafe_no, start, end);
					paging();
				});
			}
		}
		//===========================================================================
			
		var pageSIZE = 5;		//한 페이지당 보여줄 레코드 수
		var pageGROUP = 5;		//한 화면에 보여줄 페이지수
		var totalRecord = 0;	//전체 레코드 수
		var totalPage = 1; 		//전체 페이지 수
		
		//전체 레코드 수 구하기
		$.ajax({url:"countCafePassSale", data:{cafe_no:cafe_no}, async:false,
			success:function(data) {
			totalRecord = data;
		}});
		
		totalPage = parseInt(totalRecord / pageSIZE);
		if(totalRecord % pageSIZE !=0) {
			totalPage++;
		}
		
		var currentPage = 1;
		var start = (currentPage-1) * pageSIZE +1;
		var end = currentPage * pageSIZE;
		
		//화면에 리스트, pagination 뿌리기 
		listCafePassSale(cafe_no, start, end);
		paging();
	});
</script>
</head>

<body class="bg-white">
	<!-- Site Overlay -->
	<div class="site-overlay"></div>

    <nav class="navbar navbar-expand-lg navbar-light navbar-transparent bg-faded nav-sticky">
            <div class="search-inline">
                <form>
                    <input type="text" class="form-control" placeholder="Type and hit enter...">
                    <button type="submit"><i class="ti-search"></i></button>
                    <a href="javascript:void(0)" class="search-close"><i class="ti-close"></i></a>
                </form>
            </div><!--/search form-->
            <div class="container">

                <button class="navbar-toggler navbar-toggler-right" type="button" 
                data-toggle="collapse" data-target="#navbarNavDropdown" 
                aria-controls="navbarNavDropdown" aria-expanded="false" 
                aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <a class="navbar-brand" href="index.do">
                    <img class='logo logo-dark' style="top:-25px;" src="images/logo.png" alt="">
                    <img class='logo logo-light hidden-md-down' style="top:-20px;" src="images/logo.png" alt="">
                </a>
                <div  id="navbarNavDropdown" class="navbar-collapse collapse">
                    <ul class="navbar-nav ml-auto">
                     <!--    <li class="nav-item dropdown active"> -->
                     
                    	 <li class="nav-item dropdown dropdown-full-width">
                            <a class="nav-link" href="intro">스투더픽 소개</a>
                           
                        </li>
                        <li class="nav-item dropdown dropdown-full-width">
                            <a class="nav-link" href="cafeList1.do" aria-haspopup="true" aria-expanded="false">
                                스터디카페
                            </a>
                   
                        </li>
                        <li class="nav-item dropdown dropdown-full-width">
                            <a class="nav-link" href="listStd.do" aria-haspopup="true" aria-expanded="false">
                                스투더  
                            </a>
                       
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link" aria-haspopup="true" aria-expanded="false" href="diningSch">맛집찾기</a>
                      
                        </li>
                        <li class="nav-item dropdown">
                        <c:if test="${!empty loginVo }">
                        	<c:choose>
                        		<c:when test="${loginVo.role eq 'customer' }">
                        			<a id="SNS" class="nav-link" aria-haspopup="true" aria-expanded="false" href="snsMyPageView.do?cust_no=${loginVo.no }&provider_no=-1" >SNS</a>
                        		</c:when>
                        		<c:otherwise>
                        			<a id="SNS" class="nav-link" aria-haspopup="true" aria-expanded="false" href="snsMyPageView.do?cust_no=-1&provider_no=${loginVo.no }" >SNS</a>	
                        		</c:otherwise>
                        	</c:choose>
                        </c:if>
                        <c:if test="${empty loginVo }">
                        	<a class="nav-link" aria-haspopup="true" aria-expanded="false" href="login" >SNS</a>
                        </c:if>
                            
                     
                        </li>
                        <li class="nav-item dropdown">
                         <a class="nav-link  dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">고객지원</a>
                            <ul class="dropdown-menu" style="background-color: #212121!important">
                                <li>
                                    <a tabindex="-1" href="listNotice.do" class="dropdown-item">공지사항</a>
                                   
                                </li>
                                <li>
                                    <a tabindex="-1" href="listQa.do" class="dropdown-item">Q&A</a>
                                   
                                </li>
                                <li>
                                    <a tabindex="-1" href="listEvt.do	" class="dropdown-item">프로모션</a>
                                    
                                </li>
                            </ul>
                        </li>
                    </ul>
                    
                    <ul class="nav flex-row order-lg-2 ml-auto nav-icons"  style="margin-left: 50px!important;" >
                        <c:choose>
                            <c:when test="${not empty loginVo}">
                                <li class="nav-item dropdown user-dropdown align-items-center" >
                                    <a class="nav-link" href="#" id="dropdown-user" role="button"
                                       data-toggle="dropdown">
                                <span class="user-states states-online">
                                    <img src="cust_img/${loginVo.cust_img }" width="35" height="35px!important" alt="" class="rounded-circle">
                                </span>
                                        <span class="ml-2 h-lg-down dropdown-toggle">
                                                ${loginVo.nick_name}
                                        </span>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdown-user" style="background-color: #212121!important" >
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
                <div class="navbar-right-elements" style="margin: 30px">
               
                </div><!--right nav icons-->
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
					<ol class="breadcrumb text-md-right"
						style="background-color: #323232;">
						<li class="breadcrumb-item">My Cafe</li>
						<li class="breadcrumb-item active">My Page</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	<!--page title end-->

	<!-- ###################################################################### -->
	<!-- 요기에 넣어!!!!!-->
	
	<input type="hidden" value="${cafe_no}" id="cafe_no">
	<input type="hidden" value="${cafe_name}" id="cafe_name">
	
	<div class="page-wrapper" id="page-wrapper">
		<main class="content">
		<div class="page-content">
			<div class="row align-items-center mb-30 pt-30">
				<div class="col-md-12 mr-auto ml-auto">
					<div class="mb-0">
						<a href='cafeManage.do?cafe_no=${cafe_no }' class='float-right btn btn-sm btn-info btn-icon' style="background-color: #F4923D; border-color: #F4923D" >
							&nbsp;&nbsp;카페 관리
						</a>
						<h4>
							<span id="span_cafe_name"></span>
						</h4>
					</div>
				</div>
			</div>

			<div class="row">
				<!-- 날짜선택 -->
				<div class="col-lg-5 mb-30">
					<div class="portlet-box bg-transfull-height ">
						<div
							class="portlet-header bg-light flex-row b-b flex d-flex align-items-center">
							<div class="flex d-flex flex-column">
								<h3>날짜선택</h3>
							</div>
						</div>
						<div class="portlet-body" align="center">
							<div id='calendar'></div>
							<div align="center" id="selDate" style="font-size: 20px;"></div>
						</div>
					</div>
				</div>

				<!-- 예약현황 -->
				<div class="col-lg-7 mb-30">
					<div class="portlet-box bg-transfull-height ">
						<div
							class="portlet-header bg-light flex-row b-b flex d-flex align-items-center">
							<div class="flex d-flex flex-column">
								<h3>예약현황</h3>
							</div>
						</div>
						<div class="portlet-body" align="center">

							<div class="container"
								style="margin: auto; display: flex; flex-direction: row; justify-content: center;">
								<div id="mySchedule"></div>

							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 이용권 판매목록 -->
			<div class="row">
				<div class="col-lg-12">
					<div class="portlet-box portlet-fullHeight mb-30">
						<div
							class="portlet-header bg-light flex-row flex d-flex align-items-center">
							<div class="flex d-flex flex-column">
								<h3>이용권 판매 목록</h3>
							</div>

						</div>
						<div class="portlet-body no-padding">

							<div class="table-responsive">
								<table class="table mb-0">
									<thead>
										<tr>
											<th>주문번호</th>
											<th>상품</th>
											<th>가격</th>
											<th>구매자</th>
										</tr>
									</thead>
									<tbody id="tb"></tbody>
								</table>
								<div align="center" >
								<span id="btn_prev" style="margin-right: 8px;"></span>
								<span id="pagination"></span>
								<span id="btn_next"></span>
								</div>
							</div>
						</div>
					</div>
					<!--portlet-->
				</div>
				<!--col-->
			</div>
		</div>
		</main>
	</div>
	<!-- page content end-->

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


</body>

</html>
