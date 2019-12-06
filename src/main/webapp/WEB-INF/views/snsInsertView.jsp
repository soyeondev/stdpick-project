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
<link rel="stylesheet" href="css/jquery.bxslider.css">
<link href="css/tagify.css" rel="stylesheet">
<link rel="stylesheet" href="https://rawgit.com/enyo/dropzone/master/dist/dropzone.css">
<style>
 .hi {
        overflow: hidden;
  }
</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script> -->
<!-- jQuery first, then Tether, then Bootstrap JS. -->
<script src="js/plugins/plugins.js"></script> 
<script src="js/assan.custom.js"></script> 
<script src="js/jquery.bxslider.js"></script>
<script src="js/jQuery.tagify.min.js"></script>
<script src="js/tagify.js"></script>


<script type="text/javascript">
$(function() {
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
	            '<img style="height: 75px; border: 1px solid #000; margin: 5px" src="', 
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
	
	var cust_no = -1;
	var provider_no = -1;
	var role = $("#role").val();
	
	if(role == 'customer'){
		cust_no = $("#no").val();
	}
	
	if(role == 'provider'){
		provider_no = $("#no").val();
	}
	
	
	if(cust_no > -1) {
		$.ajax({url:"detailCustomer", data:{cust_no:cust_no},dataType:"json" ,success:function(data) {
			$("#nick").html(data.cust_nick); 
		}});
	}else {
		$.ajax({url:"detailProvider", data:{provider_no:provider_no},dataType:"json" ,success:function(data) {
			$("#nick").html(data.pro_nick); 
		}});
	}
 	//===============================================================================
		
	$('[name=tags]').tagify({duplicates :false});
	
	
	//================================================================================
	var today = new Date();
	var year = today.getFullYear();
	var month = today.getMonth()+1;
	var date = today.getDate();
	
	var print_today = year+"/"+month+"/"+date;
	$("#print_today").html(print_today);
	
	//===============================================================================

 	var arr_file = new Array();
 	
	//preview image 
	var imgTarget = $('#upload');  
	imgTarget.on('change', function(evt){ 
		files = evt.target.files; // FileList object
		
		if(arr_file.length == 0) {	//파일 처음 선택했으면 div 비우고 시작
			$("#div_images").empty();
		}

		var pre_sns_no = -1;
		var col_cnt = 0;
		var row_cnt = 0;
		var row = new Array();	//row 이름 다르게 해줘야 들어감
		row[row_cnt] = $('<div class="row mb20" ></div>');
		
	    // Loop through the FileList and render image files as thumbnails.
	    for (var i = 0, f; f = files[i]; i++) {
				arr_file.push(f);
				
		      // Only process image files.
// 		      if (!f.type.match('image.*')) {
// 		        continue;
// 		      }
 
		      var reader = new FileReader();

		      // Closure to capture the file information.
		      reader.onload = (function(theFile) {
		        return function(e) {
					var src = e.target.result; 
					
					var col = $('<div class="col-md-4 mb-30 hi" ></div>');
					var img = $('<img src="'+src+'" height="250" alt="" >');
					
					$(col).append(img);
					$(row[row_cnt]).append(col);
					
					col_cnt++;	
					
					if(col_cnt==3) {	//3행 완성되면 div에 row 뿌리기
						$("#div_images").append(row[row_cnt]);
						row_cnt++;
						row[row_cnt] =  $('<div class="row mb20" ></div>');
						col_cnt=0;
					}

		        };
		      })(f);
		      
	      // Read in the image file as a data URL.
	      reader.readAsDataURL(f);

	    }
		$("#img_length").html(arr_file.length);
		
		
	});
	
	//==============================================================================
		
	
	$("#btnReset").click(function() {
		$("#div_images").empty();
		
		var div = $('<div class="col-md-12 mb-30" id="img_plus"></div>');
		var img = $("<img id='addPic' style='cursor: pointer;' src='images/plus.jpg' alt='' class='img-fluid'>");
		$(img).click(function(){
			$("#upload").trigger('click');
		});$()
		
		$(div).append(img);
		$("#div_images").append(div);

		arr_file = new Array();
		$("#img_length").html(arr_file.length);
		
		$("#list").empty();
	});
	
	
	$("#btnInsert").click(function() {
		var sns_content = $("#sns_content").val();
		const formData = new FormData();
		formData.append("sns_content",sns_content);
		formData.append("cust_no",cust_no);
		formData.append("provider_no",provider_no);
		
		for(var i=0; i<arr_file.length; i++) {
			formData.append("arr_file"+i,arr_file[i]);
		}
		
		
		var tags = $('[name=tags]').val();
		var j_tags = eval("(" + tags + ")");
		$.each(j_tags, function(idx, item) {
			//alert(item.value);
			formData.append("tags",item.value); 
			
		});
		
		$.ajax({url:"snsInsert", processData: false, contentType: false,
			data:formData, 
			type:"POST", success:function(re) {
				if(re>1) {
					window.location.href="snsMyPageView.do?cust_no="+cust_no+"&provider_no="+provider_no;
					//alert("성공");
				}
		}});
	});
	
	$("#addPic").click(function(){
		$("#upload").trigger('click');
	});
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
        
 <div class="container pb50">
     <div class="row">
         <div class="col-md-9 mb40 ml-auto mr-auto">
         <h3>게시물 등록</h3>
         <hr class="mb40">
         <div id="div_images" class="mb40">
         	<div class="col-md-12 mb-30" id="img_plus">
	         		<img id="addPic" style="cursor: pointer;" src='images/plus.jpg' alt='' class='img-fluid'>
	        </div>
	     </div>
         
	        <article>
		        <div class="mb-50">
	          	 <input multiple="multiple" type="file" name="upload" id="upload" style="display: none;"/><br>
	          	 	<output id="list"></output>
	          	 <div align="right">
	          	 	 선택한 파일 개수 : <span id="img_length">0</span>개 &nbsp;&nbsp;
		          	 <button id="btnReset" style="text-align: right;" class="btn btn-outline-primary">
		          	 	이미지 다시 선택</button>
	          	</div>
	          </div>


	            <div class="post-content">
	                <ul class="post-meta list-inline">
	                    <li class="list-inline-item">
	                        <i class="fa fa-user-circle-o"></i> <span id="nick"></span>
	                    </li>
	                    <li class="list-inline-item">
	                        <i class="fa fa-calendar-o"></i><span id="print_today"></span>
	                    </li>
	                </ul>
	                <textarea class="lead" id="sns_content" rows="5" cols="80" placeholder="내용을 입력해주세요."></textarea>
	                <hr class="mb40">
	                
	                <input name="tags" placeholder="태그를 입력해주세요." value="태그">
	                <hr class="mb40">
	                
	               
	                <div class="clearfix float-right">
	                	<button id="btnInsert" class="btn btn-primary btn-lg" >등록하기</button>
	                </div>
	            </div>
	      </article><!-- post article-->
	          
          </div>
        </div>
      </div>
      
  <input type="hidden" value="${loginVo.role }" id="role">
  <input type="hidden" value="${loginVo.no }" id="no">
  
      
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
