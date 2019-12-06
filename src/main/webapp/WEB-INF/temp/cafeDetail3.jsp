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
         <!-- Favicon -->
    <link rel="shortcut icon" href="assets/images/fav.ico" type="image/x-icon">
    <link rel="icon" href="assets/images/fav.ico" type="image/x-icon">
    <!-- Plugins CSS -->
    <link rel="stylesheet" href="assets/dist/css/plugins.css">
    <!-- fonts CSS -->
    <link rel="stylesheet" href="assets/fonts/linearicons/fonts.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome/css/fontawesome-all.min.css">
    <!-- Custom CSS File -->
    <link rel="stylesheet" href="assets/dist/css/style.css">
    </head>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script type="text/javascript">
    	$(function(){
    		
    		
    		
    		var prov_no = 1;
    		var grade = 0;
    		$("#reviewAddBtn").click(function(){
    			var review_content = $("#form24").val();
    			var cafe_no = $("#cafeno").val();
    			var review_reply = null;
    			var cust_no = $("#custno").val();
    			$("#form24").val("");
    			$.ajax({
    				url:"insertReview",
    				data:{"review_content":review_content,"grade":grade,"cafe_no":cafe_no,"cust_no":cust_no},
    				success:function(data){
    					alert(data);
    					var reviewStart = (reviewCurrentPage-1) * pageSIZE +1;
    		    		var reviewEnd = reviewCurrentPage * pageSIZE;
    					
    					listAllReview(cafe_no,reviewStart,reviewEnd);
    				}
    			})
    			
    		});
    		
    		$("#inqInsertBtn").click(function(){
    			var cafe_no = $("#cafeno").val();
    			var content = $("#form23").val();
    			var secret = "false";
    			var cust_no = $("#custno").val();
    			$("#form23").val("");
    			
    			$.ajax({
    				url:"insertInq",
    				data:{"cafe_no":cafe_no,"content":content,"secret":secret,"cust_no":cust_no},
    				success:function(data){
    					alert(data);
    					var start = (currentPage-1) * pageSIZE +1;	
    		    		var end = currentPage * pageSIZE;
    		    		$("#inqContent").empty();
    					listAllInq(cafe_no, start, end);
    				
    			}});
    			
    			
    		});
    		
    	
			

    		
    		$("#seatBtn").click(function(){
    			location.href = 'seatMap.do'
    		});
    		
    		var remove = function(){
    			$("#one").removeClass();
    			$("#two").removeClass();
    			$("#three").removeClass();
    			$("#four").removeClass();
    			$("#five").removeClass();
    		};
    	
    		$("#one").click(function(){
    			remove();
    			grade = 1;
    			$("#one").addClass("fas fa-star");
    			$("#two").addClass("far fa-star");
    			$("#three").addClass("far fa-star");
    			$("#four").addClass("far fa-star");
    			$("#five").addClass("far fa-star");
    		});
    		$("#two").click(function(){
    			remove();
    			grade = 2;
    			$("#one").addClass("fas fa-star");
    			$("#two").addClass("fas fa-star");
    			$("#three").addClass("far fa-star");
    			$("#four").addClass("far fa-star");
    			$("#five").addClass("far fa-star");
    		});
    		$("#three").click(function(){
    			remove();
    			grade = 3;
    			$("#one").addClass("fas fa-star");
    			$("#two").addClass("fas fa-star");
    			$("#three").addClass("fas fa-star");
    			$("#four").addClass("far fa-star");
    			$("#five").addClass("far fa-star");
    		});
    		$("#four").click(function(){
    			remove();
    			grade = 4;
    			$("#one").addClass("fas fa-star");
    			$("#two").addClass("fas fa-star");
    			$("#three").addClass("fas fa-star");
    			$("#four").addClass("fas fa-star");
    			$("#five").addClass("far fa-star");
    		});
    		$("#five").click(function(){
    			remove();
    			grade = 5;
    			$("#one").addClass("fas fa-star");
    			$("#two").addClass("fas fa-star");
    			$("#three").addClass("fas fa-star");
    			$("#four").addClass("fas fa-star");
    			$("#five").addClass("fas fa-star");
    		});
    		
    		var pageSIZE = 5;		//한 페이지당 보여줄 레코드 수
    		var pageGROUP = 5;		//한 화면에 보여줄 페이지수
    		var totalRecord = 0;		//전체 레코드 수
    		var totalPage = 1; 		//전체 페이지 수
    		var cafe_no = $("#cafeno").val();
    		
     		var reviewCurrentPage = 1;
    		var reviewStart = (reviewCurrentPage-1) * pageSIZE +1;
    		var reviewEnd = reviewCurrentPage * pageSIZE;
    		
    		var reviewTotalRecord = 0;		//전체 레코드 수
    		var reviewTotalPage = 1; 		//전체 페이지 수
    		
    		$.ajax({
    			url:"reviewCount",
    			dataType:"json",
    			data:{cafe_no:cafe_no},
    			async:false,
    			success:function(data){
    				reviewTotalRecord = data; 
        			/* alert(reviewTotalRecord) */
    			}
    			
    		});
    		
    		var cafe_no = $("#cafeno").val();
    		var f = 0;
    		var fo = 0;
    		var th = 0;
    		var tw = 0;
    		var o = 0;
    
    		
    		
    		$.getJSON("getGradeCnt",{"cafe_no":cafe_no},function(data){
    			$.each(data,function(idx,item){
    				if(item.grade == 5){
    					$("#fiveS").html(item.cnt);
    					var width = (item.cnt/reviewTotalRecord)*100;
    					$("#fiveG").css("width",width+'%');
    					
    				}else if(item.grade == 4){
    					$("#fourS").html(item.cnt);
    					var width = (item.cnt/reviewTotalRecord)*100;
    					$("#fourG").css("width",width+'%');
    					
    				}else if(item.grade == 3){
    					$("#threeS").html(item.cnt);
    					var width = (item.cnt/reviewTotalRecord)*100;
    					$("#threeG").css("width",width+'%');
    					
    				}else if(item.grade == 2){
    					$("#twoS").html(item.cnt);
    					var width = (item.cnt/reviewTotalRecord)*100;
    					$("#twoG").css("width",width+'%');
    					
    				}else if(item.grade == 1){
    					$("#oneS").html(item.cnt);
    					var width = (item.cnt/reviewTotalRecord)*100;
    					$("#oneG").css("width",width+'%');
    					
    					
    				}
    				
    			})
    		});
    		
    		$.ajax({
    			url:"inqCount",
    			dataType:"json",
    			data:{cafe_no:cafe_no},
    			async:false,
    			success:function(data){
    				 totalRecord = data; 
        			
    			}
    			
    		});
    /* 		$.getJSON("inqCount",{cafe_no:cafe_no},async:false,
        			function(data) {
        			 totalRecord = data; 
        			 alert("data"+ data);
        			}); */
    		
    		
    	 	$("#pag").hide();
    	 	$("#reviewPag").hide();
    	 	
    		
    		
        	$("#reviewClick").click(function(){
        		$("#reviewPag").show();
        		var cafe_no = $("#cafeno").val();
        		$("#reviewClick").hide();
        		$("#reviewArw").hide();
        		
        		listAllReview(cafe_no,reviewStart,reviewEnd);
        		pagingReview();
        		
        	});
        	reviewTotalPage = parseInt(reviewTotalRecord / pageSIZE);
    		if(reviewTotalRecord % pageSIZE !=0) {
    			reviewTotalPage++;
    		}
    		
    		$(document).on("click",".reviewNumber",function(){ 
				reviewCurrentPage = $(this).html();
				reviewStart = (reviewCurrentPage-1) * pageSIZE +1;
				reviewEnd = reviewCurrentPage * pageSIZE;
				listAllReview(cafe_no, reviewStart, reviewEnd);
				pagingReview();
			});
        	
    		var pagingReview = function(){
    			$("#pagination_review").empty();
    			$("#btn_prev_review").empty();
    			$("#btn_next_review").empty(); 
    			//한 화면에 보여줄 시작페이지, 끝페이지 구하기
    		
    			var startPage = parseInt(reviewCurrentPage/pageGROUP) * pageGROUP + 1;
    			if(reviewCurrentPage % 5 == 0) {
    				startPage = (parseInt(reviewCurrentPage/pageGROUP)-1) * pageGROUP + 1;
    			}
    			var endPage = startPage + pageGROUP - 1;
    			
    			if(endPage > reviewTotalPage) {
    				endPage = reviewTotalPage;
    			}
    	
    			for(var i=startPage; i<=endPage; i++) {
    				var a = $("<a id='reviewNum"+i+"' class='reviewNumber' style='margin-right:8px; cursor:pointer ;color='blue'; font-size:30px!important;'>"+i+"</a>");
    				$("#pagination_review").append(a);
    			}
    	

    	/* 		$("a").click(function() {
    				reviewCurrentPage = $(this).html();
    				reviewStart = (reviewCurrentPage-1) * pageSIZE +1;
    				reviewEnd = reviewCurrentPage * pageSIZE;
    				listAllReview(cafe_no, reviewStart, reviewEnd);
    				pagingReview();
    			}); */
    			
    			if(reviewCurrentPage > pageGROUP) {
    				var btn_prev = $("<button class='btn-primary' style='padding:5px; border-radius: 10px;'>이전</button>");
    				$("#btn_prev_review").append(btn_prev);
    				$(btn_prev).click(function() {
    					reviewCurrentPage = startPage - 1;
    					reviewStart = (reviewCurrentPage) * pageSIZE +1;
    					reviewEnd = reviewCurrentPage * pageSIZE;
    					listAllReview(cafe_no, reviewStart, reviewEnd);
    					pagingReview();
    				});
    			}
    			/* currentPage < totalPage && endPage+1<=totalPage */
    			//reviewCurrentPage < reviewTotalPage && endPage+1<=reviewTotalPage
    			if(reviewCurrentPage < reviewTotalPage && endPage+1<=reviewTotalPage) {
    				var btn_next = $("<button class='btn-primary' style='padding:5px; border-radius: 10px;'>다음</button>");
    				$("#btn_next_review").append(btn_next);
    				$(btn_next).click(function() {
    					reviewCurrentPage = endPage + 1;
    					reviewStart = (reviewCurrentPage) * pageSIZE +1;
    					reviewEnd = reviewCurrentPage * pageSIZE;
    					listAllReview(cafe_no, reviewStart, reviewEnd);
    					pagingReview();
    					
    				});
    			}
    			
    		/* 	alert("startPage"+startPage);
    			alert("reviewCurrentPage"+reviewCurrentPage);
    			alert("pageGROUP"+pageGROUP);
    			alert("endPage"+endPage);
    			alert("reviewTotalPage"+reviewTotalPage);
    			alert("pageSIZE"+pageSIZE);
    			alert("cafe_no"+cafe_no);
    			alert("reviewStart"+reviewStart);
    			alert("reviewEnd"+reviewEnd);   
    			 */
    		}
    		
        	var listAllReview = function(cafe_no, reviewStart, reviewEnd){
        	 	$("#reviewContent").empty();
    		 	var cafe_name = $("#cafename").val();
    			$.getJSON("reviewList",{"cafe_no":cafe_no, "start":reviewStart, "end":reviewEnd }, function(data) {
    				
    				
    					$.each(data, function(idx, vo) {
    						
    						
    						var mediaclear = $(' <div class="media clearfix" style="margin-top: 10px;"></div>');
    						var img = $('<img src="assets/images/'+vo.cust_img+'" class="rounded-circle mr-3 d-flex" width="60" alt="">');
    					
    						var mediabody = $('<div class="media-body border-bottom"></div>');
    						var star = $('<p class="text-secondary mb-0"></p>');
    							for(var i=1;i<=vo.grade;i++){
    								star.append('<i class="fas fa-star"></i>');
    							}
    							for(var i=1;i<=(5-vo.grade);i++){
    								star.append('<i class="far fa-star" id="five"></i>');
    							}
    						var h6 = $('<h6>'+vo.cust_name+'</h6>'+vo.review_content+'<br>');
    						
    						var hr =$('<hr style="margin-bottom: 0px!important">');
    						$(mediabody).append(star,h6);
    						
    						if(vo.review_reply != null){
    							var hr2 = $(' <hr style="margin-bottom: 0px!important">');
	    						var span = $('<span><font id="manager" style="font-weight: bold; margin-bottom: 5px; color: orange; font-size: 16px">'+cafe_name+' 관리자</font></span><br>');
	    						
	    						var icon = $('<i class="fas fa-reply fa-rotate-180" style="width: 30px; height: 30px; margin-top: 0px; position: relative; top: -15px;" ></i><br>');
	    						
	    						var reply = $('<span style="position: relative; left: 40px; top: -30px;">'+vo.review_reply+'</span>');
	    						$(mediabody).append(hr2,span,icon,reply);
	    						
    						}
    						
    		
    						$(mediaclear).append(img,mediabody,hr);
    						
                      		$("#reviewContent").append(mediaclear);
    						
    					});
    			});	
        	}
        	
        	
    		
    		$("#inqClick").click(function(){
    		 	$("#pag").show();
    			
        		var cafe_no = $("#cafeno").val();
    			
    			$("#inqClick").hide();
    			$("#arw").hide();
    	    			
    			listAllInq(cafe_no, start, end);
    			paging();
    			
    		});
    		//전체 레코드 수 구하기
    	
    		
    		totalPage = parseInt(totalRecord / pageSIZE);
    		if(totalRecord % pageSIZE !=0) {
    			totalPage++;
    		}
    		
    		var currentPage = 1;
    		var start = (currentPage-1) * pageSIZE +1;
    		var end = currentPage * pageSIZE;
    		
    		//화면에 리스트, pagination 뿌리기 
    		
    	
    		
    		
    		
    		function listAllInq(cafe_no, start, end) {
    		 	$("#inqContent").empty();
    		 	var cafe_name = $("#cafename").val();
    			$.getJSON("inqAllList",{"cafe_no":cafe_no, "start":start, "end":end }, function(data) {
    					$.each(data, function(idx, vo) {
    						
    						var h5 = $('<h5 style="margin-bottom: 30px; margin-top: 30px;>모든 문의글</h5>');
    						var mediaclear = $('<div class="media clearfix" style="margin-top: 10px;"></div>');
    						var img = $('<img src="assets/images/'+vo.cust_img+'" class="rounded-circle mr-3 d-flex" width="60" alt="">');
    					
    						var mediabody = $('<div class="media-body border-bottom"></div>');
    						var h6 = $('<h6>'+vo.cust_nick+'</h6>'+vo.inq_content+'<br>');
    						
    						var hr =$('<hr style="margin-bottom: 0px!important">');
    						$(mediabody).append(h6);
    						
    						if(vo.inq_reply != null){
	    						var span = $('<span><font id="manager" style="font-weight: bold; margin-bottom: 5px; color: orange; font-size: 16px">'+cafe_name+' 관리자</font></span><br>');
	    						
	    						var icon = $('<i class="fas fa-reply fa-rotate-180" style="width: 30px; height: 30px; margin-top: 0px; position: relative; top: -15px;" ></i><br>');
	    						
	    						var reply = $('<span style="position: relative; left: 40px; top: -30px;">'+vo.inq_reply+'</span>');
	    						$(mediabody).append(span,icon,reply);
    						}
    		
    				
    						
    					
    						
    						
    						
    						
    						$(mediaclear).append(img,mediabody,hr);
    						
    				
                      		$("#inqContent").append(h5,mediaclear);
                      	
                      		
                     
                      		
    						
    					});
    			});	
    		}
    		
			$(document).on("click",".inqNumber",function(){
				$("#inqContent").empty();
			
				currentPage = $(this).html();
				start = (currentPage-1) * pageSIZE +1;
				end = currentPage * pageSIZE;
				listAllInq(cafe_no, start, end);
				paging();
				
				
			});
    		
    		function paging() {
    			
    	 		$("#pagination").empty();
    			$("#btn_prev").empty();
    			$("#btn_next").empty(); 
    			//한 화면에 보여줄 시작페이지, 끝페이지 구하기
    		
    			var startPage = parseInt(currentPage/pageGROUP) * pageGROUP + 1;
    			if(currentPage % 5 == 0) {
    				startPage = (parseInt(currentPage/pageGROUP)-1) * pageGROUP + 1;
    			}
    			var endPage = startPage + pageGROUP - 1;
    			
    			if(endPage > totalPage) {
    				endPage = totalPage;
    			}
    			
    			for(var i=startPage; i<=endPage; i++) {
    				var a = $("<a id='inqNum"+i+"' class='inqNumber' style='margin-right:8px; cursor:pointer ;color='blue'; font-size:30px!important;'>"+i+"</a>");
    				$("#pagination").append(a);
    			}
				
    
    			/* $("a").click(function() {
    				currentPage = $(this).html();
    				start = (currentPage-1) * pageSIZE +1;
    				end = currentPage * pageSIZE;
    				listAllInq(cafe_no, start, end);
    				paging();
    			}); */
    			
    			if(currentPage > pageGROUP) {
    				var btn_prev = $("<button class='btn-primary' style='padding:5px; border-radius: 10px;'>이전</button>");
    				$("#btn_prev").append(btn_prev);
    				$(btn_prev).click(function() {
    					currentPage = startPage - 1;
    					start = (currentPage) * pageSIZE +1;
    					end = currentPage * pageSIZE;
    					listAllInq(cafe_no, start, end);
    					paging();
    				});
    			}
    			/* currentPage < totalPage && endPage+1<=totalPage */
    			if(currentPage < totalPage && endPage+1<=totalPage) {
    				var btn_next = $("<button class='btn-primary' style='padding:5px; border-radius: 10px;'>다음</button>");
    				$("#btn_next").append(btn_next);
    				$(btn_next).click(function() {
    					currentPage = endPage + 1;
    					start = (currentPage) * pageSIZE +1;
    					end = currentPage * pageSIZE;
    					listAllInq(cafe_no, start, end);
    					paging();
    					
    				});
    			}
    /* 			
     			alert("startPage"+startPage);
    			alert("currentPage"+currentPage);
    			alert("pageGROUP"+pageGROUP);
    			alert("endPage"+endPage);
    			alert("totalPage"+totalPage);
    			alert("pageSIZE"+pageSIZE);
    			alert("cafe_no"+cafe_no);
    			alert("start"+start);
    			alert("end"+end); */  
    		}
    		
    	
    	});
    		
    </script>



    <!-- select css -->
  
   <style>
	  *{margin:0;padding:0;}
	  ul,li{list-style:none;}
	  #slide{height:300px;position:relative;overflow:hidden;}
	  #slide ul{width:400%;height:100%;transition:1s;}
	  #slide ul:after{content:"";display:block;clear:both;}
	  #slide li{float:left;width:25%;height:100%;}
	  #slide li:nth-child(1){background:#faa;}
	  #slide li:nth-child(2){background:#ffa;}
	  #slide li:nth-child(3){background:#faF;}
	  #slide li:nth-child(4){background:#aaf;}
	  #slide input{display:none;}
	  #slide label{display:inline-block;vertical-align:middle;width:10px;height:10px;border:2px solid #666;background:#fff;transition:0.3s;border-radius:50%;cursor:pointer;}
	  #slide .pos{text-align:center;position:absolute;bottom:10px;left:0;width:100%;text-align:center;}
	  #pos1:checked~ul{margin-left:0%;}
	  #pos2:checked~ul{margin-left:-100%;}
	  #pos3:checked~ul{margin-left:-200%;}
	  #pos4:checked~ul{margin-left:-300%;}
	  #pos1:checked~.pos>label:nth-child(1){background:#666;}
	  #pos2:checked~.pos>label:nth-child(2){background:#666;}
	  #pos3:checked~.pos>label:nth-child(3){background:#666;}
	  #pos4:checked~.pos>label:nth-child(4){background:#666;}
	  
	
	  .info{
	  	color: black;
	  }
	  
	  .active-pink-textarea.md-form label.active {
  color: skyblue;
}
.pink-textarea textarea.md-textarea:focus:not([readonly]) {
  border-bottom: 1px solid skyblue;
  box-shadow: 0 1px 0 0 skyblue;
}
.pink-textarea.md-form .prefix.active {
  color: skyblue;
}
.active-pink-textarea.md-form textarea.md-textarea:focus:not([readonly])+label {
  color: skyblue;
}

