
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
.qa_title {
	text-align: left;
	padding-left: 50px;
}

.qa_isanswer {
	background-color: #CCCCCC;
	font-weight: 900;
	color: #000000;
}

.h5hover:hover {
	color: #4782d3;
}

.h5hover {
	margin-bottom: .5rem;
	font-size: 14px;
	font-family: 'Montserrat', 'sans-serif';
	letter-spacing: -0.2px;
	font-weight: 800;
	display: inline;
}

.result {
	color:white;
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
	<div class="page-titles title-dark pt30 pb20 ">
		<div class="container">
			<div class="row">
				<div class=" col-md-6">
					<h4>
						페이지명: <span>Q&A</span>
					</h4>
				</div>
				<div class=" col-md-6 mb0">
					<ol class="breadcrumb text-md-right">
						<li class="breadcrumb-item"><a href="#">고객지원/프로모션</a></li>
						<li class="breadcrumb-item active">Q&A 목록</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	<!--page title end-->

	<!-- ###################################################################### -->
	<div>
		<div align="left"
			style="padding: 10px; margin: 10px; margin-left: 15%;">
			<form style="display: inline;">
				<select
					style="margin-left: 15px; border-radius: 20px; margin-right: 10px;"
					id="searchfield" name="searchfield"></select> 
				<input class="border0" type="search" placeholder="Search..."
					aria-label="Search" id="keyword" name="keyword">
			</form>
			<button class="bg-trans border0"
				style="margin-left: 15px; margin-right: 15%;" id="btnSearch"
				name="btnSearch">
				<i class="icon-Magnifi-Glass2"></i>
			</button>
			<div id = "div_t" style="display: inline; margin-left: 15px; margin-right:15%;">
			</div>
			<a id="a_insert"><button
					class="btn btn-icon btn-outline-dark mb-2" style="margin-left: 15%; margin-right: 0%; 
					right:16.5%; margin-top:-10px; position:absolute;">문의하기</button></a>
		</div>

	</div>

	<div class="page-content" align="center">
		<div class="container-fluid">
			<div class="bg-white table-responsive rounded shadow-sm mb-30"
				style="width: 70%;">
				<table class="table mb-0 table-hover" style="text-align: center;">
					<thead>
						<tr>
							<th width="10%">글번호</th>
							<th width="50%">제목</th>
							<th width="15%">작성자</th>
							<th width="15%">상태</th>
							<th width="10%">작성일</th>
						</tr>
					</thead>
					<tbody id="qa_board"></tbody>
				</table>
			</div>
		</div>
	</div>

	<div class="pagination" id="pagination"
		style="align-items: center; align-content: center; margin-left: 45%; margin-right: 45%;">
	</div>
	
	<!-- 로그인한 고객정보 -->
	<c:choose>
		<c:when test="${loginVo.role eq 'customer' }">
			<input type="hidden" value="${loginVo.no }" id="cust_no">
		</c:when>
		<c:when test="${loginVo.role eq 'provider'}">
			<input type="hidden" value="${loginVo.no }" id="provider_no">
		</c:when>
	</c:choose>
	
	
	<!-- page content end-->

	<!-- ###################################################################### -->
	<br>
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
	<script src="js/plugins/plugins.js"></script>
	<script src="js/assan.custom.js"></script>
	<script src="admin-dashboardUi/js/appUi-custom.js"></script>
	<script type="text/javascript">
	<!--QNA 목록-->
		$(function() {
			var keyword=""; 		//입력받은 검색어
			var searchfield=""; 		//선택한 select option
			
			var pageSIZE = 10;		//한 페이지당 보여줄 레코드 수
			var pageGROUP = 5;		//한 화면에 보여줄 페이지수
			var totalRecord = 0;		//전체 레코드 수
			var totalPage = 1; 		//전체 페이지 수
			
			var cust_no = $("#cust_no").val();
			var provider_no = $("#provider_no").val();
			if(cust_no == null){
				cust_no = 0;
			}
			if(provider_no == null ){
				provider_no = 0;
			}
			
			$("#a_insert").attr({"href":"insertQa.do?cust_no="+cust_no+"&provider_no="+provider_no});

			//전체 레코드 수 구하기
			$.ajax({url:"getCountQa.do", 
					data:{"keyword":keyword,"searchfield":searchfield}, async:false,
					success:function(data) {
						totalRecord = data;				
			}});
			
			totalPage = parseInt(totalRecord / pageSIZE);
			if(totalRecord % pageSIZE !=0) {
				totalPage++;
			}
			
			var currentPage = 1;
			var start = (currentPage-1) * pageSIZE +1;
			var end = currentPage * pageSIZE;
			
			//검색버튼을 눌렀을 경우 
			$("#btnSearch").click(function() {
				currentPage = 1;	
				keyword = $("#keyword").val();
				searchfield = $("#searchfield").val();
				
				$.ajax({url:"getCountQa.do", 
					data:{"keyword":keyword,"searchfield":searchfield}, async:false,
					success:function(data) {
						totalRecord = data;				
				}});

				totalPage = parseInt(totalRecord / pageSIZE);
				if(totalRecord % pageSIZE !=0) {
					totalPage++;
				}
				
				getListQa();
				paging();
			});

			//목록 가져오는 함수 
			function getListQa() {
				keyword = $("#keyword").val();
				searchfield = $("#searchfield").val();
				
				$("#qa_board").empty();
				
				$.ajax({url : "getListQa.do",
						data : {"keyword" : keyword,"searchfield" : searchfield,"start":start,"end":end},
						success : function(data) {
								var arr = eval("(" + data + ")");				
								//검색결과가 없을 시 문구 표기 
								if(data =="[]") {						
									var h4 = $("<h4 id='h_4'style='display: inline;'></h4>").html("검색 결과가 없습니다.");
									$("#div_t").append(h4);
								} else {									
									$("#div_t").empty();
								}
								
								$.each(arr,function(idx, q) {
									var tr = $("<tr></tr>");
									var td1;
									var td2;
									var h;
									var a2;
									var i2;
									var td3;
									var td4;
									var btn4;

									/*동일한 b_ref가 있는 경우*/
									if (q.isanswer > 1) {

										/*고객이 쓴 게시글인 경우*/
										if (q.man_no == "") {
											td1 = $("<td></td>").html(q.qa_no);
											td2 = $("<td class='qa_title'></td>");
											a2 = $("<a href='#!'class='a_title'></a>")
													.attr({"href" : "detailQa.do?qa_no="+ q.qa_no+ "&b_level="+ q.b_level});
											h = $("<h5 class='h5hover'></h5>").html(q.qa_title);
											
											if(q.cust_name !=null && q.pro_name ==null){
												td3 = $("<td></td>").html(q.cust_name);
											} else if (q.cust_name ==null && q.pro_name !=null) {
												td3 = $("<td></td>").html(q.pro_name);
											}
											
											td4 = $("<td></td>");
											btn4 = $("<button disabled='disabled' class='qa_isanswer'>답변완료</button>");
											
											$(a2).append(h);
											$(td2).append(a2);
											$(td4).append(btn4);

										/*관리자가 쓴 게시글인 경우*/
										} else {
											td1 = $("<td></td>");
											td2 = $("<td class='qa_title'></td>");
											h = $("<h5 class='h5hover'></h5>").html(q.qa_title);
											i2 = $("<i class='fa fa-arrow-right' aria-hidden='true'></i>");
											a2 = $("<a href='#!' class='a_title'></a>")
													.attr({"href" : "detailQa.do?qa_no="+ q.qa_no+"&b_level="+ q.b_level});

											td3 = $("<td>관리자</td>");
											td4 = $("<td></td>");

											$(a2).append(i2, h);
											$(td2).append("&nbsp;&nbsp;&nbsp;",i2,"&nbsp;",a2);
										}

									/*동일한 b_ref가 없는 경우*/
									} else {
										td1 = $("<td></td>").html(q.qa_no);
										td2 = $("<td class='qa_title'></td>");
										h = $("<h5 class='h5hover'></h5>").html(q.qa_title);
										a2 = $("<a href='#!' class='a_title'></a>")
												.attr({"href" : "detailQa.do?qa_no="+ q.qa_no+ "&b_level="+ q.b_level});

										if(q.cust_name !=null && q.pro_name ==null){
											td3 = $("<td></td>").html(q.cust_name);
										} else if (q.cust_name ==null && q.pro_name !=null) {
											td3 = $("<td></td>").html(q.pro_name);
										}
										
										td4 = $("<td></td>").html("대기중");

										$(a2).append(h);
										$(td2).append(a2);
									}

									
									var td5 = $("<td></td>").html(q.qa_write_date);
									$(tr).append(td1, td2, td3, td4, td5);
									$("#qa_board").append(tr);

								});
									
				}});
			}
			
			//페이지 출력 하는 메소드
			function paging() {
				$("#pagination").empty();
				//한 화면에 보여줄 시작페이지, 끝페이지 구하기
				var startPage = parseInt(currentPage/pageGROUP) * pageGROUP + 1;
				if(currentPage % 5 == 0) {
					startPage = (parseInt(currentPage/pageGROUP)-1) * pageGROUP + 1;
				}
				var endPage = startPage + pageGROUP - 1;
				
				if(endPage > totalPage) {
					endPage = totalPage;
				}
				
				if(currentPage > pageGROUP) {
					var btn_prev = $("<a class='page-link'><i class='fa fa-caret-left'></i></a>");
					$("#pagination").append(btn_prev);
					$(btn_prev).click(function() {
						currentPage = startPage - 1;
						start = (currentPage-1) * pageSIZE +1;
						end = currentPage * pageSIZE;

						getListQa();
						paging();
					});
				}
		
	
				for(var i=startPage; i<=endPage; i++) {
					var a = $("<a class='page-link pg'>"+i+"</a>");
					$("#pagination").append(a);
				}
				
				
				$(".pg").click(function() {
					currentPage = $(this).html();
					start = (currentPage-1) * pageSIZE +1;
					end = currentPage * pageSIZE;
					getListQa();
					paging();
				});
				
				if(currentPage < totalPage && endPage+1<=totalPage) {
					var btn_next = $("<a class='page-link'><i class='fa fa-caret-right'></i></a>");
					$("#pagination").append(btn_next);
					$(btn_next).click(function() {
						currentPage = endPage + 1;
						start = (currentPage-1) * pageSIZE +1;
						end = currentPage * pageSIZE;

						getListQa();
						paging();
					});
				}
				
			}

			//화면에 리스트, pagination 뿌리기 
			getListQa();
			paging();
		});
	</script>
	<script type="text/javascript">
	$(function() {

		var area0 = [ "전체", "내용", "제목" ];

		//선택 박스 초기화
		$("select[name^=searchfield]").each(
				function() {
					$selsf = $(this);
					$.each(eval(area0), function() {
						$selsf.append("<option value='"+this+"'>" + this
								+ "</option>");
					});
				});
	});
	</script>
</body>

</html>
