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
<link href="admin-dashboardUi/css/style2.css" rel="stylesheet">
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
	var login_type = $("#role").val();
	var view_type = $("#view_type").val();	//보고있는 개인 피드의 타입, 번호 -->controller에서 가져옴
	var view_no = $("#view_no").val();
	var login_no = $("#no").val();
	//nav-item 링크 걸기 ===============================================================================================

	$("#a_snsMyPageView").click(function() {
		var cust_no=-1;
		var provider_no=-1;
		
		
		
		if(login_type == 'customer') {
			cust_no=login_no;
		}else{
			provider_no=login_no;
		}
		
		window.location.href = "snsMyPageView.do?cust_no="+cust_no+"&provider_no="+provider_no;
	});
	
	$("#a_snsSch").click(function() {
		window.location.href = "snsSch";
	});
	
	//팔로워, 팔로잉 관련 ==============================================================================
	
	
	$(".a_ig").colorbox({iframe:true, innerWidth:350, innerHeight:500, scrolling:true});
	$("#a_follower").attr("href", "snsFollower?mode=follower&type="+view_type+"&no="+view_no);
	$("#a_following").attr("href", "snsFollower?mode=following&type="+view_type+"&no="+view_no);
	
	//========================================================================================
	if(view_type == login_type && view_no == login_no) { //나의 피드일때
		$("#a_snsMyPageView").addClass("active");	//nav-item 색칠
		
		var btn = $('<button class="btn btn-icon btn-gradient-teal">개인정보 수정</button>');
		$("#btn").append(btn);
		
		btn.click(function() {	//개인정보 수정 href
			alert("개인정보 수정!");
			//window.location.href = '';
		});

	}else {		//남의 피드일때
		var btn = $('<button class="btn btn-icon btn-gradient-teal">팔로우</button>');	//default : 언팔
		
		//팔로우하는지 확인--> 팔로우하는 중이면 언팔로우 버튼 표시
		$.ajax({url:"isFollow",
			data:{"login_type":login_type, "login_no":login_no,
					"view_type":view_type,"view_no":view_no }, async:false,
			success:function(re) {
				if(re>0) {	//팔로우중
					$(btn).html("언팔로우");
				}
		}});
		$("#btn").append(btn);
		

		$(btn).click(function() {
			if( $(this).html() == "팔로우" ) {	//팔로우버튼 눌렀을때
				$.ajax({url:"insertFollow",
					data:{"login_type":login_type, "login_no":login_no,
						"view_type":view_type,"view_no":view_no }, 
					success:function(re) {
						if(re>0) {
							
							$.ajax({url:"cntFollower",data:{f_type:view_type, f_no:view_no}, success:function(re) {
								$("#followerCount").html(re);
							}});
							
							
							
							
							
							alert("팔로우 되었습니다!");
							$(btn).html("언팔로우");
						}
				}});
			}else {	//언팔로우버튼 눌렀을때
				$.ajax({url:"deleteFollow",
					data:{"login_type":login_type, "login_no":login_no,
						"view_type":view_type,"view_no":view_no }, 
					success:function(re) {
						if(re>0) {
							
							$.ajax({url:"cntFollower",data:{f_type:view_type, f_no:view_no}, success:function(re) {
								$("#followerCount").html(re);
							}});
							
							alert("언팔로우 되었습니다!");
							$(btn).html("팔로우");
						}
				}});
			}
		});
	}
	
	//게시물뿌리기 ===================================================================
	var boardCount=0;
	$.ajax({url:"listSnsMyPage", data:{"view_type":view_type,"view_no":view_no}, 
		dataType:"json", async:false,
		success:function(data) {
		//alert(JSON.stringify(data));
		var pre_sns_no = -1;
		var col_cnt = 0;
		var row_cnt = 0;
		var row = new Array();	//row 이름 다르게 해줘야 들어감

		row[row_cnt] = $('<div class="row" ></div>');
		
		$.each(data, function(idx, item) {
			var sns_no = item.sns_no;

			if(sns_no != pre_sns_no) {	//새로운 sns_no
				boardCount++;
				pre_sns_no = sns_no;
				var sns_img_name = item.sns_img_name;
				//alert(sns_img_name);
				
				var col = $('<div class="col-md-4 mb-30 hi" ></div>');
				var a = $('<a class="a_ig2" href="detailSNS.do?sns_no='+sns_no+'"></a>');
				var img = $('<img src="images/img_sns/'+sns_img_name+'" height="250" alt="" >');
				
				$(a).append(img);
				$(col).append(a);
				$(row[row_cnt]).append(col);
				
				col_cnt++;	
				
				if(col_cnt==3) {
					//alert(sns_no);	//3,6
					//alert($(row).html());
					$("#listSns").append(row[row_cnt]);
					row_cnt++;
					row[row_cnt] = $('<div class="row"></div>');
					col_cnt=0;
				}
			}
		});
		
		$("#listSns").append(row);
		$(".a_ig2").colorbox({iframe:true, innerWidth:1100, innerHeight:500,scrolling: false});
		
	}});
	$("#boardCount").html(boardCount);
	
	
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
        
        
        
        <!-- 요기에 넣어!!!!!-->
        
        <input type="hidden" value="${view_type}" id="view_type">
        <input type="hidden" value="${view_no}" id="view_no">
        <input type="hidden" value="${loginVo.role}" id="role">
        <input type="hidden" value="${loginVo.no}" id="no">
        <!-- Nav tabs -->