.active-amber-textarea.md-form label.active {
  color: #ffa000;
}
.amber-textarea textarea.md-textarea:focus:not([readonly]) {
  border-bottom: 1px solid #ffa000;
  box-shadow: 0 1px 0 0 #ffa000;
}
.amber-textarea.md-form .prefix.active {
  color: #ffa000;
}
.active-amber-textarea.md-form textarea.md-textarea:focus:not([readonly])+label {
  color: #ffa000;
}

.active-pink-textarea-2 textarea.md-textarea {
  border-bottom: 1px solid skyblue;
  box-shadow: 0 1px 0 0 skyblue;
}
.active-pink-textarea-2.md-form label.active {
  color: skyblue;
}
.active-pink-textarea-2.md-form label {
  color: skyblue;
}
.active-pink-textarea-2.md-form .prefix {
  color: skyblue;
}
.active-pink-textarea-2.md-form textarea.md-textarea:focus:not([readonly])+label {
  color: skyblue;
}

.active-amber-textarea-2 textarea.md-textarea {
  border-bottom: 1px solid #ffa000;
  box-shadow: 0 1px 0 0 #ffa000;
}
.active-amber-textarea-2.md-form label.active {
  color: #ffa000;
}
.active-amber-textarea-2.md-form label {
  color: #ffa000;
}
.active-amber-textarea-2.md-form .prefix {
  color: #ffa000;
}
.active-amber-textarea-2.md-form textarea.md-textarea:focus:not([readonly])+label {
  color: #ffa000;
}
	</style>
	
