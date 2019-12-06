<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <!-- 희진 헤더 추가 -->
        <link rel="stylesheet" href="css/jquery-ui.min.css">
		<style type="text/css">
		.ui-datepicker {
			width:50%;
			height:300px;
			margin:auto;
			font-size : 20px;
			text-align: center;
			padding: 10px;
		}
		</style>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="js/jquery.weekly-schedule-plugin.js"></script>
	<script type="text/javascript" src="js/jquery-ui.min.js"></script>
	<!-- jQuery first, then Tether, then Bootstrap JS. -->
     <script src="js/plugins/plugins.js"></script> 
     <script src="js/assan.custom.js"></script> 
     <!-- / jQuery first, then Tether, then Bootstrap JS. -->
	<script type="text/javascript">
	$(function() {
		var $j = jQuery.noConflict();
		
		var cafe_no = $("#cafe_no").val();
		var resultDate; 	//예약날짜(넘겨줄 값)	
		var resultTime;		//예약룸번호 및 시간(넘겨줄 값) : [{1,9:00AM,10:00AM}{2,2:00PM,3:00PM,4:00PM}] 형식.	//완료 
		var printTime;
		var resultPerson; 	//예약인원(넘겨줄 값) 	//완료
		var totalPrice;		//예약가격(넘겨줄 값)
		
		var room_nos = new Array();
		var room_names = new Array();
		
		//예약인원
		resultPerson = $("#reserPerson").val();
		$("#reserPerson").change(function() {
			resultPerson = $("#reserPerson").val();
			$("#totalPrice").html(getTotal());
		});
			
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
		
		//예약 가격 구하기	//일괄 1000원으로 먹어짐. 2번째 배열 안감.
		function getTotal() {
			var total = 0;
			$.ajax({url:"getRoomTime", data:{room_no:room_nos[0]}, dataType : "json", async:false,
				success: function(data) {
					$.each(data, function(idx, d) {
				 		$.each(resultTime, function(idx2, r) {
				 			for(var i=1; i<r.length; i++) {
				 				var arr = r[i].split(":");
				 				var selTime = 0;
				 				
				 				if(arr[1].endsWith("PM")) {		//오후면 12시간 더하기 (예) 2:00PM -> 14시
				 					selTime = Number(arr[0]) + 12;
				 				}else {
				 					selTime = Number(arr[0]);
				 				}

				 				if(selTime >= d.start_time && selTime < d.end_time ) {
				 					total += d.time_price;
				 				}
				 			}
				 		}); 
					});
					
					total = total * resultPerson;
				}});
			totalPrice = total;
			return total;
		}
		
		
		//이미 예약된 시간(정보) 가져오는 메소드! 예약된 시간은 클릭 막기!! 
		function getRoomReser(reser_date) {
			$.ajax({url:"getRoomReser",
				data:{cafe_no:cafe_no, reser_date:reser_date}, dataType : "json", async:false,
				success:function(r) {
					$.each(r, function(idx, rr) {
						var room_name = rr.room_name;
						
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
							$('.'+room_name).find('.'+time_reserved).css('background','gray');
							$('.'+room_name).find('.'+time_reserved).addClass('reserved');
							//$('.룸3').find('.5\\:00AM').css('background','black');	//성공!
							//$('.룸3').find('.5\\:00AM').addClass('reserved');	//클릭 막음!
						}
					});
			}});
		}
		
		$("#datepicker").datepicker({
			minDate : 1,
			maxDate : "+1M",
			dateFormat : "yy-mm-dd", 
			onSelect : function(date) {
				resultDate = date;
				$("#reserDate").html(date);
				
				//날짜 바꾸면 선택한 데이터 초기화
				$("#reserPerson").val('1');
				$(".selected").removeClass('selected');
				$('.reserved').css('background','#DDDDDD');
				$(".reserved").removeClass('reserved');
				printTime = new Array();
				resultTime = new Array();
				$('#reserTime').html("");
				$("#totalPrice").html(getTotal());

				//선택한 날짜의 예약된 룸정보 가져오기
				getRoomReser(date);
			}
		});
		
		$('#mySchedule').weekly_schedule({
			
			  days: room_names, 
			  hours: getRoomTime(room_nos[0]), 
			  fontFamily: "Montserrat", 
			  fontColor: "black", 
			  fontWeight: "100", 
			  fontSize: "18px", 
			  hoverColor: "#F4923D", 
			  selectionColor: "#FEA65A", 
			  headerBackgroundColor: "transparent",
		});
		
		
		//시간들 클릭했을때 실행
		$(".hour").click(function() {

			$('#reserTime').html("");
			var preRoom = null;
			printTime = new Array();	//예약룸명, 시간들 (출력할 용도)
			resultTime = new Array();	//예약룸번호, 시간들 (넘겨줄 값 담을 용도) 
			var i = 0;
			
	 		var divs = $(".selected");	//선택된 div들
			$.each(divs, function(idx, d) {
		
				var arr1 =  $(this).parent().attr('class').split(' ');
				var arr2 =  $(this).attr('class').split(' ');
				var sel_room_name = arr1[1];  	//선택된 룸명
				var sel_time = arr2[1]; 	//선택된 시간
				var sel_room_no;			//선택된 룸번호
				
				//룸명에 해당하는 룸번호 구하기
				for(var j=0; j<room_names.length; j++) {
					if(room_names[j] == sel_room_name) {
						sel_room_no = room_nos[j];
					}
				}

				if(preRoom == null) {
					preRoom = sel_room_name;
					printTime[i] = new Array();
					resultTime[i] = new Array();
					printTime[i].push(sel_room_name);
					resultTime[i].push(sel_room_no);
				}
				
				if(preRoom != sel_room_name) {
					preRoom = sel_room_name;
					i++;
					printTime[i] = new Array();
					resultTime[i] = new Array();
					printTime[i].push(sel_room_name);
					resultTime[i].push(sel_room_no);
				}
				printTime[i].push(sel_time);
				resultTime[i].push(sel_time);
			});
	 		
	 		//선택한 시간(예약시간) 출력
	 		$.each(printTime, function(idx, r) {
	 			
	 			var txt_room = r[0];
	 			var txt_time = new Array();
	 			for(var j=1; j<r.length; j++) {
	 				txt_time.push(r[j]);
	 			}
	 			$('#reserTime').append(txt_room+" : "+txt_time+"<br>");
	 		}); 
	 		
	 		$("#totalPrice").html(getTotal());
	 		
		});
		
		//'다음' 버튼 눌렀을때 -> 결제화면으로 이동
		$("#nextPage").click(function() {
			window.location.href = "paymentReserRoomView.do?cafe_no="+cafe_no+"&resultDate="+resultDate+"&resultTime="+resultTime+
					"&resultPerson="+resultPerson+"&totalPrice="+totalPrice+"&printTime="+printTime;
		});
		

	});
	</script>
	<!-- 희진 헤더 추가 끝 -->
        
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
        <div class="page-titles-img title-space-lg bg-parallax parallax-overlay mb70" data-jarallax='{"speed": 0.2}' style='background-image: url("cafe_img/bg1.jpg")'>
            <div class="container">
                <div class="row">
                    <div class=" col-md-8 ml-auto mr-auto">
                        <h1 class='text-uppercase'>스터디카페 </h1>
                    </div>
                </div>
            </div>
        </div><!--page title end-->

        <!-- ###################################################################### -->
        <!-- 요기에 넣어!!!!!-->
        
   <input type="hidden" id="cafe_no" value="${cafe_no}">
   
   <h3 style="margin-left:25%">${cafe_name} - 스터디룸 예약</h3>
   <hr>
   <div align="center">
	   <br><br>
	    <div id="datepicker"></div>
		<br> 예약날짜 :
		<span id="reserDate"></span>
		<div style="margin: 50px">
			예약인원 : 
			<select id="reserPerson">
				<c:forEach var="i" begin="1" end="10">
					<option value="${i}">${i}</option>
				</c:forEach>
			</select>
		</div>
		
		<div class="container" style="margin: 50px auto; width: 50%; height: 100%; 
		display: flex; flex-direction: row; justify-content: center;">
			<div id="mySchedule" style="position: relative;left: -70px;"></div>
		</div>
		
		[ 예약시간 ]<br>
		<span id="reserTime"></span>
		
		<div align="right" style="color:black; font-size: 20px; margin-right: 25%; margin-top: 10px;">
			가격 : <span id="totalPrice">0</span>원
		</div>
		
		<div style="margin: 10px;">
			<a href="#"><button class="btn btn-warning mb5.">예약취소</button></a>
			<span style="margin-left: 35%"> </span>
			
			<button class="btn btn-warning mb5" id="nextPage">다음</button>
		</div>
	
	</div>
       <!-- ###################################################################### -->
 
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
        
    </body>
</html>
