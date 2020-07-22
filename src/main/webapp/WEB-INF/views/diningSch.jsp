<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>STUDER-PICK</title>
    <!-- Favicon -->
    <link rel="shortcut icon" href="assets/images/fav.ico"
          type="image/x-icon">
    <link rel="icon" href="assets/images/fav.ico" type="image/x-icon">
    <!-- fonts CSS -->
    <link rel="stylesheet" href="assets/fonts/linearicons/fonts.css">
    <link rel="stylesheet"
          href="assets/fonts/font-awesome/css/fontawesome-all.min.css">
    <!-- Custom CSS File -->
    <link rel="stylesheet" href="assets/dist/css/style.css">
    <link href="css/style.css" rel="stylesheet">
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
    <script src="js/plugins/plugins.js"></script>
    <style type="text/css">
        .markerbg {
            float: left;
            position: absolute;
            width: 36px;
            height: 37px;
            margin: 10px 0 0 10px;
            background: url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;
        }

        .marker_1 {
            background-position: 0 -10px;
        }

        .marker_2 {
            background-position: 0 -56px;
        }

        .marker_3 {
            background-position: 0 -102px
        }

        .marker_4 {
            background-position: 0 -148px;
        }

        .marker_5 {
            background-position: 0 -194px;
        }

        .marker_6 {
            background-position: 0 -240px;
        }

        .marker_7 {
            background-position: 0 -286px;
        }

        .marker_8 {
            background-position: 0 -332px;
        }

        .marker_9 {
            background-position: 0 -378px;
        }

        .marker_10 {
            background-position: 0 -423px;
        }

        .marker_11 {
            background-position: 0 -470px;
        }

        .marker_12 {
            background-position: 0 -516px;
        }

        .marker_13 {
            background-position: 0 -562px;
        }

        .marker_14 {
            background-position: 0 -608px;
        }

        .marker_15 {
            background-position: 0 -654px;
        }

        #pagination {
            margin: 10px auto;
            text-align: center;
        }

        .select_sido {
            position: absolute;
            right: 100px;
            float: right;
            margin-bottom: 70px;
            padding-bottom: 70px;
            padding-top: 50px;
        }

        .font_searchStd {
            position: absolute;
            right: 445px;
            text-align: center;
            margin: 10px;
        }

        #main_container {
            flex: 100%;
            max-width: 80%;
            margin-left: 15%; /*오른쪽 화면 여백이 너무 많을 경우 숫자를 늘리면 됩니다.*/
        }

        .diningLoc {
            border: solid 2px #F08B41;
            border-radius: 25px;
            width: 20%;
            height: 80%;
            text-align: center;
            margin-top: 5px;
            float: left;
        }

        #centerAddr {
            font-size: 18px;
            font-weight: bold;
            color: #F08B41;
            text-align: center;
            margin-top: 5%;
        }

        .show_loc {
            margin-left: 32%;
            float: left;
            margin-top: 1.5%;
            font-size: 15px;
            color: black;
        }

        #keyword {
            width: 750px !important;
            height: 50px !important;
            margin-left: 4px;
            margin-right: 4px;
        }

        #back_btn {
            width: 120px !important;
            height: 50px !important;
            padding: 0px !important;
            margin-left: 62%;
            margin-bottom: 4%;
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
        <div id="navbarNavDropdown" class="navbar-collapse collapse">
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
                                <a id="SNS" class="nav-link" aria-haspopup="true" aria-expanded="false"
                                   href="snsMyPageView.do?cust_no=${loginVo.no }&provider_no=-1">SNS</a>
                            </c:when>
                            <c:otherwise>
                                <a id="SNS" class="nav-link" aria-haspopup="true" aria-expanded="false"
                                   href="snsMyPageView.do?cust_no=-1&provider_no=${loginVo.no }">SNS</a>
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                    <c:if test="${empty loginVo }">
                        <a class="nav-link" aria-haspopup="true" aria-expanded="false" href="login">SNS</a>
                    </c:if>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link  dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                       aria-expanded="false" href="#">고객지원</a>
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
                        <li class="nav-item dropdown user-dropdown align-items-center">
                            <a class="nav-link" href="#" id="dropdown-user" role="button"
                               data-toggle="dropdown">
                                <span class="user-states states-online">
                                    <img src="cust_img/${loginVo.cust_img }" width="35" height="35px!important" alt=""
                                         class="rounded-circle">
                                </span>
                                <span class="ml-2 h-lg-down dropdown-toggle">
                                        ${loginVo.nick_name}
                                </span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdown-user"
                                 style="background-color: #212121!important">
                                <a class="dropdown-item" href="profile"><i class="icon-User"></i>My Profile</a>
                                <c:choose>
                                    <c:when test="${loginVo.role eq 'customer' }">
                                        <a class="dropdown-item" href="custMyPage?cust_no=${loginVo.no }"><i
                                                class="icon-User"></i>고객 My Page</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a class="dropdown-item" href="provMyPageView.do?cust_no=${loginVo.no }"><i
                                                class="icon-User"></i>사업자 My Page</a>
                                    </c:otherwise>
                                </c:choose>

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
        class="page-titles-img title-space-lg bg-parallax parallax-overlay"
        data-jarallax='{"speed": 0.2}'
        style='background-image: url("images/dining.jpg")'>
    <div class="container">
        <div class="row">

            <div class=" col-md-8 ml-auto mr-auto">
                <h1 class='text-uppercase'>주변 맛집검색</h1>

                <!-- <a href='https://www.youtube.com/watch?v=cctFcl5EFYk' class='modal-video btn btn-white-outline btn-lg btn-rounded'>Watch our film</a>
                    -->
            </div>
        </div>
    </div>
