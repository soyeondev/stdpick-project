<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>카페등록</title>
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
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet">

																																<!--  새로 추가된 파일-->
<!-- Material Design Bootstrap -->
<link href="MDB/css/mdb.min.css" rel="stylesheet">
<style type="text/css">
		h2 {
			text-align: left;
		}
		
		table, td {
			text-align: left;
			border: 1px solid white;
			border-collapse: collapse;
			margin-left: 30%;
			margin-right: 30%;
			font-size: 10pt;
			font-weight: bold;
			position: relative;
		}
		
		* {
			text-align: center;
			margin: 2px;
		}
		
		.title_box {
			margin-left: 270px;
			margin-right: 270px;
			border: 1px solid white;
			font-weight: bold;
			color: grey;
			font-size: 11.5pt;
			padding: 3px;
		}
		
		.item_checkbox{
			margin-left: 270px;
			margin-right: 270px;
			border: 1px solid white;
			font-weight: bold;
			color: grey;	
			padding: 3px;
		}
		
		.notice_box, .cafe_info_box, .policy_box,{
			margin: 10px;
		}
		
		input {
			margin: 1px;
			text-align: left;
			border: 1px solid white;
			outline-color: #d5deeb;
		}
		
		input::placeholder {
			color: #94b8f2;
			font-weight: bold;
		}
		
		textarea::placeholder {
			color: #bbd0ed;
			padding-top: 20px;
			outline-color: #d5deeb;
		}
		
		textarea:hover, textarea:focus {
			outline-color: #769ddb;
		}
		
		#btn {
			text-align: center;
		}
		
		#i-plus, #i-minus {
			color: black;
			font-weight: bold;
		}
		
		#txt, .card-body {
			resize: none;
		}
		
		#file {
			display: none;
		}
		
		#btnInsert:hover {
			color: white !important;
																				/*important가 추천방법은 아니라고 하니 추후 css 커스텀만들게 되면 mdb와 아싼키트 버튼수정하기*/
		}
		
		#input_second {
			margin-left: 0px;
			margin-right: 250px;
		}
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.6.1.min.js"></script>
<script type="text/javascript">
	
	/*체크박스 개수 초과시 알림창*/
	function allCheckedAlert(){
	    alert('4개를 모두 선택하셨습니다.');
	};

	/*파일첨부를 위한 함수 - 파일경로 받아올거얌*/
	function changeValue(obj) {
		alert(obj.value);
	};

	$(function() {

		var tr;
		var td, td1, td2;
		var inputs, inputs1, inputs2;

		var cnt = 0, cnt_chk_box=0;
		var time;
	
		/*checkBox기능*/
		$("input:checkbox").change(function(){			
	        if($("input:checkbox").is(":checked")){
	        	cnt_chk_box++;
	        	if(cnt_chk_box == 4){
/*데이터에 저장하기 배열같이 어디 담아둘까? -1018-*/		
	        		$("input:checkbox").attr("disabled", true); //비활성화
	        		allCheckedAlert();
	        	}
	        	
	        	}else{	            
	            	cnt_chk_box--;
	        };
	    });

		/*textarea::placeholder 전체 그림자적용*/
		$(".zoe_txt").addClass("z-depth-1");

		/* 파일첨부 에 관한 처리*/
		$('#btn-upload').click(function(e) {
			e.preventDefault();
			$('#file').click();
		});

		//----------------------------------

		$("#addPass").click(function() {
			time = new Date().toLocaleTimeString();
			
			tr = $("<tr></tr>").addClass("animated fadeInDown");
			td1 = $("<td></td>");
			td2 = $("<td></td>");

			var pass_td_inner_1 = "이용권명&nbsp;&nbsp;";
			var pass_attr_1 = "ex) @시간이용권";
			inputs1 = document.createElement("input");
			$(inputs1).attr({
				type : "text",
				placeholder : pass_attr_1

			});

			td1.html(pass_td_inner_1);
			td1.append(inputs1);

			var pass_td_inner_2 = "이용권 가격&nbsp;&nbsp;";
			var pass_attr_2 = "ex) 1700";
			inputs2 = document.createElement("input");
			$(inputs2).attr({
				type : "text",
				placeholder : pass_attr_2
			});

			td2.html(pass_td_inner_2);
			td2.append(inputs2);

			$(tr).append(td1, td2);
			$(".tb2-1 > tbody:last").append(tr);

		});

		$("#delPass").click(function() {
			//서서히 사라지는 효과 추가좀!
			$(".tb2-1 > tbody:last > tr:last").remove();
		});
		//--------------------------------------------
		$("#addRoom").click(function() {
			time = new Date().toLocaleTimeString();
			tr = $("<tr></tr>").addClass("animated fadeInDown");
			td = $("<td></td>");
			//td에 들어가는 내용--------------------
			var room_td_inner = "룸&nbsp;명 &nbsp;&nbsp;&nbsp;";
			var room_attr = "ex) Room 4";

			inputs = document.createElement("input");
			$(inputs).attr({
				type : "text",
				placeholder : room_attr
			});

			td.html(room_td_inner);
			td.append(inputs);

			$(tr).append(td);
			$(".tb2-2 > tbody:last").append(tr);

		});

		$("#delRoom").click(function() {
			//서서히 사라지는 효과 추가좀!
			$(".tb2-2 > tbody:last > tr:last").remove();
		});

		//--------------------------------------
		$("#addRoomTime").click(function() {
			time = new Date().toLocaleTimeString();
			tr = $("<tr></tr>").addClass("animated fadeInDown");
			;
			td1 = $("<td></td>");
			td2 = $("<td></td>");

			var roomTime_td_inner_1 = "룸시간 설정&nbsp;&nbsp;";
			var roomTime_attr_1 = "ex) 09:00 ~ 10:00";
			inputs1 = document.createElement("input");
			$(inputs1).attr({
				type : "text",
				placeholder : roomTime_attr_1,

			});

			td1.html(roomTime_td_inner_1);
			td1.append(inputs1);

			var roomTime_td_inner_2 = "시간당 금액&nbsp;&nbsp;";
			var roomTime_attr_2 = "ex) 1700";
			inputs2 = document.createElement("input");
			$(inputs2).attr({
				type : "text",
				placeholder : roomTime_attr_2
			});

			td2.html(roomTime_td_inner_2);
			td2.append(inputs2);

			$(tr).append(td1, td2);

			$(".tb2-3 > tbody:last").append(tr);

		});

		$("#delRoomTime").click(function() {
			//서서히 사라지는 효과 추가좀!
			$(".tb2-3 > tbody:last > tr:last").remove();
		});
		//----------------------------------------

		//<등록> 버튼 이벤트 
		$("#btnInsert").click(function() {
			var check = confirm("신규 카페가 추가되었습니다.");
			if (check == true) {
				$(location).attr("href", "listCafe.do"); //카페목록으로 이동/혹은 사마페로 이동--------------------통합시 처리요망
			}

		});
		//<취소> 버튼 이벤트
		$("#btnCls").click(function() {

			var check = confirm("카페 등록을 취소하시겠습니까?");
			if (check == true) {
				$(location).attr("href", "listCafe.do"); //카페목록으로 이동/혹은 사마페로 이동--------------------통합시 처리요망
			}

		});

	});
