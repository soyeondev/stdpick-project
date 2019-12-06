<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<style type="text/css">
body {
	color: black;
	position: relative;
}

#all_content {
	display: grid;
	grid-template-columns: 60% 40%;
}

/**/
#img_section {
	height: 500px;
}

/**/
#sns_section {
	border: 1px solid #999999;
	/*background-color: blue;*/
	height: 500px;
}

#scroll_section {
	overflow: scroll;
	overflow-x: hidden;
	height: 70%;
}

#picker_section {
	display: block;
	vertical-align: middle;
	/*background-color: green;*/
}

/**/
#picker_info1 {
	display: block;
	padding: 7px;
}

#picker_info2 {
	display: block;
	padding: 7px;
}

#w_picker_img1 {
	display: inline;
	vertical-align: middle;
	/*background-color: yellow;*/
}

#w_picker_nick1 {
	padding: 10px;
	display: inline;
	vertical-align: middle;
	/*background-color: orange;*/
}

#w_picker_img2 {
	display: inline;
	vertical-align: middle;
	/*background-color: yellow;*/
}

#w_picker_nick2 {
	padding: 10px;
	display: inline;
	vertical-align: middle;
	/*background-color: orange;*/
}

#a_follow {
	margin-left: 10px;
	display: inline;
	text-decoration: none;
	color: #4782d3;
}

/**/

#content_info {
	display: block;
	margin-top: 3px;
}

#write_content{
	width: 98%; 
	border: 0; 
	background: clear;
}


#write_date {
	padding-left: 60px;
	color: #999999
}

/**/
#reply_section {
	display: block;
	padding-left: 10px;
	padding-right: 10px;
	padding-top: 10px;
	margin-bottom: 10px;
}


/**/
#bottom_section{
	height: 5px;
}

#icons{
	display: inline; 
	vertical-align: middle; 
	color: #777;
}

#howmanylikes{
	vertical-align: super;
}


#btnLike{
	border: none;
	background: none;
}

#reply_section{
	padding-right: 5px; 
	margin-top: -10px;
	vertical-align: middle;
}

#new_reply_section{
	padding-left: 10px; 
	margin-top: -10px;
	vertical-align: middle;
}

#new_reply_content{
	width:330px; 
	border-radius:5px;
}

#btnInsert{
	padding-left: 30px;
}

/**/

.maintext { 
	padding-left: 60px; 
	padding-right: 60px;
}


.profile {
	width: 40px;
	height: 40px;
	object-fit: cover;
	object-position: top;
	border-radius: 50%;
}

.w_nickname {
	display: inline;
}

.contour {
	width: 100%;
	margin: 0px;
	position: static;
}

.fa {
	padding: 10px;
}

.oneanswer {
	padding-top: 20px;
}

.re_picker_img {
	display: inline;
	padding-right: 10px;
}

.re_picker_nick {
	display: inline;
	padding-right: 20px;
	font-size: 16px;
}

.re_content {
	display: inline;
}

