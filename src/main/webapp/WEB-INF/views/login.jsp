<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" href="demo-files/demo.css">
<!-- Bootstrap-->
<link href="lib/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<!--Common Plugins CSS -->
<link href="css1/plugins/plugins.css" rel="stylesheet">
<!--fonts-->
<link href="lib/line-icons/line-icons.css" rel="stylesheet">
<link href="lib/font-awesome/css/fontawesome-all.min.css"
	rel="stylesheet">
<link href="css1/style.css" rel="stylesheet">
<link rel="stylesheet" href="assets/dist/css/style.css">

<!-- script -->
<script type="text/javascript" src="js/scripts/login.js"></script>
<script type="text/javascript" src="lib/jquery/dist/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#sumit').click(function() {
			var id = $('#id').val();
			var pwd = $('#pwd').val();
			var type = $('input[name="inlineradiooptions"]:checked').val();
			login(id, pwd, type);
		})
	});
</script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>

<body>

	<div id="preloader">
		<div id="preloader-inner"></div>
	</div>
	<!--/preloader-->

	<!-- Site Overlay -->
	<div class="site-overlay"></div>

	<nav
		class="navbar navbar-expand-lg navbar-light navbar-color navbar-transparent-light nav-sticky">
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
			<a class="navbar-brand" href="index.do"> <img
				class='logo logo-light hidden-md-down' style="top:-20px;" src="images/logo.png"
				alt="">
			</a>
			<div id="navbarNavDropdown" class="navbar-collapse collapse">
				<ul class="navbar-nav ml-auto">
					<!--    <li class="nav-item dropdown active"> -->

					<li class="nav-item dropdown dropdown-full-width"><a
						class="nav-link" href="intro" style="color: white">스투더픽 소개</a></li>
					<li class="nav-item dropdown dropdown-full-width"><a
						class="nav-link" style="color: white" href="cafeList1.do"
						aria-haspopup="true" aria-expanded="false"> 스터디카페 </a></li>
					<li class="nav-item dropdown dropdown-full-width"><a
						class="nav-link" style="color: white" href="listStd.do"
						aria-haspopup="true" aria-expanded="false"> 스투더 </a></li>
					<li class="nav-item dropdown"><a class="nav-link"
						style="color: white" aria-haspopup="true" aria-expanded="false"
						href="diningSch">맛집찾기</a></li>
					<li class="nav-item dropdown">
						<c:if test="${!empty loginVo }">
                        	<c:choose>
                        		<c:when test="${loginVo.role eq 'customer' }">
                        			<a id="SNS" class="nav-link" aria-haspopup="true" aria-expanded="false" href="snsMyPageView.do?cust_no=${loginVo.no }&provider_no=-1" ><font style="color: white;">SNS</font></a>
                        		</c:when>
                        		<c:otherwise>
                        			<a id="SNS" class="nav-link" aria-haspopup="true" aria-expanded="false" href="snsMyPageView.do?cust_no=-1&provider_no=${loginVo.no }" ><font style="color: white;">SNS</font></a>	
                        		</c:otherwise>
                        	</c:choose>
                        </c:if>
                        <c:if test="${empty loginVo }">
                        	<a class="nav-link" aria-haspopup="true" aria-expanded="false" href="login" ><font style="color: white;">SNS</font></a>
                        </c:if>
					
					</li>
					<li class="nav-item dropdown"><a
						class="nav-link  dropdown-toggle" style="color: white"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
						href="#">고객지원</a>
						<ul class="dropdown-menu"
							style="background-color: #212121 !important">
							<li><a tabindex="-1" style="color: white"
								href="listNotice.do" class="dropdown-item">공지사항</a></li>
							<li><a tabindex="-1" style="color: white" href="listQa.do"
								class="dropdown-item">Q&A</a></li>
							<li><a tabindex="-1" style="color: white" href="listEvt.do	"
								class="dropdown-item">프로모션</a></li>
						</ul></li>
				</ul>
				<ul class="nav flex-row order-lg-2 ml-auto nav-icons"
					style="color: white">
					<c:choose>
						<c:when test="${not empty loginVo}">
							<li class="nav-item dropdown user-dropdown align-items-center">
								<a class="nav-link" href="#" id="dropdown-user" role="button"
								data-toggle="dropdown"> <span
									class="user-states states-online"> <img
										src="cust_img/${loginVo.cust_img }" width="35" alt=""
										class=" img-fluid rounded-circle">
								</span> <span class="ml-2 h-lg-down dropdown-toggle">
										${loginVo.nick_name} </span>
							</a>
								<div class="dropdown-menu dropdown-menu-right"
									aria-labelledby="dropdown-user">
									<a class="dropdown-item" href="profile"><i
										class="icon-User"></i>My Profile</a>
									<c:choose>
										<c:when test="${loginVo.role eq 'customer' }">
											<a class="dropdown-item" href="custMyPage"><i
												class="icon-User"></i>고객 My Page</a>
										</c:when>
										<c:otherwise>
											<a class="dropdown-item" href="provMyPageView.do"><i
												class="icon-User"></i>사업자 My Page</a>
										</c:otherwise>
									</c:choose>
									<!--추가하면 되는 부분  -->
									<a class="dropdown-item" href="logout"><i
										class="icon-Power"></i> Log Out</a>

								</div>
							</li>
							<li class="h-lg-up nav-item"><a href="#"
								class=" nav-link collapsed" data-toggle="collapse"
								data-target="#navbarToggler" aria-expanded="false"> <i
									class="icon-Magnifi-Glass2"></i>
							</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="login"><font style="color: #F4923D">Join
										Us</font></a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			<div class="navbar-right-elements" style="margin: 30px"></div>
			<!--right nav icons-->
		</div>

	</nav>

	<!-- 상단 메뉴바? 이미지 -->
	<div
		class="page-titles-img title-space-lg bg-parallax parallax-overlay mb70"
		data-jarallax='{"speed": 0.2}'
		style='background-image: url("images/bg1.jpg"); margin-bottom: 0px !important;'>
		<div class="container">
			<div class="row">
				<div class=" col-md-8 ml-auto mr-auto">
					<h1 class='text-uppercase'>스투더픽</h1>

					<!--                                    <a href='https://www.youtube.com/watch?v=cctFcl5EFYk' class='modal-video btn btn-white-outline btn-lg btn-rounded'>Watch our film</a>
                        -->
				</div>
			</div>
		</div>
	</div>
	<!--page title end-->






	<!-- ###################################################################### -->
	<!-- 요기에 넣어!!!!!-->
	<div class="page-wrapper" id="page-wrapper">

		<main class="content">

			<div class="container-fluid flex d-flex">
				<div class='row flex align-items-center'
					style="height: 1000px; padding: 0px !important; margin: 0px !important">
					<div
						class='col-lg-6 d-flex flex h-lg-down  full-height bg-pattern bg-fHeight'
						style='background-image: url(images/fheight1.jpg)'></div>
					<div
						class='col-lg-3 col-md-5 col-sm-6 ml-auto flex d-flex mr-auto full-height pt-40 pb-20'>
						<div class="w100 d-block">
							<a href="/index.do"
								class="avatar avatar60 ml-auto mr-auto bg-gradient-primary text-white rounded-circle">
								<i class="icon-Paper-Plane"></i>
							</a>
							<div class="title-sep text-center sep-white mt-20 mb-30">
								<span class='font600 fs16 text-dark'
									style="background-color: transparent;">Login</span>
							</div>
							<div>

								<!--                                        <div class="customUi-checkbox  pb-2">
                                            <input id="check-remember" type="radio" name="agree">
                                           <label for="check-remember">
                                                <span class="label-checkbox"></span> 
                                                 <span class="label-helper">개인</span> 
                                            </label> 
                                            <input id="check-remember" type="radio" name="agree2">
                                             <label for="check-remember">
                                                <span class="label-checkbox"></span>
                                                <span class="label-helper">사업자</span>
                                            </label>
                                        </div> -->

								<div align="center">
									<input type="radio" name="inlineradiooptions" value="1" checked>
									개인 <input type="radio" name="inlineradiooptions" value="2">
									사업자
								</div>

								<div class="input-icon-group">
									<!-- 									<div class="d-flex flex flex-row">
										<label class="flex d-flex mr-auto" for='pass'>Id</label>
									</div> -->
									<div class='input-icon-append'>
										<i class="fa fa-user" style="height: 40px;"></i> <input placeholder="Id" type="text"
											class="form-control" name="id" id="id">
									</div>
								</div>
								<div class="input-icon-group">
									<!-- 									<div class="d-flex flex flex-row">
										<label class="flex d-flex mr-auto" for='pass'>password</label>
									</div> -->
									<div class='input-icon-append'>
										<i class="fa fa-lock" style="height: 40px;"></i> <input name="pwd"
											placeholder="Password" type="password" class="form-control"
											id="pwd">
									</div>
								</div>
								<button type="submit" name="submit" id="sumit"
									class="btn btn-gradient-primary btn-block btn-lg">Login</button>

								<br>
								<div align="center">

									<a id="kakao-login-btn"></a> <a
										href="http://developers.kakao.com/logout"></a>
									<script type='text/javascript'>
										//<![CDATA[
										// 사용할 앱의 JavaScript 키를 설정해 주세요.
										Kakao
												.init('c1bc9ebf025c6c9764f3796dcc91b8d4');
										// 카카오 로그인 버튼을 생성합니다.
										function loginWithKakao() {
										Kakao.Auth.login({
													success : function(authObj) {
														Kakao.API
																.request({
																	url : '/v1/user/me',
																	success : function(
																			res) {
																		/* alert(JSON.stringify(res)); //<---- kakao.api.request 에서 불러온 결과값 json형태로 출력
																		alert(JSON.stringify(authObj)); //<----Kakao.Auth.createLoginButton에서 불러온 결과값 json형태로 출력 */
																		console
																				.log(res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)
																		console
																				.log(res.properties['nickname']);//<---- 콘솔 로그에 닉네임 출력(properties에 있는 nickname 접근 
																		// res.properties.nickname으로도 접근 가능 )
																		console
																				.log(authObj.access_token);//<---- 콘솔 로그에 토큰값 출력

																		$
																				.ajax({
																					type : "POST",
																					url : "check_kakao.do",
																					data : {
																						"id" : res.id
																					},
																					error : function(
																							error) {
																						alert('통신실패!!'
																								+ error);
																					},
																					success : function(
																							data) {
																						if (data == "F") {
																							alert("로그인 되었습니다");
																							location.href = "index.do";
																						} else if (data == "S") {
																							alert("회원가입을 해주세요");
																							location.href = "memberpersonal?kakaoid="
																									+ res.id;
																						}
																					}
																				});
																	}
																})
													},
													fail : function(err) {
														alert(JSON
																.stringify(err));
													}
												});
										};
										//]]>
									</script>
								</div>

								 <a id="custom-login-btn" href="javascript:loginWithKakao()" class="btn btn-social btn-border-o btn-icon btn-block mr-2 mb-2" style="background-color: #F7E600!important; color: white;">
                                            <span style="font-size:15px; font-weight:bold ;position: relative; left: -112px!important;">K</span> LOGIN with KAKAOTALK
                                 </a>
								<!--  <a href="javascript:void(0)" class="btn btn-social btn-border-o btn-icon btn-block  si-colored-facebook mr-2 mb-2">
                                            <i class="fab fa-facebook-f"></i> LOGIN with FACEBOOK&nbsp;&nbsp;
                                 </a> -->
                                 <a href="javascript:void(0)" class="btn btn-social btn-border-o btn-icon btn-block si-colored-g-plus mr-2 mb-2">
                                            <i class="fab fa-google-plus-g"></i> LOGIN with Google+&nbsp;&nbsp;&nbsp;&nbsp;
                                 </a>
                                
                               <!--   <a href="javascript:void(0)" class="btn btn-social btn-border-o btn-icon btn-block mr-2 mb-2" style="background-color:  #2DB400!important; color: white;">
                                            <span style="font-size:15px; font-weight:bold ;position: relative; left: -112px!important;">N</span> LOGIN with Naver&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 </a> -->
                                 
                                 
						
								
								<br>
								<div class="pt-20 text-center"
									style="margin-top: 0px; width: 900px; position: relative; left: -200px !important;">
									  <a href="memberpersonal"><button
											class="btn btn-outline-warning mr-5"
											style="position: relative; margin-right: 20px !important; left: -10x; width: 200px !important; display: inline;">개인
											회원가입</button></a> <a href="memberprovider"><button
											class="btn btn-outline-warning mr-5"
											style="position: relative; margin-left: 0x !important; left: -10px; width: 200px !important; display: inline;">사업자
											회원가입</button></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- main end-->
		</main>
		<!-- page content end-->
	</div>
	<!-- app's main wrapper end -->
	<!-- Common plugins -->





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
						<i class="fa fa-phone"></i>010-6868-9295
					</h4>
					<h4>
						<i class="fa fa-envelope"></i>msb9876@naver.com
					</h4>
					<p>© Copyright by Team BoB</p>
				</div>
			</div>
		</div>
	</footer>
	<!--/footer-->

	<!--back to top-->
	<a href="#" class="back-to-top hidden-xs-down" id="back-to-top"><i
		class="ti-angle-up"></i></a>
	<!-- jQuery first, then Tether, then Bootstrap JS. -->
	<script src="js/plugins/plugins.js"></script>
	<script src="js/assan.custom.js"></script>
	<script type="text/javascript" src="js/appUi-custom.js"></script>
</body>
</html>