</script>
</head>

<body>

	<!-- Pushy Menu -->
	<aside class="pushy pushy-right">
		<div class="cart-content">
			<div class="clearfix">
				<a href="javascript:void(0)" class="pushy-link text-white-gray">Close</a>
			</div>
			<ul class="list-unstyled">
				<li class="clearfix"><a href="#" class="float-left"> <img
						src="images/shop/p1.jpg" class="img-fluid" alt="" width="60">
				</a>
					<div class="oHidden">
						<span class="close"><i class="ti-close"></i></span>
						<h4>
							<a href="#">Men's Special Watch</a>
						</h4>
						<p class="text-white-gray">
							<strong>$299.00</strong> x 1
						</p>
					</div></li>
				<!--/cart item-->
				<li class="clearfix"><a href="#" class="float-left"> <img
						src="images/shop/p2.jpg" class="img-fluid" alt="" width="60">
				</a>
					<div class="oHidden">
						<span class="close"><i class="ti-close"></i></span>
						<h4>
							<a href="#">Men's tour beg</a>
						</h4>
						<p class="text-white-gray">
							<strong>$99.00</strong> x 1
						</p>
					</div></li>
				<!--/cart item-->
				<li class="clearfix"><a href="#" class="float-left"> <img
						src="images/shop/p3.jpg" class="img-fluid" alt="" width="60">
				</a>
					<div class="oHidden">
						<span class="close"><i class="ti-close"></i></span>
						<h4>
							<a href="#">Women's T-shirts</a>
						</h4>
						<p class="text-white-gray">
							<strong>$199.00</strong> x 1
						</p>
					</div></li>
				<!--/cart item-->
				<li class="clearfix">

					<div class="float-right">
						<a href="#" class="btn btn-primary">Checkout</a>
					</div>
					<h4 class="text-white">
						<small>Subtotal - </small> $49.99
					</h4>
				</li>
				<!--/cart item-->
			</ul>
		</div>
	</aside>
	<!-- Site Overlay -->
	<div class="site-overlay"></div>

	<nav
		class="navbar navbar-expand-lg navbar-light navbar-transparent bg-faded nav-sticky">
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
			<a class="navbar-brand" href="index.html"> <img
				class='logo logo-dark' style="top:-25px;" src="images/logo.png" alt=""> <img
				class='logo logo-light hidden-md-down' style="top:-20px;" src="images/logo-light.png"
				alt="">
			</a>
			<div id="navbarNavDropdown" class="navbar-collapse collapse">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item dropdown dropdown-full-width"><a
						class="nav-link" data-toggle="dropdown" href="#"
						aria-haspopup="true" aria-expanded="false"> 스투더픽 소개 </a></li>
					<li class="nav-item dropdown dropdown-full-width"><a
						class="nav-link" data-toggle="dropdown" href="#"
						aria-haspopup="true" aria-expanded="false"> 스터디카페 </a></li>
					<li class="nav-item dropdown dropdown-full-width"><a
						class="nav-link" data-toggle="dropdown" href="#"
						aria-haspopup="true" aria-expanded="false"> 스투더 </a></li>
					<li class="nav-item dropdown"><a class="nav-link"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
						href="#">맛집찾기</a></li>
					<li class="nav-item dropdown"><a class="nav-link"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
						href="#">SNS</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link  dropdown-toggle" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false" href="#">고객지원</a>
						<ul class="dropdown-menu">
							<li><a tabindex="-1" href="#" class="dropdown-item">공지사항</a>

							</li>
							<li><a tabindex="-1" href="#" class="dropdown-item">Q&A</a>

							</li>
							<li><a tabindex="-1" href="#" class="dropdown-item">프로모션</a>

							</li>
						</ul></li>
				</ul>
				<ul class="nav flex-row order-lg-2 ml-auto nav-icons">
					<li class="nav-item dropdown user-dropdown align-items-center">
						<a class="nav-link" href="#" id="dropdown-user" role="button"
						data-toggle="dropdown"> <span
							class="user-states states-online"> <img
								src="images/avatar6.jpg" width="35" alt=""
								class=" img-fluid rounded-circle">
						</span> <span class="ml-2 h-lg-down dropdown-toggle"> Hi, Bob </span>
					</a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="dropdown-user">
							<div class="text-center p-3 pt-0 b-b mb-5">
								<span class="mb-0 d-block font300 text-title fs-1x">Hi! <span
									class="font700">Sarah Taylor</span></span> <span
									class="fs12 mb-0 text-muted">Administrator</span>
							</div>
							<a class="dropdown-item" href="#"><i class="icon-User"></i>My
								Profile</a> <a class="dropdown-item" href="#"><i
								class="icon-Newspaper"></i> Tasks</a> <a class="dropdown-item"
								href="#"><i class="icon-Speach-Bubble4 "></i> Messages <span
								class="badge badge-text text-primary-active bg-primary-light ml-2">5
									New</span></a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#"><i class="icon-Gear"></i>
								Settings<span
								class="badge badge-text text-danger-active bg-danger-light ml-2">Update</span></a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="page-login.html"><i
								class="icon-Power"></i> logout</a>

						</div>
					</li>
					<li class="h-lg-up nav-item"><a href="#"
						class=" nav-link collapsed" data-toggle="collapse"
						data-target="#navbarToggler" aria-expanded="false"> <i
							class="icon-Magnifi-Glass2"></i>
					</a></li>
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
		style='background-image: url("images/wellness.jpg")'>
		<div class="container">
			<div class="row">
				<div class=" col-md-8 ml-auto mr-auto">
					<h1 class='text-uppercase'>카페등록</h1>

					<!--                                    <a href='https://www.youtube.com/watch?v=cctFcl5EFYk' class='modal-video btn btn-white-outline btn-lg btn-rounded'>Watch our film</a>
                        -->
				</div>
			</div>
		</div>
	</div>
	<!--page title end-->



	<!-- ###################################################################### -->
	<br>
	<table width="50%">
		<tr>
			<td width="-30%" rowspan="7">
				<!--  <div id="img">                  
                    <br>
                    <br>
                    <br>
                    <br>
                    <br> <input type="image" value="대표이미지">
                    버튼나오는거 보기싫어서 file 임시대체함
                </div> -->

				<div class="card text-center mb-3" style="width: 20rem;">
					<div class="card-body">
						<!-- <h5 class="card-title">사진 첨부하기</h5> -->
						<p class="card-text">
							<strong>카페사진</strong>을 선택해주세요
						</p>
						<div>
							<input type="file" id="file" name="file" multiple
								onchange="changeValue(this)" required="required" />
							<button type="button" id="btn-upload" class="btn btn-primary">첨부</button>
						</div>
						<!-- <button type="file" class="btn btn-primary">첨부</button>			 -->
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="2"><input type="text" placeholder="카페명"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="text" placeholder="카페 한줄 소개">
			</td>
		</tr>
		<tr>
			<td width="20%">위치</td>
			<td width="*"><input type="text" placeholder="ex) 서울시 마포구 백범로　"></td>
		</tr>
		<tr>
			<td width="20%">전화번호</td>
			<td width="*"><input type="text" placeholder="ex) 02-2644-2655"></td>
		</tr>
		<tr>
			<td width="20%">운영시간</td>
			<td width="*"><input type="text" placeholder="ex) 09:00 ~ 24:00"></td>
		</tr>
		<tr>
			<td width="20%">좌석수</td>
			<td width="*"><input type="text" placeholder="ex) 124석"></td>
		</tr>
	</table>
	<br>
	<div id="input_second">
		<table class="tb2-1" width="50%">
			<tr>
				<td>이용권명&nbsp;&nbsp;<input type="text" placeholder="ex) @시간이용권">
				</td>
				<td>이용권 가격&nbsp;&nbsp;<input type="text" placeholder="ex) 1700"></td>
				<!--			<td width="1%"><input type="button" id="addPass"></td>			-->
				<!--            <td width="1%"><input type="image" onClick="addPass()" src="images/plus.jpg" id="addPass"></td>			-->
				<!--            <td width="1%"><i class="ti-plus"><input type="button" id="addPass"></i></td>-->
				<td width="1%"><a href="javascript:void(0);" id="addPass"
					onclick="return false;"><i class="ti-plus" id="i-plus"></i></a></td>
				<td width="1%"><a href="javascript:void(0);" id="delPass"
					onclick="return false;"><i class="ti-minus" id="i-minus"></i></a></td>

			</tr>
			<!-- 버튼 눌리면 동적 처리 -->
			<tbody></tbody>

		</table>
		<br>
		<table class="tb2-2" width="50%">
			<tr id="firstTr">
				<td width="80%">룸&nbsp;명 &nbsp;&nbsp;&nbsp;<input type="text"
					placeholder="ex) Room 4">
				</td>
				<td width="1%"><a href="javascript:void(0);" id="addRoom"
					onclick="return false;"><i class="ti-plus" id="i-plus"></i></a></td>
				<td width="1%"><a href="javascript:void(0);" id="delRoom"
					onclick="return false;"><i class="ti-minus" id="i-minus"></i></a></td>
			</tr>
			<tbody></tbody>
			<!-- 버튼 눌리면 동적 처리 -->

		</table>
		<br>
		<table class="tb2-3" width="50%">
			<tr>
				<td>룸시간 설정&nbsp;&nbsp;<input type="text"
					placeholder="ex) 09:00 ~ 10:00">
				</td>
				<td>시간당 금액&nbsp;&nbsp;<input type="text" placeholder="ex) 1700"></td>
				<td width="1%"><a href="javascript:void(0);" id="addRoomTime"
					onclick="return false;"><i class="ti-plus" id="i-plus"></i></a></td>
				<td width="1%"><a href="javascript:void(0);" id="delRoomTime"
					onclick="return false;"><i class="ti-minus" id="i-minus"></i></a></td>
			</tr>
			<!-- 버튼 눌리면 동적 처리 -->
			<tbody></tbody>

		</table>
	</div>
	<br>
	<div class="title_box">카페설명</div>
		<div class="cafe_info_box">
		
 	 		<div class="card-body">
			    <h5 class="card-title"><i class="fa fas fa-check-square"></i>카페의 특징을 선택해주세요!</h5>
			    <h6 class="card-subtitle mb-2 text-muted">( 항목은 4가지로 제한됩니다. )</h6>