.re_write_date {
	color: #999999;
	padding-left: 55px;
	margin-top: -5px;
}
</style>
</head>
<body>
	<div id="all_content">
		<!--이미지부분-->
		<div id="img_section">
			<ul class="bxslider">
			</ul>
		</div>
		<!--내용부분-->
		<div id="sns_section">
			<!-- 상단 작성자 정보  -->
			<div id="picker_section">
				<div id="picker_info1">
					<div id="w_picker_img1"></div>
					<div id="w_picker_nick1" align="left"></div>
				</div>
			</div>
			<hr class="contour">
			<!-- 스크롤바 지원 부분 -->
			<div id="scroll_section">
				<!-- sns 본문 부분 -->
				<div id="content_info">
					<div id="sns_content">
						<!-- 본문 작성자 정보 -->
						<div id="picker_info2">
							<div id="w_picker_img2"></div>
							<div id="w_picker_nick2" align="left"></div>
						</div>
						<!-- 본문 내용 -->
						<div id="textcontent">
							<div id="write_content"></div>
							<div id="write_date"></div>
						</div>
					</div>
				</div>
				<!-- 답글 부분 -->
				<div id="reply_section">
				</div>
			</div>
			<hr class="contour">
			<!--하단고정부분-->
			<div id="bottom_section">
				<div id="icons"></div>
				<div id="new_reply_section">
					<input type="text" id="new_reply_content" name="new_reply_content">&nbsp;
					<button class="btn btn-primary btn-sm mr-1 mb-2" id="btnInsert" name="btnInsert">작성</button> 
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" id="sns_no" name="sns_no" value="${sns_no}">
	<!-- 로그인한 계정 정보 (고객이 아닌 경우 cust_no =0 / 사업자가 아닌경우 provider_no =0) -->
	<c:if test="${loginVo.role eq 'customer' }">
		<input type="hidden" id="login_cust_no" name="login_cust_no" value="${loginVo.no }">
		<input type="hidden" id="login_pro_no" name="login_pro_no" value="0">
	</c:if>
	<c:if test="${loginVo.role eq 'provider'}">
		<input type="hidden" id="login_cust_no" name="login_cust_no" value="0">
		<input type="hidden" id="login_pro_no" name="login_pro_no" value="${loginVo.no }">
	</c:if>
	
	

	<script src="js/plugins/plugins.js"></script>
	<script src="js/assan.custom.js"></script>
	<script src="admin-dashboardUi/js/appUi-custom.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
	<script type="text/javascript">
	<!--페이지 뽑아오기-->
	$(function() {
		var sns_no = $("#sns_no").val();
		var login_cust_no = $("#login_cust_no").val();
		var login_pro_no = $("#login_pro_no").val();
		
		var cust_no;
		var provider_no;
		
		var cust_img; 
		var cust_nick;
		var pro_img;
		var pro_nick;
		
		var cu;
		var p;
		
		var count_like;
		var result;
		var isClicked; 
		
		/*SNS 가져오기*/	
		function getSNS() {
			$("#w_picker_nick1").empty();
			$("#w_picker_img1").empty();
			$("#w_picker_nick2").empty();
			$("#w_picker_img2").empty();
			
			$("#write_content").empty();
			$("#write_date").empty();
			
			$.ajax({
				url : "getSNS.do",
				data: {"sns_no":sns_no},
				success : function(data) {
					var arr = eval("(" + data + ")");			
					cust_no = arr.cust_no;
					provider_no = arr.provider_no;									
					var a;
					var h4;				
					var font;
					var img; 
					
					/*작성자가 사업주일때*/
					if(cust_no == 0) {
						getProvInfo(provider_no);
						
						a = $("<a></a>");
						
						$(a).click(function() {
							parent.location.href = "snsMyPageView.do?cust_no=-1&provider_no=" + provider_no;
						});
						
						h4 = $("<h4 class='w_nickname'></h4>").html(pro_nick);
						font = $("<font class='w_nickname'></font>").html(pro_nick);
						img1 = $("<img class='profile'/>").attr({"src" : "prov_img/" + pro_img}); 
						img2 = $("<img class='profile'/>").attr({"src" : "prov_img/" + pro_img}); 
						
						$(a).append(h4);
						
						$("#w_picker_nick1").append(a)
						$("#w_picker_nick2").append(font);
						$("#w_picker_img1").append(img1);
						$("#w_picker_img2").append(img2);
						
					/*작성자가 일반 고객일때*/
					} else {
						getCustInfo(cust_no);
						
						a = $("<a></a>");
						
						$(a).click(function() {
							parent.location.href = "snsMyPageView.do?cust_no="+cust_no+"&provider_no=-1"
						});
						
						h4 = $("<h4 class='w_nickname'></h4>").html(cust_nick);
						font = $("<font class='w_nickname'></font>").html(cust_nick);
						img1 = $("<img class='profile'/>").attr({"src" : "cust_img/" + cust_img}); 
						img2 = $("<img class='profile'/>").attr({"src" : "cust_img/" + cust_img}); 
						
						$(a).append(h4);
						
						$("#w_picker_nick1").append(a)
						$("#w_picker_nick2").append(font);
						$("#w_picker_img1").append(img1);
						$("#w_picker_img2").append(img2);
					}
					
					var p = $("<p class='maintext'></p>").html(arr.sns_content);
					$("#write_content").append(p);
					
					var strong2 = $("<strong></strong>").html(arr.sns_write_date);
					$("#write_date").append(strong2);
			}			
		});
	}
		
		/*sns 태그 가져오기*/
		function getSNSTag(){
			$("#write_content").empty();
			$.ajax({
				url : "getSNSTag.do",
				data: {"sns_no":sns_no},
				success : function(data) {
					
					var arr = eval("(" + data + ")");
					var p = $("<p class='maintext'></p>");
					
					$.each(arr, function(idx, st) {		
						var a = $("<a></a>").html("#"+st.tag_name).attr({"href" : "/listAllSns.do?keyword=" + st.tag_name});; 
						
						if(idx == (arr.length-1) ){
							$(p).append(a);
						} else {					
							$(p).append(a, ", ");
						}
						
					});
					
					$("#write_content").append("<br>",p);
				}
			});
			
		}	
		
		/*박스 슬라이더 설정*/
		function setImg () {
			$('.bxslider').bxSlider({
				speed : 1500,
				pause : 5000,
				mode : 'horizontal',
				autoControls : false,
				adaptiveWidth : true,
			});
		}
		
		/*이미지 가져오기*/
		function getSNSImg(){
			$.ajax({
				url : "getSNSImg.do",
				data: {"sns_no":sns_no},
				success : function(data) { 
					var arr = eval("(" + data + ")");
					$.each(arr, function(idx, si) {
						var li = $("<li></li>")
						var img = $("<img width='100%' height='440px'/>")
								.attr({"src" : "images/img_sns/" + si.sns_img_name});
						$(li).append(img);
						$(".bxslider").append(li);
						
						
					});
					
					setImg();
				}
			});	
		}

		
		/*답글 가져오기*/
		function getSNSReply(){
			$("#reply_section").empty();
			
			$.ajax({
				url : "getSNSReply.do", 
				data: {"sns_no":sns_no},
				success : function(data) {
					var arr = eval("(" + data + ")");
					
					$.each(arr, function(idx, sr) {		
						var re_cust_no=0;
						var re_provider_no=0;
						
						re_cust_no = sr.cust_no;
						re_provider_no = sr.provider_no;	
						
						var re_cust_img; 
						var re_cust_nick;
						var re_pro_img;
						var re_pro_nick;
						
						var div1= $("<div class='oneanswer'></div>");
						var div2 = $("<div class='re_picker_img'></div>");
						var div3 = $("<div class='re_picker_nick'></div>");
						var div4 = $("<div class='re_content'></div>");	
						var div5 = $("<div class='re_write_date'></div>");	
						
						var img; 						
						var font1;
						var font2;
						var strong;
						
						var a;
						
						/*댓글 작성자가 사업주일때*/
						if(re_cust_no == 0) {
							getReProvInfo (re_provider_no);
							
							re_pro_nick = p.pro_nick;
							re_pro_img = p.pro_img;
							
							a = $("<a style='text-decoration:none;color:#000000;'></a>");
							
							$(a).click(function() {
								parent.location.href = "snsMyPageView.do?cust_no=-1&provider_no=" + re_provider_no;
								
							});
							
							
							
							img = $("<img class='profile'/>").attr({"src":"prov_img/"+re_pro_img});
							font1 = $("<font class='w_nickname'></font>").html(re_pro_nick);	
							
						/*댓글 작성자가 일반 고객일때*/
						} else {
							getReCustInfo (re_cust_no);
							
							re_cust_nick = cu.cust_nick;
							re_cust_img = cu.cust_img;
							
							a = $("<a style='text-decoration:none;color:#000000;'></a>");
							
							$(a).click(function() {
								parent.location.href = "snsMyPageView.do?cust_no="+re_cust_no+"&provider_no=-1";
								
							});
							
							img = $("<img class='profile'/>").attr({"src":"cust_img/"+re_cust_img});
							font1 = $("<font class='w_nickname'></font>").html(re_cust_nick);
							
						}
						
						font2 = $("<font></font>").html(sr.reply_content);
						strong = $("<strong><strong>").html(sr.reply_write_date);
						
						$(a).append(font1);
						
						$(div2).append(img);
						$(div3).append(a);
						$(div4).append(font2);
						$(div5).append(strong);

						$(div1).append(div2,div3,div4,div5);
						$("#reply_section").append(div1);
									
					});
				}
			});		
		}
		
		/*좋아요를 눌렀는지 확인하는 함수*/
		function getIsClicked(){
			$.ajax({
				url : "getIsClicked.do", 
				data: {"sns_no":sns_no, "cust_no":login_cust_no, "provider_no":login_pro_no}, async:false,
				success : function(data) {
					isClicked = data;					
				}
			});				
		}
		
		/*꽉찬하트로 변경하는 함수*/
		function fullHeart (){
			$("#heart").removeClass("fa fa-heart-o fa-2x");
			$("#heart").addClass("fa fa-heart fa-2x");
		}
		
		/*빈 하트로 변경하는 함수*/
		function hollowHeart (){
			$("#heart").removeClass("fa fa-heart fa-2x");
			$("#heart").addClass("fa fa-heart-o fa-2x");	
		}
		
		/*경우에 따라 하트를 변경하는 함수 */
		function setHeart(){
			/*좋아요를 눌렀을 경우*/
			if(isClicked >0) {	
				setSNSLike();
				fullHeart();		
			
			/*좋아요를 누르지 않았을 경우*/
			} else {		
				setSNSLike();
				hollowHeart();	
			} 
		}
		
		/*좋아요를 추가하는 함수*/
		function insertSNSLike(){
			$.ajax({
				url : "insertSNSLike.do",
				data: {"sns_no":sns_no, "cust_no":login_cust_no, "provider_no":login_pro_no}, async:false,
				success : function(data) {
					fullHeart ();
				}
			});		
		}
		
		/*좋아요를 취소하는 함수 */
		function deleteSNSLike (){
			$.ajax({
				url : "deleteSNSLike.do",
				data: {"sns_no":sns_no, "cust_no":login_cust_no, "provider_no":login_pro_no}, async:false,
				success : function(data) {
					hollowHeart ();
				}
			});	
		}		
		
		/*좋아요 수를 가져오는 함수   */
		function getSNSLike (){
			$.ajax({
				url : "getSNSLike.do", 
				data: {"sns_no":sns_no}, async:false,
				success : function(data) {
					count_like = data;					
				}
			});			
		}
		
		/*좋아요 부분을 화면에 설정하는함수   */
		function setSNSLike(){
			$("#icons").empty();
			
			getSNSLike();		
			var icon = $("<i id='heart'class='fa fa-heart-o fa-2x' aria-hidden='true'></i>");	
			var btn = $("<button id='btnLike'></button>").html(icon);
			
			var font = $("<font id='howmanylikes'></font>").html("&nbsp;&nbsp;"+ count_like+"명이 좋아합니다.");
			$("#icons").append(btn,font);			
			
			$("#btnLike").click(function(){	
				if(isClicked >0) {	
					deleteSNSLike();
					getIsClicked();
					setSNSLike();
					setHeart();
				} else {		
					insertSNSLike();
					getIsClicked();
					setSNSLike();
					setHeart();
				}		
			});
			
			if(isClicked >0) {
				$("#btnLike").hover(function(){
					hollowHeart();
				},function(){					
					fullHeart();
				});	
			} else {
				$("#btnLike").hover(function(){
					fullHeart();
				},function(){		
					hollowHeart();
				});	
			} 
		}
		

		/*고객 정보 가져오는 함수  */		
		function getCustInfo (cust_no){
			$.ajax({
				url : "getCustInfo.do",
				data: {"cust_no":cust_no}, async:false,
				success : function(data) {
					var arr = eval("(" + data + ")");
					cust_nick = arr.cust_nick;
					cust_img = arr.cust_img;
				}
			});			
		}
		
	
		/*사업자 정보 가져오는 함수  */
		function getProvInfo (provider_no){
			$.ajax({
				url : "getProvInfo.do", 
				data: {"provider_no":provider_no}, async:false,
				success : function(data) {
					var arr = eval("(" + data + ")");
					pro_nick = arr.pro_nick;
					pro_img = arr.pro_img;
				
				}
			});			
		}
	
		/*댓글 고객 정보 가져오는 함수  */		
		function getReCustInfo (re_cust_no){
			$.ajax({
				url : "getCustInfo.do",
				data: {"cust_no":re_cust_no}, async:false,
				success : function(data) {
					cu = eval("(" + data + ")");
					return cu;
				}
			});			
		}
		
	
		/*댓글 사업자 정보 가져오는 함수  */
		function getReProvInfo (re_provider_no){
			$.ajax({
				url : "getProvInfo.do", 
				data: {"provider_no":re_provider_no}, async:false,
				success : function(data) {
					p = eval("(" + data + ")");
					return p;
					
				}
			});			
		}
	
	/** 자동으로 실행되는 부분 **/
	getSNS();	
	getSNSTag();
	getSNSImg();
	getSNSReply();
		
	getIsClicked(); 	
	setSNSLike();
	setHeart();	
	
	$("#btnInsert").click(function(){			
		var reply_content = $("#new_reply_content").val();
			
		if(reply_content != null && reply_content != ""){
			
			$.ajax({
				url : "insertSNSReply.do", 
				data: {"sns_no":sns_no, "cust_no":login_cust_no,
						"provider_no":login_pro_no, "reply_content":reply_content}, async:false,
				success : function(data) {
					result = data;			
					if(result > 0) {				
						$('#new_reply_content').val('');
						getSNSReply();				
					} else {
						$('#new_reply_content').val('');
						getSNSReply();	
					}
				}
			});	
				
		} else {
			alert("내용을 입력하세요.");
		}});	
	})
	</script>
	<script type="text/javascript">
	</script>
</body>
</html>