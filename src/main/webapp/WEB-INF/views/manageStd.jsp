	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>CUSTMYPAGEVIEW</title>
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



<!-- -----------------------------------dashboard layout-horizontal------------------------------------------>

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Dashboard layout-horizontal</title>
<!-- Bootstrap-->
<link href="admin-dashboardUi/lib/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!--Common Plugins CSS -->
<link href="admin-dashboardUi/css/plugins/plugins.css" rel="stylesheet">
<!-- 탭 Plugins CSS -->
<link href="admin-dashboardUi/css/plugins/plugins.css" rel="stylesheet">
<link href="admin-dashboardUi/css/style.css" rel="stylesheet">
<!--fonts-->
<link href="admin-dashboardUi/lib/line-icons/line-icons.css"
	rel="stylesheet">
<link
	href="admin-dashboardUi/lib/font-awesome/css/fontawesome-all.min.css"
	rel="stylesheet">
<link href="admin-dashboardUi/lib/chartist/chartist.min.css"
	rel="stylesheet" />
<link href="admin-dashboardUi/css/chartist-custom.css" rel="stylesheet" />
<!-- jvectormap -->
<link
	href="admin-dashboardUi/lib/vector-map/jquery-jvectormap-2.0.2.css"
	rel="stylesheet" />
<link href="admin-dashboardUi/css/style.css" rel="stylesheet">


<!-- -----------------------------------dashboard button------------------------------------------>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Dashboard-button</title>
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
<link href="admin-dashboardUi/css/style1.css" rel="stylesheet">
<style>
.shadow {
    box-shadow: 4px 4px 4px 4px #999
}
.margin_div {
	margin: 3%;
}
.table-wrapper{
	float: left;
}
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		var str = window.location.search
		var std_no = str.substring(str.indexOf("=")+1,str.length);
	 	$.ajax({url:"getIngPicker?std_no="+std_no,
	 		contentType: "application/json; charset=utf-8",
	 		dataType:"json",
			success: function(data){
			$.each(data, function(idx, c){
				var tr =$("<tr></tr>");
				var h5 = $("<h5 class='h5hover' style='text-align:center;'></h5>").html(c.cust_name);
				var a = $("<a></a>").attr({"href":"confStdIng.do?cust_no="+c.cust_no+"&"+"std_no="+std_no+"&apply_no="+c.apply_no});
				var td1 =$("<td></td>");
				var td2 =$("<td></td>").html(c.phone);
				var td3 =$("<td></td>").html(c.addr);
				
				
				$(a).append(h5);
				$(td1).append(a);
				
				$(tr).append(td1,td2,td3);
				$("#picker_ing").append(tr);
			
			});
			
		}}); 
	 	
	 	$.ajax({url:"getWtgPicker?std_no="+std_no,
	 		contentType: "application/json; charset=utf-8",
	 		dataType:"json",
			success: function(data){
			$.each(data, function(idx, c){
				var tr =$("<tr></tr>");
				var h5 = $("<h5 class='h5hover' style='text-align:center;'></h5>").html(c.cust_name);
				var a = $("<a></a>").attr({"href":"confStdWtg.do?cust_no="+c.cust_no+"&"+"std_no="+std_no+"&apply_no="+c.apply_no});
				var td1 =$("<td></td>");
				var td2 =$("<td></td>").html(c.phone);
				var td3 =$("<td></td>").html(c.addr);
				
				$(a).append(h5);
				$(td1).append(a);
				
				$(tr).append(td1,td2,td3);
				$("#picker_wtg").append(tr);
			
			});
		}}); 
	});