<!-- 체크박스 시작-->
			<div class="item_checkbox">
			<div class="custom-control custom-checkbox custom-control-inline">
				<input type="checkbox" class="custom-control-input"
					id="checkbox_1" name="wifi"> <label class="custom-control-label"
					for="checkbox_1">와이파이</label>
			</div>		
			<div class="custom-control custom-checkbox custom-control-inline">
				<input type="checkbox" class="custom-control-input"
					id="checkbox_2" name="toilet"> <label class="custom-control-label"
					for="checkbox_2">화장실</label>
			</div>		
			<div class="custom-control custom-checkbox custom-control-inline">
				<input type="checkbox" class="custom-control-input"
					id="checkbox_3" name="laptop"> <label class="custom-control-label"
					for="checkbox_3">노트북</label>
			</div>
			<div class="custom-control custom-checkbox custom-control-inline">
				<input type="checkbox" class="custom-control-input"
					id="checkbox_4" name="keyboard&mouse"> <label class="custom-control-label"
					for="checkbox_4">키보드/마우스</label>
			</div>
			<div class="custom-control custom-checkbox custom-control-inline">
				<input type="checkbox" class="custom-control-input"
					id="checkbox_5" name="desktop"> <label class="custom-control-label"
					for="checkbox_5">컴퓨터</label>
			</div>
			<div class="custom-control custom-checkbox custom-control-inline">
				<input type="checkbox" class="custom-control-input"
					id="checkbox_6" name="PCmonitor"> <label class="custom-control-label"
					for="checkbox_6">모니터</label>
			</div>
			<div class="custom-control custom-checkbox custom-control-inline">
				<input type="checkbox" class="custom-control-input"
					id="checkbox_7" name="projector"> <label class="custom-control-label"
					for="checkbox_7">프로젝터</label>
			</div>
			<div class="custom-control custom-checkbox custom-control-inline">
				<input type="checkbox" class="custom-control-input"
					id="checkbox_8" name="forGroup"> <label class="custom-control-label"
					for="checkbox_8">단체석</label>
			</div>
			<div class="custom-control custom-checkbox custom-control-inline">
				<input type="checkbox" class="custom-control-input"
					id="checkbox_9" name="cabinet"> <label class="custom-control-label"
					for="checkbox_9">개인사물함</label>
			</div>
			<div class="custom-control custom-checkbox custom-control-inline">
				<input type="checkbox" class="custom-control-input"
					id="checkbox_10" name="drinks"> <label class="custom-control-label"
					for="checkbox_10">음료제공</label>
			</div>
			<div class="custom-control custom-checkbox custom-control-inline">
				<input type="checkbox" class="custom-control-input"
					id="checkbox_11" name="restrictedAccess"> <label class="custom-control-label"
					for="checkbox_11">출입통제</label>
			</div>
			<div class="custom-control custom-checkbox custom-control-inline">
				<input type="checkbox" class="custom-control-input"
					id="checkbox_12" name="membership"> <label class="custom-control-label"
					for="checkbox_12">맴버쉽</label>
			</div>
			<div class="custom-control custom-checkbox custom-control-inline">
				<input type="checkbox" class="custom-control-input"
					id="checkbox_13" name="kiosk"> <label class="custom-control-label"
					for="checkbox_13">무인결제</label>
			</div>
			<div class="custom-control custom-checkbox custom-control-inline">
				<input type="checkbox" class="custom-control-input"
					id="checkbox_14" name="cctv"> <label class="custom-control-label"
					for="checkbox_14">CCTV</label>
			</div>
			<div class="custom-control custom-checkbox custom-control-inline">
				<input type="checkbox" class="custom-control-input"
					id="checkbox_15" name="notification"> <label class="custom-control-label"
					for="checkbox_15">알림서비스</label>
			</div>
			<div class="custom-control custom-checkbox custom-control-inline">
				<input type="checkbox" class="custom-control-input"
					id="checkbox_16" name="24hours"> <label class="custom-control-label"
					for="checkbox_16">24시간</label>
			</div>
			</div>
