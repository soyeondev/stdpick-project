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
<link href='smart-form/smart-formsUI.css' rel='stylesheet' />
<link href="css/shop-style.css" rel="stylesheet">


<script type="text/javascript"src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- jQuery first, then Tether, then Bootstrap JS. -->
<script src="js/plugins/plugins.js"></script>
<script src="js/assan.custom.js"></script>
<!-- load cubeportfolio -->
<script type="text/javascript"
	src="cubeportfolio/js/jquery.cubeportfolio.min.js"></script>
<!-- init cubeportfolio -->
<script type="text/javascript" src="js/cube-thumb-slider.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script type="text/javascript">
$(function() {
	//변수 선언 & 설정 =========================================================
	var cust_no = $("#cust_no").val();
	var cafe_no = $("#cafe_no").val();			//이전페이지에서 넘어온값
	var resultDate = $("#resultDate").val();		//넘어온값	//넘겨줄값
	var resultTime = $("#resultTime").val();		//넘어온값 //넘겨줄값
	var resultPerson = $("#resultPerson").val();	//넘어온값 //넘겨줄값
	var totalPrice = $("#totalPrice").val();		//넘어온값
	var resultPrice = totalPrice;							//넘겨줄값	
	var coupon_no = "";										//넘겨줄값	
	var email = "";
	var cust_name = "";
	var phone ="";
	var addr = "";
	
	//초기화 =================================================================
	
	$.ajax({url:"detailCustomer",data:{"cust_no":cust_no} , dataType:"JSON", async: false ,
		success:function(data) {
			email = data.email;
			cust_name = data.cust_name;
			phone = data.phone;
			addr = data.addr;
	}});
		
	$("#resultPrice").html(resultPrice);
	
	$.ajax({url:"getNotUseCoupon",data:{"cust_no":cust_no} , dataType:"JSON", async: false ,
		success:function(data) {
		$.each(data, function(idx, item) {
			var option = $("<option></option>").attr("value", item.discount)
							.attr("coupon_no", item.coupon_no)
							.html(item.discount+"원 할인쿠폰");
			$("#couponList").append(option);
		});
	}});
	
	//동작 ================================================================
		
	//쿠폰 선택했을때 -> 결제할값 - 쿠폰값 , couponUse : true
	$("#couponList").change(function() {
		if($("#couponList option:selected").val() == "") {
			resultPrice = totalPrice;
			$("#resultPrice").html(resultPrice);
			coupon_no = "";
			return;
		}
		resultPrice = Number(totalPrice - $("#couponList option:selected").val());
		$("#resultPrice").html(resultPrice);
		coupon_no = $("#couponList option:selected").attr("coupon_no");

	});
	
	//결제하기 클릭시 -> 결제, 예약 테이블에 insert !!
	$("#btnPayment").click(function() {
		var data = {
				"resultPrice":resultPrice,
				"coupon_no": coupon_no,
				"cust_no" : cust_no,
				"resultDate" : resultDate,
				"resultTime" : resultTime,
				"resultPerson" : resultPerson };
		
// 		alert("ajax부른다!");
// 		$.ajax({url:"insertReserPayment",data:data , async:false, success:function(r) {
// 			re = Number(r);
// 			alert("성공");
// 		}});
		
		//결제 API
		var IMP = window.IMP;
		IMP.init('imp66427464');
		IMP.request_pay({
		    pg : 'kakaopay',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '스터디룸 예약결제',
		    amount : resultPrice,
		    buyer_email : email,
		    buyer_name : cust_name,
		    buyer_tel : phone,
		    buyer_addr : addr,
		    buyer_postcode : '123-456'
		}, function(rsp) {
			var msg="";
		    if ( rsp.success ) {	//결제 성공시 DB에 정보 insert하기
		    	var re = -1;
		    	$.ajax({url:"insertReserPayment",data:data , async:false, success:function(r) {
					re = Number(r);
				}});

		    	if(re>1) {
		    		//메세지 또는 메일 보내기
		    		var product = $("#printStr").val();
		    		$.ajax({url:"mailSender", data:{"email":email, "cust_name":cust_name,
						"product":product, "resultPrice":resultPrice}, 
						complete:function() {
					}});

 		    		msg += '결제가 완료되었습니다.';
		    	}

		    } else {
 		        msg += '결제에 실패하였습니다.';
 		        msg += '에러내용 : ' + rsp.error_msg;
		    }

		    window.location.href = "paymentResultView.do?msg="+msg+"&cafe_no="+cafe_no+"&cust_no="+cust_no+"";
		    
		});
	});

});
</script>

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
		style='background-image: url("cafe_img/bg1.jpg	")'>
		<div class="container">
			<div class="row">
				<div class=" col-md-8 ml-auto mr-auto">
					<h1 class='text-uppercase'>스터디카페</h1>

					<!--                                    <a href='https://www.youtube.com/watch?v=cctFcl5EFYk' class='modal-video btn btn-white-outline btn-lg btn-rounded'>Watch our film</a>
                        -->
				</div>
			</div>
		</div>
	</div>
	<!--page title end-->

	<!-- ###################################################################### -->
	<input type="hidden" value="${loginVo.no }" id="cust_no">
	<input type="hidden" id="cafe_no" value="${cafe_no}">
	<input type="hidden" id="resultDate" value="${resultDate}">
	<input type="hidden" id="resultTime" value="${resultTime}">
	<input type="hidden" id="resultPerson" value="${resultPerson}">
	<input type="hidden" id="totalPrice" value="${totalPrice}">


	<div class="smart-forms smart-container wrap-1">
	<h3>${cafe_name} - 룸예약 결제</h3>
	<br><br>
		<div class="form-body">

			<div class="spacer-b30">
				<div class="tagline">
					<span><font style="color: #F4923D">Reservation Information </font> </span>
				</div>
				<!-- .tagline -->
			</div>

			<div class="section">
				<label class="field prepend-icon"> <input type="text"
					class="gui-input" value="예약날짜 : ${resultDate}" readonly="readonly">
					<span class="field-icon"><i class="fa fa-calendar" aria-hidden="true"></i></i></span>
				</label>
			</div>
			<!-- end section -->

			<div class="section">
				<label class="field prepend-icon"> <input type="text"
					class="gui-input" value="예약인원 : ${resultPerson}명"
					readonly="readonly"> <span class="field-icon"><i
						class="fa fa-user"></i></span>
				</label>
			</div>
			<!-- end section -->

			<div class="section">

				<label for="mobile" class="field prepend-icon"> <input
					type="text" class="gui-input" id="printStr" value="예약룸 및 시간 : ${printStr}"
					readonly="readonly"> <span class="field-icon">
					<i class="fa fa-clock-o" aria-hidden="true"></i></span>
				</label>
			</div>
			<!-- end section -->

			<div class="spacer-t40 spacer-b30">
				<div class="tagline">
					<span> <font style="color: #F4923D">Payment Details</font> </span>
				</div>
				<!-- .tagline -->
			</div>

			<div class="section">
				<p class="small-text fine-grey">Please choose a preferred method
					of payment below</p>
			</div>
			<!-- end section -->

			<div class="section">

				<label class="field option"> <input type="radio"
					name="payment" checked> <span class="radio"></span> 카카오페이
				</label>
			</div>
			<!-- end section -->

			<div class="section">
				<label class="field select"> <select id="couponList">
						<option value="">할인쿠폰 선택</option>
				</select> <i class="arrow double"></i>
				</label>
			</div>
			<!-- end section -->


		</div>
		<!-- end .form-body section -->
		<div class="form-footer" align="right">
			<button id="btnPayment" class="btn btn-warning mb5">
				<span id="resultPrice">0</span>원 결제하기
			</button>
		</div>
		<!-- end .form-footer section -->
	</div>
	<!-- end .smart-forms section -->
	<br><br><div></div>


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
	<a href="#" class="back-to-top hidden-xs-down" id="back-to-top"><i
		class="ti-angle-up"></i></a>


</body>
</html>
