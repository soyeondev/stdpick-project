<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<!-- Bootstrap-->
<link href="admin-dashboardUi/lib/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<!--Common Plugins CSS -->
<link href="admin-dashboardUi/css/plugins/plugins.css" rel="stylesheet">
<!--fonts-->
<link href="admin-dashboardUi/lib/line-icons/line-icons.css" rel="stylesheet">
<link href="admin-dashboardUi/lib/font-awesome/css/fontawesome-all.min.css" rel="stylesheet">
<!-- <link href="admin-dashboardUi/css/style2.css" rel="stylesheet"> -->
<link href="colorbox/colorbox.css" rel="stylesheet">
<style>
 .hi {
        overflow: hidden;
   }

</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- jQuery first, then Tether, then Bootstrap JS. -->
<script src="js/plugins/plugins.js"></script> 
<script src="js/assan.custom.js"></script> 

<!-- <script type="text/javascript" src="admin-dashboardUi/js/plugins/plugins.js"></script>  -->
<script type="text/javascript" src="admin-dashboardUi/js/appUi-custom.js"></script> 
<script type="text/javascript" src="admin-dashboardUi/lib/peity/jquery.peity.min.js"></script>
<script type="text/javascript" src="admin-dashboardUi/js/widgets-custom.js"></script>
<script src="colorbox/jquery.colorbox.js"></script>
<script type="text/javascript">

$(function() {
	

	
	var role = $("#role").val();

	var cust_no=-1;				//로그인 세션
	var provider_no=-1;
	
	if(role == 'customer'){
 		cust_no = $("#no").val();
	}else{
		prov_no = $("#no").val();
	}
	
	
	$("#a_snsMyPageView").click(function() {
		window.location.href="snsMyPageView.do?cust_no="+cust_no+"&provider_no="+provider_no;
	});
	$("#a_snsSch").click(function() {
		window.location.href="snsSch";
	});
	
	
	function snsSchImg() {
		$("#sns_img").empty();
		$.ajax({url:"snsSchImg",data:{keyword:keyword}, success:function(data) {
			var arr = eval("("+data+")");
	 		var pre_sns_no = -1;
			var col_cnt = 0;
			var row_cnt = 0;
			var row = new Array();	//row 이름 다르게 해줘야 들어감
			row[row_cnt] = $('<div class="row" style="margin-bottom:3%;"></div>');

			$.each(arr, function(idx, item){
				var sns_no = item.sns_no;
				
				if(sns_no != pre_sns_no) {	//새로운 sns_no
					pre_sns_no = sns_no;
					var sns_img_name = item.sns_img_name;
					var col = $('<div class="col-md-4 mb-30 hi"></div>');
					var a = $('<a class="a_ig" href="detailSNS.do?sns_no='+sns_no+'"></a>');
					var img = $('<img src="images/img_sns/'+sns_img_name+'" height="250" alt="" >');
					
					$(a).append(img);
					$(col).append(a);
					$(row[row_cnt]).append(col);
					col_cnt++;
					
					if(col_cnt==3) {
						$("#sns_img").append(row[row_cnt]);
						row_cnt++;
						row[row_cnt] = $('<div class="row" style="margin-bottom:3%;"></div>');
						col_cnt=0;
					}
				}
			
			}); 
			
			$("#sns_img").append(row);
	        /*이부분을 설정해주셔야 detailSNS 페이지가 정상적으로 뜹니다.*/
		    $(".a_ig").colorbox({iframe:true, innerWidth:1100, innerHeight:500,scrolling: false});
			
		}});
	}
	
	
	
	var keyword = "";
	snsSchImg();
	
	$("#btn_sch").click(function(){
		 keyword = $("#keyword").val();
		
		//게시물뿌리기 ===================================================================
		snsSchImg();

	});
});

</script>
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
        <div class="page-titles-img title-space-lg bg-parallax parallax-overlay mb70" data-jarallax='{"speed": 0.2}' style='background-image: url("images/img_sns/sns.jpg")'>
            <div class="container">
                <div class="row">
                    <div class=" col-md-8 ml-auto mr-auto">
                        <h1 class='text-uppercase'>PICKER's LIFE</h1>
                    </div>
                </div>
            </div>
        </div><!--page title end-->
        <!-- ###################################################################### -->
        <input type="hidden" id="no" value="${loginVo.no }">
        <input type="hidden" id="role" value="${loginVo.role }">
        
        
        <!-- 요기에 넣어!!!!!-->
        <div  align="center">
 	        <ul class="nav nav-pills profile-tabs pb-3 mb-30" role="tablist" style="width: 70%;" >
	      
	            <li role="presentation" class="nav-item col-lg-4">
	            	<a class="nav-link active" href="#" aria-controls="tb2" role="tab" data-toggle="tab" id="a_snsSch">
	            	<i class="fa fa-users" aria-hidden="true" ></i>  모두보기</a>
	            </li>
	            <li role="presentation" class="nav-item col-lg-4">
	            	<a class="nav-link" href="#" aria-controls="tb3" role="tab" data-toggle="tab" id="a_snsMyPageView">
	            	<i class="fa fa-pencil-square-o" aria-hidden="true"></i>  My Story</a>
	            </li>
	        </ul>
        <input type="hidden" value="${view_type}" id="view_type">
        <input type="hidden" value="${view_no}" id="view_no">
        <!-- Nav tabs -->
		<div  align="center">
			<div class="row" align="center">
		<!-- col -->
				     <div class="col-lg-12 mb-30">
					         <div class=" pt-4 pb-4  bg-white rounded shadow-sm  full-height">
					             <div class="text-center pt-10">
<!-- 					                <form id="key_form" onsubmit="searchPlaces(); return false;" style="text-align: center;"> -->
							       		<input type="text" id="keyword" name="keyword" style="width:800px !important; height:50px !important; margin-left: 4px;margin-right: 4px;"> 
							           	<button id="btn_sch" class="btn btn-outline-primary mr-1 mb-2" style="width:120px !important; height:50px !important; padding: 0px !important;">검색하기</button> 
<!-- 							        </form>  -->
					             </div>
					         </div>
				     </div><!--col-->
			</div><!-- row -->
		</div>
		<div class="page-content" style="width:60%; margin-top: 4%; margin-bottom: 7%;">
			<div id="sns_img"></div>
		</div>
		</div>
		
<!-- page-content -->
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
                        <h4><i class="fa fa-phone"></i> 1800-355-4322</h4>
                        <h4><i class="fa fa-envelope"></i> support@assan.com</h4>
                        <p>&copy; Copyright 2018. Assan 3.0</p>
                    </div>
                </div>
            </div>
        </footer>

        <!--back to top-->
        <a href="#" class="back-to-top hidden-xs-down" id="back-to-top"><i class="ti-angle-up"></i></a>
    </body>
</html>