<div  align="center">
	        <ul class="nav nav-pills profile-tabs pb-3 mb-30" role="tablist" style="width: 70%;" >
	            <li role="presentation" class="nav-item col-lg-4">
	            	<a class="nav-link" href="#tb2" aria-controls="tb2" role="tab" data-toggle="tab" id="a_snsSch">
	            	<i class="fa fa-users" aria-hidden="true" ></i>  모두보기</a>
	            </li>
	            <li role="presentation" class="nav-item col-lg-4">
	            	<a class="nav-link" href="#" aria-controls="tb3" role="tab" data-toggle="tab" id="a_snsMyPageView">
	            	<i class="fa fa-pencil-square-o" aria-hidden="true"></i>  My Story</a>
	            </li>
	        </ul>

	      
	<div class="row" align="center" style="width:70%" >
			<div class="col-lg-4 mb-30 ">
		      	<div class=" pt-4 pb-4  bg-white rounded shadow-sm  full-height"> 
		         	<img src="${profile_img}" alt="" width="170" height="170" class="shadow-sm ml-auto mr-auto rounded-circle ">
		         	
		             <div class="text-center pt-15">
		                 <h5 class=" mb-30">${nick}</h5>
		                 <div id="btn"></div>
		                 
		             </div>
		         </div>
	     	</div><!-- col -->
		     <div class="col-lg-8 mb-30">
			         <div class=" pt-4 pb-4  bg-white rounded shadow-sm  full-height">
			             <div class="text-center pt-15">
			                 <div class="clearifx pb-3 mb30">
			                     <span class="p-2 text-center d-inline-block ">
			                         <span class="pt-1  fs-2x" id="boardCount">100</span><br>
			                         <span class="pt-1  fs15 text-muted">게시물</span>
			                     </span>
			                     <span class="p-2 text-center d-inline-block ">
			                         <a class="a_ig" id="a_follower">
				                         <span class="pt-1  fs-2x" id="followerCount">${cntFollower}</span><br>
				                         <span class="pt-1  fs15 text-muted">팔로워</span>
			                         </a>
			                     </span>
			                     <span class="p-2 text-center d-inline-block ">
			                     	<a class="a_ig" id="a_following">
				                         <span class="pt-1  fs-2x" id="followingCount">${cntFollowing}</span><br>
				                         <span class="pt-1  fs15 text-muted">팔로잉</span>
			                        </a>
			                     </span>
			                 </div>
			                 <div class="d-block pb-2 mb30 fs18">
			                 	${info}
			                 </div>                 
			             </div>
			             
			         </div>
			         
		     </div><!--col-->
	</div><!-- row -->
	<div align="right" style="width:68%" class="mb30">
	        <a href="snsInsertView.do"><button class="btn btn-outline-primary">게시물 등록</button></a>
	</div>
	
	<hr class="mb30" style="width:70%">
	
	<div class="page-content" style="width:60%">
				<div id="listSns"></div>
	</div><!-- page-content -->
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