</div>
<!--page title end-->

<!-- ###################################################################### -->
<!--Page content -->
<div style="border: solid 2px #D8D8D8; height: 9%;">
    <div class="show_loc">현재보고 있는 맛집 지역은&nbsp;&nbsp;</div>
    <div class="diningLoc">
        <div id="centerAddr"></div>
    </div>
    <div style="float: left;margin-top: 1.5%;font-size: 15px;color: black;">&nbsp;&nbsp;입니다.</div>
</div>
<!-- 	<div style="height: 8%; background-color: #FFD900;"></div> -->

<div class="container pt50 pb70" id="sch_content">
    <div class="map_wrap">
        <div class="option">
            <span id="sch_lb" style="margin-left: 4%;margin-bottom: 2% !important;"></span>
            <form onsubmit="searchPlaces(); return false;" style="text-align: center;">
                <select id="opt_box" style="width:120px !important; height:50px !important;">
                    <option>맛집명</option>
                    <option>지역명</option>
                </select>
                <input type="text" id="keyword">
                <button type="submit" id="btn_sch" class="btn btn-outline-warning mb5"
                        style="width:120px !important; height:50px !important; padding: 0px !important;">검색하기
                </button>
            </form>
        </div>
        <br>
        <div id="map" style="width:90%;height:450px;margin-bottom:10px; margin-left:5%; overflow:hidden;"></div>
        <br><br>

        <!-- 주변맛집 리스트 -->
        <div id="menu_wrap" class="bg_white">
            <hr>
            <ul id="placesList"></ul>
            <nav aria-label="Page navigation example" id="pagination" style="text-align: center;"></nav>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-9 mb30 sticky-content" id="main_container">

            <!--본문 시작-->


            <!-- 	맛집 리스트페이지 -->

            <div id="list_page">


                <!-- 지도 표시 -->

                <div id="list"></div>
            </div>
            <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
            <script type="text/javascript"
                    src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=c1bc9ebf025c6c9764f3796dcc91b8d4&libraries=services"></script>
            <script>
                $(function () {
                });
                // list 페이지에서 보일 속성들
                $("#dining_board_s").hide();
                $("#back_btn").hide();

                var keyword_s = $("#keyword");
                var sch_lb = $("#sch_lb");
                sch_lb.html("  찾으시는 맛집명과 지역을 함께 검색하세요.");
                keyword_s.attr("placeholder", "예) 밀플랜비 신촌");
                $("#opt_box").change(function () {
                    if ($("#opt_box").val() == '맛집명') {
                        sch_lb.html("  찾으시는 맛집명과 지역을 함께 검색하세요.");
                        keyword_s.attr("placeholder", "예) 밀플랜비 신촌");
                    } else {
                        sch_lb.html("  원하시는 지역을 검색하세요.");
                        keyword_s.attr("placeholder", "예) 신촌");
                    }
                });

                //----------------------------지도생성------------------------------
                // 마커를 담을 배열입니다
                var markers = [];

                var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                    mapOption = {
                        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
                        level: 3
                        // 지도의 확대 레벨
                    };

                // 지도를 생성합니다
                var map = new daum.maps.Map(mapContainer, mapOption);

                //HTML5의 geolocation으로 사용할 수 있는지 확인합니다
                if (navigator.geolocation) {

                    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
                    navigator.geolocation.getCurrentPosition(function (position) {

                        var lat = position.coords.latitude, // 위도
                            lon = position.coords.longitude; // 경도
                        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
                            message = '<div style="padding:5px;">현재위치</div>'; // 인포윈도우에 표시될 내용입니다
                        // 마커와 인포윈도우를 표시합니다
                        displayMarker(locPosition, message);

                        // 키워드로 장소를 검색합니다
                        searchPlaces();

                    });

                } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

                    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667), message = 'geolocation을 사용할수 없어요..'
                    alert(message);
                    displayMarker(locPosition, message);
                }


                //-------------현재위치 및 검색했을때 중심좌표 주소로 반환---------------
                //주소-좌표 변환 객체를 생성합니다
                var geocoder = new kakao.maps.services.Geocoder();

                var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
                    infowindow = new kakao.maps.InfoWindow({
                        zindex: 1
                    }); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

                // 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
                searchAddrFromCoords(map.getCenter(), displayCenterInfo);

                // 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
                kakao.maps.event.addListener(map, 'idle', function () {
                    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
                });

                //-----------------------장소검색---------------------------
                // 장소 검색 객체를 생성합니다
                var ps = new daum.maps.services.Places(map);

                // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
                var infowindow = new daum.maps.InfoWindow({
                    zIndex: 1
                });

                // 키워드로 장소를 검색합니다
                searchPlaces();


                // -----------------------지도관련함수--------------------------

                // 지도에 마커와 인포윈도우를 표시하는 함수입니다
                function displayMarker(locPosition, message) {

                    // 마커를 생성합니다
                    var marker = new kakao.maps.Marker({
                        map: map,
                        position: locPosition
                    });

                    var iwContent = message, // 인포윈도우에 표시할 내용
                        iwRemoveable = true;

                    // 인포윈도우를 생성합니다
                    var infowindow = new kakao.maps.InfoWindow({
                        content: iwContent,
                        removable: iwRemoveable
                    });

                    // 인포윈도우를 마커위에 표시합니다
                    infowindow.open(map, marker);

                    // 지도 중심좌표를 접속위치로 변경합니다
                    map.setCenter(locPosition);
                }


                // 키워드 검색을 요청하는 함수입니다
                function searchPlaces() {
                    var keyword = "";

                    if ($("#opt_box").val() == '맛집명') {
                        keyword = document.getElementById('keyword').value;

                    } else {
                        keyword = document.getElementById('keyword').value + '맛집';
                    }

                    if (!keyword.replace(/^\s+|\s+$/g, '')) {
                        //alert('키워드를 입력해주세요!');
                        ps.categorySearch('FD6', placesSearchCB, {
                            useMapBounds: true
                        });
                    } else {
                        // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
                        ps.keywordSearch(keyword, placesSearchCB);
                    }

                }

                // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
                function placesSearchCB(data, status, pagination) {
                    if (status === daum.maps.services.Status.OK) {
                        console.log(data);
                        // 정상적으로 검색이 완료됐으면
                        // 검색 목록과 마커를 표출합니다
                        displayPlaces(data);

                        // 페이지 번호를 표출합니다
                        displayPagination(pagination);

                    } else if (status === daum.maps.services.Status.ZERO_RESULT) {

                        alert('검색 결과가 존재하지 않습니다.');
                        return;

                    } else if (status === daum.maps.services.Status.ERROR) {

                        alert('검색 결과 중 오류가 발생했습니다.');
                        return;

                    }

                }

                // 검색 결과 목록과 마커를 표출하는 함수입니다
                function displayPlaces(places) {

                    var listEl = document.getElementById('placesList'), menuEl = document
                        .getElementById('menu_wrap'), fragment = document
                        .createDocumentFragment(), bounds = new daum.maps.LatLngBounds(), listStr = '';

                    // 검색 결과 목록에 추가된 항목들을 제거합니다
                    removeAllChildNods(listEl);

                    // 지도에 표시되고 있는 마커를 제거합니다
                    removeMarker();
                    var arr = new Array();
                    for (var i = 0; i < places.length; i++) {

                        // 마커를 생성하고 지도에 표시합니다
                        var placePosition = new daum.maps.LatLng(places[i].y, places[i].x), marker = addMarker(
                            placePosition, i), itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

                        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
                        // LatLngBounds 객체에 좌표를 추가합니다
                        bounds.extend(placePosition);

                        // 마커와 검색결과 항목에 mouseover 했을때
                        // 해당 장소에 인포윈도우에 장소명을 표시합니다
                        // mouseout 했을 때는 인포윈도우를 닫습니다
                        (function (marker, title) {
                            arr[i] = title;
                            daum.maps.event.addListener(marker, 'mouseover', function () {
                                displayInfowindow(marker, title);
                            });

                            daum.maps.event.addListener(marker, 'mouseout', function () {
                                infowindow.close();
                            });

                            daum.maps.event.addListener(marker, 'click', function () {
                                fnMove(arr.indexOf(title) + 1);
                            });

                            itemEl.onmouseover = function () {
                                displayInfowindow(marker, title);
                            };

                            itemEl.onmouseout = function () {
                                infowindow.close();
                            };
                            itemEl.onclick = function () {
                                $('html, body').animate({
                                    scrollTop: 0
                                }, 400);
                                $
                                    .ajax({
                                        type: "POST",
                                        url: "diningList.do",
                                        data: {
                                            'enc_query': title
                                        },
                                        dataType: 'json',
                                        success: function (data) {
                                            $
                                                .each(
                                                    data,
                                                    function (idx, item) {
                                                        var div1 = $("<div class='course-list-item mb30'></div>");
                                                        var div2 = $("<div class='row align-items-center'></div>");
                                                        var div3_1 = $("<div class='col-md-3 col-sm-12 py-2'></div>");
                                                        var a_img = $("<a href='" + item.link + "' target='_blank'></a>");

                                                        var img = $(
                                                            "<img class='img-fluid' width=150px height=150px>")
                                                            .attr(
                                                                "src",
                                                                item.thumb_nail);

                                                        var div3_2 = $("<div class='col-md-8 col-sm-12 py-3'></div>");
                                                        var a_title = $("<a href='" + item.link + "' target='_blank'></a>");
                                                        var h5 = $(
                                                            "<h5 id='item_title'></h5>")
                                                            .html(
                                                                item.title);

                                                        var p_intro = $(
                                                            "<p class='mb-0'></p>")
                                                            .html(
                                                                item.passage);
                                                        var br = $("<br>");

                                                        var ul = $("<ul class='list-inline'></ul>");
                                                        var li1 = $("<li class='list-inline-item mr-3'></li>");
                                                        var div4_1 = $("<div></div>");
                                                        var i1 = $("<i class='fa fa-calendar mr-2'></i>");
                                                        var p1 = $("<p>기간</p>");
                                                        var a1 = $(
                                                            "<a href='" + item.link + "' target='_blank'></a>")
                                                            .html(
                                                                item.regdate);

                                                        var li2 = $("<li class='list-inline-item mr-3'></li>");
                                                        var div4_2 = $("<div></div>");
                                                        var i2 = $("<i class='fa fa-calendar-check-o mr-2'></i>");
                                                        var p2 = $("<p>마감일</p>");
                                                        var a2 = $(
                                                            "<a href='" + item.link + "' target='_blank'></a>")
                                                            .html(
                                                                item.blog_name);

                                                        var li3 = $("<li class='list-inline-item mr-3'></li>");
                                                        var div4_3 = $("<div></div>");
                                                        var i3 = $("<i class='fa fa-map-marker mr-2'></i>");
                                                        var p3 = $("<p>장소</p>");
                                                        var a3 = $(
                                                            "<a href='" + item.link + "' target='_blank'></a>")
                                                            .html(
                                                                item.blog_url);

                                                        $(li1).append(i1, a1);
                                                        $(li2).append(i2, a2);
                                                        $(li3).append(i3, a3);
                                                        $(ul).append(li1, li2,
                                                            li3);

                                                        $(a_title).append(h5);
                                                        $(div3_2)
                                                            .append(
                                                                a_title,
                                                                p_intro,
                                                                br, ul);

                                                        $(a_img).append(img);
                                                        $(div3_1).append(a_img);

                                                        $(div2).append(div3_1,
                                                            div3_2);
                                                        $(div1).append(div2);

                                                        $("#dining_board")
                                                            .append(div1);

                                                        $("#sch_content")
                                                            .hide();

                                                        // list page 에서 나타나는 속성들
                                                        $("#dining_board_s")
                                                            .show();
                                                        $("#back_btn").show();

                                                    });

                                        },
                                        error: function (e1, e2, e3) {
                                            alert("diningList에러");
                                        }

                                    });

                            }

                        })(marker, places[i].place_name);

                        fragment.appendChild(itemEl);
                    }

                    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
                    listEl.appendChild(fragment);
                    menuEl.scrollTop = 0;

                    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
                    map.setBounds(bounds);
                }

                // 검색결과 항목을 Element로 반환하는 함수입니다
                function getListItem(index, places) {
                    var el = document.createElement('div')
                    var marker = $('<span class="markerbg marker_' + (index + 1)
                        + '"></span>');
                    var div_mk = $("<div></div>");
                    $(div_mk).append(marker);
                    var div1 = $("<div class='row course-list-item mb30' style='width:90%; margin-left:3%'></div>");
                    var div2 = $("<div class='align-items-center'></div>");
                    var div3_2 = $("<div class='col-md-12 col-sm-12 py-3' style='margin-left:12%;'></div>");
                    var h5 = $("<h5></h5>").html(places.place_name);
                    var p_intro = "";
                    var br = "";
                    if (places.road_address_name) {
                        p_intro = $("<a class='mb-0'></a>").html(
                            places.road_address_name + places.address_name);
                    } else {
                        p_intro = $("<a class='mb-0'></a>").html(places.address_name);
                    }
                    br = $("<br>");
                    var i0 = $("<i class='fa fa-thumbtack mr-2'></i>");
                    var ul = $("<ul class='list-inline'></ul>");
                    var li1 = $("<li class='list-inline-item mr-3'></li>");
                    var i1 = $("<i class='fa fa-phone mr-2'></i>");
                    var a1 = $("<a href='#'></a>").html(places.phone);

                    $(li1).append(i1, a1);
                    $(ul).append(li1);

                    $(div3_2).append(h5, i0, p_intro, br, ul);

                    $(div2).append(div_mk, div3_2);
                    $(div1).append(div2);

                    $(el).append(div1);
                    return el;
                }

                // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
                function addMarker(position, idx, title) {
                    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
                        imageSize = new daum.maps.Size(36, 37), // 마커 이미지의 크기
                        imgOptions = {
                            spriteSize: new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
                            spriteOrigin: new daum.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                            offset: new daum.maps.Point(13, 37)
                            // 마커 좌표에 일치시킬 이미지 내에서의 좌표
                        }, markerImage = new daum.maps.MarkerImage(imageSrc, imageSize,
                        imgOptions), marker = new daum.maps.Marker({
                            position: position, // 마커의 위치
                            image: markerImage
                        });

                    marker.setMap(map); // 지도 위에 마커를 표출합니다
                    markers.push(marker); // 배열에 생성된 마커를 추가합니다

                    return marker;
                }

                // 지도 위에 표시되고 있는 마커를 모두 제거합니다
                function removeMarker() {
                    for (var i = 0; i < markers.length; i++) {
                        markers[i].setMap(null);
                    }
                    markers = [];
                }

                // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
                function displayPagination(pagination) {
                    var paginationEl = document.getElementById('pagination'), fragment = document
                        .createDocumentFragment(), i;

                    // 기존에 추가된 페이지번호를 삭제합니다
                    while (paginationEl.hasChildNodes()) {
                        paginationEl.removeChild(paginationEl.lastChild);
                    }

                    for (i = 1; i <= pagination.last; i++) {
                        var el = document.createElement('a');
                        el.href = "#";
                        el.innerHTML = i;
                        el.style = "text-align='center;'";

                        if (i === pagination.current) {
                            el.className = 'on';
                        } else {
                            el.onclick = (function (i) {
                                return function () {
                                    pagination.gotoPage(i);
                                }
                            })(i);
                        }

                        fragment.appendChild(el);
                    }
                    paginationEl.appendChild(fragment);
                }

                // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
                // 인포윈도우에 장소명을 표시합니다
                function displayInfowindow(marker, title) {
                    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
                    infowindow.setContent(content);
                    infowindow.open(map, marker);
                }

                // 검색결과 목록의 자식 Element를 제거하는 함수입니다
                function removeAllChildNods(el) {
                    while (el.hasChildNodes()) {
                        el.removeChild(el.lastChild);
                    }
                }

                function setBounds() {
                    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
                    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
                    map.setBounds(bounds);
                }


                //---------------------------현재위치 위에 띄우기----------------------------

                function searchAddrFromCoords(coords, callback) {
                    // 좌표로 행정동 주소 정보를 요청합니다
                    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);
                }

                function searchDetailAddrFromCoords(coords, callback) {
                    // 좌표로 법정동 상세 주소 정보를 요청합니다
                    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
                }

                // 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
                function displayCenterInfo(result, status) {
                    if (status === kakao.maps.services.Status.OK) {
                        var infoDiv = document.getElementById('centerAddr');

                        for (var i = 0; i < result.length; i++) {
                            // 행정동의 region_type 값은 'H' 이므로
                            if (result[i].region_type === 'H') {
                                infoDiv.innerHTML = result[i].address_name;
                                break;
                            }
                        }
                    }
                }

                //마커 클릭했을때 스크롤바 밑으로 내리기
                function fnMove(idx) {
                    var offset = $(".marker_" + idx).offset();
                    $('html, body').animate({
                        scrollTop: offset.top - 300
                    }, 100);
                }
            </script>

            <!--본문 끝 -->
        </div>
    </div>
    <div class="pagination" id="pagination" style="margin-left: 50%; margin-right: 45%;">
    </div>

