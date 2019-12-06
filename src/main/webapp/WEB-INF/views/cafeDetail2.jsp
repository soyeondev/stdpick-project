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
    
      <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c1bc9ebf025c6c9764f3796dcc91b8d4&libraries=services"></script>
    </head>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    
    <script type="text/javascript">
    	$(function(){
    		$("#resetBtn").hide();
    		$("#upFiles").hide();
    		
    		$("#resetBtn").click(function(){
    			$("#list").empty();
    			$("#upFiles").trigger('click');
    		});
    		
    		$("#upBtn").click(function(){
    			$("#upBtn").hide();
    			$("#resetBtn").show();
    			$("#upFiles").trigger('click');
    		})
    		document.getElementById("upFiles").onchange = function () {
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
    		            '<img style="height: 75px; margin: 5px" src="',
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
    		  document.getElementById('upFiles').addEventListener('change', handleFileSelect, false);
    		
    		var cust_no = -1;
     		var provider_no = -1;
        		var role = $("#role").val();
        		
        		if(role == 'provider') {
        			provider_no = $("#no").val();
        		}else {
        			cust_no = $("#no").val();
        		}
        		var no = $("#no").val();
        		

$("#SNS").click(function(){
        			
        			
        			location.href="snsMyPageView.do?cust_no="+cust_no+"&provider_no="+provider_no;
        		})	
    		   
    	var cafe_no = $("#cafeno").val();
			    
		$.getJSON(
			"getCafeIMGS",{"cafe_no":cafe_no},function(data){
	
				$.each(data,function(idx,cafeimages){
					var li = $('<li><img alt="" src="cafe_img/'+cafeimages.cafe_img_name+'" width="500px" height="400px"></li>');
					
					$("#cafeIMG").append(li);
				   
				})
			
			}
		);
    		
    		
    		
    	$("#roomBtn").click(function(){
    		var cafe_no = $("#cafeno").val();
    		location.href="reserRoomView.do?cafe_no="+cafe_no+"";
    		
    	})	
    		
    	$("#passBtn").click(function(){
    		var cafe_no = $("#cafeno").val();
    		var amount = $("#amount").val();
			var pass_no = $("#sel1 option:selected").val();
    		location.href="paymentGetPassView.do?cafe_no="+cafe_no+"&pass_no="+pass_no+"&amount="+amount+"";
    		
    	})	
    		
    	var addr = $("#cafeloc").val();
    	var cafe_name = $("#cafename").val();
    	
    	
    	
    		
    	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    	    mapOption = {
    	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    	        level: 3 // 지도의 확대 레벨
    	    };  

    	// 지도를 생성합니다    
    	var map = new kakao.maps.Map(mapContainer, mapOption); 

    	// 주소-좌표 변환 객체를 생성합니다
    	var geocoder = new kakao.maps.services.Geocoder();
    	
    	var x = 0;
    	var y = 0;

    	
    	// 주소로 좌표를 검색합니다
    	geocoder.addressSearch(addr, function(result, status) {

    	    // 정상적으로 검색이 완료됐으면 
    	     if (status === kakao.maps.services.Status.OK) {

    	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
    	        
    	        var addr = $("#address").val();
    	      	var cafe_loc = $("#cafeloc").val();
    	      	
    	    	var cafe_name = $("#cafename").val();
    	    	var cafe_phone = $("#cafephone").val();
    	    	   
    	    	   $("#address").attr('href','https://map.kakao.com/link/map/'+cafe_name+','+result[0].y+','+result[0].x+'');
    	    	   $("#address").html(cafe_loc)
    	    	   $("#bigBtn").attr('href','https://map.kakao.com/link/map/'+cafe_name+','+result[0].y+','+result[0].x+'');
    	    	   
    	       
    	    	   
    	        
    	        

    	        // 결과값으로 받은 위치를 마커로 표시합니다
    	        var marker = new kakao.maps.Marker({
    	            map: map,
    	            position: coords
    	        });

    	        // 인포윈도우로 장소에 대한 설명을 표시합니다
    	        var infowindow = new kakao.maps.InfoWindow({
    	            content:  '<div class="wrap">' + 
    	            '    <div class="info">' + 
    	            '        <div class="title">' + 
    	            						cafe_name + 
    	            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
    	            '        </div>' + 
    	            '        <div class="body">' + 
    	            '            </div>' + 
    	            '        </div>' + 
    	            '    </div>'    
    	            
    	        });
    	        infowindow.open(map, marker);

    	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    	        map.setCenter(coords);
    	    }
    	    
    	    
    	    
    	    
    	    
    	    
    	});
    		
    
    	
    		$("#upload").hide();
    		
    		
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
    			});
    			
    			$("#upload").trigger('click');
    			
    			
    			
    		
    			
    		});
    		
    		$("#inqInsertBtn").click(function(){
    			var cafe_no = $("#cafeno").val();
    			var content = $("#form23").val();
    			var cust_no = $("#custno").val();
    			var issecret = $("#secret").prop("checked");
    			$("#form23").val("");
    			
    			$.ajax({
    				url:"insertInq",
    				data:{"cafe_no":cafe_no,"content":content,"cust_no":cust_no,"issecret":issecret},
    				success:function(data){
    					alert(data);
    					var start = (currentPage-1) * pageSIZE +1;	
    		    		var end = currentPage * pageSIZE;
    		    		$("#inqContent").empty();
    					listAllInq(cafe_no, start, end);
    				
    			}});
    			
    			
    		});
    		
    	
    		$("#upload").click(function () {
  				 
		        //preventDefault 는 기본으로 정의된 이벤트를 작동하지 못하게 하는 메서드이다. submit을 막음
		     /*    event.preventDefault();
		 
		        // Get form
		       	 /* 	var form = $('#reviewIMG')[0]; */
		        
		        /*     var fileInput = document.getElementById("upFiles");
		            var files = fileInput.files;
		            var file;
		            for (var i = 0; i < files.length; i++) {
		                file = files[i];
		                alert(file.name);
		                console.log(file.name);
		            }
		            var data = new FormData();

		            $.each($("input[type='file']")[0].files, function(i, file) {
		                data.append('file', file);
		            });
		   

		        
		        
		     
		        var data = new FormData(fileInput);
		 		alert(data);
	
		        $("#upload").prop("disabled", true);
		 		var fileName = $("#upFiles").val();
		 		alert(fileName)
		        $.ajax({
		            type: "POST",
		            enctype: 'multipart/form-data',
		            url: "uploadIMG",
		            data: data,
		            processData: false,
		            contentType: false,
		            cache: false,
		            timeout: 1000,
		            success: function (data) {
		                alert("성공");
		                $("#btnSubmit").prop("disabled", false);
		            },
		            error: function (e) {
		                console.log("ERROR : ", e);
		                $("#btnSubmit").prop("disabled", false);
		                alert("실패");
		            }
		        });
	 */
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
    						var review_no = vo.review_no;
    						
    						
    						var mediaclear = $(' <div class="media clearfix" style="margin-top: 10px;"></div>');
    						var img = $('<img src="cust_img/'+vo.cust_img+'" class="rounded-circle mr-3 d-flex" width="60" alt="">');
    					
    						var mediabody = $('<div class="media-body border-none"></div>');
    						var star = $('<p class="text-secondary mb-0"></p>');
    							for(var i=1;i<=vo.grade;i++){
    								star.append('<i class="fas fa-star"></i>');
    							}
    							for(var i=1;i<=(5-vo.grade);i++){
    								star.append('<i class="far fa-star" id="five"></i>');
    							}
    						var h6 = $('<h6>'+vo.cust_name+'</h6>');
    						var pp = $('<div></div>');
    						var pp2 = $('<span style="display:block;">'+vo.review_content+'</span>');
    						var rvimg = ""; 
    						
    						var imgDiv = $('<div></div>');
	    					$(pp).append(pp2);
	    						$.getJSON(
	    			    			"getReviewImg",{"review_no":review_no},function(data){
	    			    				
	    			    				
	    			    				 	$.each(data,function(idx,img){
	    			    				 	 	 rvimg = $('<p style=" text-align : right;"><img src="cafe_img/'+img.review_img+'" alt="" class="img-fluid" style="width:150px; height:100px;"></p>'); 
	    			    					
	    			    					
	    			    				/* 	var rvimg = $('<a href="cafe_img/'+img.review_img+'" class="simple-hover" style="width:200px; display:inline	"><img src="cafe_img/'+img.review_img+'" alt="" class="img-fluid" width="200px" height="150px"></a>');  */
	    			    			
	    			    				}); 
	    			    				 
    			    				$(imgDiv).append(rvimg);
	    			    			$(pp).after(imgDiv); 
	    			    			
	    			    			
	    			    			}
	    			    		) 
    					
	    			    		
    						var arwicon = $('<p style=" text-align : right;">리뷰 펼치기<i class="fas fa-chevron-down"></i></p>');
	    					
    						var hr =$('<hr style="margin-bottom: 0px!important">');
							
							$(arwicon).click(function(){
								var arwiconRev = $('<p style=" text-align : right;">리뷰 접기<i class="fas fa-chevron-up"></i></p>');
								$(pp).append(pp2);
						 		$(arwicon).hide();
						 		$(imgDiv).empty();
						 		$(rvimg).remove();
						 		$.getJSON(
		    			    			"getReviewImg",{"review_no":review_no},function(data){
		    			    				
		    			    				
		    			    				 	$.each(data,function(idx,img){
		    			    						var rvimg = $('<a href="cafe_img/'+img.review_img+'" class="simple-hover" style="width:200px; height:150px; display:inline	"><img src="cafe_img/'+img.review_img+'" alt="" class="" width="350px" height="250px!important"></a>'); 
		    			    							
		    			    						$(imgDiv).append(rvimg);
		    			    				 	}); 
		    			    				 	$(pp).after(imgDiv); 
		    			    			});
						 		$(mediabody).append(arwiconRev);
						 		
						 		$(arwiconRev).click(function(){
						 			
						 			$(pp).empty();
						 			$(pp).append(pp2);
						 			$(rvimg).remove();
						 			$(arwiconRev).remove();
							 		$(arwicon).show();
									$(imgDiv).empty();
							 		$.getJSON(
			    			    			"getReviewImg",{"review_no":review_no},function(data){
			    			    				
			    			    				 	$.each(data,function(idx,img){
			    			    					
			    			    					
			    			    				 		var rvimg = $('<p style=" text-align : right;"><img src="cafe_img/'+img.review_img+'" alt="" class="img-fluid" style="width:150px; height:100px;"></p>'); 
			    			    							
			    			    					
			    			    				 	}); 
			    			    				 	$(pp).after(rvimg); 
			    			    			});
							 		
						 		})
							});
    						
							
    						$(mediabody).append(arwicon);
    						$(mediabody).append(star,h6,pp,arwicon);
    						
    						if(vo.review_reply != null){
    							var hr2 = $(' <hr style="margin-bottom: 0px!important";width:120%!important> ');
	    						var span = $('<span><font id="manager" style="font-weight: bold; margin-bottom: 5px; color: orange; font-size: 16px">'+cafe_name+' 관리자</font></span><br>');
	    						
	    						var icon = $('<i class="fas fa-reply fa-rotate-180" style="width: 30px; height: 30px; margin-top: 0px; position: relative; top: -15px;" ></i><br>');
	    						
	    						var reply = $('<span style="position: relative; left: 40px; top: -30px;">'+vo.review_reply+'</span>');
	    						$(mediabody).append(hr2,span,icon,reply);
	    						
    						}
    					
    						
    						
    		
    						$(mediaclear).append(img,mediabody,hr);
    						
                      		$("#reviewContent").append(mediaclear,hr);
    						
    					});
    			});	
        	}
        	
        	listAllReview(cafe_no, reviewStart, reviewEnd);
    		
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
    						var img = $('<img src="cust_img/'+vo.cust_img+'" class="rounded-circle mr-3 d-flex" width="60" alt="">');
    					
    						var mediabody = $('<div class="media-body border-none"></div>');
    						if(vo.issecret == 'true'){
    							var cust_no = $("#custno").val();
    							if(vo.cust_no == cust_no){
    								var h6 = $('<h6>'+vo.cust_nick+'</h6><i class="fas fa-unlock-alt"></i>'+vo.inq_content+'<br>');
    							}else{
    								var h6 = $('<h6>'+vo.cust_nick+'</h6><i class="fas fa-lock"></i>비밀글 입니다<br>');
    							}
    						}else{
    							var h6 = $('<h6>'+vo.cust_nick+'</h6>'+vo.inq_content+'<br>');
    						}
    						
    						var hr =$('<hr style="margin-bottom: 0px!important">');
    						$(mediabody).append(h6);
    						
    						if(vo.inq_reply != null){
								var span = $('<span><font id="manager" style="font-weight: bold; margin-bottom: 5px; color: orange; font-size: 16px">'+cafe_name+' 관리자</font></span><br>');
	    						
	    						var icon = $('<i class="fas fa-reply fa-rotate-180" style="width: 30px; height: 30px; margin-top: 0px; position: relative; top: -15px;" ></i><br>');
	    						
    							if(vo.issecret == 'true'){
    								var cust_no = $("#custno").val();
        							if(vo.cust_no == cust_no){
        								var reply = $('<span style="position: relative; left: 40px; top: -30px;"><i class="fas fa-unlock-alt"></i>'+vo.inq_reply+'</span>');
        							}else{
    									var reply = $('<span style="position: relative; left: 40px; top: -30px;"><i class="fas fa-lock"></i>비공개 답변입니다</span>');
        							}
        						}else{
	    							var reply = $('<span style="position: relative; left: 40px; top: -30px;">'+vo.inq_reply+'</span>');
    							}
	    						
    							$(mediabody).append(hr,span,icon,reply);
	    						
	    						
    						}
    		
    				
    						
    					
    						
    						
    						
    						
    						$(mediaclear).append(img,mediabody);
    						
    				
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
    		
    		listAllInq(cafe_no, start, end);
    		
    		var chkBox = function(cbname){
    			
    			if(cbname == "와이파이"){
    				var li = $('<li class="col-sm-4 col-md-3 py-2 col-6"></li>');
    					var icon = $('<i class="fa fa-wifi float-left w40 rounded-circle bg-gray mr-3"></i>	');
    					var div = $('<div class="oHidden"></div>');
    						var small = $('<small class="d-block pt-1">Wi-Fi</small>');
    						var h6 = $('<h6 class="text-secondary">WI-FI</h6>');
    						
    				$(div).append(small,h6);		
    				$(li).append(icon,div);		
    				$("#chkboxVal").append(li);
    				
    			}else if(cbname == "화장실"){
    				var li = $('<li class="col-sm-4 col-md-3 py-2 col-6"></li>');
					var icon = $('<i class="fas fa-restroom float-left w40 rounded-circle bg-gray mr-3"></i>');
					var div = $('<div class="oHidden"></div>');
						var small = $('<small class="d-block pt-1">실내화장실</small>');
						var h6 = $('<h6 class="text-secondary">TOILET</h6>');
						
					$(div).append(small,h6);		
					$(li).append(icon,div);		
					$("#chkboxVal").append(li);
    				
    			}else if(cbname == "노트북"){
    				var li = $('<li class="col-sm-4 col-md-3 py-2 col-6"></li>');
					var icon = $('<i class="fas fa-laptop float-left w40 rounded-circle bg-gray mr-3"></i>	');
					var div = $('<div class="oHidden"></div>');
						var small = $('<small class="d-block pt-1">노트북</small>');
						var h6 = $('<h6 class="text-secondary">NOTEBOOK</h6>');
						
					$(div).append(small,h6);		
					$(li).append(icon,div);		
					$("#chkboxVal").append(li);
    				
    			}else if(cbname == "키보드/마우스"){
    				var li = $('<li class="col-sm-4 col-md-3 py-2 col-6"></li>');
					var icon = $('<i class="fas fa-mouse float-left w40 rounded-circle bg-gray mr-3"></i>	');
					var div = $('<div class="oHidden"></div>');
						var small = $('<small class="d-block pt-1">키보드/마우스</small>');
						var h6 = $('<h6 class="text-secondary">KEYBOARD/MOUSE</h6>');
						
					$(div).append(small,h6);		
					$(li).append(icon,div);		
					$("#chkboxVal").append(li);
    				
    			}else if(cbname == "컴퓨터"){
    				var li = $('<li class="col-sm-4 col-md-3 py-2 col-6"></li>');
					var icon = $('<i class="fas fa-mobile float-left w40 rounded-circle bg-gray mr-3"></i>	');
					var div = $('<div class="oHidden"></div>');
						var small = $('<small class="d-block pt-1">컴퓨터</small>');
						var h6 = $('<h6 class="text-secondary">COMPUTER</h6>');
							
					$(div).append(small,h6);		
					$(li).append(icon,div);		
					$("#chkboxVal").append(li);
    				
    			}else if(cbname == "모니터"){
    				var li = $('<li class="col-sm-4 col-md-3 py-2 col-6"></li>');
					var icon = $('<i class="fas fa-tv float-left w40 rounded-circle bg-gray mr-3"></i>	');
					var div = $('<div class="oHidden"></div>');
						var small = $('<small class="d-block pt-1">모니터</small>');
						var h6 = $('<h6 class="text-secondary">MONITOR</h6>');
						
					$(div).append(small,h6);		
					$(li).append(icon,div);		
					$("#chkboxVal").append(li);
    				
    			}else if(cbname == "프로젝터"){
    				var li = $('<li class="col-sm-4 col-md-3 py-2 col-6"></li>');
					var icon = $('<i class="fas fa-video float-left w40 rounded-circle bg-gray mr-3"></i>	');
					var div = $('<div class="oHidden"></div>');
						var small = $('<small class="d-block pt-1">빔 프로젝터</small>');
						var h6 = $('<h6 class="text-secondary">PROJECTOR</h6>');
						
					$(div).append(small,h6);		
					$(li).append(icon,div);		
					$("#chkboxVal").append(li);
    				
    			}else if(cbname == "단체석"){
    				var li = $('<li class="col-sm-4 col-md-3 py-2 col-6"></li>');
					var icon = $('<i class="fas fa-users float-left w40 rounded-circle bg-gray mr-3"></i>	');
					var div = $('<div class="oHidden"></div>');
						var small = $('<small class="d-block pt-1">단체석</small>');
						var h6 = $('<h6 class="text-secondary">MEETING ROOM</h6>');
						
					$(div).append(small,h6);		
					$(li).append(icon,div);		
					$("#chkboxVal").append(li);
    				
    			}else if(cbname == "개인사물함"){
    				var li = $('<li class="col-sm-4 col-md-3 py-2 col-6"></li>');
					var icon = $('<i class="fas fa-door-closed float-left w40 rounded-circle bg-gray mr-3"></i>	');
					var div = $('<div class="oHidden"></div>');
						var small = $('<small class="d-block pt-1">개인 사물함</small>');
						var h6 = $('<h6 class="text-secondary">LOCKER</h6>');
						
					$(div).append(small,h6);		
					$(li).append(icon,div);		
					$("#chkboxVal").append(li);
    				
    			}else if(cbname == "음료제공"){
    				var li = $('<li class="col-sm-4 col-md-3 py-2 col-6"></li>');
					var icon = $('<i class="fas fa-coffee float-left w40 rounded-circle bg-gray mr-3"></i>	');
					var div = $('<div class="oHidden"></div>');
						var small = $('<small class="d-block pt-1">음료제공</small>');
						var h6 = $('<h6 class="text-secondary">CAFE</h6>');
						
					$(div).append(small,h6);		
					$(li).append(icon,div);		
					$("#chkboxVal").append(li);
    				
    			}else if(cbname == "출입통제"){
    				var li = $('<li class="col-sm-4 col-md-3 py-2 col-6"></li>');
					var icon = $('<i class="fas fa-shield-alt float-left w40 rounded-circle bg-gray mr-3"></i>	');
					var div = $('<div class="oHidden"></div>');
						var small = $('<small class="d-block pt-1">출입보안</small>');
						var h6 = $('<h6 class="text-secondary">SECURITY</h6>');
						
					$(div).append(small,h6);		
					$(li).append(icon,div);		
					$("#chkboxVal").append(li);
    				
    			}else if(cbname == "멤버쉽"){
    				var li = $('<li class="col-sm-4 col-md-3 py-2 col-6"></li>');
					var icon = $('<i class="far fa-id-card float-left w40 rounded-circle bg-gray mr-3"></i>	');
					var div = $('<div class="oHidden"></div>');
						var small = $('<small class="d-block pt-1">멤버쉽</small>');
						var h6 = $('<h6 class="text-secondary">MEMBERSHIP</h6>');
						
					$(div).append(small,h6);		
					$(li).append(icon,div);		
					$("#chkboxVal").append(li);
    				
    			}else if(cbname == "무인결제"){
    				var li = $('<li class="col-sm-4 col-md-3 py-2 col-6"></li>');
					var icon = $('<i class="fas fa-cash-register float-left w40 rounded-circle bg-gray mr-3"></i>	');
					var div = $('<div class="oHidden"></div>');
						var small = $('<small class="d-block pt-1">무인결제</small>');
						var h6 = $('<h6 class="text-secondary">UNATTENDED PAY</h6>');
						
					$(div).append(small,h6);		
					$(li).append(icon,div);		
					$("#chkboxVal").append(li);
    				
    			}else if(cbname == "CCTV"){
    				var li = $('<li class="col-sm-4 col-md-3 py-2 col-6"></li>');
					var icon = $('<i class="fas fa-camera float-left w40 rounded-circle bg-gray mr-3"></i>	');
					var div = $('<div class="oHidden"></div>');
						var small = $('<small class="d-block pt-1">CCTV</small>');
						var h6 = $('<h6 class="text-secondary">CCTV</h6>');
						
					$(div).append(small,h6);		
					$(li).append(icon,div);		
					$("#chkboxVal").append(li);
    				
    			}else if(cbname == "알림서비스"){
    				var li = $('<li class="col-sm-4 col-md-3 py-2 col-6"></li>');
					var icon = $('<i class="far fa-bell float-left w40 rounded-circle bg-gray mr-3"></i>	');
					var div = $('<div class="oHidden"></div>');
						var small = $('<small class="d-block pt-1">알림서비스</small>');
						var h6 = $('<h6 class="text-secondary">TIME ALARM</h6>');
						
					$(div).append(small,h6);		
					$(li).append(icon,div);		
					$("#chkboxVal").append(li);
    				
    			}else if(cbname == "24시간"){
    				var li = $('<li class="col-sm-4 col-md-3 py-2 col-6"></li>');
					var icon = $('<i class="fas fa-history float-left w40 rounded-circle bg-gray mr-3"></i>	');
					var div = $('<div class="oHidden"></div>');
						var small = $('<small class="d-block pt-1">24시간</small>');
						var h6 = $('<h6 class="text-secondary">24HOURS</h6>');
						
					$(div).append(small,h6);		
					$(li).append(icon,div);		
					$("#chkboxVal").append(li);
    				
    			}
    		}
    		
    		
    		var chkPrint = function(cafe_no){
    			$.getJSON({
    	   			url:"chkbox",
    	   			data:{"cafe_no":cafe_no},
    	   			success:function(data){
    	   				$.each(data,function(idx,item){
    	   					var cbname = item.cafe_chkbox_name;
    	   					chkBox(cbname);
    	   				});
    	   			}
    	   		})
    		}
    		
    		chkPrint(cafe_no);
	   		
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