</script>
</head>
<body>
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
	<div class="page-titles title-dark pt30 pb20 mb40">
		<div class="container">
			<div class="row">
				<div class=" col-md-6">
					<h4>
						<span>스투더 관리</span>
					</h4>
				</div>
				<div class=" col-md-6 mb0">
					<ol class="breadcrumb text-md-right">
						<li class="breadcrumb-item"><a href="#">회원정보</a></li>
						<li class="breadcrumb-item active">마이페이지</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	<!--page title end-->


	<!-- ###################################################################### -->
	<!-- 요기에 넣어!!!!!-->
	
	<div class="row rounded shadow-sm bg-white" style="width: 70%; margin-left: 15%; margin-right: 17%; margin-top: 1%; padding-top: 3%; padding-left: 3%">
			<span style="width: 100%">
				<h3>${loginVo.nick_name } 님이 개설하신 스투더의 정보입니다.</h3>
			</span>
			<div style="width:95%; height:0.8%; background-color: gray;"></div>
			<span style="margin-left: 7%;margin-right: 5%; padding-top: 3%; margin-bottom: 3%">
				<img class="shadow" src="images/std_img/upload/${s.std_image }" width="480px" height="300px" >
			</span>
			<span style="padding-top: 3%; margin-bottom: 3%">
			<h4><strong>${s.std_name }</strong></h4><br>
			<span class="iCard-meta fs14 d-block mb-13"><i class='fa fa-calendar mr-2'></i>기간
				<strong class="font630">&nbsp&nbsp ${s.std_start } ~ ${s.std_end }</strong>
			</span><br>
			<span class="iCard-meta fs14 d-block mb-13"><i class='fa fa-user mr-2'></i>인원
				<strong class="font600">&nbsp&nbsp ${s.std_limit }명</strong>
			</span><br>
			<span class="iCard-meta fs14 d-block mb-13"><i class='fa fa-map-marker mr-2'></i>장소
				<strong class="font600">&nbsp&nbsp ${s.std_loc }</strong>
			</span>
			</span>
			
		</div>
<!-- 	<span style="margin-left: 15%;margin-top: 3%"><h5>피커 관리를 원하시면 해당 피커를 클릭하세요</h5></span> -->
	<div class="row rounded shadow-sm bg-white" style="width: 70%; margin-left: 15%; margin-right: 17%; margin-top: 1%; padding-top: 3%; padding-bottom: 3%">
	<div class="col-lg-6" align="center">
	<span align="left"><h4 style="margin-left: 10%; margin-bottom: 2%">참가중인 피커</h4></span>
		<div class="container-fluid">
			<div class="bg-white table-responsive rounded shadow-sm mb-30"
				style="width: 90%;">
				<table class="table mb-0 table-hover" style="text-align: center;">
					<thead>
						<tr>
<!-- 							<th width="10%">No</th> -->
							<th width="25%">NAME</th>
							<th width="35%">PHONE</th>
							<th width="40%">LOCATION</th>
						</tr>
					</thead>
					<tbody id="picker_ing"></tbody>
				</table>
			</div>
		</div>
	</div>


	<div class="col-lg-6" align="center">
<span align="left"><h4 style="margin-left: 10%; margin-bottom: 2%">신청대기중인 피커</h4></span>
		<div class="container-fluid">
			<div class="bg-white table-responsive rounded shadow-sm mb-30"
				style="width: 90%;">
				<table class="table mb-0 table-hover" style="text-align: center;">
					<thead>
						<tr>
<!-- 							<th width="10%">No</th> -->
							<th width="25%">NAME</th>
							<th width="35%">PHONE</th>
							<th width="40%">LOCATION</th>
						</tr>
					</thead>
					<tbody id="picker_wtg"></tbody>
				</table>
			</div>
		</div>
	</div>
	</div>
	
	<div style="text-align: center;margin-bottom: 5%; margin-top: 2%"><button class="btn btn-outline-warning mb5"><a href="custMyPage">마이페이지로</a></button></div> 
	
		<!-- -----------------------------------새로 추가한 파일 ------------------------------------------>

		<script type="text/javascript" src="js/plugins/plugins1.js"></script>
		<!--  <script type="text/javascript" src="js/appUi-custom.js"></script>  -->
	</div>

	<!-- ###################################################################### -->
	<!--back to top-->
	<a href="#" class="back-to-top hidden-xs-down" id="back-to-top"><i
		class="ti-angle-up"></i></a>
	<!-- jQuery first, then Tether, then Bootstrap JS. -->
	<script src="js/plugins/plugins.js"></script>
	<script src="js/assan.custom.js"></script>



</body>
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
</html>