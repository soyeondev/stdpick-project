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
	<div
		class="page-titles-img title-space-lg bg-parallax parallax-overlay mb70"
		data-jarallax='{"speed": 0.2}'
		style='background-image: url("images/dining.jpg")'>
		<div class="container">
			<div class="row">
				<div class=" col-md-8 ml-auto mr-auto">
					<h1 class='text-uppercase'>주변 맛집검색</h1>

					<!-- <a href='https://www.youtube.com/watch?v=cctFcl5EFYk' class='modal-video btn btn-white-outline btn-lg btn-rounded'>Watch our film</a>
                        -->
				</div>
			</div>
		</div>
	</div>
	<!--page title end-->

	<!-- ###################################################################### -->
	<!--Page content -->
	<div class="container pt100 pb70">
		<div class="row">
			<div class="col-lg-9 mb30 sticky-content" id="main_container">
				<!--본문 시작-->
<!-- 				<div id="img_board"></div> -->
				<div id="dining_board"></div>


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
						<li class="list-inline-item"><a href="#"> <i
								class="fa fa-facebook"></i>Facebook
						</a></li>
						<li class="list-inline-item"><a href="#"> <i
								class="fa fa-twitter"></i>twitter
						</a></li>
						<li class="list-inline-item"><a href="#"> <i
								class="fa fa-instagram"></i>instagram
						</a></li>
						<li class="list-inline-item"><a href="#"> <i
								class="fa fa-behance"></i>Behance
						</a></li>
					</ul>
					<h4>
						<i class="fa fa-phone"></i> 1800-355-4322
					</h4>
					<h4>
						<i class="fa fa-envelope"></i> support@assan.com
					</h4>
					<p>&copy; Copyright 2018. Assan 3.0</p>
				</div>
			</div>
		</div>
	</footer>

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
	<script type="text/javascript">
	<!--스투더 목록-->
		$(function() {
			//목록 가져오는 함수 
			function getDiningList() {
				$("#std_board").empty();
				
				keyword = $("#keyword").val();
				sido = $("#sido").val();
				gugun = $("#gugun").val();
				
				$.ajax({url : "diningList.do",
						success : function(data) {
							var arr = eval("(" + data + ")");
 								$.each(arr,function(idx, item) {
										console.log(item.thumb_nail);
 									 	var div1 = $("<div class='course-list-item mb30'></div>");
 										var div2 = $("<div class='row align-items-center'></div>");
 										var div3_1 = $("<div class='col-md-3 col-sm-12 py-2'></div>");
 										var a_img = $("<a></a>").attr({"href" : item.link});
 										 
 										var img = $("<img class='img-fluid' width=150px height=150px>").attr("src", item.thumb_nail);

 										var div3_2 = $("<div class='col-md-8 col-sm-12 py-3'></div>");
 										var a_title = $("<a></a>").attr({"href" : item.link});
 										var h5 = $("<h5></h5>").html(item.title);

 										var p_intro = $("<p class='mb-0'></p>").html(item.passage);
 										var br = $("<br>");

 										var ul = $("<ul class='list-inline'></ul>");
 										var li1 = $("<li class='list-inline-item mr-3'></li>");
 										var div4_1 = $("<div></div>");
 										var i1 = $("<i class='fa fa-calendar mr-2'></i>");
 										var p1 = $("<p>기간</p>");
 										var a1 = $("<a href='#'></a>").html(item.regdate);

 										var li2 = $("<li class='list-inline-item mr-3'></li>");
 										var div4_2 = $("<div></div>");
 										var i2 = $("<i class='fa fa-calendar-check-o mr-2'></i>");
 										var p2 = $("<p>마감일</p>");
 										var a2 = $("<a href='#'></a>").html(item.blog_name);

 										var li3 = $("<li class='list-inline-item mr-3'></li>");
 										var div4_3 = $("<div></div>");
 										var i3 = $("<i class='fa fa-map-marker mr-2'></i>");
 										var p3 = $("<p>장소</p>");
 										var a3 = $("<a href='#'></a>").html(item.blog_url);

 										$(li1).append(i1,a1);
 										$(li2).append(i2,a2);
 										$(li3).append(i3,a3);
 										$(ul).append(li1, li2, li3);

 										$(a_title).append(h5);
 										$(div3_2).append(a_title,p_intro, br, ul);

 										$(a_img).append(img);
 										$(div3_1).append(a_img);

 										$(div2).append(div3_1,div3_2);
 										$(div1).append(div2);

 										$("#dining_board").append(div1);
//  									$("#img_board").append(img);
									
								});		 		
							
						}
		
				});
			}


	});
	</script>
</body>
</html>
