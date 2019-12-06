<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>STUDER-PICK</title>
<!-- 추가 코드 -->
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
<link
	href="admin-dashboardUi/lib/data-tables/dataTables.bootstrap4.min.css"
	rel="stylesheet">
<link
	href="admin-dashboardUi/lib/data-tables/responsive.bootstrap4.min.css"
	rel="stylesheet">
<link href="admin-dashboardUi/css/style.css" rel="stylesheet">

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
 .notice{
	text-align: center; 
	font-weight: 900;
	background-color: #323232;
	color: aliceblue;
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
	<br>
	<br>
	<br>
	<div class="page-titles title-dark pt30 pb20 mb70">
		<div class="container">
			<div class="row">
				<div class=" col-md-6">
					<h4>
						페이지명: <span>공지사항 상세</span>
					</h4>
				</div>
				<div class=" col-md-6 mb0">
					<ol class="breadcrumb text-md-right">
						<li class="breadcrumb-item"><a href="#">고객지원/프로모션</a></li>
						<li class="breadcrumb-item active">공지사항 상세</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	<!--page title end-->

	<!-- ###################################################################### -->
	<!-- 요기에 넣어!!!!!-->

	<div class="page-content" align="center">
		<div class="container-fluid">
			<div class="bg-white table-responsive rounded shadow-sm mb-30"
				style="width: 60%;">
				<table class="table mb-0 table-bordered" id="notice_board" ></table>
			</div>
		</div>
	</div>

	<div class="page-content" align="center">
		<div class="container-fluid">
			<div class="bg-white table-responsive rounded shadow-sm mb-30"
				style="width: 60%;">
				<table class="table mb-0" id="aside">
				</table>
			</div>
			<a href="/std_1st/listNotice.do"><button
					class="btn btn-icon btn-outline-dark mb-2" id="btnList"
					name="btnList">목록</button></a>
		</div>
	</div>



	<!-- ###################################################################### -->

	<br>
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
	<script src="admin-dashboardUi/js/appUi-custom.js"></script>
	<script type="text/javascript">
	<!--공지사항 상세 MAIN-->
		$(function() {	
			
			var getNotice = function(){
				
				var tr1 = $("<tr></tr>");
				var tr2 = $("<tr></tr>");
				var tr3 = $("<tr></tr>");
				var tr4 = $("<tr></tr>");
				
				var td1 = $("<td class='notice' width='10%'><strong>제목<stong></td>");
				var td1_1 = $("<td width='60%'></td>").html("${n.notice_title}");				
				var td2 = $("<td class='notice' width='10%'>작성일</td>");
				var td2_1 = $("<td width='20%'></td>").html("${n.write_date}");	
				
				var td3 = $("<td class='notice' width='10%'>작성자</td>");
				var td3_1 = $("<td width='60%'>관리자</td>");
				var td4 = $("<td class='notice' width='10%'>조회수</td>");
				var td4_1 = $("<td width='20%'></td>").html("${n.hits}");
				 
				var td5 = $("<td colspan='4'style='height: 300px;'></td>").html("${n.notice_content}");
							
				var td6 = $("<td class='notice' width='10%'>첨부파일</td>");
				var td6_1 = $("<td colspan='3'></td>");
				
				var a = $("<a></a>").attr({"href":"down?notice_no=${n.notice_no}"});
				var span = $("<span></span>").html("${n.notice_filename}");
				
				$(tr1).append(td1,td1_1,td2,td2_1);
				$(tr2).append(td3,td3_1,td4,td4_1);
				$(tr3).append(td5);
							
				$(a).append(span);
				$(td6_1).append(a);
				$(tr4).append(td6,td6_1);
				
				$("#notice_board").append(tr1,tr2,tr3,tr4);
			};
			
			getNotice();
		});
	</script>
	
	<script type="text/javascript">
	<!--하단 이전글/다음글 부분-->
		$(function(){		
			var tr1 = $("<tr></tr>");
			var tr2 = $("<tr></tr>");
			
			var td1 = $("<td class='notice' width='10%'>이전글</td>");
			var td1_1 = $("<td width='90%'></td>");
			var a1 = $("<a></a>").html("${n1.notice_title}").attr({"href":"detailNotice.do?notice_no=${n1.notice_no}"});
			
			var td2 = $("<td class='notice' width='10%'>다음글</td>");
			var td2_1 = $("<td width='90%'></td>");
			var a2 = $("<a></a>").html("${n2.notice_title}").attr({"href":"detailNotice.do?notice_no=${n2.notice_no}"});
			
			$(td1_1).append(a1);
			$(td2_1).append(a2);
			
			$(tr1).append(td1,td1_1);
			$(tr2).append(td2,td2_1);
			
			$("#aside").append(tr2,tr1);
			
			
		});
	</script>
</body>

</html>