.dropdown-item{
	color: #BDBDBD!important;
}
	</style>
	
<body>
<c:forEach var="chk" items="${chkbox }">
	<input type="hidden" value="${chk.cafe_chkbox_name }">
</c:forEach>

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
	
        	<input id="role" type="hidden" value="${loginVo.role }">
           <input id="no" type="hidden" value="${loginVo.no }">
  
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
                <ul id="chkboxVal" class="course-detail-meta row list-unstyled">
                    <!-- <li class="col-sm-4 col-md-3 py-2 col-6">
                    
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
                    </li> -->
                </ul>
                <div style="position:relative;height:0;padding-bottom:40.25%">
                	<div id="slide" style="width: 500px; height: 400px;">
					  <input type="radio" name="pos" id="pos1" checked>
					  <input type="radio" name="pos" id="pos2">
					  <input type="radio" name="pos" id="pos3">
					  <input type="radio" name="pos" id="pos4">
					  <ul id="cafeIMG">
					    <li><img alt="" src="cafe_img/${cafe.main_img }" width="500px" height="400px"></li>
					
					  </ul>
					  <p class="pos">
					    <label for="pos1"></label>
					    <label for="pos2"></label>
					    <label for="pos3"></label>
					    <label for="pos4"></label>
					  </p>
					</div>
					                	
                    
                    <div style="position: relative; left: 550px; top: -400px;">
                    	
                    	
                    	<h5><font style="color: black;"><i class="fa fa-map-marker-alt" aria-hidden="true">　</i><a id="address" target="_blank">${cafe.cafe_loc }</a></font></h5><br>
                    	<h5><font style="color: black;"><i class="far fa-clock"></i>　${cafe.cafe_hrs }</font></h5><br>
                    	<h5><font style="color: black;"><i class="fas fa-phone"></i>　${cafe.cafe_phone }</font></h5><br>
                    	<h5><font style="color: black;"><i class="fa fa-krw" aria-hidden="true"></i>　(ROOM)${cafe.room_price }~</font></h5><br>
                    	<div class="pass">
						    <h5><font style="color: black;"><i class="fa fa-krw" aria-hidden="true"></i>　이용권</font></h5>
						 
						   
						   <div class="form-group">
							  <select class="form-control" id="sel1" style="width:270px; font-size:18px;height:15px; margin-bottom: 0px; display: inline; ">
								 	<c:forEach var="passvo" items="${pass }">
								 		 <option value="${passvo.pass_no }">${passvo.pass_content }</option>
								 	</c:forEach>					
						    </select>
						    <label for="amount"><font style="font-size: 18px;">수량</font></label>
						    <input type="number" id="amount" class="form-control" style="width: 100px; display: inline; font-size: 18px;height:15px; position: relative; bottom: 3px;" value="1">
						    </div>
						</div>
						<!-- 버튼 -->
						<button type="button" id="roomBtn" class="btn btn-outline-warning mb5" style="margin-top: 5px; margin-right: 10px;">룸 예약하기</button>
						<button type="button" id="passBtn" class="btn btn-outline-warning mb5" style="margin-top: 5px; margin-right: 10px;">이용권 구매</button>
						<button type="button" class="btn btn-outline-warning mb5" style="margin-top: 5px" id="seatBtn">실시간 좌석</button>
                    	
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
                                    <div id="map" style="width:300px;;height:450px;"></div>
                                    <div>
                                     
                                    </div>
                                    <br>
                                    <a id="bigBtn" target="_blank" class="btn btn-outline-warning mb5">
                                        <i class="fa fa-search-plus mr-2" ></i>크게보기
                                    </a>
                                </div>
                            </div>
                        </div>
                        <!--tab pane-->
                         <div class="tab-pane" id="c-qa">
                       
                             <h5 style="margin-bottom: 30px;">문의 작성</h5>
                            <div class="media clearfix" style="margin-top: 10px;">

                                <img src="cust_img/${cust.cust_img }" class="rounded-circle mr-3 d-flex" width="60" alt="">
                                <div class="media-body border-none">
                                    <h6>　${cust.cust_nick }</h6>
                                    <p class="text-secondary mb-0">
                                      
                                         
                                    </p>
                                  <div class="md-form mb-4 pink-textarea active-pink-textarea-2" style="width: 1000px;">
									  <i class="fas fa-angle-double-right prefix"></i>
									    	
									  <c:choose>
									  	<c:when test="${empty loginVo.no }">
									  		 <textarea id="form23" class="md-textarea form-control" rows="3" cols="70" style="width: 800px; display: inline;" readonly="readonly" placeholder="비로그인 상태에서는 문의를 남길 수 없습니다"></textarea>
									  	</c:when>
									  	<c:when test="${loginVo.role eq 'provider'}">
									  		 <textarea id="form23" class="md-textarea form-control" rows="3" cols="70" style="width: 800px; display: inline;" readonly="readonly" placeholder="사업자 분은 문의를 남길 수 없습니다"></textarea>
									  	</c:when>
									  	<c:otherwise>
									  		 <textarea id="form23" class="md-textarea form-control" rows="3" cols="70" style="width: 800px; display: inline;"></textarea>
									  	</c:otherwise>
									  </c:choose>
									 
									  <button id="inqInsertBtn" class="btn btn-outline-primary mb5" style="position: relative; top: -30px; left: 20px;">등록</button>
									  <input id="secret" type="checkbox" style="position: relative; left: -890px; top:20px;">
									  
									  <label for="secret" style="position: relative; left: -890px; top:20px;">비공개</label>
									  <label for="form23">　　문의를 남겨주세요</label>
								</div>
                                </div>
                            </div><!--/.review-->
                            <input id="cafeno" type="hidden" value="${cafe.cafe_no }"> 
                            <input id="cafename" type="hidden" value="${cafe.cafe_name }"> 
                            <input id="custno" type="hidden" value="${loginVo.no}"> 
                            <input id="cafeloc" type="hidden" value="${cafe.cafe_loc }"> 
                            <input id="cafephone" type="hidden" value="${cafe.cafe_phone }"> 
                        
                        
                             <h5 style="margin-bottom: 30px; margin-top: 30px;">최근 문의글</h5>
                             <div id="inqContent"> </div>
                            <%--  <c:forEach var="inqvo" items="${inqs }">
                             <div  class="media clearfix" style="margin-top: 10px;">
                           
                                <img src="assets/images/${inqvo.cust_img }" class="rounded-circle mr-3 d-flex" width="60" alt="">
                                <div class="media-body border-none">
                                    <h6>${inqvo.cust_nick }</h6>
                                 
                             
                                           	${inqvo.inq_content }<br>
                                           
                                           	<c:if test="${!empty inqvo.inq_reply  }">
                                           		<hr style="margin-bottom: 0px!important">
	                                           	<span><font id="manager" style="font-weight: bold; margin-bottom: 5px; color: orange; font-size: 16px">${cafe.cafe_name } 관리자</font></span><br>
	                                           	<i class="fas fa-reply fa-rotate-180" style="width: 30px; height: 30px; margin-top: 0px; position: relative; top: -15px;" ></i><br>
	                                           	<span style="position: relative; left: 40px; top: -30px;">
	                                           		${inqvo.inq_reply }
	                                           	</span>
                                           	</c:if>
                                    
                                </div>
                            </div><!--/.review-->
                            </c:forEach> --%>
	                            
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
                           
                                <img src="cust_img/${cust.cust_img }" class="rounded-circle mr-3 d-flex" width="60" alt="">
                                <div class="media-body border-none">
                                    <h6>${cust.cust_nick }</h6>
                                 
                                    <p class="text-secondary mb-0">
                                      
                                            <i class="far fa-star" id="one"></i>
                                            <i class="far fa-star" id="two"></i>
                                            <i class="far fa-star" id="three"></i>
                                            <i class="far fa-star" id="four"></i>
                                            <i class="far fa-star" id="five"></i>
                                         
                                    </p>
                                  <div class="md-form amber-textarea active-amber-textarea-2" style="width: 1000px;">
                                  
									  <i class="fas fa-pencil-alt prefix" style="display: inline;"></i>
									  <form id="reviewIMG" action="requestupload2.do" method="post" enctype="multipart/form-data" target="iframe1">
									  	  <input type="hidden" name="cafe_no" value="${cafe.cafe_no }">
									  	  <input type="hidden" name="cust_no" value="${loginVo.no}">
										  <input id="upFiles" multiple="multiple" type="file" name="file">
										  <button id="upBtn" class="btn btn-outline-warning mb5" style="display: block;">사진선택</button>
										  <button id="resetBtn" class="btn btn-outline-warning mb5" style="display: block;">다시선택</button>
										  	<output id="list"></output>
										  <input type="submit" id="upload">
									  </form>
									  <c:choose>
									  	<c:when test="${empty loginVo.no }">
			 									<textarea id="form24" class="md-textarea form-control" rows="3" cols="70" style="width: 800px; display: inline;" readonly="readonly" placeholder="비로그인 상태에서는 리뷰를 남길 수 없습니다"></textarea>
									  	</c:when>
									  	<c:when test="${loginVo.role eq 'provider'}">
									  		 <textarea id="form23" class="md-textarea form-control" rows="3" cols="70" style="width: 800px; display: inline;" readonly="readonly" placeholder="사업자 분은 리뷰를 남길 수 없습니다"></textarea>
									  	</c:when>
									  	<c:otherwise>
									  		 	<textarea id="form24" class="md-textarea form-control" rows="3" cols="70" style="width: 800px; display: inline;"></textarea>
									  	</c:otherwise>
									  </c:choose>
									  
									 
									  <button id="reviewAddBtn" class="btn btn-outline-warning mb5" style="position: relative; top: -30px; left: 20px;">등록</button>
								 	  <label for="form24">　리뷰를 작성해 주세요</label>
							
								</div>
                                </div>
                            </div><!--/.review-->
                            <h5 style="margin-bottom: 30px; margin-top: 30px;">최신 리뷰</h5>
                              <div class="container popup-container mb50">	
                              <div id="reviewContent">
                             
                     <%--        <c:forEach var="review" items="${review }">
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
                                         	<br>
                                         	<span id="rvimg">
                                         	
                                         	</span>
	                                          
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
                          
                            </c:forEach> --%>
                            </div>
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
                                    <h5>취소 환불 규정</h5>
                                    <hr>
                                    <p>
                                       	<font class="info" style="font-weight: bold;">${cafe.cafe_policy }</font><br>

										
                                    </p>
                                  

										
										

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
<iframe src="#" name="iframe1" style="width:1px; height:1px; border:0; visibility:hidden;"></iframe>
        <!--back to top-->
        <a href="#" class="back-to-top hidden-xs-down" id="back-to-top"><i class="ti-angle-up"></i></a>
        <!-- jQuery first, then Tether, then Bootstrap JS. -->
        <script src="js/plugins/plugins.js"></script> 
        <script src="js/assan.custom.js"></script> 
    </body>
</html>