<!-- 체크박스 끝-->
  </div>
		</div>
	
	<div class="cafe_info_box">
		<textarea class="zoe_txt" id="txt_cafe_info" name="txt_cafe_info"
			rows="3" cols="150" placeholder="이용관련공지"></textarea>
	</div>


	<div class="cafe_info_box">
		<textarea class="zoe_txt" id="txt" rows="4" cols="150"
			placeholder="업체정보"></textarea>
	</div>

	<div class="title_box">취소/환불규정</div>

	<div class="notice_box">
		<textarea class="zoe_txt" id="txt" rows="5" cols="150"
			placeholder="상품정보 제공고시" name="txt"></textarea>
	</div>

	<div class="policy_box">
		<textarea class="zoe_txt" id="txt" name="txt" rows="5" cols="150"
			style="color: gray">	
        1. STD인사이트 모든 강좌는 강좌 시작일 5일 이전까지 취소 시에는 전액 환불이 가능합니다.
            단, 강좌 시작일 3일전까지 취소 시 50% 환불이 가능하며,그 이후와 강좌 당일 취소 시 환불 불가 (단, 지인에게 양도 가능)합니다.

            예시) 강좌 시작일이 2015년 3월 6일 (금) 일 경우,
            3월 1일 이전까지 취소 신청시 : 전액 환불 (결제수단에 따라 취소 수수료,부가세 발생가능)
            3월 3일까지 취소 신청시 : 50% 환불 (결제수단 관계없이 취소 수수료, 부가세 SD인사이트가 부담)
            3월 4일~3월 6일 강좌  당일 취소 신청 시 : 환불 불가 (지인에게 양도 가능)
            
            2. 결제 수단에 따라 취소 수수료와 부가세 발생 
            (STD인사이트 ‘결제수단별 취소 수수료, 부가세 부과 안내’ 참고)
            강좌 시작일 5일 이전까지 취소 시 전액 환불이 가능하지만 이 경우에도
            실시간 계좌이체와 가상계좌를 통해 결제하신 경우는 PG사 매입기준에 따라
            전액 환불금에서 취소수수료와 10% 부가세를 제외하고 환불해 드립니다.  
            신용카드와 무통장 입금은 취소 시 취소수수료와 10% 부가세가 발생하지 않습니다. 
            강좌 시작일 3일 전까지 취소 신청하여 50% 환불 처리 하는 경우,
            결제 수단에 관계없이 취소 수수료와 부가세는 SD인사이트가부담합니다. 
            3. 주최측 사정으로 인한 강좌 폐강 혹은 강좌 취소 시에는 100% 환불하여 드립니다. 		
		</textarea>
	</div>
	<br>


	<div id="btn">
		<button id="btnCls" class="btn btn-light">취소</button>
		<button id="btnInsert" class="btn btn-outline-primary mb5">등록</button>
	</div>
	<br>
	<!-- ###################################################################### -->

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
</body>
</html>
