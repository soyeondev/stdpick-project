
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
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
          <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
		  <!-- Bootstrap core CSS -->
		  <link href="MDB/css/bootstrap.min.css" rel="stylesheet">
		  <!-- Material Design Bootstrap -->
		  <link href="MDB/css/mdb.css" rel="stylesheet">
		  <!-- Your custom styles (optional) -->
		  <link href="MDB/css/style.css" rel="stylesheet">
        
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
		
	<%String kakaoid= request.getParameter("kakaoid"); %>
	<c:set value="${param.kakaoid}" var="kakaoid"/>
		
		<script type="text/javascript">
		
		
		var ch_flag = {"id": false, "nick": false};
		
		$(document).ready(function(){
			$("#resetBtn").click(function(){
				ch_flag = {"id": false, "nick": false};
			})
		});
		
		function check1()	{
			var temp = $("#cust_nick").val();

			  $.ajax({		             
		            type : "POST",
		            url : "check_nick.do",
		            data : { "cust_nick" : temp},
		            error : function(error){
		                alert('통신실패!!'+error);
		            },
		            success : function(data){
		            	if(data=="F")	{
		            		alert("이미 존재하는 닉네임 입니다. 다른 닉네임을 사용해 주세요.");
		            	} else if(data=="S") {
		            		alert("사용 가능한 닉네임입니다.");
		            		ch_flag.nick = true;
		            	}
		            }
		        });
			}
		
		<c:if test="${null eq kakaoid}">
		function check2()	{
			var temp = $("#id").val();

			  $.ajax({		             
		            type : "POST",
		            url : "check_id.do",
		            data : { "id" : temp},
		            error : function(error){
		                alert('통신실패!!'+error);
		            },
		            success : function(data){
		            	if(data=="F")	{
		            		alert("이미 존재하는 아이디 입니다. 다른 아이디를 사용해 주세요.");
		            	} else if(data=="S") {
		            		alert("사용 가능한 아이디 입니다.");
		            		ch_flag.id = true;
		            	}
		            }
		        });
			}
		  </c:if>

		   function check(re, what, message) {
		       if(re.test(what.value)) {
		           return true;
		       }
		       alert(message);
		       what.value = "";
		       what.focus();
		       //return false;
		   }
		 
		function goSubmit()	{
			
			var re = /^[a-zA-Z0-9]{4,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
				
			var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			// 이메일이 적합한지 검사할 정규식

			var email = document.getElementById("email");
						
			<c:if test="${null eq kakaoid}">

			var id = document.getElementById("id");
			var pwd = document.getElementById("pwd");
			if(!check(re,id,"아이디는 4~12자의 영문 대소문자와 숫자로만 입력")) {
		           return false;
		       }

		    if(!check(re,pwd,"패스워드는 4~12자의 영문 대소문자와 숫자로만 입력")) {
		           return false;
		       }

		    if(frm.pwd.value != frm.pwd1.value) {
		           alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
		           frm.pwd1.value = "";
		           frm.pwd1.focus();
		           return false;
		       }
		    </c:if>

		     if(email.value=="") {
		           alert("이메일을 입력해 주세요");
		           email.focus();
		           return false;
		       }

		     if(!check(re2, email, "적합하지 않은 이메일 형식입니다.")) {
		           return false;
		       }

		     if(frm.cust_name.value=="") {
		           alert("이름을 입력해 주세요");
		           frm.cust_name.focus();
		           return false;
		       }
		     
		     if(frm.cust_info.value=="") {
		           alert("자기소개를 적어주세요");
		           frm.cust_info.focus();
		           return false;
		       }
		     
		     <c:if test="${null eq kakaoid}">
		     if(ch_flag.id == false) {
		    	 alert("아이디 중복 여부를 확인해 주세요.")
		    	 return false;
		     }
		     </c:if>
		     
		     if(ch_flag.nick == false) {
		    	 alert("닉네임 중복 여부를 확인해 주세요.")
		    	 return false;
		     }
			
			frm.submit();
		}

		</script>
		<script type="text/javascript">
			$(function(){
				$("#btnReset").hide();
				document.getElementById("upload").onchange = function () {
				    var reader = new FileReader();

				    reader.onload = function (e) {
				        // get loaded data and render thumbnail.
				        document.getElementById("image").src = e.target.result;
				    };

				    // read the image file as a data URL.
				    reader.readAsDataURL(this.files[0]);
				};
				
				function handleFileSelect(evt) {
					$("#btnReset").show();
					$("#imgs").empty();
					
				    var files = evt.target.files;

				    // Loop through the FileList and render image files as thumbnails.
				    for (var i = 0, f; f = files[i]; i++) {

				      // Only process image files.
				      if (!f.type.match('image.*')) {
				        continue;
				      }

				      var reader = new FileReader();

				      // Closure to capture the file information.
				      reader.onload = (function(theFile) {
				        return function(e) {
				          // Render thumbnail.
				          var span = document.createElement('span');
				          span.innerHTML = 
				          [
				            '<img style="position:relative; left:80px; ;width: 400px; height:400px; border: 0px solid gray; margin: 5px" src="', 
				            e.target.result,
				            '" title="', escape(theFile.name), 
				            '"/>'
				          ].join('');
				          
				          document.getElementById('list').insertBefore(span, null);
				        };
				      })(f);

				      // Read in the image file as a data URL.
				      reader.readAsDataURL(f);
				    }
				  }

				  document.getElementById('upload').addEventListener('change', handleFileSelect, false);
				
				$("#selPro").click(function(){
					
					$("#upload").trigger('click');
				
				})
			})
			
			function resetClick() {
				$("#imgs").empty();
				$("#btnReset").hide();
				var img = $('<img alt="" src="images/selProfile.png" id="selPro" width ="600px!important" style="cursor: pointer;">');
				
				$(img).click(function(){
					
					$("#upload").trigger('click');
				});$()
				
				$("#imgs").append(img);
		
				$("#list").empty();
			}
			
			
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
                            <a class="nav-link" href="intro"><font style="color: gray;">스투더픽 소개</font></a>
                           
                        </li>
                        <li class="nav-item dropdown dropdown-full-width">
                            <a class="nav-link" href="cafeList1.do" aria-haspopup="true" aria-expanded="false">
                            <font style="color: gray;">    스터디카페</font>
                            </a>
                   
                        </li>
                        <li class="nav-item dropdown dropdown-full-width">
                            <a class="nav-link" href="listStd.do" aria-haspopup="true" aria-expanded="false">
                                <font style="color: gray;">스투더  </font>
                            </a>
                       
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link" aria-haspopup="true" aria-expanded="false" href="diningSch"><font style="color: gray;">맛집찾기</font></a>
                      
                        </li>
                        <li class="nav-item dropdown">
                        <c:if test="${!empty loginVo }">
                        	<c:choose>
                        		<c:when test="${loginVo.role eq 'customer' }">
                        			<a id="SNS" class="nav-link" aria-haspopup="true" aria-expanded="false" href="snsMyPageView.do?cust_no=${loginVo.no }&provider_no=-1" ><font style="color: gray;">SNS</font></a>
                        		</c:when>
                        		<c:otherwise>
                        			<a id="SNS" class="nav-link" aria-haspopup="true" aria-expanded="false" href="snsMyPageView.do?cust_no=-1&provider_no=-${loginVo.no }" ><font style="color: gray;">SNS</font></a>	
                        		</c:otherwise>
                        	</c:choose>
                        </c:if>
                        <c:if test="${empty loginVo }">
                        	<a class="nav-link" aria-haspopup="true" aria-expanded="false" href="login" ><font style="color: gray;">SNS</font></a>
                        </c:if>
                            
                     
                        </li>
                        <li class="nav-item dropdown">
                         <a class="nav-link  dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#"><font style="color: gray;">고객지원</font></a>
                            <ul class="dropdown-menu" style="background-color: #212121!important">
                                <li>
                                    <a tabindex="-1" href="listNotice.do" class="dropdown-item"><font style="color: white;">공지사항</font></a>
                                   
                                </li>
                                <li>
                                    <a tabindex="-1" href="listQa.do" class="dropdown-item"><font style="color: white;">Q&A</font></a>
                                   
                                </li>
                                <li>
                                    <a tabindex="-1" href="listEvt.do	" class="dropdown-item"><font style="color: white;">프로모션</font></a>
                                    
                                </li>
                            </ul>
                        </li>
                    </ul>
                    
                    <ul class="nav flex-row order-lg-2 ml-auto nav-icons">
                        <c:choose>
                            <c:when test="${not empty loginVo}">
                                <li class="nav-item dropdown user-dropdown align-items-center" >
                                    <a class="nav-link" href="#" id="dropdown-user" role="button"
                                       data-toggle="dropdown">
                                <span class="user-states states-online">
                                    <img src="cust_img/${loginVo.cust_img }" width="35" alt="" class=" img-fluid rounded-circle">
                                </span>
                                        <span class="ml-2 h-lg-down dropdown-toggle">
                                                ${loginVo.nick_name}
                                        </span>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdown-user" style="background-color: #212121!important" >
                                        <a class="dropdown-item" href="profile"><i class="icon-User"></i><font style="color: white;">My Profile</font></a>
                                        <c:choose>
                                        	<c:when test="${loginVo.role eq 'customer' }">
                                        		 <a class="dropdown-item" href="custMyPage?cust_no=${loginVo.no }"><i class="icon-User"></i><font style="color: white;">고객 My Page</font></a>
                                        	</c:when>
                                        	<c:otherwise>
                                        		<a class="dropdown-item" href="provMyPageView.do?cust_no=${loginVo.no }"><i class="icon-User"></i><font style="color: white;">사업자 My Page</font></a>
                                        	</c:otherwise>
                                        </c:choose>
                                        <!--추가하면 되는 부분  -->
                                        <a class="dropdown-item" href="logout"><i class="icon-Power"></i>
                                            <font style="color: white;">Log Out</font></a>

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
        <div class="page-titles-img title-space-lg bg-parallax parallax-overlay mb70" data-jarallax='{"speed": 0.2}' 
        style='background-image: url("images/bg1.jpg")'>
            <div class="container">
                <div class="row">
                    <div class=" col-md-8 ml-auto mr-auto">
                        <h1 class='text-uppercase'>개인 회원가입 </h1>

                        <!--                                    <a href='https://www.youtube.com/watch?v=cctFcl5EFYk' class='modal-video btn btn-white-outline btn-lg btn-rounded'>Watch our film</a>
                        -->
                    </div>
                </div>
            </div>
        </div><!--page title end-->
        
        
        
        
        
        
        
        
        <!-- ###################################################################### -->
        <!-- 요기에 넣어!!!!!-->






	<div style="margin-left: 35%"> 
	<div class="col-lg-6">
		<div class="portlet-box portlet-gutter ui-buttons-col mb-30">
			<div class="portlet-header flex-row flex d-flex align-items-center b-b">
				<div class="flex d-flex flex-column">
					<h3>개인 정보 입력</h3>
					<br>
	<!-- <span class="portlet-subtitle">개인 정보 입력</span> -->
				</div><br><br>
			</div>
			<div class="portlet-body">

			<form action="insertCustomer" id="F" method="post" name="frm" enctype="multipart/form-data">
				<div class="form-group" >
						<div class="md-form">
						  <i class="fas fa-user prefix"></i>
						  <input type="text" style="width: 548.47px;" id="cust_name" name="cust_name" class="form-control" placeholder="이름">
						  
						</div>
				</div>
				<div class="form-group" style="margin-bottom: 0px!important;">
					<div class="md-form" style="display: inline-block;">
						  <i class="fas fa-user prefix"></i>
						  <input type="text" style="width: 412px;" id="cust_nick" name="cust_nick" class="form-control" placeholder="닉네임">
					</div>
					<input type="button" class="btn btn-outline-warning xs" style="width: 120px; height: 45px;" value="중복확인" onClick="check1()">

				</div>
				<div class="form-group">
				
		
					<div class="md-form" style="display: inline-block;">
						  <i class="fas fa-mobile-alt prefix"></i>
						  <input type="tel" style="width: 548.47px;" id="phone" name="phone" class="form-control" placeholder="전화번호" >
					</div>
				</div>

				<div class="form-group">
						<div class="md-form">
						  <i class="fas fa-envelope prefix"></i>
						  <input type="email"  style="width: 548.47px; margin-bottom: 40px;" name="email" id="email"  class="form-control" placeholder="E-mail">
						</div>
				</div>
			
				
				<div class="form-group">
						<div class="md-form">
						  <i class="fas fa-home prefix"></i>
						  <input type="text"  style="width: 548.47px;" name="addr" id="addr"  class="form-control" placeholder="주소를 구/동 까지만 입력해주세요 ex)서울시 강서구 (염창동)">
						</div>
				</div>

				
				<c:if test="${null eq kakaoid}">
				<div class="form-group">
					<div class="md-form" style="display: inline-block;">
							<i class="fas fa-id-card-alt prefix"></i>
						  <input type="text" style="width: 412px;" id="id" name="id"  placeholder="아이디" class="form-control" value="${member.id }">
					</div>
					<input type="button" class="btn btn-outline-warning xs" style="width: 120px; height: 45px;" value="중복확인" onClick="check2()">
				</div>
				<div class="form-group">
				<div class="md-form">
				  <i class="fas fa-lock prefix"></i>
				  <input type="password"  style="width: 548.47px;" id="pwd" name="pwd" class="form-control validate" placeholder="비밀번호">
				</div>
				</div>
				<div class="form-group">
					<div class="md-form">
					  <i class="fas fa-lock prefix"></i>
					  <input type="password"  style="width: 548.47px;" id="pwd1" name="pwd1" class="form-control validate" placeholder="비밀번호 확인">
					</div>
				</div>
				
				</c:if>
				<div class="form-group">
					<div class="md-form">
					  <i class="fas fa-info-circle prefix"></i>　　&nbsp;&nbsp;자기소개
					  <textarea name="cust_info"  style="width: 548.47px;" id="cust_info" class="md-textarea form-control" rows="3" >${member.cust_info }</textarea>
					</div>
				</div>
				
				<div class="form-group">
					<output id="list"></output>
					<div id="imgs">
						<img alt="" src="images/selProfile.png" id="selPro" width ="600px!important" style="cursor: pointer;">
					</div>
					<input type="file" id=upload name="upload" class="form-control" style="display: none; ">
					<input type="hidden" name="cust_img" value="${member.cust_img }">
					<input type="button" id="btnReset" value="다시선택" style="position:relative;left: 230px;" class="btn btn-outline-warning mr-1 mb-2" onClick="resetClick()"> 
				</div>
				<c:if test="${null ne kakaoid}">
					<input type="hidden" name="id" value="<%=kakaoid%>" >
					<input type="hidden" name="pwd" value='kakaologin' >
				</c:if>
				<br>
				<div align="center">
				<input type="button" id="btnInsert" value="가입" class="btn btn-outline-warning mr-1 mb-2" onClick="goSubmit()"> <input id="resetBtn" type="reset" value="취소" class="btn btn-outline-warning mr-1 mb-2">
				</div>
				<br>
			</form>
			</div>
		</div>
	</div>
		<!--portlet-->

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
          <!-- Bootstrap tooltips -->
  <script type="text/javascript" src="js/popper.min.js"></script>
  <!-- Bootstrap core JavaScript -->
  <!-- MDB core JavaScript -->
  <script type="text/javascript" src="js/mdb.min.js"></script>
    </body>
</html>