</div>
<div class="container pt100 pb70" id="dining_board">
    <span id="dining_board_s" style="color: gray; font-size: 15px; margin-left: 1%;">선택하신 음식점의 블로그후기 입니다.</span>
    <button type="button" id="back_btn" class="btn btn-outline-warning mb5" onclick="location.href='diningSch'">뒤로가기
    </button>
</div>
<!--Page content -->
<footer class="footer footer-dark pt50 pb30">
    <div class="container">
        <div class="row">
            <div class="col-lg-6  ml-auto mr-auto text-center">
                <ul class="social-icons list-inline">
                    <li class="list-inline-item"><a href="#"> <i
                            class="fa fa-facebook"></i>Facebook
                    </a></li>
                    <li class="list-inline-item"><a href="#"> <i
                            class="fa fa-twitter"></i>twitter
                    </a></li>
                    <li class="list-inline-item"><a href="#"> <i
                            class="fa fa-instagram"></i>instagram
                    </a></li>
                    <li class="list-inline-item"><a href="#"> <i
                            class="fa fa-behance"></i>Behance
                    </a></li>
                </ul>
                <h4>
                    <i class="fa fa-phone"></i> 1800-355-4322
                </h4>
                <h4>
                    <i class="fa fa-envelope"></i> support@assan.com
                </h4>
                <p>&copy; Copyright 2018. Assan 3.0</p>
            </div>
        </div>
    </div>
</footer>

<!--back to top-->
<a href="#" class="back-to-top hidden-xs-down" id="back-to-top"><i
        class="ti-angle-up"></i></a>
<!-- jQuery first, then Tether, then Bootstrap JS. -->

<script src="assets/dist/js/plugins.js"></script>
<script src="assets/dist/js/education.custom.js"></script>
<script src="js/plugins/plugins.js"></script>
<script src="js/assan.custom.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
</script>
</body>
</html>
	