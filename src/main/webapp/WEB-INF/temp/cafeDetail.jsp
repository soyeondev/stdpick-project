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
         <!-- Favicon -->
    <link rel="shortcut icon" href="assets/images/fav.ico" type="image/x-icon">
    <link rel="icon" href="assets/images/fav.ico" type="image/x-icon">
    <!-- Plugins CSS -->
    <link rel="stylesheet" href="assets/dist/css/plugins.css">
    <!-- fonts CSS -->
    <link rel="stylesheet" href="assets/fonts/linearicons/fonts.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome/css/fontawesome-all.min.css">
    <!-- Custom CSS File -->
    <link rel="stylesheet" href="assets/dist/css/style.css">
    </head>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script type="text/javascript">
    	$(function(){
    		$("#seatBtn").click(function(){
    			location.href = 'seatMap.do'
    		})
    		
    		var remove = function(){
    			$("#one").removeClass();
    			$("#two").removeClass();
    			$("#three").removeClass();
    			$("#four").removeClass();
    			$("#five").removeClass();
    		}
    	
    		$("#one").click(function(){
    			remove();
    		
    			$("#one").addClass("fas fa-star");
    			$("#two").addClass("far fa-star");
    			$("#three").addClass("far fa-star");
    			$("#four").addClass("far fa-star");
    			$("#five").addClass("far fa-star");
    		});
    		$("#two").click(function(){
    			remove();
    		
    			$("#one").addClass("fas fa-star");
    			$("#two").addClass("fas fa-star");
    			$("#three").addClass("far fa-star");
    			$("#four").addClass("far fa-star");
    			$("#five").addClass("far fa-star");
    		});
    		$("#three").click(function(){
    			remove();
    		
    			$("#one").addClass("fas fa-star");
    			$("#two").addClass("fas fa-star");
    			$("#three").addClass("fas fa-star");
    			$("#four").addClass("far fa-star");
    			$("#five").addClass("far fa-star");
    		});
    		$("#four").click(function(){
    			remove();
    		
    			$("#one").addClass("fas fa-star");
    			$("#two").addClass("fas fa-star");
    			$("#three").addClass("fas fa-star");
    			$("#four").addClass("fas fa-star");
    			$("#five").addClass("far fa-star");
    		});
    		$("#five").click(function(){
    			remove();
    		
    			$("#one").addClass("fas fa-star");
    			$("#two").addClass("fas fa-star");
    			$("#three").addClass("fas fa-star");
    			$("#four").addClass("fas fa-star");
    			$("#five").addClass("fas fa-star");
    		});
    		
    	});
    </script>

    <!-- select css -->
  
   <style>
	  *{margin:0;padding:0;}
	  ul,li{list-style:none;}
	  #slide{height:300px;position:relative;overflow:hidden;}
	  #slide ul{width:400%;height:100%;transition:1s;}
	  #slide ul:after{content:"";display:block;clear:both;}
	  #slide li{float:left;width:25%;height:100%;}
	  #slide li:nth-child(1){background:#faa;}
	  #slide li:nth-child(2){background:#ffa;}
	  #slide li:nth-child(3){background:#faF;}
	  #slide li:nth-child(4){background:#aaf;}
	  #slide input{display:none;}
	  #slide label{display:inline-block;vertical-align:middle;width:10px;height:10px;border:2px solid #666;background:#fff;transition:0.3s;border-radius:50%;cursor:pointer;}
	  #slide .pos{text-align:center;position:absolute;bottom:10px;left:0;width:100%;text-align:center;}
	  #pos1:checked~ul{margin-left:0%;}
	  #pos2:checked~ul{margin-left:-100%;}
	  #pos3:checked~ul{margin-left:-200%;}
	  #pos4:checked~ul{margin-left:-300%;}
	  #pos1:checked~.pos>label:nth-child(1){background:#666;}
	  #pos2:checked~.pos>label:nth-child(2){background:#666;}
	  #pos3:checked~.pos>label:nth-child(3){background:#666;}
	  #pos4:checked~.pos>label:nth-child(4){background:#666;}
	  
	
	  .info{
	  	color: black;
	  }
	  
	  .active-pink-textarea.md-form label.active {
  color: skyblue;
}
.pink-textarea textarea.md-textarea:focus:not([readonly]) {
  border-bottom: 1px solid skyblue;
  box-shadow: 0 1px 0 0 skyblue;
}
.pink-textarea.md-form .prefix.active {
  color: skyblue;
}
.active-pink-textarea.md-form textarea.md-textarea:focus:not([readonly])+label {
  color: skyblue;
}

