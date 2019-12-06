<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
            <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
          <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script type="text/javascript">
        	$(function(){
    
          		var cust_no = -1;
        		var provider_no = -1;
        		var role = $("#role").val();
        		
        		if(role == 'provider') {
        			provider_no = $("#no").val();
        		}else {
        			cust_no = $("#no").val();
        		}
        		var no = $("#no").val();
        		
        		
        		$("#cafeListBtn").click(function(){
        			location.href="cafeList1.do";
        			
        		})
      
        		$("#slide-1706-layer-3").click(function(){
        			location.href="intro";
        		})
        		
        		$("#SNS").click(function(){
        			
        			
        			location.href="snsMyPageView.do?cust_no="+cust_no+"&provider_no="+provider_no;
        		})
        	})
        
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
                    <img class='logo logo-dark' style="top:-25px;" src="images/logo.png"  alt="">
                    <img class='logo logo-light hidden-md-down' style="top:-20px;" style="top: -20px;" src="images/logo.png" alt="">
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
                        	<a id="SNS" class="nav-link" aria-haspopup="true" aria-expanded="false" href="#" >SNS</a>
                        </c:if>
                        <c:if test="${empty loginVo }">
                        	<a class="nav-link" aria-haspopup="true" aria-expanded="false" href="login" >SNS</a>
                        </c:if>
                            
                     
                        </li>
                        <li class="nav-item dropdown">
                         <a class="nav-link  dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">고객지원</a>
                            <ul class="dropdown-menu">
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
                                <li class="nav-item dropdown user-dropdown align-items-center">
                                    <a class="nav-link" href="#" id="dropdown-user" role="button"
                                       data-toggle="dropdown">
                                <span class="user-states states-online">
                                    <img src="cust_img/${loginVo.cust_img }" width="35px!important" height="35px!important" alt="" class="rounded-circle">
                                </span>
                                        <span class="ml-2 h-lg-down dropdown-toggle">
                                                ${loginVo.nick_name}
                                        </span>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdown-user">
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
                                        <a class="dropdown-item" onclick="logout()" id="logout" href="logout"><i class="icon-Power"></i>
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

        <div id="rev_slider_1078_1_wrapper" class="rev_slider_wrapper fullwidthbanner-container" data-alias="classic4export" data-source="gallery" style="margin:0px auto;background-color:transparent;padding:0px;margin-top:0px;margin-bottom:0px;">
            <!-- START REVOLUTION SLIDER 5.4.1 auto mode -->
            <div id="rev_slider_1078_1" class="rev_slider fullwidthabanner" style="display:none;" data-version="5.4.1">
                <ul>	
                    <!-- SLIDE  -->
                    <li data-index="rs-3045" data-transition="parallaxtoleft" data-slotamount="default" data-hideafterloop="0" data-hideslideonmobile="off"  data-easein="Power4.easeInOut" data-easeout="Power4.easeInOut" data-masterspeed="2000" data-rotate="0"  data-fstransition="fade" data-fsmasterspeed="1500" data-fsslotamount="7" data-saveperformance="off"  data-title="Intro" data-param1="" data-param2="" data-param3="" data-param4="" data-param5="" data-param6="" data-param7="" data-param8="" data-param9="" data-param10="" data-description="">
                        <!-- MAIN IMAGE -->
                        <img src="images/bg1.jpg"  alt=""  data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="10" class="rev-slidebg" data-no-retina>
                        <!-- LAYERS -->
                        <!-- LAYER NR. 1 -->
                        <div class="tp-caption mainSlide-Subtitle   tp-resizeme" 
                             id="slide-1706-layer-1" 
                             data-x="['left','left','left','left']" data-hoffset="['30','15','15','15']" 
                             data-y="['middle','middle','middle','middle']" data-voffset="['-102','-102','-92','-68']" 
                             data-width="none"
                             data-height="none"
                             data-whitespace="nowrap"
                             data-fontsize="['20','20','20','20']"
                             data-lineheight="['25','25','25','25']"
                             data-type="text" 
                             data-responsive_offset="on"
                             data-frames='[{"delay":800,"speed":1500,"frame":"0","from":"y:50px;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"Power3.easeInOut"}]'
                             data-textAlign="['left','left','left','left']"
                             data-paddingtop="[0,0,0,0]"
                             data-paddingright="[0,0,0,0]"
                             data-paddingbottom="[0,0,0,0]"
                             data-paddingleft="[0,0,0,0]"

                             style="z-index: 7; white-space: nowrap;text-transform:left;">We go Together like Studer</div>
                        <!-- LAYER NR. 1 -->
                        <div class="tp-caption mainSlide-Title-Centered   tp-resizeme" 
                             id="slide-1706-layer-2" 
                             data-x="['left','left','left','left']" data-hoffset="['30','15','15','15']" 
                             data-y="['middle','middle','middle','middle']" data-voffset="['0','0','0','1']" 
                             data-fontsize="['55','55','40','30']"
                             data-lineheight="['65','65','55','35']"
                             data-width="['800','700','621','420']"
                             data-height="none"
                             data-whitespace="normal"

                             data-type="text" 
                             data-responsive_offset="on" 
                             data-frames='[{"delay":1400,"speed":1500,"frame":"0","from":"y:50px;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"Power3.easeInOut"}]'
                             data-textAlign="['left','left','left','left']"
                             data-paddingtop="[0,0,0,0]"
                             data-paddingright="[0,0,0,0]"
                             data-paddingbottom="[10,10,10,10]"
                             data-paddingleft="[0,0,0,0]"
                             style="z-index: 6; text-align:left; max-width:1170px; white-space: normal;">공부가 영어로 뭐지?<br>
                         STUDER P<font style="color: #F4923D">!</font>CK</div>
                        <!-- LAYER NR. 3 -->
                        <div class="tp-caption mainSlide-Button btn btn-lg btn-white-outline " 
                             id="slide-1706-layer-3" 
                             data-x="['left','left','left','left']" data-hoffset="['30','15','15','15']" 
                             data-y="['middle','middle','middle','middle']" data-voffset="['112','112','112','96']" 
                             data-width="none"
                             data-height="none"
                             data-whitespace="nowrap"
                             data-type="button" 
                             data-actions='[{"event":"click","action":"intro.do","offset":"px","delay":"","location":"intro"}]'
                             data-responsive_offset="on" 
                             data-responsive="off"
                             data-frames='[{"delay":2000,"speed":1500,"frame":"0","from":"y:50px;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"Power3.easeInOut"}]'
                             data-textAlign="['left','left','left','left']"
                             data-paddingtop="[12,12,12,12]"
                             data-paddingright="[35,35,35,35]"
                             data-paddingbottom="[12,12,12,12]"
                             data-paddingleft="[35,35,35,35]"

                             style="z-index: 8; white-space: nowrap;outline:none;box-shadow:none;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;cursor:pointer;"> STUDER P<font style="color: #F4923D">!</font>CK 소개 </div>
                    </li>
                    <!-- SLIDE  -->
                    <li data-index="rs-3046" data-transition="parallaxtoleft" data-slotamount="default" data-hideafterloop="0" data-hideslideonmobile="off"  data-easein="Power4.easeInOut" data-easeout="Power4.easeInOut" data-masterspeed="2000" data-rotate="0"  data-fstransition="fade" data-fsmasterspeed="1500" data-fsslotamount="7" data-saveperformance="off"  data-title="Intro" data-param1="" data-param2="" data-param3="" data-param4="" data-param5="" data-param6="" data-param7="" data-param8="" data-param9="" data-param10="" data-description="">
                        <!-- MAIN IMAGE -->
                        <img src="images/bg2.png"  alt=""  data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="10" class="rev-slidebg" data-no-retina>
                        <!-- LAYERS -->

                        <!-- LAYER NR. 1 -->
                        <div class="tp-caption mainSlide-Title-Centered   tp-resizeme" 
                             id="slide-1706-layer-4" 
                             data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']" 
                             data-y="['middle','middle','middle','middle']" data-voffset="['0','0','0','1']" 
                             data-fontsize="['55','55','40','30']"
                             data-lineheight="['65','65','50','35']"
                             data-width="['900','800','621','420']"
                             data-height="none"
                             data-whitespace="normal"

                             data-type="text" 
                             data-responsive_offset="on" 
                             data-frames='[{"delay":1000,"speed":1500,"frame":"0","from":"y:50px;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"Power3.easeInOut"}]'
                             data-textAlign="['center','center','center','center']"
                             data-paddingtop="[0,0,0,0]"
                             data-paddingright="[0,0,0,0]"
                             data-paddingbottom="[10,10,10,10]"
                             data-paddingleft="[0,0,0,0]"

                             style="z-index: 6; text-align:center; white-space: normal;">스터디 카페가 영어로 뭐지? <br> STUDER P<font style="color: #F4923D">!</font>CK </div>
                        <!-- LAYER NR. 3 -->
                        <div class="tp-caption mainSlide-caption   tp-resizeme" 
                             id="slide-1706-layer-5" 
                             data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']" 
                             data-y="['middle','middle','middle','middle']" data-voffset="['80','80','80','50']" 
                             data-fontsize="['24','24','24','16']"
                             data-lineheight="['34','34','34','26']"
                             data-width="['800','700','621','420']"
                             data-height="none"
                             data-whitespace="normal"
                             data-type="text" 
                             data-responsive_offset="on" 
                             data-frames='[{"delay":1400,"speed":1500,"frame":"0","from":"y:50px;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"Power3.easeInOut"}]'
                             data-textAlign="['center','center','center','center']"
                             data-paddingtop="[0,0,0,0]"
                             data-paddingright="[0,0,0,0]"
                             data-paddingbottom="[10,10,10,10]"
                             data-paddingleft="[0,0,0,0]"
                             style="z-index: 6; text-align:left; max-width:1170px; white-space: normal;"></div>
                    </li>
                    <!-- SLIDE  -->
                    <li data-index="rs-3047" data-transition="parallaxtoright" data-slotamount="default" data-hideafterloop="0" data-hideslideonmobile="off"  data-easein="Power4.easeInOut" data-easeout="Power4.easeInOut" data-masterspeed="2000" data-rotate="0"  data-saveperformance="off"  data-title="HTML5 Video" data-param1="" data-param2="" data-param3="" data-param4="" data-param5="" data-param6="" data-param7="" data-param8="" data-param9="" data-param10="" data-description="">
                        <!-- MAIN IMAGE -->
                        <img src="images/video/Busy-People.jpg"  alt=""  data-bgposition="center center" data-bgfit="cover" data-bgparallax="10" class="rev-slidebg" data-no-retina>
                        <!-- LAYERS -->

                        <!-- BACKGROUND VIDEO LAYER -->
                        <div class="rs-background-video-layer" 
                             data-forcerewind="on" 
                             data-volume="mute" 
                             data-videowidth="100%" 
                             data-videoheight="100%" 
                             data-videomp4="images/video/Busy-People.mp4" 
                             data-videopreload="auto" 
                             data-videoloop="none" 
                             data-forceCover="1" 
                             data-aspectratio="16:9" 
                             data-autoplay="true" 
                             data-autoplayonlyfirsttime="false" 
                             data-nextslideatend="true" 
                             ></div>
                        <!-- LAYER NR. 1 -->
                        <div class="tp-caption mainSlide-Title-Centered   tp-resizeme" 
                             id="slide-1706-layer-8" 
                             data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']" 
                             data-y="['middle','middle','middle','middle']" data-voffset="['0','0','0','1']" 
                             data-fontsize="['55','55','40','30']"
                             data-lineheight="['65','65','50','35']"
                             data-width="['900','800','621','420']"
                             data-height="none"
                             data-whitespace="normal"

                             data-type="text" 
                             data-responsive_offset="on" 
                             data-frames='[{"delay":1000,"speed":1500,"frame":"0","from":"y:50px;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"Power3.easeInOut"}]'
                             data-textAlign="['center','center','center','center']"
                             data-paddingtop="[0,0,0,0]"
                             data-paddingright="[0,0,0,0]"
                             data-paddingbottom="[10,10,10,10]"
                             data-paddingleft="[0,0,0,0]"

                             style="z-index: 6; text-align:center; white-space: normal;">모임이 영어로 뭐지?<br>STUDER P<font style="color: #F4923D">!</font>CK</div>
                        <!-- LAYER NR. 3 -->
                        <div class="tp-caption mainSlide-caption   tp-resizeme" 
                             id="slide-1706-layer-9" 
                             data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']" 
                             data-y="['middle','middle','middle','middle']" data-voffset="['80','80','80','50']" 
                             data-fontsize="['24','24','24','16']"
                             data-lineheight="['34','34','34','26']"
                             data-width="['800','700','621','420']"
                             data-height="none"
                             data-whitespace="normal"
                             data-type="text" 
                             data-responsive_offset="on" 
                             data-frames='[{"delay":1400,"speed":1500,"frame":"0","from":"y:50px;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"Power3.easeInOut"}]'
                             data-textAlign="['center','center','center','center']"
                             data-paddingtop="[0,0,0,0]"
                             data-paddingright="[0,0,0,0]"
                             data-paddingbottom="[10,10,10,10]"
                             data-paddingleft="[0,0,0,0]"
                             style="z-index: 6; text-align:left; max-width:1170px; white-space: normal;"></div>
                    </li>
                </ul>
                <div class="tp-bannertimer" style="height: 7px; background-color: rgba(255, 255, 255, 0.25);"></div>	</div>
        </div><!-- END REVOLUTION SLIDER -->
        <div class="container pt90">

            <div class="row pb60">
                <div class="col-lg-4 mb30 wow zoomInUp" data-wow-delay="100ms" data-wow-duration=".4s">
                    <div class="icon-box icon-box-center" >
                        <i id="cafeListBtn"class="icon-hover-1 bg-primary icon-calendar icon-hover-default"></i><br><br>
                        <h3>손 쉬운 카페 예약 시스템</h3>
                        <p>
                           전국에 있는 모든 스터디 카페를<br>
                            StuderPick 에서 예약 하세요 </p>
                    </div>
                </div><!--/col-->
                <div class="col-lg-4 mb30 wow zoomInDown" data-wow-delay="200ms" data-wow-duration=".6s">
                    <div class="icon-box icon-box-center">
                        <i class="icon-hover-1 bg-primary icon-profile-male icon-hover-default"></i><br><br>
                        <h3>간편한 모임 찾기</h3>
                        <p>
                            혼자서는 다루기 어려운 주제가 있다면<br>
                            마음이 맞는 사람들과 모임을 시작해보세요
                            
                        </p>
                    </div>
                </div><!--/col-->
                <div class="col-lg-4 mb30 wow zoomInRight" data-wow-delay="300ms" data-wow-duration=".8s">
                    <div class="icon-box icon-box-center">
                        <i class="icon-hover-1 bg-primary icon-chat icon-hover-default"></i><br><br>
                        <h3>SNS</h3>
                        <p>
                            Pickers Life와 함께<br>
                            나의 일상을 공유하고 다른 피커들과 소통해보세요
                        </p>
                    </div>
                </div><!--/col-->
            </div>

        </div><!--/intro-->

        <div class="bg-faded">
       <!--     <div class="container pt90">
                <div class="title-heading1 mb40">
                    <h3 style="color: yellow; font-size: 40px" >▼</h3><br>
                    
                </div>           
            </div>-->
            <!--            <div id="js-filters-mosaic-flat" class="cbp-l-filters-buttonCenter">
                            <div data-filter="*" class="cbp-filter-item-active cbp-filter-item">
                                All <div class="cbp-filter-counter"></div>
                            </div>
                            <div data-filter=".print" class="cbp-filter-item">
                                Print <div class="cbp-filter-counter"></div>
                            </div>
                            <div data-filter=".web-design" class="cbp-filter-item">
                                Web Design <div class="cbp-filter-counter"></div>
                            </div>
                            <div data-filter=".graphic" class="cbp-filter-item">
                                Graphic <div class="cbp-filter-counter"></div>
                            </div>
                            <div data-filter=".motion" class="cbp-filter-item">
                                Motion <div class="cbp-filter-counter"></div>
                            </div>
                        </div>-->

            <div id="js-grid-mosaic-flat" class="cbp cbp-l-grid-mosaic-flat">
     <!--           <div class="cbp-item web-design graphic">
                    <a href="images/masonry/sm1.jpg" class="cbp-caption cbp-lightbox" data-title="Bolt UI<br>by Tiberiu Neamu">
                        <div class="cbp-caption-defaultWrap">
                            <img src="images/masonry/sm1.jpg" alt="">
                        </div>
                        <div class="cbp-caption-activeWrap">
                            <div class="cbp-l-caption-alignCenter">
                                <div class="cbp-l-caption-body">
                                    <div class="cbp-l-caption-title">Project title</div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>-->
                <div class="cbp-item print motion">
           <!--         <a href="images/masonry/sm2.jpg" class="cbp-caption cbp-lightbox" data-title="World Clock<br>by Paul Flavius Nechita">
                        <div class="cbp-caption-defaultWrap">
                            <img src="images/masonry/sm2.jpg" alt="">
                        </div>
                        <div class="cbp-caption-activeWrap">
                            <div class="cbp-l-caption-alignCenter">
                                <div class="cbp-l-caption-body">
                                    <div class="cbp-l-caption-title">World Clock</div>
                                </div>
                            </div>
                        </div>
                    </a>-->
                </div>
  <!--              <div class="cbp-item print motion">
                    <a href="images/masonry/lgv1.jpg" class="cbp-caption cbp-lightbox" data-title="WhereTO App<br>by Tiberiu Neamu">
                        <div class="cbp-caption-defaultWrap">
                            <img src="images/masonry/lgv1.jpg" alt="">
                        </div>
                        <div class="cbp-caption-activeWrap">
                            <div class="cbp-l-caption-alignCenter">
                                <div class="cbp-l-caption-body">
                                    <div class="cbp-l-caption-title">WhereTO App</div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>-->
