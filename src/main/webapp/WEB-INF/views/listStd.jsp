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
<!-- Favicon -->
<link rel="shortcut icon" href="assets/images/fav.ico"
	type="image/x-icon">
<link rel="icon" href="assets/images/fav.ico" type="image/x-icon">
<!-- fonts CSS -->
<link rel="stylesheet" href="assets/fonts/linearicons/fonts.css">
<link rel="stylesheet"
	href="assets/fonts/font-awesome/css/fontawesome-all.min.css">
<!-- Custom CSS File -->
<link rel="stylesheet" href="assets/dist/css/style.css">
<link href="css/style.css" rel="stylesheet">
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
<style type="text/css">
.select_sido {
	position: absolute;
	right: 100px;
	float: right;
	margin-bottom: 70px;
	padding-bottom: 70px;
	padding-top: 50px;
}

.font_searchStd {
	position: absolute;
	right: 445px;
	text-align: center;
	margin: 10px;
}

#main_container {
	flex: 100%;
	max-width: 80%;
	margin-left: 15%; /*오른쪽 화면 여백이 너무 많을 경우 숫자를 늘리면 됩니다.*/
}
</style>
</head>

<body>

	<div id="preloader">
		<div id="preloader-inner"></div>
	</div>
	
	<!--/preloader-->
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
                        			<a id="SNS" class="nav-link" aria-haspopup="true" aria-expanded="false" href="snsMyPageView.do?cust_no=-1&provider_no=-${loginVo.no }" >SNS</a>	
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
                    
                    <ul class="nav flex-row order-lg-2 ml-auto nav-icons">
                        <c:choose>
                            <c:when test="${not empty loginVo}">
                                <li class="nav-item dropdown user-dropdown align-items-center" >
                                    <a class="nav-link" href="#" id="dropdown-user" role="button"
                                       data-toggle="dropdown">
                                <span class="user-states states-online">
                                    <img src="cust_img/${loginVo.cust_img }" width="35" alt="" class=" img-fluid rounded-circle">
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
	<div
		class="page-titles-img title-space-lg bg-parallax parallax-overlay mb70"
		data-jarallax='{"speed": 0.2}'
		style='background-image: url("images/std1.jpg")'>
		<div class="container">
			<div class="row">
				<div class=" col-md-8 ml-auto mr-auto">
					<h1 class='text-uppercase'>스&nbsp;&nbsp;투&nbsp;&nbsp;더</h1>

					<!-- <a href='https://www.youtube.com/watch?v=cctFcl5EFYk' class='modal-video btn btn-white-outline btn-lg btn-rounded'>Watch our film</a>
                        -->
				</div>
			</div>
		</div>
	</div>
	<!--page title end-->

	<!-- ###################################################################### -->
	<!--Page content -->
	<form class="form-inline ml-1">
		<div class="select_sido">
			<font class="font_sido">지역 </font> <select name="sido" id="sido"
				class="form-control border0"></select> <select name="gugun"
				id="gugun" class="form-control border0"></select> <br> <br>
			<br>
		</div>
		<div class="search_std">
			<font class="font_searchStd"> 스투더 검색 </font> <input id="keyword" name="keyword"
				class="form-control border0" type="search" placeholder="Search..."
				aria-label="Search" width="35"
				style="position: absolute; right: 200px; width: 250px">
			<button type="button" class="btn btn-warning mb5 btn-rounded" id="btnSearch" name="btnSearch"
				style="position: absolute; right: 100px; text-align: center;">검색</button>
		</div>
	</form>

	<input type="hidden" id="h_keyword" value="${keyword}">
	<input type="hidden" id="h_sido" value="${sido}">
	<input type="hidden" id="h_gugun" value="${gugun}">

	<div class="container pt100 pb70">
		<div class="row">
			<div class="col-lg-9 mb30 sticky-content" id="main_container">
				<!--본문 시작-->
				<div id="std_board"></div>


				<!--본문 끝 -->
			</div>
		</div>
		<div class="pagination" id="pagination"
		style="align-items: center; align-content: center; margin-left: 45%; margin-right: 45%;">
		</div>
	</div>
	
	

	<!--Page content -->
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
	<!-- jQuery first, then Tether, then Bootstrap JS. -->
	<script src="js/plugins/plugins.js"></script>
	<script src="js/assan.custom.js"></script>
	<script src="assets/dist/js/plugins.js"></script>
	<script src="assets/dist/js/education.custom.js"></script>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script type="text/javascript"></script>
	<script type="text/javascript">
	<!--시/군/구 콤보박스-->
		$('document')
				.ready(
						function() {						
							var area0 = [ "시/도 선택", "서울특별시", "인천광역시", "대전광역시",
									"광주광역시", "대구광역시", "울산광역시", "부산광역시", "경기도",
									"강원도", "충청북도", "충청남도", "전라북도", "전라남도",
									"경상북도", "경상남도", "제주도" ];
							var area1 = [ "강남구", "강동구", "강북구", "강서구", "관악구",
									"광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구",
									"동작구", "마포구", "서대문구", "서초구", "성동구", "성북구",
									"송파구", "양천구", "영등포구", "용산구", "은평구", "종로구",
									"중구", "중랑구" ];
							var area2 = [ "계양구", "남구", "남동구", "동구", "부평구",
									"서구", "연수구", "중구", "강화군", "옹진군" ];
							var area3 = [ "대덕구", "동구", "서구", "유성구", "중구" ];
							var area4 = [ "광산구", "남구", "동구", "북구", "서구" ];
							var area5 = [ "남구", "달서구", "동구", "북구", "서구", "수성구",
									"중구", "달성군" ];
							var area6 = [ "남구", "동구", "북구", "중구", "울주군" ];
							var area7 = [ "강서구", "금정구", "남구", "동구", "동래구",
									"부산진구", "북구", "사상구", "사하구", "서구", "수영구",
									"연제구", "영도구", "중구", "해운대구", "기장군" ];
							var area8 = [ "고양시", "과천시", "광명시", "광주시", "구리시",
									"군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시",
									"수원시", "시흥시", "안산시", "안성시", "안양시", "양주시",
									"오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시",
									"평택시", "포천시", "하남시", "화성시", "가평군", "양평군",
									"여주군", "연천군" ];
							var area9 = [ "강릉시", "동해시", "삼척시", "속초시", "원주시",
									"춘천시", "태백시", "고성군", "양구군", "양양군", "영월군",
									"인제군", "정선군", "철원군", "평창군", "홍천군", "화천군",
									"횡성군" ];
							var area10 = [ "제천시", "청주시", "충주시", "괴산군", "단양군",
									"보은군", "영동군", "옥천군", "음성군", "증평군", "진천군",
									"청원군" ];
							var area11 = [ "계룡시", "공주시", "논산시", "보령시", "서산시",
									"아산시", "천안시", "금산군", "당진군", "부여군", "서천군",
									"연기군", "예산군", "청양군", "태안군", "홍성군" ];
							var area12 = [ "군산시", "김제시", "남원시", "익산시", "전주시",
									"정읍시", "고창군", "무주군", "부안군", "순창군", "완주군",
									"임실군", "장수군", "진안군" ];
							var area13 = [ "광양시", "나주시", "목포시", "순천시", "여수시",
									"강진군", "고흥군", "곡성군", "구례군", "담양군", "무안군",
									"보성군", "신안군", "영광군", "영암군", "완도군", "장성군",
									"장흥군", "진도군", "함평군", "해남군", "화순군" ];
							var area14 = [ "경산시", "경주시", "구미시", "김천시", "문경시",
									"상주시", "안동시", "영주시", "영천시", "포항시", "고령군",
									"군위군", "봉화군", "성주군", "영덕군", "영양군", "예천군",
									"울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군" ];
							var area15 = [ "거제시", "김해시", "마산시", "밀양시", "사천시",
									"양산시", "진주시", "진해시", "창원시", "통영시", "거창군",
									"고성군", "남해군", "산청군", "의령군", "창녕군", "하동군",
									"함안군", "함양군", "합천군" ];
							var area16 = [ "서귀포시", "제주시", "남제주군", "북제주군" ];

							// 시/도 선택 박스 초기화

							$("select[name^=sido]")
									.each(
											function() {
												$selsido = $(this);
												$
														.each(
																eval(area0),
																function() {
																	$selsido
																			.append("<option value='"+this+"'>"
																					+ this
																					+ "</option>");
																});
												$selsido
														.next()
														.append(
																"<option value=''>구/군 선택</option>");
											});

							// 시/도 선택시 구/군 설정

							$("select[name^=sido]")
									.change(
											function() {
												var area = "area"
														+ $("option", $(this))
																.index(
																		$(
																				"option:selected",
																				$(this))); // 선택지역의 구군 Array
												var $gugun = $(this).next(); // 선택영역 군구 객체
												$("option", $gugun).remove(); // 구군 초기화

												if (area == "area0")
													$gugun
															.append("<option value=''>구/군 선택</option>");
												else {
													$
															.each(
																	eval(area),
																	function() {
																		$gugun
																				.append("<option value='"+this+"'>"
																						+ this
																						+ "</option>");
																	});
												}
											});
							
						

						});
	</script>
	<script type="text/javascript">
	<!--스투더 목록-->
		$(function() {
			
			var keyword;		//입력받은 검색어
			var sido;			//선택한 시/도
			var gugun;			//선택한 구/군
			
			var pageSIZE = 5;		//한 페이지당 보여줄 레코드 수
			var pageGROUP = 5;		//한 화면에 보여줄 페이지수
			var totalRecord = 0;		//전체 레코드 수
			var totalPage = 1; 		//전체 페이지 수
			
			var today = new Date(); //오늘날짜함수 
			var todate; //오늘날짜(yyyymmdd)를 담을 변수
			var getdate; //스투더 시작날짜(yyyymmdd)를 담을 변수
			
			$.ajax({url:"getCountStd.do", 
				data:{"keyword":keyword,"sido":sido, "gugun":gugun}, async:false,
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
			
			$("#btnSearch").click(function(){
				keyword = $("#keyword").val();
				sido = $("#sido").val();
				gugun = $("#gugun").val();
				currentPage = 1;
				
				$.ajax({url:"getCountStd.do", 
					data:{"keyword":keyword,"sido":sido, "gugun":gugun}, async:false,
					success:function(data) {
						totalRecord = data;				
				}});
				
				totalPage = parseInt(totalRecord / pageSIZE);
				if(totalRecord % pageSIZE !=0) {
					totalPage++;
				}
				
				getListStd();
				paging();						
				
			});
			
			//날짜를 올바른 형식으로 바꿔주는 함수
			 Date.prototype.yyyymmdd = function() {
  		 		var yyyy = this.getFullYear().toString();
   				var mm = (this.getMonth() + 1).toString();
   		 		var dd = this.getDate().toString();
   		 		return  yyyy + "-" + (mm[1] ? mm : "0" + mm[0]) + "-" + (dd[1] ? dd : "0" + dd[0]);
			 }
			
			//String을  date 타입으로 바꿔주는 함수
			 function parse(str) {
				 var y = str.substr(0,4),
                m = str.substr(5,2),
                d = str.substr(8,2);
				    return new Date(y,m,d);
			}
			
			//목록 가져오는 함수 
			function getListStd() {
				$("#std_board").empty();
				
				keyword = $("#keyword").val();
				sido = $("#sido").val();
				gugun = $("#gugun").val();
				

				$.ajax({url : "getListStd.do",
						data : {"keyword":keyword, "sido":sido, "gugun":gugun,"start":start,"end":end  },
						success : function(data) {
							var arr = eval("(" + data + ")");
							//검색결과가 없을 시 문구 표기 
							if(data == "[]") {
								var h2 = $("<h2></h2>").html("검색 결과가 없습니다.");								
								$("#std_board").append(h2);	
							} else {
								$.each(arr,function(idx, std) {
									
									todate = parse(today.yyyymmdd());
									getdate = parse(std.std_close);
									
									var div1 = $("<div class='course-list-item mb30'></div>");
									var div2 = $("<div class='row align-items-center'></div>");
									var div3_1 = $("<div class='col-md-3 col-sm-12 py-2'></div>");
									var a_img = $("<a></a>");
									var img;

									if (std.std_image != null) {
										img = $("<img class='img-fluid'>").attr("src","images/std_img/upload/"+std.std_image);
									} else {
										img = $("<img class='img-fluid'>").attr("src","images/std_img/upload/std_default.PNG");
									}

									
									var div3_2 = $("<div class='col-md-6 col-sm-12 py-3'></div>");
									var a_title;
									if(todate<=getdate) {
										a_title = $("<a></a>").attr({"href" : "detailStd.do?std_no="+ std.std_no +"&isClosed=-1"});
									} else {
										a_title = $("<a></a>").attr({"href" : "detailStd.do?std_no="+ std.std_no +"&isClosed=1"});
									}
									var h5 = $("<h5></h5>").html(std.std_name);

									var p_intro = $("<p class='mb-0'></p>").html(std.std_intro);
									var br = $("<br>");

									var ul = $("<ul class='list-inline'></ul>");
									var li1 = $("<li class='list-inline-item mr-3'></li>");
									var div4_1 = $("<div></div>");
									var i1 = $("<i class='fa fa-calendar mr-2'></i>");
									var p1 = $("<p>기간</p>");
									var a1 = $("<a href='#'></a>").html(std.std_start+ " ~ "+ std.std_end);

									var li2 = $("<li class='list-inline-item mr-3'></li>");
									var div4_2 = $("<div></div>");
									var i2 = $("<i class='fa fa-calendar-check-o mr-2'></i>");
									var p2 = $("<p>마감일</p>");
									var a2 = $("<a href='#'></a>").html(std.std_close);

									var li3 = $("<li class='list-inline-item mr-3'></li>");
									var div4_3 = $("<div></div>");
									var i3 = $("<i class='fa fa-map-marker mr-2'></i>");
									var p3 = $("<p>장소</p>");
									var a3 = $("<a href='#'></a>").html(std.std_loc);

									var li4 = $("<li class='list-inline-item mr-3'></li>");
									var div4_4 = $("<div></div>");
									var i4 = $("<i class='fa fa-user mr-2'></i>");
									var p4 = $("<p>모집현황</p>");
									var a4;
									
									if(std.std_limit > std.picker_count){
										a4 = $("<a href='#'></a>").html(std.std_limit+"명 중 "+std.picker_count+"명 모집");
									}else if (std.std_limit <= std.picker_count) {
										a4 = $("<a href='#'></a>").html("모집 완료");
									}
									var li5 = $("<li class='list-inline-item mr-3'></li>");
									var div4_5 = $("<div></div>");
									var i5 = $("<i class='fa fa-eye mr-2'></i>");
									var p5 = $("<p>조회수</p>");
									var a5 = $("<a href='#'></a>").html(std.std_hits);

									var div3_3 = $("<div class='col-md-3 py-2 col-12'></div>");
									var join;
									var std_no = std.std_no
									if(todate<=getdate) {	
										join = $("<a class=' btn btn-outline-warning mb5'></a>").html("참여하기")
												.attr({"href" : "detailStd.do?std_no="+ std.std_no +"&isClosed=-1"});
										$(join).click(function(){
											$.ajax({
												url:"updateStdHit",
												data:{"std_no" : std.std_no},
												success:function(){
													getListStd();
												}
											})
										})
									}else{
										join = $("<a class=' btn btn-outline-warning mb5'></a>").html("모집종료")
										.attr({"href" : "detailStd.do?std_no="+ std.std_no +"&isClosed=1"});
										$(join).click(function(){
											$.ajax({
												url:"updateStdHit",
												data:{"std_no" : std.std_no},
												success:function(){
													getListStd();
												}
											})
										})
									}
									
									$(div3_3).append(join);

									$(li1).append(i1, "기간 ",a1);
									$(li2).append(i2, " 마감일 ",a2);
									$(li3).append(i3, " 장소 ",a3);
									$(li4).append(i4, " 모집현황 ",a4);
									$(li5).append(i5, " 조회수 ",a5);
									$(ul).append(li1, li2, li3,li4, li5);

									$(a_title).append(h5);
									$(div3_2).append(a_title,p_intro, br, ul);

									$(a_img).append(img);
									$(div3_1).append(a_img);

									$(div2).append(div3_1,div3_2, div3_3);
									$(div1).append(div2);

									$("#std_board").append(div1);
								});					
							}
						}
		
				});
			}
			
			//페이지 출력 하는 메소드
			function paging() {
				$("#pagination").empty();
				//한 화면에 보여줄 시작페이지, 끝페이지 구하기
				var startPage = parseInt(currentPage/pageGROUP) * pageGROUP + 1;
				if(currentPage % 5 == 0) {
					startPage = (parseInt(currentPage/pageGROUP)-1) * pageGROUP + 1;
				}
				var endPage = startPage + pageGROUP - 1;
				
				if(endPage > totalPage) {
					endPage = totalPage;
				}
				
				if(currentPage > pageGROUP) {
					var btn_prev = $("<a class='page-link'><i class='fa fa-caret-left'></i></a>");
					$("#pagination").append(btn_prev);
					$(btn_prev).click(function() {
						currentPage = startPage - 1;
						start = (currentPage-1) * pageSIZE +1;
						end = currentPage * pageSIZE;
						getListStd();
						paging();
					});
				}
		
	
				for(var i=startPage; i<=endPage; i++) {
					var a = $("<a class='page-link pg'>"+i+"</a>");
					$("#pagination").append(a);
				}
				
				
				$(".pg").click(function() {
					currentPage = $(this).html();
					start = (currentPage-1) * pageSIZE +1;
					end = currentPage * pageSIZE;
					getListStd();
					paging();
				});
				
				if(currentPage < totalPage && endPage+1<=totalPage) {
					var btn_next = $("<a class='page-link'><i class='fa fa-caret-right'></i></a>");
					$("#pagination").append(btn_next);
					$(btn_next).click(function() {
						currentPage = endPage + 1;
						start = (currentPage-1) * pageSIZE +1;
						end = currentPage * pageSIZE;
						getListStd();
						paging();
					});
				}
			}

			getListStd();
			paging();

	});
	</script>
	  <script src="js/plugins/plugins.js"></script> 
	  <script src="js/assan.custom.js"></script> 
</body>
</html>
