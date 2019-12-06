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
           <link rel="stylesheet" href="assets/dist/css/style.css">
        <script language="JavaScript" type="text/JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
//-->
</script>
<style type='text/css'>
<!--
body  {
 font-size: 9pt;line-height: 17px;color: 333333;
 scrollbar-face-color: #FFFFFF;
 scrollbar-highlight-color: #666666;
 scrollbar-3dlight-color: #FFFFFF;
 scrollbar-shadow-color: #666666;
 scrollbar-darkshadow-color: #FFFFFF;
 scrollbar-track-color: #FFFFFF;
 scrollbar-arrow-color: #666666;
}
td       {font-size: 9pt;line-height: 17px;color: 333333;}
-->
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js">
</script>
<script type="text/javascript">
	$(function(){
		
		var use = $(".use").length;
		var empty = $(".empty").length;
		
		$("#useCount").html(use+"석");
		$("#emptyCount").html(empty+"석");
	
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
        <div class="page-titles-img title-space-lg bg-parallax parallax-overlay mb70" data-jarallax='{"speed": 0.2}' style='background-image: url("images/bg1.jpg")'>
            <div class="container">
                <div class="row">
                    <div class=" col-md-8 ml-auto mr-auto">
                        <h1 class='text-uppercase'>실시간 좌석 현황 </h1>

                        <!--                                    <a href='https://www.youtube.com/watch?v=cctFcl5EFYk' class='modal-video btn btn-white-outline btn-lg btn-rounded'>Watch our film</a>
                        -->
                    </div>
                </div>
            </div>
        </div><!--page title end-->
        
        
        
        
        
        
        
        
        <!-- ###################################################################### -->
      	<div leftmargin="0" topmargin="0" style="background-repeat:no-repeat; background-attachment:fixed; background-position:0px 0px;  position: relative; left: 450px; top: -50px;">
      	<div id="Layer1" style="position:absolute; left:900px; top:60px; width:45px; height:27px; z-index:1"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;font-family: "Montserrat", sans-serif;'>사용중</font></td></tr></table></div>
      	<div style="position:absolute; left:955px; top:60px; width:45px; height:27px; z-index:1"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td bgcolor='white' align='center' valign='middle'><font id="useCount" style='color:black;font-size:10pt;font-weight:900;font-family: "Montserrat", sans-serif;'></font></td></tr></table></div>
      	<div id="Layer131" style="position:absolute; left:900px; top:90px; width:45px; height:27px; z-index:131"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="empty" bgcolor='gray' bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;font-family: "Montserrat", sans-serif;'>빈좌석</font></td></tr></table></div>
      	<div style="position:absolute; left:955px; top:90px; width:45px; height:27px; z-index:1"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td bgcolor='white' align='center' valign='middle'><font id="emptyCount" style='color:black;font-size:10pt;font-weight:900;font-family: "Montserrat", sans-serif;'></font></td></tr></table></div>
        
        <div id="Layer1" style="position:absolute; left:56px; top:90px; width:42px; height:27px; z-index:1"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>1</font></td></tr></table></div>
		<div id="Layer2" style="position:absolute; left:97px; top:90px; width:42px; height:27px; z-index:2"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>2</font></td></tr></table></div>
		<div id="Layer3" style="position:absolute; left:139px; top:90px; width:42px; height:27px; z-index:3"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>3</font></td></tr></table></div>
		<div id="Layer4" style="position:absolute; left:182px; top:90px; width:42px; height:27px; z-index:4"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>4</font></td></tr></table></div>
		<div id="Layer5" style="position:absolute; left:224px; top:90px; width:42px; height:27px; z-index:5"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>5</font></td></tr></table></div>
		<div id="Layer6" style="position:absolute; left:365px; top:90px; width:42px; height:27px; z-index:6"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>6</font></td></tr></table></div>
		<div id="Layer7" style="position:absolute; left:407px; top:90px; width:42px; height:27px; z-index:7"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>7</font></td></tr></table></div>
		<div id="Layer8" style="position:absolute; left:407px; top:117px; width:42px; height:27px; z-index:8"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>8</font></td></tr></table></div>
		<div id="Layer9" style="position:absolute; left:365px; top:117px; width:42px; height:27px; z-index:9"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>9</font></td></tr></table></div>
		<div id="Layer10" style="position:absolute; left:224px; top:117px; width:42px; height:27px; z-index:10"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>10</font></td></tr></table></div>
		<div id="Layer11" style="position:absolute; left:182px; top:117px; width:42px; height:27px; z-index:11"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>11</font></td></tr></table></div>
		<div id="Layer12" style="position:absolute; left:139px; top:117px; width:42px; height:27px; z-index:12"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>12</font></td></tr></table></div>
		<div id="Layer13" style="position:absolute; left:97px; top:117px; width:42px; height:27px; z-index:13"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>13</font></td></tr></table></div>
		<div id="Layer14" style="position:absolute; left:56px; top:117px; width:42px; height:27px; z-index:14"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="empty" bgcolor='gray' bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>14</font></td></tr></table></div>
		<div id="Layer15" style="position:absolute; left:56px; top:170px; width:42px; height:27px; z-index:15"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>15</font></td></tr></table></div>
		<div id="Layer16" style="position:absolute; left:97px; top:170px; width:42px; height:27px; z-index:16"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>16</font></td></tr></table></div>
		<div id="Layer17" style="position:absolute; left:139px; top:170px; width:42px; height:27px; z-index:17"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="empty" bgcolor='gray' bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>17</font></td></tr></table></div>
		<div id="Layer18" style="position:absolute; left:182px; top:170px; width:42px; height:27px; z-index:18"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="empty" bgcolor='gray' bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>18</font></td></tr></table></div>
		<div id="Layer19" style="position:absolute; left:224px; top:170px; width:42px; height:27px; z-index:19"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="empty" bgcolor='gray' bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>19</font></td></tr></table></div>
		<div id="Layer20" style="position:absolute; left:266px; top:170px; width:42px; height:27px; z-index:20"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>20</font></td></tr></table></div>
		<div id="Layer21" style="position:absolute; left:365px; top:170px; width:42px; height:27px; z-index:21"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>21</font></td></tr></table></div>
		<div id="Layer22" style="position:absolute; left:406px; top:170px; width:42px; height:27px; z-index:22"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>22</font></td></tr></table></div>
		<div id="Layer23" style="position:absolute; left:448px; top:170px; width:42px; height:27px; z-index:23"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>23</font></td></tr></table></div>
		<div id="Layer24" style="position:absolute; left:490px; top:170px; width:42px; height:27px; z-index:24"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>24</font></td></tr></table></div>
		<div id="Layer25" style="position:absolute; left:533px; top:170px; width:42px; height:27px; z-index:25"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>25</font></td></tr></table></div>
		<div id="Layer26" style="position:absolute; left:575px; top:170px; width:42px; height:27px; z-index:26"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="empty" bgcolor='gray' bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>26</font></td></tr></table></div>
		<div id="Layer27" style="position:absolute; left:575px; top:197px; width:42px; height:27px; z-index:27"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="empty" bgcolor='gray' bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>27</font></td></tr></table></div>
		<div id="Layer28" style="position:absolute; left:533px; top:197px; width:42px; height:27px; z-index:28"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="empty" bgcolor='gray' bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>28</font></td></tr></table></div>
		<div id="Layer29" style="position:absolute; left:490px; top:197px; width:42px; height:27px; z-index:29"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>29</font></td></tr></table></div>
		<div id="Layer30" style="position:absolute; left:448px; top:197px; width:42px; height:27px; z-index:30"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="empty" bgcolor='gray' bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>30</font></td></tr></table></div>
		<div id="Layer31" style="position:absolute; left:407px; top:197px; width:42px; height:27px; z-index:31"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>31</font></td></tr></table></div>
		<div id="Layer32" style="position:absolute; left:365px; top:197px; width:42px; height:27px; z-index:32"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>32</font></td></tr></table></div>
		<div id="Layer33" style="position:absolute; left:266px; top:197px; width:42px; height:27px; z-index:33"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>33</font></td></tr></table></div>
		<div id="Layer34" style="position:absolute; left:224px; top:197px; width:42px; height:27px; z-index:34"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="empty" bgcolor='gray' bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>34</font></td></tr></table></div>
		<div id="Layer35" style="position:absolute; left:182px; top:197px; width:42px; height:27px; z-index:35"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>35</font></td></tr></table></div>
		<div id="Layer36" style="position:absolute; left:139px; top:197px; width:42px; height:27px; z-index:36"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>36</font></td></tr></table></div>
		<div id="Layer37" style="position:absolute; left:98px; top:197px; width:42px; height:27px; z-index:37"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>37</font></td></tr></table></div>
		<div id="Layer38" style="position:absolute; left:56px; top:197px; width:42px; height:27px; z-index:38"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="empty" bgcolor='gray' bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>38</font></td></tr></table></div>
		<div id="Layer39" style="position:absolute; left:56px; top:249px; width:42px; height:27px; z-index:39"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>39</font></td></tr></table></div>
		<div id="Layer40" style="position:absolute; left:97px; top:249px; width:42px; height:27px; z-index:40"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>40</font></td></tr></table></div>
		<div id="Layer41" style="position:absolute; left:139px; top:249px; width:42px; height:27px; z-index:41"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>41</font></td></tr></table></div>
		<div id="Layer42" style="position:absolute; left:182px; top:249px; width:42px; height:27px; z-index:42"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>42</font></td></tr></table></div>
		<div id="Layer43" style="position:absolute; left:224px; top:249px; width:42px; height:27px; z-index:43"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>43</font></td></tr></table></div>
		<div id="Layer44" style="position:absolute; left:266px; top:249px; width:42px; height:27px; z-index:44"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>44</font></td></tr></table></div>
		<div id="Layer45" style="position:absolute; left:449px; top:249px; width:42px; height:27px; z-index:45"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>45</font></td></tr></table></div>
		<div id="Layer46" style="position:absolute; left:490px; top:249px; width:43px; height:27px; z-index:46"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>46</font></td></tr></table></div>
		<div id="Layer47" style="position:absolute; left:575px; top:249px; width:42px; height:27px; z-index:47"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>47</font></td></tr></table></div>
		<div id="Layer48" style="position:absolute; left:616px; top:249px; width:43px; height:27px; z-index:48"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>48</font></td></tr></table></div>
		<div id="Layer49" style="position:absolute; left:617px; top:277px; width:42px; height:27px; z-index:49"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>49</font></td></tr></table></div>
		<div id="Layer50" style="position:absolute; left:575px; top:277px; width:42px; height:27px; z-index:50"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>50</font></td></tr></table></div>
		<div id="Layer51" style="position:absolute; left:491px; top:277px; width:42px; height:27px; z-index:51"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>51</font></td></tr></table></div>
		<div id="Layer52" style="position:absolute; left:449px; top:277px; width:42px; height:27px; z-index:52"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>52</font></td></tr></table></div>
		<div id="Layer53" style="position:absolute; left:266px; top:277px; width:42px; height:27px; z-index:53"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>53</font></td></tr></table></div>
		<div id="Layer54" style="position:absolute; left:224px; top:277px; width:42px; height:27px; z-index:54"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>54</font></td></tr></table></div>
		<div id="Layer55" style="position:absolute; left:182px; top:277px; width:42px; height:27px; z-index:55"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>55</font></td></tr></table></div>
		<div id="Layer56" style="position:absolute; left:139px; top:277px; width:42px; height:27px; z-index:56"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>56</font></td></tr></table></div>
		<div id="Layer57" style="position:absolute; left:98px; top:277px; width:42px; height:27px; z-index:57"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="empty" bgcolor='gray' bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>57</font></td></tr></table></div>
		<div id="Layer58" style="position:absolute; left:56px; top:277px; width:42px; height:27px; z-index:58"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>58</font></td></tr></table></div>
		<div id="Layer59" style="position:absolute; left:56px; top:329px; width:42px; height:27px; z-index:59"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>59</font></td></tr></table></div>
		<div id="Layer60" style="position:absolute; left:97px; top:329px; width:42px; height:27px; z-index:60"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>60</font></td></tr></table></div>
		<div id="Layer61" style="position:absolute; left:139px; top:329px; width:42px; height:27px; z-index:61"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>61</font></td></tr></table></div>
		<div id="Layer62" style="position:absolute; left:182px; top:329px; width:42px; height:27px; z-index:62"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="empty" bgcolor='gray' bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>62</font></td></tr></table></div>
		<div id="Layer63" style="position:absolute; left:224px; top:329px; width:42px; height:27px; z-index:63"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="empty" bgcolor='gray' bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>63</font></td></tr></table></div>
		<div id="Layer64" style="position:absolute; left:266px; top:329px; width:42px; height:27px; z-index:64"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="empty" bgcolor='gray' bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>64</font></td></tr></table></div>
		<div id="Layer65" style="position:absolute; left:365px; top:329px; width:42px; height:27px; z-index:65"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>65</font></td></tr></table></div>
		<div id="Layer66" style="position:absolute; left:406px; top:329px; width:42px; height:27px; z-index:66"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="empty" bgcolor='gray' bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>66</font></td></tr></table></div>
		<div id="Layer67" style="position:absolute; left:448px; top:329px; width:42px; height:27px; z-index:67"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>67</font></td></tr></table></div>
		<div id="Layer68" style="position:absolute; left:490px; top:329px; width:42px; height:27px; z-index:68"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="empty" bgcolor='gray' bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>68</font></td></tr></table></div>
		<div id="Layer69" style="position:absolute; left:533px; top:329px; width:42px; height:27px; z-index:69"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>69</font></td></tr></table></div>
		<div id="Layer70" style="position:absolute; left:575px; top:329px; width:42px; height:27px; z-index:70"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>70</font></td></tr></table></div>
		<div id="Layer71" style="position:absolute; left:575px; top:356px; width:42px; height:27px; z-index:71"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>71</font></td></tr></table></div>
		<div id="Layer72" style="position:absolute; left:533px; top:356px; width:42px; height:27px; z-index:72"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>72</font></td></tr></table></div>
		<div id="Layer73" style="position:absolute; left:490px; top:356px; width:42px; height:27px; z-index:73"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>73</font></td></tr></table></div>
		<div id="Layer74" style="position:absolute; left:448px; top:356px; width:42px; height:27px; z-index:74"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>74</font></td></tr></table></div>
		<div id="Layer75" style="position:absolute; left:407px; top:356px; width:42px; height:27px; z-index:75"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>75</font></td></tr></table></div>
		<div id="Layer76" style="position:absolute; left:365px; top:356px; width:42px; height:27px; z-index:76"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>76</font></td></tr></table></div>
		<div id="Layer77" style="position:absolute; left:266px; top:356px; width:42px; height:27px; z-index:77"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>77</font></td></tr></table></div>
		<div id="Layer78" style="position:absolute; left:224px; top:356px; width:42px; height:27px; z-index:78"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>78</font></td></tr></table></div>
		<div id="Layer79" style="position:absolute; left:182px; top:356px; width:42px; height:27px; z-index:79"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>79</font></td></tr></table></div>
		<div id="Layer80" style="position:absolute; left:139px; top:356px; width:42px; height:27px; z-index:80"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>80</font></td></tr></table></div>
		<div id="Layer81" style="position:absolute; left:98px; top:356px; width:42px; height:27px; z-index:81"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>81</font></td></tr></table></div>
		<div id="Layer82" style="position:absolute; left:56px; top:356px; width:42px; height:27px; z-index:82"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>82</font></td></tr></table></div>
		<div id="Layer83" style="position:absolute; left:56px; top:409px; width:42px; height:27px; z-index:83"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>83</font></td></tr></table></div>
		<div id="Layer84" style="position:absolute; left:97px; top:409px; width:42px; height:27px; z-index:84"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="empty" bgcolor='gray' bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>84</font></td></tr></table></div>
		<div id="Layer85" style="position:absolute; left:139px; top:409px; width:42px; height:27px; z-index:85"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>85</font></td></tr></table></div>
		<div id="Layer86" style="position:absolute; left:182px; top:409px; width:42px; height:27px; z-index:86"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="empty" bgcolor='gray' bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>86</font></td></tr></table></div>
		<div id="Layer87" style="position:absolute; left:224px; top:409px; width:42px; height:27px; z-index:87"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="empty" bgcolor='gray' bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>87</font></td></tr></table></div>
		<div id="Layer88" style="position:absolute; left:266px; top:409px; width:42px; height:27px; z-index:88"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>88</font></td></tr></table></div>
		<div id="Layer89" style="position:absolute; left:266px; top:436px; width:42px; height:27px; z-index:89"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>89</font></td></tr></table></div>
		<div id="Layer90" style="position:absolute; left:224px; top:436px; width:42px; height:27px; z-index:90"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>90</font></td></tr></table></div>
		<div id="Layer91" style="position:absolute; left:182px; top:436px; width:42px; height:27px; z-index:91"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>91</font></td></tr></table></div>
		<div id="Layer92" style="position:absolute; left:139px; top:436px; width:42px; height:27px; z-index:92"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="empty" bgcolor='gray' bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>92</font></td></tr></table></div>
		<div id="Layer93" style="position:absolute; left:98px; top:436px; width:42px; height:27px; z-index:93"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>93</font></td></tr></table></div>
		<div id="Layer94" style="position:absolute; left:56px; top:436px; width:42px; height:27px; z-index:94"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>94</font></td></tr></table></div>
		<div id="Layer95" style="position:absolute; left:56px; top:488px; width:42px; height:27px; z-index:95"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>95</font></td></tr></table></div>
		<div id="Layer96" style="position:absolute; left:97px; top:488px; width:42px; height:27px; z-index:96"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>96</font></td></tr></table></div>
		<div id="Layer97" style="position:absolute; left:139px; top:488px; width:42px; height:27px; z-index:97"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>97</font></td></tr></table></div>
		<div id="Layer98" style="position:absolute; left:182px; top:488px; width:42px; height:27px; z-index:98"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>98</font></td></tr></table></div>
		<div id="Layer99" style="position:absolute; left:224px; top:488px; width:42px; height:27px; z-index:99"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>99</font></td></tr></table></div>
		<div id="Layer100" style="position:absolute; left:266px; top:488px; width:42px; height:27px; z-index:100"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>100</font></td></tr></table></div>
		<div id="Layer101" style="position:absolute; left:266px; top:515px; width:42px; height:27px; z-index:101"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>101</font></td></tr></table></div>
		<div id="Layer102" style="position:absolute; left:224px; top:515px; width:42px; height:27px; z-index:102"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="empty" bgcolor='gray' bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>102</font></td></tr></table></div>
		<div id="Layer103" style="position:absolute; left:182px; top:515px; width:42px; height:27px; z-index:103"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>103</font></td></tr></table></div>
		<div id="Layer104" style="position:absolute; left:139px; top:515px; width:42px; height:27px; z-index:104"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="empty" bgcolor='gray' bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>104</font></td></tr></table></div>
		<div id="Layer105" style="position:absolute; left:98px; top:515px; width:42px; height:27px; z-index:105"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="empty" bgcolor='gray' bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>105</font></td></tr></table></div>
		<div id="Layer106" style="position:absolute; left:56px; top:515px; width:42px; height:27px; z-index:106"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>106</font></td></tr></table></div>
		<div id="Layer107" style="position:absolute; left:365px; top:409px; width:42px; height:27px; z-index:107"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>107</font></td></tr></table></div>
		<div id="Layer108" style="position:absolute; left:365px; top:436px; width:42px; height:27px; z-index:108"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>108</font></td></tr></table></div>
		<div id="Layer109" style="position:absolute; left:365px; top:463px; width:42px; height:27px; z-index:109"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>109</font></td></tr></table></div>
		<div id="Layer110" style="position:absolute; left:365px; top:490px; width:42px; height:27px; z-index:110"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>110</font></td></tr></table></div>
		<div id="Layer111" style="position:absolute; left:365px; top:517px; width:42px; height:27px; z-index:111"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>111</font></td></tr></table></div>
		<div id="Layer112" style="position:absolute; left:407px; top:517px; width:42px; height:27px; z-index:112"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>112</font></td></tr></table></div>
		<div id="Layer113" style="position:absolute; left:407px; top:490px; width:42px; height:27px; z-index:113"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="empty" bgcolor='gray' bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>113</font></td></tr></table></div>
		<div id="Layer114" style="position:absolute; left:407px; top:463px; width:42px; height:27px; z-index:114"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="empty" bgcolor='gray' bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>114</font></td></tr></table></div>
		<div id="Layer115" style="position:absolute; left:407px; top:436px; width:42px; height:27px; z-index:115"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>115</font></td></tr></table></div>
		<div id="Layer116" style="position:absolute; left:407px; top:409px; width:42px; height:27px; z-index:116"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>116</font></td></tr></table></div>
		<div id="Layer117" style="position:absolute; left:493px; top:409px; width:42px; height:27px; z-index:117"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="empty" bgcolor='gray' bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>117</font></td></tr></table></div>
		<div id="Layer118" style="position:absolute; left:493px; top:436px; width:42px; height:27px; z-index:118"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>118</font></td></tr></table></div>
		<div id="Layer119" style="position:absolute; left:493px; top:463px; width:42px; height:27px; z-index:119"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="empty" bgcolor='gray' bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>119</font></td></tr></table></div>
		<div id="Layer120" style="position:absolute; left:493px; top:490px; width:42px; height:27px; z-index:120"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>120</font></td></tr></table></div>
		<div id="Layer121" style="position:absolute; left:535px; top:490px; width:42px; height:27px; z-index:121"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>121</font></td></tr></table></div>
		<div id="Layer122" style="position:absolute; left:535px; top:463px; width:42px; height:27px; z-index:122"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>122</font></td></tr></table></div>
		<div id="Layer123" style="position:absolute; left:535px; top:436px; width:42px; height:27px; z-index:123"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="empty" bgcolor='gray' bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>123</font></td></tr></table></div>
		<div id="Layer124" style="position:absolute; left:535px; top:409px; width:42px; height:27px; z-index:124"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>124</font></td></tr></table></div>
		<div id="Layer125" style="position:absolute; left:790px; top:341px; width:42px; height:27px; z-index:125"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>125</font></td></tr></table></div>
		<div id="Layer126" style="position:absolute; left:833px; top:341px; width:42px; height:27px; z-index:126"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>126</font></td></tr></table></div>
		<div id="Layer127" style="position:absolute; left:833px; top:314px; width:42px; height:27px; z-index:127"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>127</font></td></tr></table></div>
		<div id="Layer128" style="position:absolute; left:790px; top:314px; width:42px; height:27px; z-index:128"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>128</font></td></tr></table></div>
		<div id="Layer129" style="position:absolute; left:714px; top:261px; width:43px; height:27px; z-index:129"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>129</font></td></tr></table></div>
		<div id="Layer130" style="position:absolute; left:756px; top:261px; width:42px; height:27px; z-index:130"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>130</font></td></tr></table></div>
		<div id="Layer131" style="position:absolute; left:798px; top:261px; width:42px; height:27px; z-index:131"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="empty" bgcolor='gray' bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>131</font></td></tr></table></div>
		<div id="Layer132" style="position:absolute; left:841px; top:261px; width:42px; height:27px; z-index:132"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>132</font></td></tr></table></div>
		<div id="Layer133" style="position:absolute; left:841px; top:234px; width:42px; height:27px; z-index:133"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="empty" bgcolor='gray' bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>133</font></td></tr></table></div>
		<div id="Layer134" style="position:absolute; left:798px; top:234px; width:42px; height:27px; z-index:134"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>134</font></td></tr></table></div>
		<div id="Layer135" style="position:absolute; left:756px; top:234px; width:42px; height:27px; z-index:135"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>135</font></td></tr></table></div>
		<div id="Layer136" style="position:absolute; left:714px; top:234px; width:42px; height:27px; z-index:136"><table width=96% height=96% border='0' cellpadding='0' cellspacing='0'><tr><td class="use" bgcolor='orange' align='center' valign='middle'><font style='color:white;font-size:10pt;font-weight:900;'>136</font></td></tr></table></div>

<table width="1010" height="585" border="0" cellspacing="0" cellpadding="0" >
 <tr style="background-image: url('MAP/2-back.jpg');" >
     
    <td width="800" height="462"></td>
 </tr>
</table>
</div>
        <!-- 요기에 넣어!!!!!-->
        
        
      
      
      
      
            
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
