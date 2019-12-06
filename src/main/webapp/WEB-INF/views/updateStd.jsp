<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
	    <!-- real-estate -->
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <title>스투더수정</title>    
	    <!-- Plugins CSS -->
	    <link href="real-estate/css/plugins/plugins.css" rel="stylesheet">
	    <!-- load css for cubeportfolio -->
	    <link rel="stylesheet" type="text/css" href="real-estate/cubeportfolio/css/cubeportfolio.min.css">  
	    <link rel="stylesheet" type="text/css"  href="real-estate/smart-form/smart-templates/css/smart-forms.css">
	    <link href="real-estate/css/style.css" rel="stylesheet">
	        <script src="js/plugins/plugins.js"></script> 
        <script src="js/assan.custom.js"></script> 
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
         <link href="css/tagify.css" rel="stylesheet">
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
          <script src="js/jQuery.tagify.min.js"></script>
		<script src="js/tagify.js"></script>
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
        $(function(){
        	$("input[type=file]").change(function(e){
        		$in = $(this);
        		$in.next().html($in.val());
        	});
        
        	// 해당 셀렉트 박스에 change event binding 하기
        	$("#sigu").change(function() {
	        	$("#sigu_input").val($(this).val());
        	});
        	// 해당 셀렉트 박스에 change event binding 하기
        	$("#sido").change(function() {
				$("#sido_input").val($(this).val());
        	
        	});
        	
        	$("#update_std").click(function(){
        		$("#std_loc").val($("#sido_input").val()+"-"+$("#sigu_input").val());
        		var tags = $("#tags").val();
        		var tags_d = eval("("+tags+")");
        		var tag_str = "";

        		$.each(tags_d, function(idx, item){
        			tag_str += " #"+item.value;
        		});
        		
//  	  		tag_str = str.substr(5,str.length);
        		$("#tag_content").val(tag_str);
        		
	     		$("#std_form").submit();
	     		
    		}); 
        	
        	function readURL(input){
        		if(input.files && input.files[0]){
        			var reader = new FileReader();
        			reader.onload = function(e){
        				$("#preview_img").attr("src", e.target.result);
        			}
        			reader.readAsDataURL(input.files[0]);
        		}
        	}
        	
        	$("#upload").change(function(){
        		readURL(this);
        	});
        });
    </script>
    </head>