.active-amber-textarea.md-form label.active {
  color: #ffa000;
}
.amber-textarea textarea.md-textarea:focus:not([readonly]) {
  border-bottom: 1px solid #ffa000;
  box-shadow: 0 1px 0 0 #ffa000;
}
.amber-textarea.md-form .prefix.active {
  color: #ffa000;
}
.active-amber-textarea.md-form textarea.md-textarea:focus:not([readonly])+label {
  color: #ffa000;
}

.active-pink-textarea-2 textarea.md-textarea {
  border-bottom: 1px solid skyblue;
  box-shadow: 0 1px 0 0 skyblue;
}
.active-pink-textarea-2.md-form label.active {
  color: skyblue;
}
.active-pink-textarea-2.md-form label {
  color: skyblue;
}
.active-pink-textarea-2.md-form .prefix {
  color: skyblue;
}
.active-pink-textarea-2.md-form textarea.md-textarea:focus:not([readonly])+label {
  color: skyblue;
}

.active-amber-textarea-2 textarea.md-textarea {
  border-bottom: 1px solid #ffa000;
  box-shadow: 0 1px 0 0 #ffa000;
}
.active-amber-textarea-2.md-form label.active {
  color: #ffa000;
}
.active-amber-textarea-2.md-form label {
  color: #ffa000;
}
.active-amber-textarea-2.md-form .prefix {
  color: #ffa000;
}
.active-amber-textarea-2.md-form textarea.md-textarea:focus:not([readonly])+label {
  color: #ffa000;
}
	</style>
	
