<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<!-- real-estate (새로추가한 css, plugins)-->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>스투더상세</title>
	 	<script src="js/plugins/plugins.js"></script> 
	<script src="js/assan.custom.js"></script> 
<!-- Plugins CSS -->
<link href="real-estate/css/plugins/plugins.css" rel="stylesheet">
<!-- load css for cubeportfolio -->
<link rel="stylesheet" type="text/css"
	href="real-estate/cubeportfolio/css/cubeportfolio.min.css">
<link rel="stylesheet" type="text/css"
	href="real-estate/smart-form/smart-templates/css/smart-forms.css">
<link href="real-estate/css/style.css" rel="stylesheet">



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


<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js
        "></script>
<script type="text/javascript">
	$(function() {
		var isClosed = $("#isClosed").val();
		var btn_apply;
		
		if(isClosed  == 1) {
			btn_apply = $("<button class='btn btn-outline-warning mb5' id='btn_apply' disabled='disabled'>마감</button>");
			
		} else if (isClosed == -1) {
			btn_apply = $("<button class='btn btn-outline-warning mb5' id='btn_apply'>신청</button>");			
		}
		
		$("#btn_apply_section").append(btn_apply);
			
		$(btn_apply).click(function(){
			var str = window.location.search
    		var std_no = str.substring(str.indexOf("=")+1,str.length);
			location.href = "applyStd?std_no="+std_no;
		}); 
		 
		 
		$("#btn_ajax").click(function() {
			$.ajax({
				url : "/getStd",
				success : function(data) {

				}
			});

		});

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
                        <li class="nav-item dropdown dropdown-full-width active">
                            <a class="nav-link" href="listStd.do" aria-haspopup="true" aria-expanded="false">
                            <font style="color: #F4923D">
                                스투더  
                                </font>
                            </a>
                       
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link"  aria-haspopup="true" aria-expanded="false" href="diningSch">맛집찾기</a>
                      
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link" aria-haspopup="true" aria-expanded="false" href="SNSList.do">SNS</a>
                     
                        </li>
                        <li class="nav-item dropdown">
                         <a class="nav-link  dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">고객지원</a>
                            <ul class="dropdown-menu">
                                <li style="border-color: #212121!important">
                                    <a tabindex="-1" href="listNotice.do" class="dropdown-item" style="border-color: #212121!important">공지사항</a>
                                   
                                </li>
                                <li>
                                    <a tabindex="-1" href="listQa.do" class="dropdown-item" style="border-color: #212121!important">Q&A</a>
                                   
                                </li>
                                <li>
                                    <a tabindex="-1" href="listEvt.do	" class="dropdown-item" style="border-color: #212121!important">프로모션</a>
                                    
                                </li>
                            </ul>
                        </li>
                    </ul>
                    
                    <ul class="nav flex-row order-lg-2 ml-auto nav-icons">
                        <c:choose>
                            <c:when test="${not empty loginVo}">
                                <li class="nav-item dropdown user-dropdown align-items-center">
                                    <a class="nav-link" href="#" id="dropdown-user" role="button"
                                       data-toggle="dropdown">
                                <span class="user-states states-online">
                                    <img src="cust_img/${loginVo.cust_img }" width="35" alt="" class=" img-fluid rounded-circle">
                                </span>
                                        <span class="ml-2 h-lg-down dropdown-toggle">
                                                ${loginVo.nick_name}
                                        </span>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdown-user">
                                        <a class="dropdown-item" href="profile" style="border-color: #212121!important"><i class="icon-User"></i>My Profile</a>
                                        <c:choose>
                                        	<c:when test="${loginVo.role eq 'customer' }">
                                        		 <a class="dropdown-item" style="border-color: #212121!important" href="custMyPage?cust_no=${loginVo.no }"><i class="icon-User"></i>고객 My Page</a>
                                        	</c:when>
                                        	<c:otherwise>
                                        		<a class="dropdown-item" style="border-color: #212121!important" href="provMyPageView.do?cust_no=${loginVo.no }"><i class="icon-User"></i>사업자 My Page</a>
                                        	</c:otherwise>
                                        </c:choose>
                                        
                                        <!--추가하면 되는 부분  -->
                                        <a class="dropdown-item" style="border-color: #212121!important" href="logout"><i class="icon-Power"></i>
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
                                <li><a href="login"> <font style="color: #F4923D">Join Us</font></a></li>
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
		class="page-titles-img title-space-lg bg-parallax parallax-overlay"
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
	<!-- 		<div style="background-color:#D8D8D8; width: 2500px; height: 70px;"></div> -->

	<!-- ###################################################################### -->
	<!-- 요기에 넣어!!!!!-->



	<div>
		<!-- Site Overlay -->
		<div class="white-page-content" style="padding-top: 3%">
			<div class="container pt0 pb40">
				<div class="row" style="padding-left: 7%;">
					<!--본문 시작 -->
					<div class="col-md-11 mb30">
						<div class="single-prp-header mb40 clearfix">
							<h3 class="mb10 left-title">${s.std_name}</h3>
							<span><i class="fa fa-question-circle"></i> ${s.std_intro} </span>
						</div>

						<div id="js-grid-slider-thumbnail" class="cbp">
							<div class="cbp-item">
								<div class="cbp-caption">
									<div class="cbp-caption-defaultWrap">
										<img src="images/std_img/upload/${s.std_image}" alt="">
									</div>
								</div>
							</div>
						</div>


						<div id="js-pagination-slider">
							<div class="cbp-pagination-item cbp-pagination-active">
								<img src="images/std_img/upload/${s.std_image}" alt="">
							</div>
							<div align="right">
								<div class='col-md-3 py-2 col-12' id="btn_apply_section">
								</div>
							</div>
						</div>

						<div class="prp-description pt5" style="margin-top: 3%">
							<div class="row">
								<div class="col-md-5 mb50">
									<h3 class="mb0">모임 요약</h3>
									<hr>
									<ul class="list-unstyled summary">
										<li class="clearfix"><div class="float-right">${s.std_loc}</div>
											<i class="fa fa-map-marker"></i> 모임장소</li>
										<li class="clearfix"><div class="float-right">${s.std_time}</div>
											<i class="fa fa-check-circle"></i> 모임시간</li>
										<li class="clearfix"><div class="float-right">${s.std_start}</div>
											<i class="fa fa-angle-double-right"></i> 시작일</li>
										<li class="clearfix"><div class="float-right">${s.std_end}</div>
											<i class="fa fa-angle-double-left"></i> 종료일</li>
										<li class="clearfix"><div class="float-right">${s.std_limit}
												명</div> <i class="fa fa-user"></i> 모집인원</li>
										<li class="clearfix"><div class="float-right">${s.std_close}</div>
											<i class="fa fa-exclamation-circle"></i> 모집마감일</li>
										<li class="clearfix"><div class="float-right">${h}</div> <i
											class="fa fa-hashtag"></i> HashTag</li>
									</ul>
								</div>

								<div class="col-md-7 mb50">
									<h3 class="mb0">리더 소개</h3>
									<hr>
									<p>${s.founder_info}</p>
								</div>
							</div>

							<div class="row">
								<div class="col-md-12">
									<h3 class="mb0">스투더 소개</h3>
									<hr>
									<p>${s.std_content}</p>
								</div>
							</div>
						</div>
					</div>
					<input type="hidden" id="isClosed" name="isClosed" value="${isClosed}">
					<!--본문 끝 -->
				</div>
			</div>
		</div>
	</div>



	<!--새로 추가한 페이지-->
	<a href="#" class="back-to-top hidden-xs-down" id="back-to-top"><i
		class="ti-angle-up"></i></a>
	<!-- jQuery first, then Tether, then Bootstrap JS. -->
	<script type="text/javascript" src="real-estate/js/plugins/plugins.js"></script>
	<script type="text/javascript" src="real-estate/js/assan.custom.js"></script>
	<script type="text/javascript"
		src="real-estate/cubeportfolio/js/jquery.cubeportfolio.min.js"></script>
	<script type="text/javascript" src="real-estate/js/cube-thumbSlider.js"></script>
	<!--google map-->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAMwVpUj3-oHHW8N21819BhKttOga2Rj2s"></script>
	<script src="real-estate/js/jquery.gmap.min.js"></script>
	<!--Contact script-->
	<!--         <script src="real-estate/js/contact.js" type="text/javascript"></script> -->


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
 
</body>
</html>
