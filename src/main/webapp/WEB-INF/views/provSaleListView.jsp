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

<link href="admin-dashboardUi/lib/select2/dist/css/select2.min.css"
	rel="stylesheet">
<link href="admin-dashboardUi/css/select2-custom.css" rel="stylesheet">
<link href="admin-dashboardUi/css/style.css" rel="stylesheet">

<!-- //css  -->

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="js/jquery.weekly-schedule-plugin.js"></script>

<!-- jQuery first, then Tether, then Bootstrap JS. -->
<script src="js/plugins/plugins.js"></script>
<script src="js/assan.custom.js"></script>
<!-- Common plugins -->
<script type="text/javascript"
	src="admin-dashboardUi/js/appUi-custom.js"></script>
<script type="text/javascript"
	src="admin-dashboardUi/lib/peity/jquery.peity.min.js"></script>
<script src="admin-dashboardUi/lib/select2/dist/js/select2.min.js"></script>


<script type="text/javascript">
	$(function() {
		var provider_no = 1;
		var pageSIZE = 20;
		var start = 1;
		var end = pageSIZE;
		var currentPage = 1;
		var searchColumn ="";
		var oper = "";
		var keyword="";
		//==========================================================================
		
		listProvAllSale(provider_no, start, end, searchColumn, oper, keyword);	//처음에 뿌려주기
		
		//무한스크롤
		$(window).scroll(function() {
		    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
			      currentPage++;
			      start = (currentPage-1) * pageSIZE +1;
				  end = currentPage * pageSIZE;
				  listProvAllSale(provider_no, start, end, searchColumn, oper, keyword);
		    }
		});
		
		$("#sp_oper").hide();
		$("#searchColumn").change(function() {
			if( $("#searchColumn option:selected").val() == 'totalprice' ) {
				$("#sp_oper").show();
			}else {
				$("#sp_oper").hide();
			}
		});
		
		$("#btnSearch").click(function() {
			$("#tb").empty();
			
			searchColumn = $("#searchColumn option:selected").val();
			oper = $("#oper option:selected").val();
			keyword = $("#keyword").val();
			currentPage = 1;
			start = 1;
			end = pageSIZE;
			listProvAllSale(provider_no, start, end, searchColumn, oper, keyword);
		});

		function listProvAllSale(provider_no, start, end, searchColumn, oper, keyword) {
			$.ajax({url:"listProvAllSale", 
				data:{"provider_no":provider_no, "start":start, "end":end, 
						"searchColumn":searchColumn, "oper":oper, "keyword":keyword}, 
				dataType:"JSON", success:function(data) {
				$.each(data, function(idx, item) {
					var tr = $("<tr></tr>");
					var td1 = $("<td></td>").html(item.pay_no);
					var td2 = $("<td></td>").html(item.cafe_name);
					var td3 = $("<td></td>").html(item.product);
					var td4 = $("<td></td>").html(item.totalprice);
					var td5 = $("<td></td>").html(item.id);
					
					
					$(tr).append(td1, td2, td3, td4, td5);
					$("#tb").append(tr);
				});
			}});	
		}
		
		
	});
</script>


</head>

<body class="bg-white">
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
	<div class="page-titles title-dark pt30 pb20 mb30">
		<div class="container">
			<div class="row">
				<div class=" col-md-6">
					<h4>
						<span>My Page</span>
					</h4>
				</div>
				<div class=" col-md-6 mb0">
					<ol class="breadcrumb text-md-right"
						style="background-color: #323232;">
						<li class="breadcrumb-item">My Cafe</li>
						<li class="breadcrumb-item active">My Page</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	<!--page title end-->

	<!-- ###################################################################### -->
	<!-- 요기에 넣어!!!!!-->

	<div class="row">
		<div class="col-lg-12">
			<div class="portlet-box portlet-fullHeight mb-30">
				<div
					class="portlet-header bg-light flex-row flex d-flex align-items-center">
					<div class="flex d-flex flex-column">
						<h3>전체 판매 목록</h3>
					</div>
					<div class="portlet-tools">
						<select id="searchColumn" style="padding: 3px;">
							<option value="pay_no">주문번호</option>
							<option value="cafe_name">카페</option>
							<option value="product">상품</option>
							<option value="totalprice">가격</option>
							<option value="id">구매자</option>
						</select>
						
						<span id="sp_oper">
							<select id="oper" style="padding: 3px;">
								<option value="=">=</option>
								<option value=">=">>=</option>
								<option value="<="><=</option>			
							</select>
						</span>
						
						<input type="text" id="keyword">
						<button id="btnSearch" class="btn-primary" style="border-radius: 5px; background-color: #F4923D; border-color: #F4923D">검색</button>
					
					</div>
					
				</div>
				<div class="portlet-body no-padding">

					<div class="table-responsive">
						<table class="table mb-0">
							<thead>
								<tr>
									<th>주문번호</th> <!-- pay_no -->
									<th>카페</th>
									<th>상품</th>
									<th>가격</th>
									<th>구매자<th>
										
								</tr>
									</thead>
									<tbody id="tb"></tbody>
								</table>
							</div>
						</div>
					</div>
					<!--portlet-->
				</div>
				<!--col-->
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
	<a href="#" class="back-to-top hidden-xs-down" id="back-to-top"><i
											class="ti-angle-up"></i></a>




									</body>

</html>