<body>

        <div id="preloader">
            <div id="preloader-inner"></div>
        </div><!--/preloader-->

        <!-- Pushy Menu -->
        <aside class="pushy pushy-right">
            <div class="cart-content">
                <div class="clearfix">
                    <a href="javascript:void(0)" class="pushy-link text-white-gray">Close</a>
                </div>
                <ul class="list-unstyled">
                    <li class="clearfix">
                        <a href="#" class="float-left">
                            <img src="images/shop/p1.jpg" class="img-fluid" alt="" width="60">
                        </a>
                        <div class="oHidden">
                            <span class="close"><i class="ti-close"></i></span>
                            <h4><a href="#">Men's Special Watch</a></h4>
                            <p class="text-white-gray"><strong>$299.00</strong> x 1</p>
                        </div>
                    </li><!--/cart item-->
                    <li class="clearfix">
                        <a href="#" class="float-left">
                            <img src="images/shop/p2.jpg" class="img-fluid" alt="" width="60">
                        </a>
                        <div class="oHidden">
                            <span class="close"><i class="ti-close"></i></span>
                            <h4><a href="#">Men's tour beg</a></h4>
                            <p class="text-white-gray"><strong>$99.00</strong> x 1</p>
                        </div>
                    </li><!--/cart item-->
                    <li class="clearfix">
                        <a href="#" class="float-left">
                            <img src="images/shop/p3.jpg" class="img-fluid" alt="" width="60">
                        </a>
                        <div class="oHidden">
                            <span class="close"><i class="ti-close"></i></span>
                            <h4><a href="#">Women's T-shirts</a></h4>
                            <p class="text-white-gray"><strong>$199.00</strong> x 1</p>
                        </div>
                    </li><!--/cart item-->
                    <li class="clearfix">

                        <div class="float-right">
                            <a href="#" class="btn btn-primary">Checkout</a>
                        </div>
                        <h4  class="text-white">
                            <small>Subtotal - </small> $49.99
                        </h4>
                    </li><!--/cart item-->
                </ul>
            </div>
        </aside>
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

                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <a class="navbar-brand" href="index.html">
                    <img class='logo logo-dark' style="top:-25px;" src="images/logo.png" alt="">
                    <img class='logo logo-light hidden-md-down' style="top:-20px;" src="images/logo-light.png" alt="">
                </a>
                <div  id="navbarNavDropdown" class="navbar-collapse collapse">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item dropdown active">
                            <a class="nav-link" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">스투더픽 소개</a>
                           
                        </li>
                        <li class="nav-item dropdown dropdown-full-width">
                            <a class="nav-link" data-toggle="dropdown" href="#" aria-haspopup="true" aria-expanded="false">
                                스터디카페
                            </a>
                   
                        </li>
                        <li class="nav-item dropdown dropdown-full-width">
                            <a class="nav-link" data-toggle="dropdown" href="#" aria-haspopup="true" aria-expanded="false">
                                스투더  
                            </a>
                       
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">맛집찾기</a>
                      
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">SNS</a>
                     
                        </li>
                        <li class="nav-item dropdown">
                         <a class="nav-link  dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">고객지원</a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a tabindex="-1" href="#" class="dropdown-item">공지사항</a>
                                   
                                </li>
                                <li>
                                    <a tabindex="-1" href="#" class="dropdown-item">Q&A</a>
                                   
                                </li>
                                <li>
                                    <a tabindex="-1" href="#" class="dropdown-item">프로모션</a>
                                    
                                </li>
                            </ul>
                        </li>
                    </ul>   
                    <ul class="nav flex-row order-lg-2 ml-auto nav-icons"  style="margin-left: 50px!important;" >
                        <li class="nav-item dropdown user-dropdown align-items-center">
                            <a class="nav-link" href="#" id="dropdown-user" role="button" data-toggle="dropdown">
                                <span class="user-states states-online">
                                    <img src="images/avatar6.jpg" width="35" alt="" class=" img-fluid rounded-circle">
                                </span>
                                <span class="ml-2 h-lg-down dropdown-toggle">
                                    Hi, Sarah
                                </span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdown-user">
                                <div class="text-center p-3 pt-0 b-b mb-5">
                                    <span class="mb-0 d-block font300 text-title fs-1x">Hi! <span class="font700">Sarah Taylor</span></span>
                                    <span class="fs12 mb-0 text-muted">Administrator</span>
                                </div>
                                <a class="dropdown-item" href="#"><i class="icon-User"></i>My Profile</a>
                                <a class="dropdown-item" href="#"><i class="icon-Newspaper"></i> Tasks</a>
                                <a class="dropdown-item" href="#"><i class="icon-Speach-Bubble4 "></i> Messages <span class="badge badge-text text-primary-active bg-primary-light ml-2">5 New</span></a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#"><i class="icon-Gear"></i> Settings<span class="badge badge-text text-danger-active bg-danger-light ml-2">Update</span></a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="page-login.html"><i class="icon-Power"></i> logout</a>

                            </div>
                        </li>
                        <li class="h-lg-up nav-item">
                            <a href="#" class=" nav-link collapsed" data-toggle="collapse" data-target="#navbarToggler" aria-expanded="false">
                                <i class="icon-Magnifi-Glass2"></i>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="navbar-right-elements" style="margin: 30px">
               
                </div><!--right nav icons-->
            </div>

        </nav>
  
		<!-- 상단 메뉴바? 이미지 -->
        <div class="page-titles-img title-space-lg bg-parallax parallax-overlay mb70" data-jarallax='{"speed": 0.2}' style='background-image: url("images/chaeummain.png")'>
            
            <div class="container">
                <div class="row">
                    <div class=" col-md-8 ml-auto mr-auto">
                        <h1 class='text-uppercase'>채움 스터디 카페 </h1>

                        <!--                                    <a href='https://www.youtube.com/watch?v=cctFcl5EFYk' class='modal-video btn btn-white-outline btn-lg btn-rounded'>Watch our film</a>
                        -->
                    </div>
                </div>
            </div>
        </div><!--page title end-->
        
        
        
        
        
        
        
        
        <!-- ###################################################################### -->
        
          <div class="container pt100 pb70" style="margin-left: 50px; padding-top: 0px;">
        <div class="row" style="width: 1400px;">
            <div class="col-lg-9 ml-auto mb30 sticky-content course-detail">
                <h2 class="mb-4">채움 스터디 카페</h2>
                <ul class="course-detail-meta row list-unstyled">
                    <li class="col-sm-4 col-md-3 py-2 col-6">
                       <i class="fa fa-wifi float-left w40 rounded-circle bg-gray mr-3"></i>	
                        <div class="oHidden">
                            <small class="d-block pt-1">Wi-Fi</small>
                             <h6 class="text-secondary">WI-FI</h6>
                        </div>
                    </li>
                    <li class="col-sm-4 col-md-3 py-2 col-6">
                        <i class="fa fa-coffee float-left w40 rounded-circle bg-gray mr-3"></i>
                        <div class="oHidden">
                            <small class="d-block pt-1">음료제공</small>
                            <h6 class="text-secondary">CAFE</h6>
                        </div>
                    </li>
                    <li class="col-sm-4 col-md-3 py-2 col-6">
                        <i class="fa fa-address-card float-left w40 rounded-circle bg-gray mr-3" aria-hidden="true"></i>
                        <div class="oHidden">
                            <small class="d-block pt-1">멤버쉽</small>
                            <h6 class="text-secondary">MEMBERSHIP</h6>
                        </div>
                    </li>
                    <li class="col-sm-4 col-md-3 py-2 col-6">
                        <i class="fa fa-video float-left w40 rounded-circle bg-gray mr-3"></i>
                        <div class="oHidden">
                            <small class="d-block pt-1">24시간</small>
                           <h6 class="text-secondary">CCTV작동</h6>
                        </div>
                    </li>
                </ul>
                <div style="position:relative;height:0;padding-bottom:40.25%">
                	<div id="slide" style="width: 500px; height: 400px;">
					  <input type="radio" name="pos" id="pos1" checked>
					  <input type="radio" name="pos" id="pos2">
					  <input type="radio" name="pos" id="pos3">
					  <input type="radio" name="pos" id="pos4">
					  <ul>
					    <li><img alt="" src="images/chaeummain2.png" width="500px" height="400px"></li>
					    <li><img alt="" src="images/cu2.png" width="500px" height="400px"></li>
					    <li><img alt="" src="images/cu3.png" width="500px" height="400px"></li>
					    <li><img alt="" src="images/cu4.png" width="500px" height="400px"></li>
					  </ul>
					  <p class="pos">
					    <label for="pos1"></label>
					    <label for="pos2"></label>
					    <label for="pos3"></label>
					    <label for="pos4"></label>
					  </p>
					</div>
					                	
                    
                    <div style="position: relative; left: 550px; top: -400px;">
                    	<h3>채움 스터디 카페</h3>
                    	<p>지식을 꽉 채우는 채음 스터디카페</p>
                    	<h5><font style="color: black;"><i class="fa fa-map-marker-alt" aria-hidden="true"></i><a href="http://naver.me/GP6fEpcM" target="_blank">　서울 마포구 신촌로 150 신촌포스빌 203호</a></font></h5><br>
                    	<h5><font style="color: black;"><i class="far fa-clock"></i>　08:00~23:00</font></h5><br>
                    	<h5><font style="color: black;"><i class="fa fa-krw" aria-hidden="true"></i>　(ROOM)1500~</font></h5><br>
                    	<div class="pass">
						    <h5><font style="color: black;"><i class="fa fa-krw" aria-hidden="true"></i>　이용권</font></h5>
						   
						   <div class="form-group">
							  <select class="form-control" id="sel1" style="width:400px;font-size:18px;height:15px; margin-bottom: 0px">
						
						        <option>1시간 1200원</option>
						        <option>5시간 5000원</option>
						        <option>10시간 10000원</option>
						        <option>24시간 20000원</option>
						        <option>한달정액권 80000원</option>
						    </select>
						    </div>
						</div>
						<!-- 버튼 -->
						<button type="button" class="btn btn-outline-primary mb5" style="margin-top: 5px; margin-right: 10px;">룸 예약하기</button>
						<button type="button" class="btn btn-outline-primary mb5" style="margin-top: 5px; margin-right: 10px;">이용권 구매</button>
						<button type="button" class="btn btn-outline-primary mb5" style="margin-top: 5px" id="seatBtn">실시간 좌석</button>
                    	
                    </div>
                </div>
                    <ul class="nav tab-list nav-justified">
                        <li class="nav-item" role="presentation">
                            <a data-toggle="tab" class="nav-link active" href="#c-desc">
                                <i class="far fa-sticky-note mr-2"></i>카페설명</a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a data-toggle="tab" class="nav-link" href="#c-qa">
                                <i class="fa fa-clock mr-2"></i>카페문의</a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a data-toggle="tab" class="nav-link" href="#c-reviews">
                                <i class="fa fa-thumbs-up mr-2"></i> 사용리뷰</a>

                        </li>
                         <li class="nav-item" role="presentation">
                            <a data-toggle="tab" class="nav-link" href="#c-cancle">
                                <i class="fa fa-thumbs-up mr-2"></i>취소 및 환불규정</a>

                        </li>
                    </ul>
                    <!--tabs nav-->
                    <div class="tab-content">
                        <div class="tab-pane active show" id="c-desc">
                            <div class="row">
                                <div class="col-md-8 mb-30">
                                    <h5>이용 수칙 안내</h5>
                                    <hr>
                                    <p>
                                       	<font class="info">1.매장내 음식물 반입은 금지입니다(냄새나지 않는 음식은 괜찮아요)</font><br>

										<font class="info">2.공부하는 학생들이 많기 때문에 반드시 정숙해주세요</font><br>
										
										<font class="info">3.영어나 스페인어 멘토링 해드립니다</font><br>
                                    </p>
                                    <br>
                                    <h5>업체정보</h5>
                                    <hr>
                                    <p>
                                        <font class="info">1. 신촌최저가! 최고의 가성비! 쾌적한 환경!</font><br>

										<font class="info">2. 편리한 교통 - 신촌역 1번출구에서 도보3분</font><br>
										
										<font class="info">3. 각종 편의시설 - 공용컴퓨터, 모니터, 빔프로젝트, 전면거울(면접방), wifi 5G 구비</font><br>
										
										<font class="info">4. 각 방마다 유리보드, 개인별 콘덴서 비치</font><br>
										
										<font class="info">5. 휴게실 사탕, 차, 커피 등 무료</font><br>
                                    </p>
                                    <h5>부가 시설</h5>
                                    <hr>
                                    <p>
                                      	<font class="info">노트북 대여 </font><br>
                                     	<font class="info">24시간 CCTV 보안시스템 작동중 </font><br>
                                     	<font class="info">물품 보관함 </font><br>
                                     	<font class="info">멤버쉽 포인트 적립</font><br>
                                    </p>
                                </div>
                                <div class="col-md-4 mb-30">
                                    <h5>오시는 길</h5>
                                    <hr>
                                    <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12651.803528099805!2d126.942077!3d37.556221!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x38f2569f0da430ef!2z7Iug7LSM7Iqk7YSw65SU66O4IOyLoOy0jCDsiqTthLDrlJTsubTtjpgg7Iug7LSM7Iqk7YSw65SU66O4IOyxhOybgCDqs7XrtoDtlZjquLAg7KKL7J2A7Lm07Y6Y!5e0!3m2!1sko!2skr!4v1571382664752!5m2!1sko!2skr" width="300" height="450" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
                                    <div>
                                     
                                    </div>
                                    <br>
                                    <a href="https://goo.gl/maps/oqwoQqFMZ12qXaWs6" target="_blank" class="btn btn btn-outline-primary mb5">
                                        <i class="fa fa-search-plus mr-2" ></i>크게보기
                                    </a>
                                </div>
                            </div>
                        </div>
                        <!--tab pane-->
                         <div class="tab-pane" id="c-qa">
                       
                             <h5 style="margin-bottom: 30px;">문의 작성</h5>
                            <div class="media clearfix" style="margin-top: 10px;">
                           
                                <img src="assets/images/lion.png" class="rounded-circle mr-3 d-flex" width="60" alt="">
                                <div class="media-body border-bottom">
                                    <h6>문성빈</h6>
                                    <p class="text-secondary mb-0">
                                      
                                         
                                    </p>
                                  <div class="md-form mb-4 pink-textarea active-pink-textarea-2" style="width: 1000px;">
									  <i class="fas fa-angle-double-right prefix"></i>
									  <textarea id="form23" class="md-textarea form-control" rows="3" cols="70" style="width: 800px; display: inline;"></textarea>
									  <button class="btn btn-outline-primary mb5" style="position: relative; top: -30px; left: 20px;">등록</button>
									  <label for="form23">　　문의를 남겨주세요</label>
								</div>
                                </div>
                            </div><!--/.review-->
                            
                             <h5 style="margin-bottom: 30px; margin-top: 30px;">최근 문의글</h5>
                            <div class="media clearfix" style="margin-top: 10px;">
                           
                                <img src="assets/images/lion.png" class="rounded-circle mr-3 d-flex" width="60" alt="">
                                <div class="media-body border-bottom">
                                    <h6>문성빈</h6>
                                 
                                    <p style="color: black">
                                           	시험기간에 가격이 더오르거나 하지는 않죠?? 항상 고정된 가격인가요??<br>
                                           	<hr style="margin-bottom: 0px!important">
                                           	<span><font id="manager" style="font-weight: bold; margin-bottom: 5px; color: orange; font-size: 16px">채움 관리자</font></span><br>
                                           	<i class="fas fa-reply fa-rotate-180" style="width: 30px; height: 30px; margin-top: 0px; position: relative; top: -15px;" ></i><br>
                                           	<span style="position: relative; left: 40px; top: -30px;">
                                           		네 고객님 저희 채움 스터디카페는 항상 똑같은 요금제로 운영되고있으므로.<br>
                                           		시험기간이라도 요금이 따로 증가하지는 않습니다.<br>
                                           		다만 주말이나 17시 이후에는 스터디룸 가격이 1700으로 변경되니 참고바랍니다!
                                           	</span>
                                    </p>
                                </div>
                            </div><!--/.review-->
                            <div class="media clearfix py-3">
                                    <img src="assets/images/tube.png" class="rounded-circle mr-3 d-flex" width="60" alt="">
                                    <div class="media-body border-bottom">
                                        <h6>박선영</h6>
                                        <p class="text-secondary mb-0">
                                  
                                        <p style="color: black">
                                               	혹시 진행중인 이벤트같은게 있을까요??<br>
                                               	있으면좋을것같은데! 물품보관함 대여비가 궁금해요!
                                               <hr style="margin-bottom: 0px!important">
                                               	<span><font id="manager" style="font-weight: bold; margin-bottom: 5px; color: orange; font-size: 16px">채움 관리자</font></span><br>
	                                           	<i class="fas fa-reply fa-rotate-180" style="width: 30px; height: 30px; margin-top: 0px; position: relative; top: -15px;"></i><br>
	                                           	<span style="position: relative; left: 40px; top: -30px;">
	                                           		네 고객님 저희 채움스터디카페는 현재 오픈이벤트 진행중이며<br>
	                                           		1인당 1시간 무료이용이 가능합니다!<br>
	                                           		그리고 물품보관함은 15일 3000원/ 30일 5000원 으로 운영되고있습니다!<br>
	                                           		많은 이용부탁드릴게요!
	                                           	</span>
                                        </p>
                                    </div>
                                </div><!--/.review-->
                                <div class="media clearfix">
                                        <img src="assets/images/cat.png" class="rounded-circle mr-3 d-flex" width="60" alt="">
                                        <div class="media-body border-bottom">
                                            <h6>김선겸</h6>
                                         
                                            <p style="color: black">
                                                   	설마고양이못데려가는거아니죠? 우리 고양이는 착해서 다른 사람한테 피해안줘요! ㅎㅎ.<br>
                                                   	고양이 가져가도되는거죠??
                                                   	 	<hr style="margin-bottom: 0px!important">
                                                   	 		<span><font id="manager" style="font-weight: bold; margin-bottom: 5px; color: orange; font-size: 16px">채움 관리자</font></span><br>
	                                           	<i class="fas fa-reply fa-rotate-180" style="width: 30px; height: 30px; margin-top: 0px; position: relative; top: -15px;"></i><br>
	                                           	<span style="position: relative; left: 40px; top: -30px;">
	                                           		고객님 정말 죄송합니다..<br>
	                                           		다른 고객들에게 피해가 갈 수 있기 때문에 반려동물은 동반입실이 불가합니다<br>
	                                           		죄송합니다 ㅠㅠ<br>
	                                           	</span>
                                            </p>
                                        </div>
                                    </div><!--/.review-->
                                    <br>
                                      		<span style="position: relative; left: 450px; color: black"><a id="reviewClick" href="#" style="color: blue;">모든 문의 보기</a></span><br>
                                      		<i class="fas fa-angle-down" style="position: relative; left: 490px; color: black; width: 20px; height: 20px; " ></i>
                                      		
                        </div>
                        <!--tab pane-->
                        <div class="tab-pane" id="c-reviews">
                            <div class="row mb-4 align-items-center" style="margin-bottom: 0px!important;">
                                <div class="col-md-5 mb-30">
                                    <div class="p-4 border-right border-top border-bottom border-left text-center bg-white rounded text-dark">
                                        <div class="display-3 text-secondary">4.85</div>
                                        <h4>
                                           	리뷰 평점
                                        </h4>
                                        <span class="text-muted">243 리뷰</span>
                                    </div>
                                </div>
                                <div class="col-md-7 mb-30">
                                    <div class="clearfix mb-2">
                                        <span class="float-right">
                                            225
                                        </span>
                                         <span class="text-secondary mb-0">  
											<i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
										</span>
                                    </div>
                                    <div class="progress mb-3" style="height: 2px;">
                                        <div class="progress-bar bg-secondary" style="width: 100%"></div>
                                    </div>
                                    <div class="clearfix mb-2">
                                        <span class="float-right">
                                            10
                                        </span>
                                         <span class="text-secondary mb-0"> 
                                        	<i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
										</span>
                                    </div>
                                    <div class="progress mb-3" style="height: 2px;">
                                        <div class="progress-bar bg-secondary" style="width: 15%"></div>
                                    </div>
                                    <div class="clearfix mb-2">
                                            <span class="float-right">
                                                5
                                            </span>
                                                    <span class="text-secondary mb-0">  
			                                        	<i class="fas fa-star"></i>
			                                            <i class="fas fa-star"></i>
			                                            <i class="fas fa-star"></i>
													</span>
                                        </div>
                                        <div class="progress mb-3" style="height: 2px;">
                                            <div class="progress-bar bg-secondary" style="width: 5%"></div>
                                        </div>
                                        <div class="clearfix mb-2">
                                                <span class="float-right">
                                                    2
                                                </span>
                                                 <span class="text-secondary mb-0"> 
			                                        	<i class="fas fa-star"></i>
			                                            <i class="fas fa-star"></i>
												</span>
                                            </div>
                                            <div class="progress mb-3" style="height: 2px;">
                                                <div class="progress-bar bg-secondary" style="width: 2%"></div>
                                            </div>
                                            <div class="clearfix mb-2">
                                                    <span class="float-right">
                                                        0
                                                    </span>
                                                    <span class="text-secondary mb-0"> 
			                                        	<i class="fas fa-star"></i>
													</span>
                                                </div>
                                                <div class="progress mb-3" style="height: 2px;">
                                                    <div class="progress-bar bg-secondary" style="width: 0%"></div>
                                                </div>
                                </div>
                            </div><!--/.row-->
                             <h5 style="margin-bottom: 30px;">리뷰 작성</h5>
                            <div class="media clearfix" style="margin-top: 10px;">
                           
                                <img src="assets/images/lion.png" class="rounded-circle mr-3 d-flex" width="60" alt="">
                                <div class="media-body border-bottom">
                                    <h6>문성빈</h6>
                                    <p class="text-secondary mb-0">
                                      
                                            <i class="far fa-star" id="one"></i>
                                            <i class="far fa-star" id="two"></i>
                                            <i class="far fa-star" id="three"></i>
                                            <i class="far fa-star" id="four"></i>
                                            <i class="far fa-star" id="five"></i>
                                         
                                    </p>
                                  <div class="md-form amber-textarea active-amber-textarea-2" style="width: 1000px;">
									  <i class="fas fa-pencil-alt prefix"></i>
									  <textarea id="form24" class="md-textarea form-control" rows="3" cols="70" style="width: 800px; display: inline;"></textarea>
									  <button class="btn btn-outline-warning mb5" style="position: relative; top: -30px; left: 20px;">등록</button>
									  <label for="form24">　　리뷰를 작성해 주세요</label>
								</div>
                                </div>
                            </div><!--/.review-->
                            
                             <h5 style="margin-bottom: 30px; margin-top: 30px;">베스트 리뷰</h5>
                            <div class="media clearfix" style="margin-top: 10px;">
                           
                                <img src="assets/images/lion.png" class="rounded-circle mr-3 d-flex" width="60" alt="">
                                <div class="media-body border-bottom">
                                    <h6>문성빈</h6>
                                    <p class="text-secondary mb-0">
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                         
                                    </p>
                                    <p>
                                           	내부시설이 깨끗하고 깔끔해서 좋았어요 특히 개인물품 보관함이 있어서 시험기간에 이용하기 정말좋은것 같습니다
	                                           <hr style="margin-bottom: 0px!important">
                                               	<span><font id="manager" style="font-weight: bold; margin-bottom: 5px; color: orange; font-size: 16px">채움 관리자</font></span><br>
	                                           	<i class="fas fa-reply fa-rotate-180" style="width: 30px; height: 30px; margin-top: 0px; position: relative; top: -15px;"></i><br>
	                                           	<span style="position: relative; left: 40px; top: -30px;">
	                                           		고객님 만족스러웠다니 정말 기쁩니다<br>
	                                           		이벤트 진행중이니 자주 방문해주세요! ^^<br>
	                                           	</span>
                                    </p>
                                </div>
                            </div><!--/.review-->
                            <div class="media clearfix py-3">
                                    <img src="assets/images/tube.png" class="rounded-circle mr-3 d-flex" width="60" alt="">
                                    <div class="media-body border-bottom">
                                        <h6>박선영</h6>
                                        <p class="text-secondary mb-0">
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                           	<i class="far fa-star"></i>
                                           
                                        </p>
                                        <p>
                                               	책상이나 조명이 집중이 잘되는 것 같아요 생긴지 얼마 안되서 그런지 시설도 굉장히 깔끔합니다 근데 새로생긴곳이라 그런지<br>
                                               	약간 페인트냄새? 같은게 나던데 내부 방향제 같은거 설치해주시면 좋을 것 같아요! 
                                               	 <hr style="margin-bottom: 0px!important">
                                               	<span><font id="manager" style="font-weight: bold; margin-bottom: 5px; color: orange; font-size: 16px">채움 관리자</font></span><br>
	                                           	<i class="fas fa-reply fa-rotate-180" style="width: 30px; height: 30px; margin-top: 0px; position: relative; top: -15px;"></i><br>
	                                           	<span style="position: relative; left: 40px; top: -30px;">
	                                           		고객님들이 최상의 조건에서 집중 할 수 있도록<br>
	                                           		항상 조명과 환경을 최상의 상태로 유지하고있습니다!<br>
	                                           		신축건물이다보니 ㅠㅠ 아무래도 미흡한면이 있었던 것 같습니다! 방향제 설치하였으니<br>
	                                           		다음에 방문하실때는 더 만족스러운 채움스터디카페가 되겠습니다!
	                                           	</span>
                                        </p>
                                    </div>
                                </div><!--/.review-->
                                <div class="media clearfix">
                                        <img src="assets/images/cat.png" class="rounded-circle mr-3 d-flex" width="60" alt="">
                                        <div class="media-body border-bottom">
                                            <h6>김선겸</h6>
                                            <p class="text-secondary mb-0">
                                                  	<i class="fas fa-star"></i>
		                                            <i class="fas fa-star"></i>
		                                            <i class="fas fa-star"></i>
		                                           	<i class="far fa-star"></i>
                                               		<i class="far fa-star"></i>
                                            </p>
                                            <p>
                                                   	고양이는 왜 못데려가는거죠?? 우리 고양이는 착해서 다른 사람한테 피해안주는데 기분이 나빠서 별점하나 줄입니다.<br>
                                                   	그래도 전체적인 시설이 깔끔하고 대여시스템도 잘되어있어서 별점 4개드릴게요!
                                                   	 <hr style="margin-bottom: 0px!important">
                                               	<span><font id="manager" style="font-weight: bold; margin-bottom: 5px; color: orange; font-size: 16px">채움 관리자</font></span><br>
	                                           	<i class="fas fa-reply fa-rotate-180" style="width: 30px; height: 30px; margin-top: 0px; position: relative; top: -15px;"></i><br>
	                                           	<span style="position: relative; left: 40px; top: -30px;">
	                                           		고객님..설마 진짜 데려오실줄은 몰랐네요..<br>
	                                           		어쩔 수 없이 제가 이번한번은 눈감아 드렸지만 다음엔 절대 데려오시면 안됩니다 ㅠㅠ<br>
	                                           		그리고 4개 주신다더니 ㅠㅠ3개주셨어요! 다음엔 꼭 별점 4점주세요! ㅎㅎ<br>
	                                           	</span>
                                            </p>
                                        </div>
                                    </div><!--/.review-->
                                    <br>
                                      		<span style="position: relative; left: 450px; color: black"><a id="reviewClick" href="#" style="color: orange;">모든 리뷰 보기</a></span><br>
                                      		<i class="fas fa-angle-down" style="position: relative; left: 490px; color: black; width: 20px; height: 20px;" ></i>
                                      		
                        </div>
                        <!--tab pane-->
                        
                         <div class="tab-pane" id="c-cancle" style="width: 1200px;">
                            <div class="row">
                                <div class="col-md-8 mb-30" style="width: 1200px;">
                                    <h5>상품 정보 제공 고시</h5>
                                    <hr>
                                    <p>
                                       	<font class="info" style="font-weight: bold;">채움 스터디 카페</font><br>

										<font class="info">1.스터디카페 이용에 관련한 스터디룸 및 이용권 장소제공</font><br>
										
										<font class="info">2.기타 간단한 식음료 제공</font><br>
                                    </p>
                                    <br>
                                    <h5>취소 환불 규정</h5>
                                    <hr>
                                    <p>
                                        <font class="info">1. 채움스터디카페의 모든 예약은 시작일 5일 이전까지 취소 시에는 전액 환불이 가능합니다. 단, 예약일 3일전까지 취소 시 50% 환불이 가능하며, 
                                        					그 이후와 예약 당일 취소 시 환불 불가 (단, 지인에게 양도 가능)합니다.
															예시) 예약일이 2020년 3월 6일 (금) 일 경우 3월 1일 이전까지 취소 신청시 : 전액 환불 (결제수단에 따라 취소 수수료,부가세 발생가능) 
															3월 3일까지 취소 신청시 : 50% 환불 (결제수단 관계없이 취소 수수료, 부가세 채움스터디카페가 부담) 3월 4일~3월 6일 강좌 당일 취소 신청 시 : 
															환불 불가 (지인에게 양도 가능)</font><br>

										<font class="info">2. 결제 수단에 따라 취소 수수료와 부가세 발생 (채움스터디카페 ‘결제수단별 취소 수수료, 부가세 부과 안내’ 참고) 
																예약일 5일 이전까지 취소 시 전액 환불이 가능하지만 이 경우에도 실시간 계좌이체와 가상계좌를 통해 결제하신 경우는 
																PG사 매입기준에 따라 전액 환불금에서 취소수수료와 10% 부가세를 제외하고 환불해 드립니다. 신용카드와 무통장 입금은 취소 시 
																취소수수료와 10% 부가세가 발생하지 않습니다.
															 	예약일 3일 전까지 취소 신청하여 50% 환불 처리 하는 경우, 
															 	결제 수단에 관계없이 취소 수수료와 부가세는 채움스터디 카페가 부담합니다.</font><br>
										
										<font class="info">3. 카페측 사정으로 인한 예약 취소 시에는 100% 환불하여 드립니다.</font><br>
										

                                    </p>
                                    
                                </div>
                         
                            </div>
                        </div>
                    </div>
                    <!--tab content-->
                 
                </div>
                
               
            </div>
       
     
            </div>
    
   
        
        <!-- 요기에 넣어!!!!!-->
        
        
      
      
      
      
            
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
                        <h4><i class="fa fa-phone"></i> 1800-355-4322</h4>
                        <h4><i class="fa fa-envelope"></i> support@assan.com</h4>
                        <p>&copy; Copyright 2018. Assan 3.0</p>
                    </div>
                </div>
            </div>
        </footer>

        <!--back to top-->
        <a href="#" class="back-to-top hidden-xs-down" id="back-to-top"><i class="ti-angle-up"></i></a>
        <!-- jQuery first, then Tether, then Bootstrap JS. -->
        <script src="js/plugins/plugins.js"></script> 
        <script src="js/assan.custom.js"></script> 
    </body>
</html>