<body>

        <div id="preloader">
            <div id="preloader-inner"></div>
        </div><!--/preloader-->

        <!-- Pushy Menu -->
        <aside class="pushy pushy-right">
            <div class="cart-content">
                <div class="clearfix">
                    <a href="javascript:void(0)" class="pushy-link text-white-gray">Close</a>
                </div>
                <ul class="list-unstyled">
                    <li class="clearfix">
                        <a href="#" class="float-left">
                            <img src="images/shop/p1.jpg" class="img-fluid" alt="" width="60">
                        </a>
                        <div class="oHidden">
                            <span class="close"><i class="ti-close"></i></span>
                            <h4><a href="#">Men's Special Watch</a></h4>
                            <p class="text-white-gray"><strong>$299.00</strong> x 1</p>
                        </div>
                    </li><!--/cart item-->
                    <li class="clearfix">
                        <a href="#" class="float-left">
                            <img src="images/shop/p2.jpg" class="img-fluid" alt="" width="60">
                        </a>
                        <div class="oHidden">
                            <span class="close"><i class="ti-close"></i></span>
                            <h4><a href="#">Men's tour beg</a></h4>
                            <p class="text-white-gray"><strong>$99.00</strong> x 1</p>
                        </div>
                    </li><!--/cart item-->
                    <li class="clearfix">
                        <a href="#" class="float-left">
                            <img src="images/shop/p3.jpg" class="img-fluid" alt="" width="60">
                        </a>
                        <div class="oHidden">
                            <span class="close"><i class="ti-close"></i></span>
                            <h4><a href="#">Women's T-shirts</a></h4>
                            <p class="text-white-gray"><strong>$199.00</strong> x 1</p>
                        </div>
                    </li><!--/cart item-->
                    <li class="clearfix">

                        <div class="float-right">
                            <a href="#" class="btn btn-primary">Checkout</a>
                        </div>
                        <h4  class="text-white">
                            <small>Subtotal - </small> $49.99
                        </h4>
                    </li><!--/cart item-->
                </ul>
            </div>
        </aside>
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

                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <a class="navbar-brand" href="index.html">
                    <img class='logo logo-dark' style="top:-25px;" src="images/logo.png" alt="">
                    <img class='logo logo-light hidden-md-down' style="top:-20px;" src="images/logo-light.png" alt="">
                </a>
                <div  id="navbarNavDropdown" class="navbar-collapse collapse">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item dropdown active">
                            <a class="nav-link" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">스투더픽 소개</a>
                           
                        </li>
                        <li class="nav-item dropdown dropdown-full-width">
                            <a class="nav-link" data-toggle="dropdown" href="#" aria-haspopup="true" aria-expanded="false">
                                스터디카페
                            </a>
                   
                        </li>
                        <li class="nav-item dropdown dropdown-full-width">
                            <a class="nav-link" data-toggle="dropdown" href="#" aria-haspopup="true" aria-expanded="false">
                                스투더  
                            </a>
                       
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">맛집찾기</a>
                      
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">SNS</a>
                     
                        </li>
                        <li class="nav-item dropdown">
                         <a class="nav-link  dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">고객지원</a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a tabindex="-1" href="#" class="dropdown-item">공지사항</a>
                                   
                                </li>
                                <li>
                                    <a tabindex="-1" href="#" class="dropdown-item">Q&A</a>
                                   
                                </li>
                                <li>
                                    <a tabindex="-1" href="#" class="dropdown-item">프로모션</a>
                                    
                                </li>
                            </ul>
                        </li>
                    </ul>   
                    <ul class="nav flex-row order-lg-2 ml-auto nav-icons"  style="margin-left: 50px!important;" >
                        <li class="nav-item dropdown user-dropdown align-items-center">
                            <a class="nav-link" href="#" id="dropdown-user" role="button" data-toggle="dropdown">
                                <span class="user-states states-online">
                                    <img src="images/avatar6.jpg" width="35" alt="" class=" img-fluid rounded-circle">
                                </span>
                                <span class="ml-2 h-lg-down dropdown-toggle">
                                    Hi, Sarah
                                </span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdown-user">
                                <div class="text-center p-3 pt-0 b-b mb-5">
                                    <span class="mb-0 d-block font300 text-title fs-1x">Hi! <span class="font700">Sarah Taylor</span></span>
                                    <span class="fs12 mb-0 text-muted">Administrator</span>
                                </div>
                                <a class="dropdown-item" href="#"><i class="icon-User"></i>My Profile</a>
                                <a class="dropdown-item" href="#"><i class="icon-Newspaper"></i> Tasks</a>
                                <a class="dropdown-item" href="#"><i class="icon-Speach-Bubble4 "></i> Messages <span class="badge badge-text text-primary-active bg-primary-light ml-2">5 New</span></a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#"><i class="icon-Gear"></i> Settings<span class="badge badge-text text-danger-active bg-danger-light ml-2">Update</span></a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="page-login.html"><i class="icon-Power"></i> logout</a>

                            </div>
                        </li>
                        <li class="h-lg-up nav-item">
                            <a href="#" class=" nav-link collapsed" data-toggle="collapse" data-target="#navbarToggler" aria-expanded="false">
                                <i class="icon-Magnifi-Glass2"></i>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="navbar-right-elements" style="margin: 30px">
               
                </div><!--right nav icons-->
            </div>

        </nav>
  
		<!-- 상단 메뉴바? 이미지 -->
        <div class="page-titles-img title-space-lg bg-parallax parallax-overlay mb70" data-jarallax='{"speed": 0.2}' style='background-image: url("images/chaeummain.png")'>
            
            <div class="container">
                <div class="row">
                    <div class=" col-md-8 ml-auto mr-auto">
                        <h1 class='text-uppercase'>스터디 카페 </h1>

                        <!--                                    <a href='https://www.youtube.com/watch?v=cctFcl5EFYk' class='modal-video btn btn-white-outline btn-lg btn-rounded'>Watch our film</a>
                        -->
                    </div>
                </div>
            </div>
        </div><!--page title end-->
        
        
        
        
        
        
        
        
        <!-- ###################################################################### -->
        
          <div class="container pt100 pb70" style="margin-left: 50px; padding-top: 0px;">
        <div class="row" style="width: 1400px;">
            <div class="col-lg-9 ml-auto mb30 sticky-content course-detail">
                <h2 class="mb-4" style="margin-bottom: 5px!important;">${cafe.cafe_name }</h2>
                <p>${cafe.cafe_info }</p>
                <ul class="course-detail-meta row list-unstyled">
                    <li class="col-sm-4 col-md-3 py-2 col-6">
                       <i class="fa fa-wifi float-left w40 rounded-circle bg-gray mr-3"></i>	
                        <div class="oHidden">
                            <small class="d-block pt-1">Wi-Fi</small>
                             <h6 class="text-secondary">WI-FI</h6>
                        </div>
                    </li>
                    <li class="col-sm-4 col-md-3 py-2 col-6">
                        <i class="fa fa-coffee float-left w40 rounded-circle bg-gray mr-3"></i>
                        <div class="oHidden">
                            <small class="d-block pt-1">음료제공</small>
                            <h6 class="text-secondary">CAFE</h6>
                        </div>
                    </li>
                    <li class="col-sm-4 col-md-3 py-2 col-6">
                        <i class="fa fa-address-card float-left w40 rounded-circle bg-gray mr-3" aria-hidden="true"></i>
                        <div class="oHidden">
                            <small class="d-block pt-1">멤버쉽</small>
                            <h6 class="text-secondary">MEMBERSHIP</h6>
                        </div>
                    </li>
                    <li class="col-sm-4 col-md-3 py-2 col-6">
                        <i class="fa fa-video float-left w40 rounded-circle bg-gray mr-3"></i>
                        <div class="oHidden">
                            <small class="d-block pt-1">24시간</small>
                           <h6 class="text-secondary">CCTV작동</h6>
                        </div>
                    </li>
                </ul>
                <div style="position:relative;height:0;padding-bottom:40.25%">
                	<div id="slide" style="width: 500px; height: 400px;">
					  <input type="radio" name="pos" id="pos1" checked>
					  <input type="radio" name="pos" id="pos2">
					  <input type="radio" name="pos" id="pos3">
					  <input type="radio" name="pos" id="pos4">
					  <ul>
					    <li><img alt="" src="images/chaeummain2.png" width="500px" height="400px"></li>
					    <li><img alt="" src="images/cu2.png" width="500px" height="400px"></li>
					    <li><img alt="" src="images/cu3.png" width="500px" height="400px"></li>
					    <li><img alt="" src="images/cu4.png" width="500px" height="400px"></li>
					  </ul>
					  <p class="pos">
					    <label for="pos1"></label>
					    <label for="pos2"></label>
					    <label for="pos3"></label>
					    <label for="pos4"></label>
					  </p>
					</div>
					                	
                    
                    <div style="position: relative; left: 550px; top: -400px;">
                    	
                    	
                    	<h5><font style="color: black;"><i class="fa fa-map-marker-alt" aria-hidden="true"></i><a href="http://naver.me/GP6fEpcM" target="_blank">　서울 마포구 신촌로 150 신촌포스빌 203호</a></font></h5><br>
                    	<h5><font style="color: black;"><i class="far fa-clock"></i>　${cafe.cafe_hrs }</font></h5><br>
                    	<h5><font style="color: black;"><i class="fas fa-phone"></i>　${cafe.cafe_phone }</font></h5><br>
                    	<h5><font style="color: black;"><i class="fa fa-krw" aria-hidden="true"></i>　(ROOM)${cafe.room_price }~</font></h5><br>
                    	<div class="pass">
						    <h5><font style="color: black;"><i class="fa fa-krw" aria-hidden="true"></i>　이용권</font></h5>
						   
						   <div class="form-group">
							  <select class="form-control" id="sel1" style="width:400px;font-size:18px;height:15px; margin-bottom: 0px">
								 	<c:forEach var="passvo" items="${pass }">
								 		 <option>${passvo.pass_content }</option>
								 	</c:forEach>					
						    </select>
						    </div>
						</div>
						<!-- 버튼 -->
						<button type="button" class="btn btn-outline-primary mb5" style="margin-top: 5px; margin-right: 10px;">룸 예약하기</button>
						<button type="button" class="btn btn-outline-primary mb5" style="margin-top: 5px; margin-right: 10px;">이용권 구매</button>
						<button type="button" class="btn btn-outline-primary mb5" style="margin-top: 5px" id="seatBtn">실시간 좌석</button>
                    	
                    </div>
                </div>
                    <ul class="nav tab-list nav-justified">
                        <li class="nav-item" role="presentation">
                            <a data-toggle="tab" class="nav-link active" href="#c-desc">
                                <i class="far fa-sticky-note mr-2"></i>카페설명</a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a data-toggle="tab" class="nav-link" href="#c-qa">
                                <i class="fa fa-clock mr-2"></i>카페문의</a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a data-toggle="tab" class="nav-link" href="#c-reviews">
                                <i class="fa fa-thumbs-up mr-2"></i> 사용리뷰</a>

                        </li>
                         <li class="nav-item" role="presentation">
                            <a data-toggle="tab" class="nav-link" href="#c-cancle">
                                <i class="fa fa-thumbs-up mr-2"></i>취소 및 환불규정</a>

                        </li>
                    </ul>
                    <!--tabs nav-->
                    <div class="tab-content">
                        <div class="tab-pane active show" id="c-desc">
                            <div class="row">
                                <div class="col-md-8 mb-30">
                                    <h5>이용 수칙 안내</h5>
                                    <hr>
                                    <p>
                                       	<font class="info">${cafe.cafe_notice }</font><br>

										
                                    </p>
                                    <br>
                                    <h5>업체정보</h5>
                                    <hr>
                                    <p>
                                        <font class="info">${cafe.cafe_info_detail }</font><br>

									
                                    </p>
                                    <h5>부가 시설</h5>
                                    <hr>
                                    <p>
                                      	<font class="info">${cafe.cafe_facil } </font><br>
                                     	
                                    </p>
                                </div>
                                <div class="col-md-4 mb-30">
                                    <h5>오시는 길</h5>
                                    <hr>
                                    <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12651.803528099805!2d126.942077!3d37.556221!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x38f2569f0da430ef!2z7Iug7LSM7Iqk7YSw65SU66O4IOyLoOy0jCDsiqTthLDrlJTsubTtjpgg7Iug7LSM7Iqk7YSw65SU66O4IOyxhOybgCDqs7XrtoDtlZjquLAg7KKL7J2A7Lm07Y6Y!5e0!3m2!1sko!2skr!4v1571382664752!5m2!1sko!2skr" width="300" height="450" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
                                    <div>
                                     
                                    </div>
                                    <br>
                                    <a href="https://goo.gl/maps/oqwoQqFMZ12qXaWs6" target="_blank" class="btn btn btn-outline-primary mb5">
                                        <i class="fa fa-search-plus mr-2" ></i>크게보기
                                    </a>
                                </div>
                            </div>
                        </div>
                        <!--tab pane-->
                         <div class="tab-pane" id="c-qa">
                       
                             <h5 style="margin-bottom: 30px;">문의 작성</h5>
                            <div class="media clearfix" style="margin-top: 10px;">
                           
                                <img src="assets/images/${cust.cust_img }" class="rounded-circle mr-3 d-flex" width="60" alt="">
                                <div class="media-body border-bottom">
                                    <h6>${cust.cust_nick }</h6>
                                    <p class="text-secondary mb-0">
                                      
                                         
                                    </p>
                                  <div class="md-form mb-4 pink-textarea active-pink-textarea-2" style="width: 1000px;">
									  <i class="fas fa-angle-double-right prefix"></i>
									  <textarea id="form23" class="md-textarea form-control" rows="3" cols="70" style="width: 800px; display: inline;"></textarea>
									  <button id="inqInsertBtn" class="btn btn-outline-primary mb5" style="position: relative; top: -30px; left: 20px;">등록</button>
									  <label for="form23">　　문의를 남겨주세요</label>
								</div>
                                </div>
                            </div><!--/.review-->
                            <input id="cafeno" type="hidden" value="${cafe.cafe_no }"> 
                            <input id="cafename" type="hidden" value="${cafe.cafe_name }"> 
                            <input id="custno" type="hidden" value="${cust.cust_no }"> 
                          <div id="inqContent">  
                             <h5 style="margin-bottom: 30px; margin-top: 30px;">최근 문의글</h5>
                             <c:forEach var="inqvo" items="${inqs }">
                             <div  class="media clearfix" style="margin-top: 10px;">
                           
                                <img src="assets/images/${inqvo.cust_img }" class="rounded-circle mr-3 d-flex" width="60" alt="">
                                <div class="media-body border-bottom">
                                    <h6>${inqvo.cust_nick }</h6>
                                 
                             
                                           	${inqvo.inq_content }<br>
                                           	<hr style="margin-bottom: 0px!important">
                                           	<c:if test="${!empty inqvo.inq_reply  }">
	                                           	<span><font id="manager" style="font-weight: bold; margin-bottom: 5px; color: orange; font-size: 16px">${cafe.cafe_name } 관리자</font></span><br>
	                                           	<i class="fas fa-reply fa-rotate-180" style="width: 30px; height: 30px; margin-top: 0px; position: relative; top: -15px;" ></i><br>
	                                           	<span style="position: relative; left: 40px; top: -30px;">
	                                           		${inqvo.inq_reply }
	                                           	</span>
                                           	</c:if>
                                    
                                </div>
                            </div><!--/.review-->
                            </c:forEach>
                            
                            </div>
                            	<br><br>
                      	      	<div id="pag" style="position: relative; left: 430px;">
	                      	      	<div id="btn_prev" style="display: inline">
	                      	      	
		                           	</div>
		                           	<div id="pagination" style="display: inline">
		    							
		    						</div>
		    						<div id="btn_next" style="display: inline"> 
		    						
		    						</div>
    							</div>
                          
                           
                           <!--  <div class="media clearfix py-3">
                                    <img src="assets/images/tube.png" class="rounded-circle mr-3 d-flex" width="60" alt="">
                                    <div class="media-body border-bottom">
                                        <h6>박선영</h6>
                                        <p class="text-secondary mb-0">
                                  
                                        <p style="color: black">
                                               	혹시 진행중인 이벤트같은게 있을까요??<br>
                                               	있으면좋을것같은데! 물품보관함 대여비가 궁금해요!
                                               <hr style="margin-bottom: 0px!important">
                                               	<span><font id="manager" style="font-weight: bold; margin-bottom: 5px; color: orange; font-size: 16px">채움 관리자</font></span><br>
	                                           	<i class="fas fa-reply fa-rotate-180" style="width: 30px; height: 30px; margin-top: 0px; position: relative; top: -15px;"></i><br>
	                                           	<span style="position: relative; left: 40px; top: -30px;">
	                                           		네 고객님 저희 채움스터디카페는 현재 오픈이벤트 진행중이며<br>
	                                           		1인당 1시간 무료이용이 가능합니다!<br>
	                                           		그리고 물품보관함은 15일 3000원/ 30일 5000원 으로 운영되고있습니다!<br>
	                                           		많은 이용부탁드릴게요!
	                                           	</span>
                                        </p>
                                    </div>
                                </div>/.review
                                <div class="media clearfix">
                                        <img src="assets/images/cat.png" class="rounded-circle mr-3 d-flex" width="60" alt="">
                                        <div class="media-body border-bottom">
                                            <h6>김선겸</h6>
                                         
                                            <p style="color: black">
                                                   	설마고양이못데려가는거아니죠? 우리 고양이는 착해서 다른 사람한테 피해안줘요! ㅎㅎ.<br>
                                                   	고양이 가져가도되는거죠??
                                                   	 	<hr style="margin-bottom: 0px!important">
                                                   	 		<span><font id="manager" style="font-weight: bold; margin-bottom: 5px; color: orange; font-size: 16px">채움 관리자</font></span><br>
	                                           	<i class="fas fa-reply fa-rotate-180" style="width: 30px; height: 30px; margin-top: 0px; position: relative; top: -15px;"></i><br>
	                                           	<span style="position: relative; left: 40px; top: -30px;">
	                                           		고객님 정말 죄송합니다..<br>
	                                           		다른 고객들에게 피해가 갈 수 있기 때문에 반려동물은 동반입실이 불가합니다<br>
	                                           		죄송합니다 ㅠㅠ<br>
	                                           	</span>
                                            </p>
                                        </div>
                                    </div>/.review -->
                                    <br>
                                      		<a id="inqClick" style="position: relative; left: 450px; color: blue">모든 문의 보기</a><br>
                                      		<i id="arw" class="fas fa-angle-down" style="position: relative; left: 490px; color: black; width: 20px; height: 20px; " ></i>
                             
                                 		
                        </div>
                            
                        <!--tab pane-->
                        <div class="tab-pane" id="c-reviews">
                            <div class="row mb-4 align-items-center" style="margin-bottom: 0px!important;">
                                <div class="col-md-5 mb-30">
                                    <div class="p-4 border-right border-top border-bottom border-left text-center bg-white rounded text-dark">
                                        <div class="display-3 text-secondary">${total.avg}</div>
                                        <h4>
                                           	리뷰 평점
                                        </h4>
                                        <span class="text-muted">총 ${total.total } 리뷰</span>
                                    </div>
                                </div>
                                <div class="col-md-7 mb-30">
                              
                                    <div class="clearfix mb-2">
                                        <span id="fiveS" class="float-right">
                                            
                                        </span>
                                         <span class="text-secondary mb-0">  
											<i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
										</span>
                                    </div>
                                    <div class="progress mb-3" style="height: 2px;">
                                        <div id="fiveG" class="progress-bar bg-secondary"></div>
                                    </div>
                                    <div class="clearfix mb-2">
                                        <span id="fourS" class="float-right">
                                            
                                        </span>
                                         <span class="text-secondary mb-0"> 
                                        	<i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
										</span>
                                    </div>
                                    <div class="progress mb-3" style="height: 2px;">
                                        <div id="fourG" class="progress-bar bg-secondary" ></div>
                                    </div>
                                    <div class="clearfix mb-2">
                                            <span id="threeS" class="float-right">
                                                
                                            </span>
                                                    <span class="text-secondary mb-0">  
			                                        	<i class="fas fa-star"></i>
			                                            <i class="fas fa-star"></i>
			                                            <i class="fas fa-star"></i>
													</span>
                                        </div>
                                        <div class="progress mb-3" style="height: 2px;">
                                            <div id="threeG" class="progress-bar bg-secondary" ></div>
                                        </div>
                                        <div class="clearfix mb-2">
                                                <span id="twoS" class="float-right">
                                                    
                                                </span>
                                                 <span class="text-secondary mb-0"> 
			                                        	<i class="fas fa-star"></i>
			                                            <i class="fas fa-star"></i>
												</span>
                                            </div>
                                            <div class="progress mb-3" style="height: 2px;">
                                                <div id="twoG" class="progress-bar bg-secondary" ></div>
                                            </div>
                                            <div class="clearfix mb-2">
                                                    <span id="oneS" class="float-right">
                                                        
                                                    </span>
                                                    <span class="text-secondary mb-0"> 
			                                        	<i class="fas fa-star"></i>
													</span>
                                                </div>
                                                <div class="progress mb-3" style="height: 2px;">
                                                    <div id="oneG" class="progress-bar bg-secondary" ></div>
                                                </div>
                                </div>
                            </div><!--/.row-->
                          
                             <h5 style="margin-bottom: 30px;">리뷰 작성</h5>
                            <div class="media clearfix" style="margin-top: 10px;">
                           
                                <img src="assets/images/${cust.cust_img }" class="rounded-circle mr-3 d-flex" width="60" alt="">
                                <div class="media-body border-bottom">
                                    <h6>${cust.cust_nick }</h6>
                                    <p class="text-secondary mb-0">
                                      
                                            <i class="far fa-star" id="one"></i>
                                            <i class="far fa-star" id="two"></i>
                                            <i class="far fa-star" id="three"></i>
                                            <i class="far fa-star" id="four"></i>
                                            <i class="far fa-star" id="five"></i>
                                         
                                    </p>
                                  <div class="md-form amber-textarea active-amber-textarea-2" style="width: 1000px;">
									  <i class="fas fa-pencil-alt prefix"></i>
									 
									  <textarea id="form24" class="md-textarea form-control" rows="3" cols="70" style="width: 800px; display: inline;"></textarea>
									  <button id="reviewAddBtn" class="btn btn-outline-warning mb5" style="position: relative; top: -30px; left: 20px;">등록</button>
								 <label for="form24">　리뷰를 작성해 주세요</label>	  
								</div>
                                </div>
                            </div><!--/.review-->
                            <h5 style="margin-bottom: 30px; margin-top: 30px;">최신 리뷰</h5>
                              <div id="reviewContent">
                             
                            <c:forEach var="review" items="${review }">
                            <div class="media clearfix" style="margin-top: 10px;">
                                <img src="assets/images/${review.cust_img }" class="rounded-circle mr-3 d-flex" width="60" alt="">
                                <div class="media-body border-bottom">
                                    <h6>${review.cust_name }</h6>
                                    <p class="text-secondary mb-0">
										<c:forEach begin="1" end="${review.grade }" step="1">                                    
                                            <i class="fas fa-star"></i>
                                        </c:forEach> 
                                     
                                        <c:forEach begin="1" end="${5-review.grade}" step="1">
                                         	<i class="far fa-star" id="five"></i>
                                        </c:forEach>
                                    </p>
                                  
                                  
                                    <p>
                                           	${review.review_content }
	                                          
	                                           	<c:if test="${!empty review.review_reply  }">
	                                           	 <hr style="margin-bottom: 0px!important">
	                                           	 
	                                               	<span><font id="manager" style="font-weight: bold; margin-bottom: 5px; color: orange; font-size: 16px">${cafe.cafe_name } 관리자</font></span><br>
		                                           	<i class="fas fa-reply fa-rotate-180" style="width: 30px; height: 30px; margin-top: 0px; position: relative; top: -15px;"></i><br>
		                                           	<span style="position: relative; left: 40px; top: -30px;">
		                                           		${ review.review_reply}
	                                           		</span>
	                                           	</c:if>
                                    </p>
                                </div>
                            </div><!--/.review-->
                          
                            </c:forEach>
                            </div>
                            <br><br>
                             	 <div id="reviewPag" style="position: relative; left: 430px;">
	                      	      	<div id="btn_prev_review" style="display: inline">
	                      	      	
		                           	</div>
		                           	<div id="pagination_review" style="display: inline">
		    							
		    						</div>
		    						<div id="btn_next_review" style="display: inline"> 
		    						
		    						</div>
    							</div>
                          	<br><br>
                            	<span style="position: relative; left: 450px; color: black"><a id="reviewClick" style="color: orange;">모든 리뷰 보기</a></span><br>
                                      		<i id="reviewArw" class="fas fa-angle-down" style="position: relative; left: 490px; color: black; width: 20px; height: 20px;" ></i>
                                      		
                          <!--   <div class="media clearfix py-3">
                                    <img src="assets/images/tube.png" class="rounded-circle mr-3 d-flex" width="60" alt="">
                                    <div class="media-body border-bottom">
                                        <h6>박선영</h6>
                                        <p class="text-secondary mb-0">
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                           	<i class="far fa-star"></i>
                                           
                                        </p>
                                        <p>
                                               	책상이나 조명이 집중이 잘되는 것 같아요 생긴지 얼마 안되서 그런지 시설도 굉장히 깔끔합니다 근데 새로생긴곳이라 그런지<br>
                                               	약간 페인트냄새? 같은게 나던데 내부 방향제 같은거 설치해주시면 좋을 것 같아요! 
                                               	 <hr style="margin-bottom: 0px!important">
                                               	<span><font id="manager" style="font-weight: bold; margin-bottom: 5px; color: orange; font-size: 16px">채움 관리자</font></span><br>
	                                           	<i class="fas fa-reply fa-rotate-180" style="width: 30px; height: 30px; margin-top: 0px; position: relative; top: -15px;"></i><br>
	                                           	<span style="position: relative; left: 40px; top: -30px;">
	                                           		고객님들이 최상의 조건에서 집중 할 수 있도록<br>
	                                           		항상 조명과 환경을 최상의 상태로 유지하고있습니다!<br>
	                                           		신축건물이다보니 ㅠㅠ 아무래도 미흡한면이 있었던 것 같습니다! 방향제 설치하였으니<br>
	                                           		다음에 방문하실때는 더 만족스러운 채움스터디카페가 되겠습니다!
	                                           	</span>
                                        </p>
                                    </div>
                                </div>/.review
                                <div class="media clearfix">
                                        <img src="assets/images/cat.png" class="rounded-circle mr-3 d-flex" width="60" alt="">
                                        <div class="media-body border-bottom">
                                            <h6>김선겸</h6>
                                            <p class="text-secondary mb-0">
                                                  	<i class="fas fa-star"></i>
		                                            <i class="fas fa-star"></i>
		                                            <i class="fas fa-star"></i>
		                                           	<i class="far fa-star"></i>
                                               		<i class="far fa-star"></i>
                                            </p>
                                            <p>
                                                   	고양이는 왜 못데려가는거죠?? 우리 고양이는 착해서 다른 사람한테 피해안주는데 기분이 나빠서 별점하나 줄입니다.<br>
                                                   	그래도 전체적인 시설이 깔끔하고 대여시스템도 잘되어있어서 별점 4개드릴게요!
                                                   	 <hr style="margin-bottom: 0px!important">
                                               	<span><font id="manager" style="font-weight: bold; margin-bottom: 5px; color: orange; font-size: 16px">채움 관리자</font></span><br>
	                                           	<i class="fas fa-reply fa-rotate-180" style="width: 30px; height: 30px; margin-top: 0px; position: relative; top: -15px;"></i><br>
	                                           	<span style="position: relative; left: 40px; top: -30px;">
	                                           		고객님..설마 진짜 데려오실줄은 몰랐네요..<br>
	                                           		어쩔 수 없이 제가 이번한번은 눈감아 드렸지만 다음엔 절대 데려오시면 안됩니다 ㅠㅠ<br>
	                                           		그리고 4개 주신다더니 ㅠㅠ3개주셨어요! 다음엔 꼭 별점 4점주세요! ㅎㅎ<br>
	                                           	</span>
                                            </p>
                                        </div>
                                    </div>/.review
                                    <br>
                                      	
                                      		
                        </div> -->
                        </div>
                        <!--tab pane-->
                        
                         <div class="tab-pane" id="c-cancle" style="width: 1200px;">
                            <div class="row">
                                <div class="col-md-8 mb-30" style="width: 1200px;">
                                    <h5>상품 정보 제공 고시</h5>
                                    <hr>
                                    <p>
                                       	<font class="info" style="font-weight: bold;">${cafe.cafe_cp }</font><br>

										
                                    </p>
                                    <br>
                                    <h5>취소 환불 규정</h5>
                                    <hr>
                                    <p>
                                        <font class="info">${cafe.cafe_rp }</font><br>

										
										

                                    </p>
                                    
                                </div>
                         
                            </div>
                        </div>
                    </div>
                    <!--tab content-->
                 
                </div>
                
               
            </div>
       
     
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
