<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>STUDER-PICK</title>    
        <!-- Plugins CSS -->
        <link href="css/plugins/plugins.css" rel="stylesheet">
        <!-- REVOLUTION STYLE SHEETS -->
        <link rel="stylesheet" type="text/css" href="revolution/css/settings.css">
        <!-- REVOLUTION LAYERS STYLES -->
        <link rel="stylesheet" type="text/css" href="revolution/css/layers.css">
        <!-- REVOLUTION NAVIGATION STYLES -->
        <link rel="stylesheet" type="text/css" href="revolution/css/navigation.css">
        <!-- load css for cubeportfolio -->
        <link rel="stylesheet" type="text/css" href="cubeportfolio/css/cubeportfolio.min.css">     
        <link href="css/style.css" rel="stylesheet">
           <link rel="stylesheet" href="assets/dist/css/style.css">
    </head>

<body>

        <div id="preloader">
            <div id="preloader-inner"></div>
        </div><!--/preloader-->

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
        <div class="page-titles-img title-space-lg bg-parallax parallax-overlay mb70" 
        data-jarallax='{"speed": 0.2}' 
        style='background-image: url("images/bg1.jpg")'>
            <div class="container">
                <div class="row">
                    <div class=" col-md-8 ml-auto mr-auto">
                        <h1 class='text-uppercase'>스투더픽 </h1>

                        <!--                                    <a href='https://www.youtube.com/watch?v=cctFcl5EFYk' class='modal-video btn btn-white-outline btn-lg btn-rounded'>Watch our film</a>
                        -->
                    </div>
                </div>
            </div>
        </div><!--page title end-->
        
        
        
        
        
        
        
        
        <!-- ###################################################################### -->
        <!-- 요기에 넣어!!!!!-->
        <br><br>
                <div class='container no-padding mb70'>
            <div class='row no-margin mb70 align-items-center'>
                <div class='col-md-4 mb30'>
                    <div class="media pos-relative">
                        <div class="d-flex mr-3">
                            <i class="icon-chat fa-2x"></i>  
                        </div>
                        <div class="media-body ">
                            <h4 class="mt-0 mb10  text-uppercase">최적의 학습 도우미</h4>
                            	기존 예약시스템과 차별화를 통해 학생에게는 최적의 학습 목표를, 취업 준비생에게는 성공적인 취업을 달성할 수 있도록 도움을 드립니다
                        </div>
                    </div>
                </div>
                <div class='col-md-4 mb30'>
                    <div class="media pos-relative">
                        <div class="d-flex mr-3">
                            <i class="icon-trophy fa-2x"></i>  
                        </div>
                        <div class="media-body">
                            <h4 class="mt-0 mb10 text-uppercase">더 넓은 공간을 더 저렴하게 예약하세요</h4>
                            	다양한 스터디 카페를 한눈에 꼼꼼하게 비교해 보고, 이벤트 프로모션을 통해 더 넓은 공간을 더 저렴하게 예약하세요
                        </div>
                    </div>
                </div>

                <div class='col-md-4 mb30'>
                    <div class="media pos-relative">
                        <div class="d-flex mr-3">
                            <i class="icon-global fa-2x"></i>  
                        </div>
                        <div class="media-body ">
                            <h4 class="mt-0 mb10  text-uppercase">온라인 시스템</h4>
                           		 대한민국은 지금 스터디카페가 대세! <br>
                           		 24시간 언제든지 원하는 시간에 자유롭게 예약할 수 있는 시스템!
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class='container mb40'>
            <div class='row'>
                <div class='col-lg-10 ml-auto mr-auto'>
                    <div class="title-heading1 mb30">
                        <br><br><br><br>
                        <h3>Meet the team</h3>                       
                    </div>
                    <p class='lead tritary-font mb50 text-center'>
            	최근에 많이 생겨난 스터디 카페. 여러 스터디 카페를 이용하면서 아쉬운 점이 많았습니다. 왜 스터디카페는 한번에 여러 카페를 비교해 보고 예약하는 시스템이 없는 걸까?
            	항상 카페마다 전화를 해서 빈자리를 확인하고 직접 가서 결제를 해야만 하는 걸까? 온라인에서 한눈에 비교하고 예약하고 결제까지 한다면, 더 넓고 좋은 공간을 더 저렴하게
            	이용할 수 있지 않을까? 이러한 아쉬움을 마음에 담아 스투더픽을 런칭하게 되었습니다.
                    </p>
                </div>
            </div>
            <div class='row'>
                <div class='col-lg-4 col-md-6 mb30'>
                    <div class='team-card'>
                        <img src='images/hb.jpg' alt='' class='img-fluid'>
                        <div class='team-overlay align-items-center'>
                            <div class='team-detail'>
                                <h4>HANBYEOL KO</h4>
                                <span>HANBYEOL@naver.com</span>
                                <div class='seprator-overlay'></div>
                                <ul class='list-inline'>
                                    <li class='list-inline-item'>
                                        <a href='#'><i class='fa fa-facebook'></i></a>
                                    </li>
                                    <li class='list-inline-item'>
                                        <a href='#'><i class='fa fa-twitter'></i></a>
                                    </li>
                                    <li class='list-inline-item'>
                                        <a href='#'> <i class='fa fa-youtube'></i></a>
                                    </li>
                                    <li class='list-inline-item'>
                                        <a href='#'><i class='fa fa-instagram'></i></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div><!--/col-->
                <div class='col-lg-4 col-md-6 mb30'>
                    <div class='team-card'>
                        <img src='images/12345.jpg' alt='' class='img-fluid'>
                        <div class='team-overlay align-items-center'>
                            <div class='team-detail'>
                                <h4>seonkyum Kim</h4>
                                <span>ycb2@hanmail.net</span>
                                <div class='seprator-overlay'></div>
                                <ul class='list-inline'>
                                    <li class='list-inline-item'>
                                        <a href='#'><i class='fa fa-facebook'></i></a>
                                    </li>
                                    <li class='list-inline-item'>
                                        <a href='#'><i class='fa fa-twitter'></i></a>
                                    </li>
                                    <li class='list-inline-item'>
                                        <a href='#'> <i class='fa fa-youtube'></i></a>
                                    </li>
                                    <li class='list-inline-item'>
                                        <a href='#'><i class='fa fa-instagram'></i></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div><!--/col-->
                <div class='col-lg-4 col-md-6 mb30'>
                    <div class='team-card'>
                        <img src='images/23456.jpg' alt='' class='img-fluid'>
                        <div class='team-overlay align-items-center'>
                            <div class='team-detail'>
                                <h4>Heejin Choi</h4>
                                <span>Heejin@gamil.com</span>
                                <div class='seprator-overlay'></div>
                                <ul class='list-inline'>
                                    <li class='list-inline-item'>
                                        <a href='#'><i class='fa fa-facebook'></i></a>
                                    </li>
                                    <li class='list-inline-item'>
                                        <a href='#'><i class='fa fa-twitter'></i></a>
                                    </li>
                                    <li class='list-inline-item'>
                                        <a href='#'> <i class='fa fa-youtube'></i></a>
                                    </li>
                                    <li class='list-inline-item'>
                                        <a href='#'><i class='fa fa-instagram'></i></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div><!--/col-->
                <div class='col-lg-4 col-md-6 mb30'>
                    <div class='team-card'>
                        <img src='images/34567.jpg' alt='' class='img-fluid'>
                        <div class='team-overlay align-items-center'>
                            <div class='team-detail'>
                                <h4>Soyeun Kim</h4>
                                <span>kimsoyeun@naver.com</span>
                                <div class='seprator-overlay'></div>
                                <ul class='list-inline'>
                                    <li class='list-inline-item'>
                                        <a href='#'><i class='fa fa-facebook'></i></a>
                                    </li>
                                    <li class='list-inline-item'>
                                        <a href='#'><i class='fa fa-twitter'></i></a>
                                    </li>
                                    <li class='list-inline-item'>
                                        <a href='#'> <i class='fa fa-youtube'></i></a>
                                    </li>
                                    <li class='list-inline-item'>
                                        <a href='#'><i class='fa fa-instagram'></i></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div><!--/col-->
                                <div class='col-lg-4 col-md-6 mb30'>
                    <div class='team-card'>
                        <img src='images/45678.jpg' alt='' class='img-fluid'>
                        <div class='team-overlay align-items-center'>
                            <div class='team-detail'>
                                <h4>Seongbin Moon</h4>
                                <span>moonsb@nate.com</span>
                                <div class='seprator-overlay'></div>
                                <ul class='list-inline'>
                                    <li class='list-inline-item'>
                                        <a href='#'><i class='fa fa-facebook'></i></a>
                                    </li>
                                    <li class='list-inline-item'>
                                        <a href='#'><i class='fa fa-twitter'></i></a>
                                    </li>
                                    <li class='list-inline-item'>
                                        <a href='#'> <i class='fa fa-youtube'></i></a>
                                    </li>
                                    <li class='list-inline-item'>
                                        <a href='#'><i class='fa fa-instagram'></i></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div><!--/col-->
                                <div class='col-lg-4 col-md-6 mb30'>
                    <div class='team-card'>
                        <img src='images/56789.jpg' alt='' class='img-fluid'>
                        <div class='team-overlay align-items-center'>
                            <div class='team-detail'>
                                <h4>Seonyeong Park</h4>
                                <span>Seonyeong@naver.com</span>
                                <div class='seprator-overlay'></div>
                                <ul class='list-inline'>
                                    <li class='list-inline-item'>
                                        <a href='#'><i class='fa fa-facebook'></i></a>
                                    </li>
                                    <li class='list-inline-item'>
                                        <a href='#'><i class='fa fa-twitter'></i></a>
                                    </li>
                                    <li class='list-inline-item'>
                                        <a href='#'> <i class='fa fa-youtube'></i></a>
                                    </li>
                                    <li class='list-inline-item'>
                                        <a href='#'><i class='fa fa-instagram'></i></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div><!--/col-->
            </div>
        </div><!--team-->
        <div class='container mb50'>
            <div class="title-heading1 mb30">
             <br><br><br><br><br>
                <h3>why choose us</h3>                       
            </div>
            <div class="row special-feature">
                <div class="col-md-3 col-sm-6 margin20">
                    <div class="s-feature-box text-center">
                        <div class="mask-top">
                            <!-- Icon -->
                            <i class="fa fa-heart-o"></i>
                            <!-- Title -->
                            <h4>예약을 쉽고 빠르게</h4>
                        </div>
                        <div class="mask-bottom">
                            <!-- Icon -->
                            <i class="fa fa-heart-o"></i>
                            <!-- Title -->
                            <h4>예약을 쉽고 빠르게</h4>
                            <!-- Text -->
                            <p>여러 스터디 카페를 한눈에 비교하여 선택한 후 쉽고 빠르게 예약과 결제를 할 수 있습니다</p>
                        </div>
                    </div>

                </div><!--services col-->
                <div class="col-md-3 col-sm-6 margin20">
                    <div class="s-feature-box text-center">
                        <div class="mask-top">
                            <!-- Icon -->
                            <i class="fa fa-laptop"></i>
                            <!-- Title -->
                            <h4>스터디 모임 검색 및 개설</h4>
                        </div>
                        <div class="mask-bottom">
                            <!-- Icon -->
                            <i class="fa fa-laptop"></i>
                            <!-- Title -->
                            <h4>스터디 모임 검색 및 개설</h4>
                            <!-- Text -->
                            <p>관심있는 스터디 모임을 지역별, 종류별로 검색하여 참가 신청할 수 있으며, 직접 모임을 개설할 수도 있습니다.</p>
                        </div>
                    </div>
                </div><!--services col-->
                <div class="col-md-3 col-sm-6 margin20">
                    <div class="s-feature-box text-center">
                        <div class="mask-top">
                            <!-- Icon -->
                            <i class="fa fa-code"></i>
                            <!-- Title -->
                            <h4>카페 근처 맛집 추천</h4>
                        </div>
                        <div class="mask-bottom">
                            <!-- Icon -->
                            <i class="fa fa-code"></i>
                            <!-- Title -->
                            <h4>카페 근처 맛집 추천</h4>
                            <!-- Text -->
                            <p>예약한 스터디 카페 근처의 맛집을 자동으로 추천하여, 식당을 검색해야 하는 고민과 수고를 덜어 드립니다.</p>
                        </div>
                    </div>
                </div><!--services col-->
                <div class="col-md-3 col-sm-6 margin20">
                    <div class="s-feature-box text-center">
                        <div class="mask-top">
                            <!-- Icon -->
                            <i class="fa fa-cogs"></i>
                            <!-- Title -->
                            <h4>SNS 연동을 통한 스터디 모임 활성화</h4>
                        </div>
                        <div class="mask-bottom">
                            <!-- Icon -->
                            <i class="fa fa-cogs"></i>
                            <!-- Title -->
                            <h4>SNS 연동을 통한 스터디 모임 활성화</h4>
                            <!-- Text -->
                            <p>SNS 연동을 통해 스터디원이 함께 스터디 내용과 일상을 공유할 수 있습니다. 더 재미있고 즐겁게 모임에 참가하세요. </p>
                        </div>
                    </div>
                </div><!--services col-->
            </div>
        </div>
        <div class='bg-faded pt100 pb100'>
            <div class='container text-center'>
                <div class='row'>
                    <div class='col-lg-8 col-md-10 ml-auto mr-auto'>
                        <h2 class='mb10'>스터디 카페 예약을 쉽고! 빠르게!</h2>
                        <p class='mb20 lead'>
                             	스터디 카페 예약. 더이상 카페 마다 전화해서 빈자리를 확인하고 예약하고
                             	내방하여<br> 결제할 필요가 없습니다.빈자리 확인부터 결제까지 빠르게 논스탑으로 이용하세요!
                        </p>
                        <a target='_blank' href='cafeList1.do' class="btn btn-outline-warning mb5 btn-rounded">스터디카페 확인하러 가기</a>
                    </div>
                </div>
            </div>
        </div>
        
      
      
      
      
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
        <a href="#" class="back-to-top hidden-xs-down" id="back-to-top"><i class="ti-angle-up"></i></a>
        <!-- jQuery first, then Tether, then Bootstrap JS. -->
        <script src="js/plugins/plugins.js"></script> 
        <script src="js/assan.custom.js"></script> 
    </body>
</html>
