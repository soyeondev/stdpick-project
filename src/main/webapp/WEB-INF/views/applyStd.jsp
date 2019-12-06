<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
	    <!-- real-estate -->
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <title>스투더신청</title>    
	         <script src="js/plugins/plugins.js"></script> 
	  <script src="js/assan.custom.js"></script> 
	    <!-- Plugins CSS -->
	    <link href="real-estate/css/plugins/plugins.css" rel="stylesheet">
	    <!-- load css for cubeportfolio -->
	    <link rel="stylesheet" type="text/css" href="real-estate/cubeportfolio/css/cubeportfolio.min.css">  
	    <link rel="stylesheet" type="text/css"  href="real-estate/smart-form/smart-templates/css/smart-forms.css">
	    <link href="real-estate/css/style.css" rel="stylesheet">
	    
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
                <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script type="text/javascript">
        $(function(){
   			var str = window.location.search
       		var std_no = str.substring(str.indexOf("=")+1,str.indexOf("&"));
   			$("#std_no").val(std_no);
    		$("#btn_apply").click(function(){
    			$("#apply_form").submit();
    			
    		}); 
    		
    		var cust_no = -1;
     		var provider_no = -1;
        		var role = $("#role").val();
        		
        		if(role == 'provider') {
        			provider_no = $("#no").val();
        		}else {
        			cust_no = $("#no").val();
        		}
        		var no = $("#no").val();
        		

				$("#SNS").click(function(){
        			
        			
        			location.href="snsMyPageView.do?cust_no="+cust_no+"&provider_no="+provider_no;
        		})
        });
        </script> 	
    </head>

<body>
 <input id="role" type="hidden" value="${loginVo.role }">
           <input id="no" type="hidden" value="${loginVo.no }">


        <div id="preloader">
            <div id="preloader-inner"></div>
        </div><!--/preloader-->

        <!-- Site Overlay -->
        <div class="site-overlay"></div>


<!--  -->
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
                    
                    <ul class="nav flex-row order-lg-2 ml-auto nav-icons" style="margin-left: 50px!important;">
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
        
        				                            <div class="col-lg-6" style="margin-left: 25%; margin-top: 3%; margin-bottom: 10%">
                                <div class="portlet-box portlet-gutter ui-buttons-col mb-30">
                                    <div class="portlet-header flex-row flex d-flex align-items-center b-b">
                                        <div class="flex d-flex flex-column">
                                            <h3>스투더 신청서 작성</h3><br><br>
                                            <span class="portlet-subtitle"></span>
                                        </div>
                                    </div>
                                    <div class="portlet-body">
                                    
                                        <form id="apply_form" action="applyStdTst" method="post">
                                        
                                            <div class="form-group row">
                                        	<input type="hidden" id="std_no" name="std_no">
                                        	 <input type="hidden" name="cust_no" value="${loginVo.no }">
                                                <label for="inputPassword3" class="col-sm-2 col-form-label">신청 동기 및 기타</label>
                                                <div class="col-sm-10">
                                                    <textarea rows="10" cols="105" placeholder=" Contents" id="apply_content" name="apply_content"></textarea>
                                                </div>
                                            </div>  
                                            <div class="form-group row" style="margin-top: 2%">
 		                                        <div class="col-sm-2 ml-auto" style="display: inline;">
 		                                            <button type="button" class="btn btn-warning mb5" id="btn_apply">신청</button>
                                                </div>
                                            </div>
                                        </form>
                                       
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
      <!--google map-->
      <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAMwVpUj3-oHHW8N21819BhKttOga2Rj2s"></script>
      <script src="real-estate/js/jquery.gmap.min.js"></script> 
      <script>
          // Marker Map
          $(document).ready(function () {
              map = new GMaps({
                  scrollwheel: false,
                  el: '#markermap',
                  lat: 26.981942,
                  lng: 75.684486

              });
              map.addMarker({
                  lat: 26.981942,
                  lng: 75.684486,
                  title: 'Marker with InfoWindow',
                  infoWindow: {
                      content: '<h4>GUNJAN Land & builders</h4><p>We build your dreams</p>'
                  }
              });
          });
      </script> 
      <!--Contact script-->
<!--         <script src="real-estate/js/contact.js" type="text/javascript"></script> -->



        
      
      
      
      
            
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