<!--                <div class="cbp-item motion graphic">
                    <a href="images/masonry/lgh1.jpg" class="cbp-caption cbp-lightbox" data-title="Seemple* Music<br>by Tiberiu Neamu">
                        <div class="cbp-caption-defaultWrap">
                            <img src="images/masonry/lgh1.jpg" alt="">
                        </div>
                        <div class="cbp-caption-activeWrap">
                            <div class="cbp-l-caption-alignCenter">
                                <div class="cbp-l-caption-body">
                                    <div class="cbp-l-caption-title">Seemple* Music</div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>-->
                <div class="cbp-item print motion">
                    <a href="cafeList1.do" class="cbp-caption" data-title="Remind~Me Widget<br>by Tiberiu Neamu">
                        <div class="cbp-caption-defaultWrap">
                            <img src="images/masonry/study.jpg" alt="">
                        </div>
                        <div class="cbp-caption-activeWrap">
                            <div class="cbp-l-caption-alignCenter">
                                <div class="cbp-l-caption-body">
                                    <div style="font-size:40px; font-weight: bold; color: white">STUDY CAFE 스터디 카페</div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="cbp-item web-design print">
                    <a href="listStd.do" class="cbp-caption" data-title="iDevices<br>by Tiberiu Neamu">
                        <div class="cbp-caption-defaultWrap">
                            <img src="images/masonry/meet.jpg" alt="">
                        </div>
                        <div class="cbp-caption-activeWrap">
                            <div class="cbp-l-caption-alignCenter">
                                <div class="cbp-l-caption-body">
                                     <div style="font-size:40px; font-weight: bold; color: white">STUDER 모임찾기</div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
        

            </div>
        </div><!--portfolio-->
  
        <div data-jarallax='{"speed": 0.2}' style='background-color: #444444'>
            <div class="container pt60 pb60">
                <div class="row">
                    <div class="col-lg-8">
                        <h3 class="text-white" style="text-align: right">
                            None of us is smarter than all of us combined.  <br>
                            -Ken H Blanchard
                        </h3>
                    </div>
                    <!--<div class="col-lg-4 pt0">
                        <a href="#" class="btn btn-lg btn-white-outline">
                            View All Work
                        </a>
                    </div>-->
                </div>
            </div>
        </div><!--cta-->

     
           
           <input id="role" type="hidden" value="${loginVo.role }">
           <input id="no" type="hidden" value="${loginVo.no }">
           


       <div style="background-color: #444444">
            <div class="container" >
                <div class="row">
                    <div class="col-md-6 col-lg-3 text-center mb40">

                        <h1 class="counter text-white" data-from="0" data-to="10100"
                            data-speed="5000" data-refresh-interval="50"></h1>
                        <p class="lead text-white-gray">등록된 스터디카페</p>
                    </div>
                    <div class="col-md-6 col-lg-3 text-center mb40">
                        <h1 class="counter text-white" data-from="0" data-to="24"
                            data-speed="5000" data-refresh-interval="50"></h1>
                        <p class="lead text-white-gray">이용중인 사업자</p>
                    </div>
                    <div class="col-md-6 col-lg-3 text-center mb40">
                        <h1 class="counter text-white" data-from="0" data-to="14500"
                            data-speed="5000" data-refresh-interval="50"></h1>
                        <p class="lead text-white-gray">등록된 스투더</p>
                    </div>
                    <div class="col-md-6 col-lg-3 text-center mb40">
                        <h1 class="counter text-white" data-from="0" data-to="13234"
                            data-speed="5000" data-refresh-interval="50"></h1>
                        <p class="lead text-white-gray">이용중인 피커</p>
                    </div>
                </div>
            </div>
        </div>


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
        <div class="footer-bottomAlt">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7">
                        <div class="clearfix">
                            <a href="#" class="social-icon-sm si-dark si-facebook si-dark-round">
                                <i class="fa fa-facebook"></i>
                                <i class="fa fa-facebook"></i>
                            </a>
                            <a href="#" class="social-icon-sm si-dark si-twitter si-dark-round">
                                <i class="fa fa-twitter"></i>
                                <i class="fa fa-twitter"></i>
                            </a>
                            <a href="#" class="social-icon-sm si-dark si-g-plus si-dark-round">
                                <i class="fa fa-google-plus"></i>
                                <i class="fa fa-google-plus"></i>
                            </a>
                            <a href="#" class="social-icon-sm si-dark si-skype si-dark-round">
                                <i class="fa fa-skype"></i>
                                <i class="fa fa-skype"></i>
                            </a>
                            <a href="#" class="social-icon-sm si-dark si-linkedin si-dark-round">
                                <i class="fa fa-linkedin"></i>
                                <i class="fa fa-linkedin"></i>
                            </a>  
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <span>&copy; Copyright 2018. All Right Reserved</span>
                    </div>
                </div>
            </div>
        </div><!--/footer bottom-->
        <!--back to top-->
        <a href="#" class="back-to-top hidden-xs-down" id="back-to-top"><i class="ti-angle-up"></i></a>
        <!-- jQuery first, then Tether, then Bootstrap JS. -->
        <script type="text/javascript" src="js/plugins/plugins.js"></script> 
        <script type="text/javascript" src="js/assan.custom.js"></script> 
        <!-- load cubeportfolio -->
        <script type="text/javascript" src="cubeportfolio/js/jquery.cubeportfolio.min.js"></script>
        <!-- REVOLUTION JS FILES -->
        <script type="text/javascript" src="revolution/js/jquery.themepunch.tools.min.js"></script>
        <script type="text/javascript" src="revolution/js/jquery.themepunch.revolution.min.js"></script>
        <!-- SLIDER REVOLUTION 5.0 EXTENSIONS  (Load Extensions only on Local File Systems !  The following part can be removed on Server for On Demand Loading) -->	
        <script type="text/javascript" src="revolution/js/extensions/revolution.extension.actions.min.js"></script>
        <script type="text/javascript" src="revolution/js/extensions/revolution.extension.carousel.min.js"></script>
        <script type="text/javascript" src="revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
        <script type="text/javascript" src="revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
        <script type="text/javascript" src="revolution/js/extensions/revolution.extension.migration.min.js"></script>
        <script type="text/javascript" src="revolution/js/extensions/revolution.extension.navigation.min.js"></script>
        <script type="text/javascript" src="revolution/js/extensions/revolution.extension.parallax.min.js"></script>
        <script type="text/javascript" src="revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
        <script type="text/javascript" src="revolution/js/extensions/revolution.extension.video.min.js"></script>
        <script>
            /**Hero  script**/
            var tpj = jQuery;

            var revapi1078;
            tpj(document).ready(function () {
                if (tpj("#rev_slider_1078_1").revolution == undefined) {
                    revslider_showDoubleJqueryError("#rev_slider_1078_1");
                } else {
                    revapi1078 = tpj("#rev_slider_1078_1").show().revolution({
                        sliderType: "standard",
                        jsFileLocation: "revolution/js/",
                        sliderLayout: "auto",
                        dottedOverlay: "none",
                        delay: 8000,
                        navigation: {
                            arrows: {
                                enable: true,
                                style: 'uranus',
                                tmp: '',
                                rtl: false,
                                hide_onleave: false,
                                hide_onmobile: true,
                                hide_under: 600,
                                hide_over: 9999,
                                hide_delay: 200,
                                hide_delay_mobile: 1200,
                                left: {
                                    container: 'slider',
                                    h_align: 'left',
                                    v_align: 'center',
                                    h_offset: 0,
                                    v_offset: 0
                                },
                                right: {
                                    container: 'slider',
                                    h_align: 'right',
                                    v_align: 'center',
                                    h_offset: 0,
                                    v_offset: 0
                                }
                            }
                        },
                        viewPort: {
                            enable: true,
                            outof: "pause",
                            visible_area: "80%",
                            presize: false
                        },
                        responsiveLevels: [1240, 1024, 778, 480],
                        visibilityLevels: [1240, 1024, 778, 480],
                        gridwidth: [1140, 992, 700, 465],
                        gridheight: [600, 600, 500, 480],
                        lazyType: "none",
                        parallax: {
                            type: "mouse",
                            origo: "slidercenter",
                            speed: 2000,
                            levels: [2, 3, 4, 5, 6, 7, 12, 16, 10, 50, 46, 47, 48, 49, 50, 55]
                        },
                        shadow: 0,
                        spinner: "off",
                        stopLoop: "off",
                        stopAfterLoops: -1,
                        stopAtSlide: -1,
                        shuffle: "off",
                        autoHeight: "off",
                        hideThumbsOnMobile: "off",
                        hideSliderAtLimit: 0,
                        hideCaptionAtLimit: 0,
                        hideAllCaptionAtLilmit: 0,
                        debugMode: false,
                        fallbacks: {
                            simplifyAll: "off",
                            nextSlideOnWindowFocus: "off",
                            disableFocusListener: false
                        }
                    });
                }
            });	/*ready*/
            //cube portfolio init
            (function ($, window, document, undefined) {
                'use strict';

                // init cubeportfolio
                $('#js-grid-mosaic-flat').cubeportfolio({
                    filters: '#js-filters-mosaic-flat',
                    layoutMode: 'mosaic',
                    sortToPreventGaps: true,
                    mediaQueries: [{
                            width: 1500,
                            cols: 6
                        }, {
                            width: 1100,
                            cols: 4
                        }, {
                            width: 800,
                            cols: 3
                        }, {
                            width: 480,
                            cols: 2,
                            options: {
                                caption: '',
                                gapHorizontal: 15,
                                gapVertical: 15
                            }
                        }],
                    defaultFilter: '*',
                    animationType: 'fadeOutTop',
                    gapHorizontal: 0,
                    gapVertical: 0,
                    gridAdjustment: 'responsive',
                    caption: 'fadeIn',
                    displayType: 'fadeIn',
                    displayTypeSpeed: 100,
                    // lightbox
                    lightboxDelegate: '.cbp-lightbox',
                    lightboxGallery: true,
                    lightboxTitleSrc: 'data-title',
                    lightboxCounter: '<div class="cbp-popup-lightbox-counter">{{current}} of {{total}}</div>',
                    plugins: {
                        loadMore: {
                            selector: '#js-loadMore-mosaic-flat',
                            action: 'click',
                            loadItems: 3
                        }
                    }
                });
            })(jQuery, window, document);
        </script> 
    </body>
</html>    