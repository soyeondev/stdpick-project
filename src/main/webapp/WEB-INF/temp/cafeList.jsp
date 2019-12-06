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
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script type="text/javascript">
       		$(function(){
				$.getJSON("cafeListAll",function(data){
					$.each(data,function(idx,item){
						alert(item.cafe_name);
					});
				});
       		}); 
        </script>
<script type="text/javascript">
<!--시/군/구 콤보박스 (sector1)-->
	$('document')
			.ready(
					function() {
						var area0 = ["서울특별시", "인천광역시", "대전광역시",
								"광주광역시", "대구광역시", "울산광역시", "부산광역시", "경기도",
								"강원도", "충청북도", "충청남도", "전라북도", "전라남도", "경상북도",
								"경상남도", "제주도" ];
						var area1 = [ "강남구", "강동구", "강북구", "강서구", "관악구", "광진구",
								"구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구",
								"마포구", "서대문구", "서초구", "성동구", "성북구", "송파구",
								"양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구" ];
						var area2 = [ "계양구", "남구", "남동구", "동구", "부평구", "서구",
								"연수구", "중구", "강화군", "옹진군" ];
						var area3 = [ "대덕구", "동구", "서구", "유성구", "중구" ];
						var area4 = [ "광산구", "남구", "동구", "북구", "서구" ];
						var area5 = [ "남구", "달서구", "동구", "북구", "서구", "수성구",
								"중구", "달성군" ];
						var area6 = [ "남구", "동구", "북구", "중구", "울주군" ];
						var area7 = [ "강서구", "금정구", "남구", "동구", "동래구", "부산진구",
								"북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구",
								"중구", "해운대구", "기장군" ];
						var area8 = [ "고양시", "과천시", "광명시", "광주시", "구리시", "군포시",
								"김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시",
								"시흥시", "안산시", "안성시", "안양시", "양주시", "오산시",
								"용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시",
								"포천시", "하남시", "화성시", "가평군", "양평군", "여주군", "연천군" ];
						var area9 = [ "강릉시", "동해시", "삼척시", "속초시", "원주시", "춘천시",
								"태백시", "고성군", "양구군", "양양군", "영월군", "인제군",
								"정선군", "철원군", "평창군", "홍천군", "화천군", "횡성군" ];
						var area10 = [ "제천시", "청주시", "충주시", "괴산군", "단양군",
								"보은군", "영동군", "옥천군", "음성군", "증평군", "진천군", "청원군" ];
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
        
    </head>

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
                            <img src="C:\std_2nd_project\std_1st\src\main\webapp\images\bg1" class="img-fluid" alt="" width="60">
                        </a>
                        <div class="oHidden">
                            <span class="close"><i class="ti-close"></i></span>
                            <h4><a href="#">Men's Special Watch</a></h4>
                            <p class="text-white-gray"><strong>ROOM : ￦1700 / 좌석 : ￦1000</strong> x 1</p>
                        </div>
                    </li><!--/cart item-->
                    <li class="clearfix">
                        <a href="#" class="float-left">
                            <img src="images/shop/p2.jpg" class="img-fluid" alt="" width="60">
                        </a>
                        <div class="oHidden">
                            <span class="close"><i class="ti-close"></i></span>
                            <h4><a href="#">Men's tour beg</a></h4>
                            <p class="text-white-gray"><strong>ROOM : ￦1700 / 좌석 : ￦1000</strong> x 1</p>
                        </div>
                    </li><!--/cart item-->
                    <li class="clearfix">
                        <a href="#" class="float-left">
                            <img src="images/shop/p3.jpg" class="img-fluid" alt="" width="60">
                        </a>
                        <div class="oHidden">
                            <span class="close"><i class="ti-close"></i></span>
                            <h4><a href="#">Women's T-shirts</a></h4>
                            <p class="text-white-gray"><strong>￦1500</strong> x 1</p>
                        </div>
                    </li><!--/cart item-->
                    <li class="clearfix">

                        <div class="float-right">
                            <a href="#" class="btn btn-primary">Checkout</a>
                        </div>
                        <h4  class="text-white">
                            <small>Subtotal - </small> ￦1700
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
                <a class="navbar-brand" href="indextest2.do">
                    <img class='logo logo-dark' style="top:-25px;" src="images/logo.png" alt="">
                    <img class='logo logo-light hidden-md-down' style="top:-20px;" src="images/logo-light.png" alt="">
                </a>
                <div  id="navbarNavDropdown" class="navbar-collapse collapse">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item dropdown active">
                            <a class="nav-link" aria-haspopup="true" aria-expanded="false" href="#">스투더픽 소개</a>
                           
                        </li>
                        <li class="nav-item dropdown dropdown-full-width">
                            <a class="nav-link" href="/listCafe.do" aria-haspopup="true" aria-expanded="false">
                                스터디카페
                            </a>
                   
                        </li>
                        <li class="nav-item dropdown dropdown-full-width">
                            <a class="nav-link" href="#" aria-haspopup="true" aria-expanded="false">
                                스투더  
                            </a>
                       
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link" aria-haspopup="true" aria-expanded="false" href="#">맛집찾기</a>
                      
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link" aria-haspopup="true" aria-expanded="false" href="#">SNS</a>
                     
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
        <div class="page-titles-img title-space-lg bg-parallax parallax-overlay mb70" data-jarallax='{"speed": 0.2}' style='background-image: url("images/bg1.jpg")'>
            <div class="container">
                <div class="row">
                    <div class=" col-md-8 ml-auto mr-auto">
                        <h1 class='text-uppercase'>스터디카페 </h1>

                        <!--                                    <a href='https://www.youtube.com/watch?v=cctFcl5EFYk' class='modal-video btn btn-white-outline btn-lg btn-rounded'>Watch our film</a>
                        -->
                    </div>
                </div>
            </div>
        </div><!--page title end-->
        
        
        
        
        
        
        
                     <div class="col-md-9 mb40" style="position:relative; left: 220px;">
                    <div class="listing-filter clearfix">
                    <div class="row" style="position: relative; left: 250px;">
					  <div class="col-md-6 select-outline" id="sector1">
					  <select class="mdb-select md-form md-outline colorful-select dropdown-primary" name="sido1" id="sido1" style="height: 30px">
					      <option value="" disabled selected>시 를 선택하세요</option>　　
				
					    </select>
					   　<select class="mdb-select md-form md-outline colorful-select dropdown-primary" name="gugun1" id="gugun1" style="height: 30px">
					      <option value="" disabled selected>구 를 선택하세요</option>
						
					    </select>
					  <div class="input-group mb-3" style="margin-top: 10px; ">
  						<input type="text" class="form-control" placeholder="카페명으로 검색" aria-label="Recipient's username" aria-describedby="basic-addon2" style="height: 36px;">
  							<div class="input-group-append">
    							<button type="button" class="btn btn-primary btn-sm mb5">검색</button>
 					 		</div>
						</div>
						
					  </div>
					</div>
					
							
					
				

                    
                    
                    <div class="property-listing-row" style="margin:250px; margin-top: 30px; margin-bottom: 30px;">
                        <div class="row align-items-center">
                            <div class="col-sm-5">
                                <a class="listing-thumb" href="#">
                                    <img src="images/chaeum1.png" alt="" class="img-fluid" style="height: 230px; width: 400px;">
                                    
                                    <span class="listing-label sale"></span>
                                </a>
                            </div>
                            <div class="col-sm-7">
                                <div class="listing-content-alt">
                                    <span class="float-right rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star-half-empty"></i>
                                        (234)
                                    </span>
                                    <h3><a href="#">채움 스터디</a></h3>
                                    <span class="listing-location"><i class="fa fa-map-marker"></i>서울특별시 서대문구 창천동 62-22</span>
                               <ul class="listing-meta list-inline clearfix">
                               <!--      <li class="list-inline-item">
                                        <span><i class="fa fa-square-o mr-2"></i> Size</span>
                                        400 Sq Ft
                                    </li>
                                   
                                    <li class="list-inline-item">
                                        <span><i class="fa fa-bed mr-2"></i> Beds</span>
                                        3
                                    </li>
                                    <li class="list-inline-item">
                                        <span><i class="fa fa-shower mr-2"></i> Baths</span>
                                        1
                                    </li> -->
                                </ul>
                                    <ul class="clearfix list-inline listing-row-inline mb0">
                                        <li class="list-inline-item">
                                            <a href="#"><i class="ti-user"></i>채움</a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a href="#"><i class="ti-mobile"></i>010-8139-3327</a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a href="#"><i class="ti-sharethis"></i>공유</a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a href="#"><i class="ti-heart"></i>찜</a>
                                        </li>
                                    </ul>
                                    <hr>
                                    <div class="property-listing-footer clearfix">
                                        <div class="float-right">
                                            <a href="cafeDetail.do" class="btn btn-primary">상세 보기</a>
                                        </div>
                                        <h4 class="font400">ROOM : ￦1700 / 좌석 : ￦1000</h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div><!--/listing row-->
                     <div class="property-listing-row" style="margin:250px; margin-top: 30px; margin-bottom: 30px;">
                        <div class="row align-items-center">
                            <div class="col-sm-5">
                                <a class="listing-thumb" href="#">
                                    <img src="images/social.png" alt="" class="img-fluid" style="height: 230px; width: 400px;">
                                    <span class="listing-label sale"></span>
                                </a>
                            </div>
                            <div class="col-sm-7">
                                <div class="listing-content-alt">
                                    <span class="float-right rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star-half-empty"></i>
                                        (234)
                                    </span>
                                    <h3><a href="#">Jacksonvile 모임공간</a></h3>
                                    <span class="listing-location"><i class="fa fa-map-marker"></i>서울특별시 서대문구 창천동 62-22</span>
                               <ul class="listing-meta list-inline clearfix">
                               <!--      <li class="list-inline-item">
                                        <span><i class="fa fa-square-o mr-2"></i> Size</span>
                                        400 Sq Ft
                                    </li>
                                   
                                    <li class="list-inline-item">
                                        <span><i class="fa fa-bed mr-2"></i> Beds</span>
                                        3
                                    </li>
                                    <li class="list-inline-item">
                                        <span><i class="fa fa-shower mr-2"></i> Baths</span>
                                        1
                                    </li> -->
                                </ul>
                                    <ul class="clearfix list-inline listing-row-inline mb0">
                                        <li class="list-inline-item">
                                            <a href="#"><i class="ti-user"></i>Jacksonvile</a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a href="#"><i class="ti-mobile"></i>010-8139-3327</a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a href="#"><i class="ti-sharethis"></i>공유</a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a href="#"><i class="ti-heart"></i>찜</a>
                                        </li>
                                    </ul>
                                    <hr>
                                    <div class="property-listing-footer clearfix">
                                        <div class="float-right">
                                            <a href="#" class="btn btn-primary">상세 보기</a>
                                        </div>
                                        <h4 class="font400">ROOM : ￦1700 / 좌석 : ￦1000</h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div><!--/listing row-->
                    
                   
                     <div class="property-listing-row" style="margin:250px; margin-top: 30px; margin-bottom: 30px;" >
                        <div class="row align-items-center">
                            <div class="col-sm-5">
                                <a class="listing-thumb" href="#">
                                    <img src="images/toz.png" alt="" class="img-fluid" style="height: 230px; width: 400px;">
                                    <span class="listing-label sale"></span>
                                </a>
                            </div>
                            <div class="col-sm-7">
                                <div class="listing-content-alt">
                                    <span class="float-right rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star-half-empty"></i>
                                        (234)
                                    </span>
                                    <h3><a href="#">Toz 스터디카페</a></h3>
                                    <span class="listing-location"><i class="fa fa-map-marker"></i>서울특별시 서대문구 창천동 62-22</span>
                               <ul class="listing-meta list-inline clearfix">
                               <!--      <li class="list-inline-item">
                                        <span><i class="fa fa-square-o mr-2"></i> Size</span>
                                        400 Sq Ft
                                    </li>
                                   
                                    <li class="list-inline-item">
                                        <span><i class="fa fa-bed mr-2"></i> Beds</span>
                                        3
                                    </li>
                                    <li class="list-inline-item">
                                        <span><i class="fa fa-shower mr-2"></i> Baths</span>
                                        1
                                    </li> -->
                                </ul>
                                    <ul class="clearfix list-inline listing-row-inline mb0">
                                        <li class="list-inline-item">
                                            <a href="#"><i class="ti-user"></i>Toz</a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a href="#"><i class="ti-mobile"></i>010-8139-3327</a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a href="#"><i class="ti-sharethis"></i>공유</a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a href="#"><i class="ti-heart"></i>찜</a>
                                        </li>
                                    </ul>
                                    <hr>
                                    <div class="property-listing-footer clearfix">
                                        <div class="float-right">
                                            <a href="#" class="btn btn-primary">상세 보기</a>
                                        </div>
                                        <h4 class="font400">ROOM : ￦1700 / 좌석 : ￦1000</h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div><!--/listing row-->
                     <div class="property-listing-row" style="margin:250px; margin-top: 30px; margin-bottom: 30px;">
                        <div class="row align-items-center">
                            <div class="col-sm-5">
                                <a class="listing-thumb" href="#">
                                    <img src="images/youngs1.png" alt="" class="img-fluid" style="height: 230px; width: 400px;">
                                    <span class="listing-label sale"></span>
                                </a>
                            </div>
                            <div class="col-sm-7">
                                <div class="listing-content-alt">
                                    <span class="float-right rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star-half-empty"></i>
                                        (234)
                                    </span>
                                    <h3><a href="#">영스스터디카페</a></h3>
                                    <span class="listing-location"><i class="fa fa-map-marker"></i>서울특별시 서대문구 창천동 62-22</span>
                               <ul class="listing-meta list-inline clearfix">
                               <!--      <li class="list-inline-item">
                                        <span><i class="fa fa-square-o mr-2"></i> Size</span>
                                        400 Sq Ft
                                    </li>
                                   
                                    <li class="list-inline-item">
                                        <span><i class="fa fa-bed mr-2"></i> Beds</span>
                                        3
                                    </li>
                                    <li class="list-inline-item">
                                        <span><i class="fa fa-shower mr-2"></i> Baths</span>
                                        1
                                    </li> -->
                                </ul>
                                    <ul class="clearfix list-inline listing-row-inline mb0">
                                        <li class="list-inline-item">
                                            <a href="#"><i class="ti-user"></i>youngs</a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a href="#"><i class="ti-mobile"></i>010-8139-3327</a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a href="#"><i class="ti-sharethis"></i>공유</a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a href="#"><i class="ti-heart"></i>찜</a>
                                        </li>
                                    </ul>
                                    <hr>
                                    <div class="property-listing-footer clearfix">
                                        <div class="float-right">
                                            <a href="#" class="btn btn-primary">상세 보기</a>
                                        </div>
                                        <h4 class="font400">ROOM : ￦1700 / 좌석 : ￦1000</h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div><!--/listing row-->
                       <div class="property-listing-row" style="margin:250px; margin-top: 30px; margin-bottom: 30px;">
                        <div class="row align-items-center">
                            <div class="col-sm-5">
                                <a class="listing-thumb" href="#">
                                    <img src="images/wings.jpg" alt="" class="img-fluid" style="height: 230px; width: 400px;">
                                    <span class="listing-label sale"></span>
                                </a>
                            </div>
                            <div class="col-sm-7">
                                <div class="listing-content-alt">
                                    <span class="float-right rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star-half-empty"></i>
                                        (234)
                                    </span>
                                    <h3><a href="#">윙스터디 카페</a></h3>
                                    <span class="listing-location"><i class="fa fa-map-marker"></i>서울특별시 서대문구 창천동 62-22</span>
                               <ul class="listing-meta list-inline clearfix">
                               <!--      <li class="list-inline-item">
                                        <span><i class="fa fa-square-o mr-2"></i> Size</span>
                                        400 Sq Ft
                                    </li>
                                   
                                    <li class="list-inline-item">
                                        <span><i class="fa fa-bed mr-2"></i> Beds</span>
                                        3
                                    </li>
                                    <li class="list-inline-item">
                                        <span><i class="fa fa-shower mr-2"></i> Baths</span>
                                        1
                                    </li> -->
                                </ul>
                                    <ul class="clearfix list-inline listing-row-inline mb0">
                                        <li class="list-inline-item">
                                            <a href="#"><i class="ti-user"></i>WingStudy</a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a href="#"><i class="ti-mobile"></i>010-8139-3327</a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a href="#"><i class="ti-sharethis"></i>공유</a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a href="#"><i class="ti-heart"></i>찜</a>
                                        </li>
                                    </ul>
                                    <hr>
                                    <div class="property-listing-footer clearfix">
                                        <div class="float-right">
                                            <a href="#" class="btn btn-primary">상세 보기</a>
                                        </div>
                                        <h4 class="font400">ROOM : ￦1700 / 좌석 : ￦1000</h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div><!--/listing row-->
                    <nav aria-label="Page navigation example" class="pt30 mb0">
                        <ul class="pagination pagination justify-content-end">
                            <li class="page-item "><a class="page-link" href="#">Previous</a></li>
                            <li class="page-item active"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><a class="page-link" href="#">Next</a></li>
                        </ul>
                    </nav>
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