<body>

        <div id="preloader">
            <div id="preloader-inner"></div>
        </div><!--/preloader-->

        <!-- Pushy Menu -->
       
        <!-- Site Overlay -->
        <div class="site-overlay"></div>

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
        <div class="page-titles-img title-space-lg bg-parallax parallax-overlay" data-jarallax='{"speed": 0.2}' style='background-image: url("images/std1.jpg")'>
            <div class="container">
                <div class="row">
                    <div class=" col-md-8 ml-auto mr-auto">
                        <h1 class='text-uppercase'>스&nbsp;&nbsp;투&nbsp;&nbsp;더 </h1>

                        <!--                                    <a href='https://www.youtube.com/watch?v=cctFcl5EFYk' class='modal-video btn btn-white-outline btn-lg btn-rounded'>Watch our film</a>
                        -->
                    </div>
                </div>
            </div>
        </div><!--page title end-->
        
        
        
        <!-- ###################################################################### -->
        <!-- 요기에 넣어!!!!!-->
        
        
        
        <div>
        <!-- Site Overlay -->
        <div class="site-overlay"></div>
        <div class="white-page-content" style="padding-top: 5%">
        
            <div class="container pt5 pb10" style="padding-left: 5%;">
                <ol class="breadcrumb mb30">

                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item">Property Detail</li>
                </ol>
               <div class="row">
                    <div class="col-md-12 mb30">
                        <div class="single-prp-header mb40 clearfix">
							<h2 class="mb10 left-title">스투더 수정</h2>
                        </div>
                        <form id="std_form" method="POST" action="updateStdPost" enctype="multipart/form-data">
                        <input type="hidden" name="std_no" value="${s.std_no }">
                        <input type="hidden" id="founder_no" name="founder_no" value="${loginVo.no }">
                        <input type="hidden" name="std_image" value="${s.std_image }">
                        <div class="prp-description pt50">
                            <div class="row" style="padding-left: 3%">
                                <div class="col-md-13 mb30">
                                    <ul class="list-unstyled summary">
                                        <li class="clearfix"><div class="float-right"><input type="text" name="std_name" value="${s.std_name}" style= "width:670px"></div>
                                            <i class="fa fa-address-card"></i> 스투더명 
                                        </li>
                                        <li class="clearfix"><div class="float-right"><input type="text" name="std_intro" value="${s.std_intro}" style= "width:670px"></div>
                                            <i class="fa fa-align-left"></i> 한줄소개
                                        </li>
                                        <li class="clearfix"><div class="float-right"><input type="text" name="std_time" value="${s.std_time}" style= "width:670px"></div>
                                            <i class="fa fa-check-circle"></i> 모임시간
                                        </li>
                                        <li class="clearfix">
                                        <i class="fa fa-map-marker"></i> 모임장소&nbsp;&nbsp;&nbsp;
		                                    <input type="hidden" id="std_loc" name="std_loc" value="${s.std_loc }">
		                                    <input type="text" id="sido_input" value="${sido }">
		                                    <input type="text" id="sigu_input" value="${sigu }">
                                        	<select name="sido" id="sido"></select>&nbsp;&nbsp;
		                                    <select name="sigu" id="sigu"></select>
                                        </li>
                                        <li class="clearfix"><div class="float-right"><input type="date" name="std_start" value="${s.std_start}" style= "width:670px"></div>
                                            <i class="fa fa-angle-double-right"></i> 시작일
                                        </li>
                                        <li class="clearfix"><div class="float-right"><input type="date" name="std_end" value="${s.std_end}" style= "width:670px"></div>
                                            <i class="fa fa-angle-double-left"></i> 종료일
                                        </li>
                                        <li class="clearfix"><div class="float-right"><input type="number" name="std_limit" value="${s.std_limit}" style= "width:670px"></div>
                                            <i class="fa fa-user"></i> 모집인원
                                        </li>
                                        <li class="clearfix"><div class="float-right"><input type="date" name="std_close" value="${s.std_close}" style= "width:670px"></div>
                                            <i class="fa fa-exclamation-circle"></i> 모집마감일
                                        </li>
                                         <li class="clearfix">
                                         <div class="float-right">
                                         </div>
                                           <i class="fa fa-hashtag"></i> HashTag
	                                        <input type="hidden" id="tag_recv" value="${h }" style= "width:670px">
                                            <input type="text" id="tags" name="tags" style= "width:500px !important;">

					                        <script type="text/javascript">
						                        	var tagify = $('[id=tags]').tagify({enforeWhitelist: true});
				                        		    var tags = tagify.data('tagify');
					                            	var tag_str = $("#tag_recv").val();
					                            	var tag_arr = tag_str.split("#");
 					                    			for(var i = 0; i < tag_arr.length; i++){
 					                    				tags.addTags(tag_arr[i]);
					                    			}

					                    			
					                        </script>
  	                            			<input type="hidden" id="tag_content" name="tag_content" style= "width:500px !important;">
                                        </li> 
                                        <li class="clearfix">
 	                                        <div class="float-right" style= "margin-right: 5px">
	                                        </div>
	                                        
                                            <i class="fa fa-map-marker"></i> 이미지등록&nbsp;&nbsp;&nbsp;&nbsp;<br><br>
                                             <div class="custom-file">
											  <input type="file" class="custom-file-input" id="upload" name="upload">
											  <label class="custom-file-label" for="upload"></label>
											</div>
											<div class="cbp-pagination-item cbp-pagination-active">
				                                <img id="preview_img" alt="" src="images/std_img/upload/${s.std_image }">
				                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <!--개설자 소개-->
                            <div class="row">
                                <div class="col-md-12">
                                    <h4 class="mb0">개설자소개</h4><hr>
                                    <textarea cols="120"; rows="30" name="founder_info">${s.founder_info}</textarea>
                                </div>
                            </div>
                            <br><br>
                            
                            <!--모임 소개-->
                            <div class="row">
                                <div class="col-md-12">
                                    <h4 class="mb0">모임소개</h4><hr>
                                    <textarea cols="120"; rows="30" name="std_content">${s.std_content}</textarea>
                                </div>
                            </div>
                        </div>
                        </form>
                        <div style="text-align: center;margin-bottom: 5%; margin-top: 2%;"><button class="btn btn-outline-warning mb5" id="update_std">수정</button></div> 
                    </div>
                </div>
            </div>
        </div>
		
		
        </div>
		


      <!--새로 추가한 페이지-->
      <a href="#" class="back-to-top hidden-xs-down" id="back-to-top"><i class="ti-angle-up"></i></a>
      <!-- jQuery first, then Tether, then Bootstrap JS. -->
      <script type="text/javascript" src="real-estate/js/plugins/plugins.js"></script> 
      <script type="text/javascript" src="real-estate/js/assan.custom.js"></script> 
      <script type="text/javascript" src="real-estate/cubeportfolio/js/jquery.cubeportfolio.min.js"></script>
      <script type="text/javascript" src="real-estate/js/cube-thumbSlider.js"></script> 
            
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
