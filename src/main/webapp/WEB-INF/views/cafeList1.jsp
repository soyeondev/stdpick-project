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
	       	<style type="text/css">
       		.searchBtn:hover{
       			color: white!important;
       			background-color: #F4923D!important;
       			
       		}
       		
       	</style>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script type="text/javascript">


    	var firstStart = 1;
		var firstEnd = 5;
		var sellStart = 1;
		var sellEnd = 5;
		var gradeStart = 1;
		var gradeEnd = 5;
		var passStart = 1;
		var passEnd = 5;
		var roomStart = 1;
		var roomEnd = 5;
		var searchStart = 1;
		var searchEnd = 5;
		
       		$(function(){
       	      
       			
       			
       			var totalCount = 0;
       			
       			var cust_no = $("#loginID").val();
       			if(cust_no=null){
       				cust_no=0;
       				
       			}
       			
       			
       			$.getJSON("totalCount",function(cnt){
       				totalCount = cnt;
       			});
       			
       			var list = function(cafevo){
       			
					var itemcenter =  $('<div class="row align-items-center"></div>');
					var col_5 = $('<div class="col-sm-5"></div>');
						var listing = $('<a class="listing-thumb" href="#"></a>');
						var main_img = $('<img src="cafe_img/'+cafevo.main_img+'" alt="" class="img-fluid" style="height: 230px; width: 400px;">')
						var span_listing = $('<span class="listing-label sale"></span>');
					var col_8 = $(' <div class="col-sm-7"></div>');
						var listing_content = $('<div class="listing-content-alt"></div>');
							var span_star = $('<span class="float-right rating"></span>');
							var star = $('<div style="color:#F4923D"><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><p>(0)</p></div>');
				
							var cafeno = Number(cafevo.cafe_no); 	
							var starChild = $.getJSON("printStar",{cafeno:cafeno},function(data){
							
		       					$.each(data,function(idx,stars){
		       						var avg = Number(stars.avg);
		       						var count = $('<font>('+stars.count+')</font>')

		       							if (avg<0.5){
		       								star.empty();
		       								var zero = $('<i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>');
		       							
		       								star.append(zero);
		       								star.append(count);
		       							}
		       							else if (avg == null){
		       								star.empty();
		       								var zero = $('<i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>');
		       					
		       								star.append(zero);
		       								star.append(count);
		       							}
		       							else if (avg>=0.5 && avg <1.0) {
		       								star.empty();
											var half = $('<i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>');
											star.append(half);
											star.append(count);
		       							}
		       							else if (avg>=1.0 && avg <1.5) {
		       								star.empty();
											var one = $('<i class="fa fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>');
											star.append(one);
											star.append(count);
		       							}
		       							else if (avg>=1.5 && avg <2.0) {
		       								star.empty();
											var onehalf = $('<i class="fa fa-star"></i><i class="fa fa-star"><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>');
											star.append(onehalf);
											star.append(count);
		       							}
		       							else if (avg>=2.0 && avg <2.5) {
		       								star.empty();
											var two = $('<i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>');
		       								star.append(tow);
		       								star.append(count);
		       							}
		       							else if (avg>=2.5 && avg <3.0) {
		       								star.empty();
											var twohalf = $('<i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>');
		       								star.append(twohalf);
		       								star.append(count);
		       							}
		       							else if (avg>=3.0 && avg <3.5) {
		       								star.empty();
											var three = $('<i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>');
		       								star.append(three);
		       								star.append(count);
		       							}
		       							else if (avg>=3.5 && avg <4.0) {
		       								star.empty();
											var threehalf = $('<i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="far fa-star"></i>');
											star.append(threehalf);
											star.append(count);
		       							}
		       							else if (avg>=4.0 && avg <4.5) {
		       								star.empty();
											var four = $('<i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>');
											var empty = $('<i class="far fa-star"></i>');
											star.append(four,empty);
											star.append(count);
		       							}
		       							else if (avg>=4.5 && avg <5.0) {
		       								star.empty();
											var fourhalf = $('<i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star">');
											star.append(fourhalf);
											star.append(count);
		       							}
		       							else if (avg==5.0) {
		       								star.empty();
											var five = $('<i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>');
											star.append(five);
											star.append(count);
		       							}
		       						
		       					});
		       					
		       				}); 
		       				
							var title = $('<h3><a href="cafeDetail2.do?cafe_no='+cafevo.cafe_no+'&cust_no=0" style="color:black;">'+cafevo.cafe_name+'</a></h3>');
							var addr = $('<a href="#" class="listing-location" style="color:#2E2E2E"><i class="fa fa-map-marker"></i>'+cafevo.cafe_loc+'</a>');
							var ul = $('<ul class="listing-meta list-inline clearfix"></ul>');
						 	var ul2 = $('<ul class="clearfix list-inline listing-row-inline mb0"></ul>');
								var li1 = $('<li class="list-inline-item"></li>');
									var li_a = $('<a href="#"><i class="ti-user" style="color:#2E2E2E"></i><font style="color:#2E2E2E">'+cafevo.cafe_name+'</font></a>');
								var li2 = $('<li class="list-inline-item"></li>');
									var li_a2 = $('<a href="#"><i class="ti-mobile" style="color:#2E2E2E"></i><font style="color:#2E2E2E">'+cafevo.cafe_phone+'</font></a>');
								var li3 = $('<li class="list-inline-item"></li>');
									var li_a3 = $('<a href="#"><i class="ti-sharethis" style="color:#2E2E2E"></i><font style="color:#2E2E2E">공유</font></a>');
								var li4 = $('<li class="list-inline-item"></li>');
									var li_a4 = $('<a href="#"><i class="ti-heart" style="color:#2E2E2E"></i><font style="color:#2E2E2E">찜</font></a>');
							var hr = $('<hr>');
							var listing_footer = $('<div class="property-listing-footer clearfix"></div>');
								var f_right = $('<div class="float-right"></div>')
								if(cust_no==null){
									cust_no = 0;
								}
									var detail_a = $(' <a href="cafeDetail2.do?cafe_no='+cafevo.cafe_no+'&cust_no='+cust_no+'" style="color:#F4923D; border-color:#F4923D;" class="btn btn-outline-warning mb5 btn-rounded searchBtn">상세 보기</a>');
								var h4 = $(' <h4 class="font400;" style="color: #F4923D; position: relative; top:10px;">ROOM : ￦'+cafevo.room_price+' / 좌석 : ￦'+cafevo.pass_price+'</h4>');
								
								 	
				var br = $("<br><br>");
				$(col_5).append(listing,main_img,span_listing);
				
				$(li1).append(li_a);
				$(li2).append(li_a2);
				$(li3).append(li_a3);
				$(li4).append(li_a4);
				
				$(ul2).append(li1,li2,li3,li4);
				
				$(f_right).append(detail_a);
				
				$(listing_footer).append(f_right,h4);
				
				$(listing_content).append(span_star,star,title,addr,ul,ul2,hr,listing_footer);
				
				$(col_8).append(listing_content);
				
				$(itemcenter).append(col_5,col_8);
				
				
				
				$("#listArea").append(itemcenter,br);
       			}
       			
       			
       			$("#search").click(function(){
       				
       				var sido = $("#sido1 option:selected").val();
       				var gugun = $("#gugun1 option:selected").val();
       				var keyword = $("#keyword").val();
       				searchStart = 1;
       				searchEnd = 5;
       			
       				$("#cafe_si").data("sido",sido);
       				$("#cafe_gu").data("gugun", gugun);
       				$("#keyword").data("keyword",keyword);
       				
       				var s1 = $("#cafe_si").data("sido");
       				var g1 = $("#cafe_gu").data("gugun");
       				var k1 = $("#keyword").data("keyword");
       				
       				
       			/* 	if(gugun == "전체"){
       					gugun.val(" ");
       				} */
       				
       			
       				
       		 	 $("#listArea").empty();
    				$.getJSON("searchCafe",{sido:sido,gugun:gugun,keyword:keyword,"start":searchStart,"end":searchEnd },function(data){
    					$.each(data,function(idx,cafevo){
							list(cafevo);
    					});
    				});
    				searchStart += 5;
    				
       				searchEnd += 5
       				
       				$("#sido1").val(sido);
       				$("#gugun1").val(gugun);
       			}) 
       			
       			
        		$("#sell").click(function(){
        			sellStart = 1;
        			sellEnd = 5;
        			firstStart = 1;
        			firstEnd = 5;
        			gradeStart = 1;
        			gradeEnd = 5;
        			passStart = 1;
        			passEnd = 5;
        			roomStart = 1;
        			roomEnd = 5;
        			var sido = $("#sido1 option:selected").val();	
       				var gugun = $("#gugun1 option:selected").val();
       				var keyword = $("#keyword").val();
        			$("#listArea").empty();
    				$.getJSON("sellSort",{sido:sido,gugun:gugun,keyword:keyword,"start":sellStart,"end":sellEnd},function(data){
    					$.each(data,function(idx,cafevo){
							list(cafevo);
    					});
    					
    				});
    				sellStart += 5;
	        		sellEnd += 5;
       			});
       			
        		$("#grade").click(function(){
        			firstStart = 1;
        			firstEnd = 5;
        			sellStart = 1;
        			sellEnd = 5;
        			gradeStart = 1;
        			gradeEnd = 5;
        			passStart = 1;
        			passEnd = 5;
        			roomStart = 1;
        			roomEnd = 5;
        			var sido = $("#sido1 option:selected").val();	
       				var gugun = $("#gugun1 option:selected").val();
       				var keyword = $("#keyword").val();
        			$("#listArea").empty();
    				$.getJSON("gradeSort",{sido:sido,gugun:gugun,keyword:keyword,"start":gradeStart,"end":gradeEnd},function(data){
    					$.each(data,function(idx,cafevo){
							list(cafevo);
							
    					});
    					
    				});
    				gradeStart += 5;
	        		gradeEnd += 5;
       			});
       			
       			$("#room_price").click(function(){
       				firstStart = 1;
        			firstEnd = 5;
        			sellStart = 1;
        			sellEnd = 5;
        			gradeStart = 1;
        			gradeEnd = 5;
        			roomStart = 1;
        			roomEnd = 5;
        			passStart = 1;
        			passEnd = 5;
        			var sido = $("#sido1 option:selected").val();	
       				var gugun = $("#gugun1 option:selected").val();
       				var keyword = $("#keyword").val();
       				$("#listArea").empty();
    				$.getJSON("roomPriceSort",{sido:sido,gugun:gugun,keyword:keyword,"start":roomStart,"end":roomEnd},function(data){
    					$.each(data,function(idx,cafevo){
							list(cafevo);
    					});
    				
    				});
    				roomStart += 5;
	        		roomEnd += 5;
       			});
       			
       	
       			$("#pass_price").click(function(){
       				firstStart = 1;
        			firstEnd = 5;
        			sellStart = 1;
        			sellEnd = 5;
        			gradeStart = 1;
        			gradeEnd = 5;
        			roomStart = 1;
        			roomEnd = 5;
        			passStart = 1;
        			passEnd = 5;
       				$("#listArea").empty();
       				var sido = $("#sido1 option:selected").val();	
       				var gugun = $("#gugun1 option:selected").val();
       				var keyword = $("#keyword").val();
    				$.getJSON("passPriceSort",{sido:sido,gugun:gugun,keyword:keyword,"start":passStart,"end":passEnd},function(data){
    					$.each(data,function(idx,cafevo){
							list(cafevo);
    					});
    				
    				});
    				passStart += 5;
	        		passEnd += 5;
    					
       			}); 
       			var page = 1;
       			
       			$.getJSON("cafeListAll",{"start":firstStart,"end":firstEnd},function(data){
					$.each(data,function(idx,cafevo){
						list(cafevo);
				
    				 });
					firstStart += 5;
					firstEnd += 5; 
				});   
       			
       		
					
       		  
       			
   				
       			$(window).scroll(function() {
       				let $window = $(this);
       	            let scrollTop = $window.scrollTop();
       	            let windowHeight = $window.height();
       	            let documentHeight = $(document).height();
       	            
       				if(firstEnd <= totalCount ){	
       			    if (scrollTop + windowHeight + 30 > documentHeight) {
       			      console.log(++page);
       			   	var sido = $("#sido1 option:selected").val();	
      				var gugun = $("#gugun1 option:selected").val();
      				var keyword = $("#keyword").val();
       					
       			      	if($('input:radio[name=inlineDefaultRadiosExample]').is(':checked')){
	       			   		
	       	        		if($('input[name="inlineDefaultRadiosExample"]:checked').val() == "sell"){
	       	        			$.getJSON("sellSort",{sido:sido,gugun:gugun,keyword:keyword,"start":sellStart,"end":sellEnd},function(data){
	       	    					$.each(data,function(idx,cafevo){
	       								list(cafevo);
	       	    					});
	       	    				});
	       	        			
	       	        			if(sellEnd>totalCount){
									sellEnd = totalCount
								}	    		
	       	        			
	       	        			sellStart += 5;
	       	        			sellEnd += 5;
	       	        		}else if($('input[name="inlineDefaultRadiosExample"]:checked').val() == "grade"){
	       	        			$.getJSON("gradeSort",{sido:sido,gugun:gugun,keyword:keyword,"start":gradeStart,"end":gradeEnd},function(data){
	       	    					$.each(data,function(idx,cafevo){
	       								list(cafevo);
	       	    					});
	       	    				});
	       	        			
	       	        			if(gradeEnd>totalCount){
	       	        				gradeEnd = totalCount
								}	    		
	       	        			
	       	        			gradeStart += 5;
	       	        			gradeEnd += 5;
	       	        			
	       	        		}else if($('input[name="inlineDefaultRadiosExample"]:checked').val() == "room_price"){
	       	        			$.getJSON("roomPriceSort",{sido:sido,gugun:gugun,keyword:keyword,"start":roomStart,"end":roomEnd},function(data){
	       	    					$.each(data,function(idx,cafevo){
	       								list(cafevo);
	       	    					});
	       	    				});
	       	        			
	       	        			if(roomEnd>totalCount){
									roomEnd = totalCount
								}	    		
	       	        			
	       	        			roomStart += 5;
	       	        			roomEnd += 5;
	       	        			
	       	        		}else if($('input[name="inlineDefaultRadiosExample"]:checked').val() == "pass_price"){
	       	        			$.getJSON("passPriceSort",{sido:sido,gugun:gugun,keyword:keyword,"start":passStart,"end":passEnd},function(data){
	       	    					$.each(data,function(idx,cafevo){
	       								list(cafevo);
	       	    					});
	       	    				});
	       	        			
	       	        			if(passEnd>totalCount){
									passEnd = totalCount
								}	    		
	       	        			
	       	        			passStart += 5;
	       	        			passEnd += 5;
	       	        		}
							
       			      	}else{
       			      		$.getJSON("cafeListAll",{sido:sido,gugun:gugun,keyword:keyword,"start":firstStart,"end":firstEnd},function(data){
		    					$.each(data,function(idx,cafevo){
		    						list(cafevo);
			    				 });
    						
							if(firstEnd>totalCount){
								firstEnd = totalCount
							}	    				
							
							 
    						/* alert(start +" : "+ end); */
	    				}); 
	       			      	firstStart += 5;
	    					firstEnd += 5;
       			      	}
	       				
       			    	
       			    }
       			    }
       			
       			});
   				
       			
       			
			
				//검색 및 정렬 기능 끝
				
			
				
				
				
       		}); 
       		
       	
       		
        </script>
<script type="text/javascript">
<!--시/군/구 콤보박스 (sector1)-->
	$('document')
			.ready(
					function() {
						var area0 = ["서울특별시", "인천광역시", "대전광역시",
								"광주광역시", "대구광역시", "울산광역시", "부산광역시", "경기도",
								"강원도", "충청북도", "충청남도", "전라북도", "전라남도", "경상북도",
								"경상남도", "제주도" ];
						
						var area1 = [ "전체","강남구", "강동구", "강북구", "강서구", "관악구", "광진구",
								"구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구",
								"마포구", "서대문구", "서초구", "성동구", "성북구", "송파구",
								"양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구" ];
						var area2 = [ "전체","계양구", "남구", "남동구", "동구", "부평구", "서구",
								"연수구", "중구", "강화군", "옹진군" ];
						var area3 = [ "전체","대덕구", "동구", "서구", "유성구", "중구" ];
						var area4 = [ "전체","광산구", "남구", "동구", "북구", "서구" ];
						var area5 = [ "전체","남구", "달서구", "동구", "북구", "서구", "수성구",
								"중구", "달성군" ];
						var area6 = [ "전체","남구", "동구", "북구", "중구", "울주군" ];
						var area7 = [ "전체","강서구", "금정구", "남구", "동구", "동래구", "부산진구",
								"북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구",
								"중구", "해운대구", "기장군" ];
						var area8 = [ "전체","고양시", "과천시", "광명시", "광주시", "구리시", "군포시",
								"김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시",
								"시흥시", "안산시", "안성시", "안양시", "양주시", "오산시",
								"용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시",
								"포천시", "하남시", "화성시", "가평군", "양평군", "여주군", "연천군" ];
						var area9 = [ "전체","강릉시", "동해시", "삼척시", "속초시", "원주시", "춘천시",
								"태백시", "고성군", "양구군", "양양군", "영월군", "인제군",
								"정선군", "철원군", "평창군", "홍천군", "화천군", "횡성군" ];
						var area10 = [ "전체","제천시", "청주시", "충주시", "괴산군", "단양군",
								"보은군", "영동군", "옥천군", "음성군", "증평군", "진천군", "청원군" ];
						var area11 = [ "전체","계룡시", "공주시", "논산시", "보령시", "서산시",
								"아산시", "천안시", "금산군", "당진군", "부여군", "서천군",
								"연기군", "예산군", "청양군", "태안군", "홍성군" ];
						var area12 = [ "전체","군산시", "김제시", "남원시", "익산시", "전주시",
								"정읍시", "고창군", "무주군", "부안군", "순창군", "완주군",
								"임실군", "장수군", "진안군" ];
						var area13 = [ "전체","광양시", "나주시", "목포시", "순천시", "여수시",
								"강진군", "고흥군", "곡성군", "구례군", "담양군", "무안군",
								"보성군", "신안군", "영광군", "영암군", "완도군", "장성군",
								"장흥군", "진도군", "함평군", "해남군", "화순군" ];
						var area14 = [ "전체","경산시", "경주시", "구미시", "김천시", "문경시",
								"상주시", "안동시", "영주시", "영천시", "포항시", "고령군",
								"군위군", "봉화군", "성주군", "영덕군", "영양군", "예천군",
								"울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군" ];
						var area15 = [ "전체","거제시", "김해시", "마산시", "밀양시", "사천시",
									"양산시", "진주시", "진해시", "창원시", "통영시", "거창군",
								"고성군", "남해군", "산청군", "의령군", "창녕군", "하동군",
								"함안군", "함양군", "합천군" ];
						var area16 = [ "전체","서귀포시", "제주시", "남제주군", "북제주군" ];

						// 시/도 선택 박스 초기화

						$("select[name^=sido]")
								.each(
										function() {
											$selsido = $(this);
											$
													.each(
															eval(area0),
															function() {
																$selsido
																		.append("<option value='"+this+"'>"
																				+ this
																				+ "</option>");
															});
											$selsido
													.next()
													.append(
															"<option value=''>구/군 선택</option>");
										});

						// 시/도 선택시 구/군 설정

						$("select[name^=sido]")
								.change(
										function() {
											var area = "area" + $("option", $(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
											var $gugun = $(this).next(); // 선택영역 군구 객체
											$("option", $gugun).remove(); // 구군 초기화

											if (area == "area0")
												$gugun
														.append("<option value=''>구/군 선택</option>");
											else {
												$.each(eval(area),function() {
														$gugun.append("<option value='"+this+"'>"+ this+ "</option>");
														});
												}
										});
						var page = 1;

						

					});
	
	
</script>
        
<!-- <script type="text/javascript">

var page = 1;
$(window).scroll(function() {
    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
      console.log(++page);
      $("#listArea").append("<h1>Page " + page + "</h1><BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~");
      
    }
});

   if ($("body").height() < $(window).height()) {
        alert("There isn't a vertical scroll bar");
    }
</script> -->
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
        	<input id="role" type="hidden" value="${loginVo.role }">
           <input id="no" type="hidden" value="${loginVo.no }">
        
		<!-- 상단 메뉴바? 이미지 -->
        <div class="page-titles-img title-space-lg bg-parallax parallax-overlay mb70" data-jarallax='{"speed": 0.2}' style='background-image: url("images/bg1.jpg")'>
            <div class="container">
                <div class="row">
                    <div class=" col-md-8 ml-auto mr-auto">
                        <h1 class='text-uppercase'>스터디카페 </h1>

                        <!--                                    <a href='https://www.youtube.com/watch?v=cctFcl5EFYk' class='modal-video btn btn-white-outline btn-lg btn-rounded'>Watch our film</a>
                        -->
                    </div>
                </div>
            </div>
        </div><!--page title end-->
        
        <input type="hidden" id="cafe_si">
        <input type="hidden" id="cafe_gu">
        
        
        
        
        <input id="loginID" type="hidden" value="${loginVo.no}">
                     <div class="col-md-9 mb40" style="position:relative; left: 200px;">
                    <div class="listing-filter clearfix">
                    <div class="row" style="position: relative; left: 250px;">
					  <div class="col-md-6 select-outline" id="sector1">
					  <select class="mdb-select md-form md-outline colorful-select dropdown-primary" name="sido1" id="sido1" style="height: 30px">
					      <option value="" disabled selected>시 를 선택하세요</option>　　
				
					    </select>
					   　<select class="mdb-select md-form md-outline colorful-select dropdown-primary" name="gugun1" id="gugun1" style="height: 30px">
					      <option value="" disabled selected>구 를 선택하세요</option>
						
					    </select>
					  <div class="input-group mb-3" style="margin-top: 10px; ">
  						<input type="text" id="keyword" name="keyword" class="form-control" placeholder="카페명으로 검색" aria-label="Recipient's username" aria-describedby="basic-addon2" style="height: 36px;">
  							<div class="input-group-append">
    							<button id="search" type="button" class="btn btn-primary btn-sm mb5" style="background-color: #F4923D; border-color: #FEA65A; height: 40px;" >검색</button>
 					 		</div>
						</div>
						<!-- Default inline 1-->
						<div class="custom-control custom-radio custom-control-inline">
						  <input type="radio" class="custom-control-input" id="sell" value="sell" name="inlineDefaultRadiosExample">
						  <label class="custom-control-label" for="sell">판매순</label>
						</div>
						
						<!-- Default inline 2-->
						<div class="custom-control custom-radio custom-control-inline">
						  <input type="radio" class="custom-control-input" id="grade" value="grade" name="inlineDefaultRadiosExample">
						  <label class="custom-control-label" for="grade">평점순</label>
						</div>
						
						<!-- Default inline 3-->
						<div class="custom-control custom-radio custom-control-inline">
						  <input type="radio" class="custom-control-input" id="room_price" value="room_price" name="inlineDefaultRadiosExample">
						  <label class="custom-control-label" for="room_price">룸 가격</label>
						</div>
						
						<div class="custom-control custom-radio custom-control-inline">
						  <input type="radio" class="custom-control-input" id="pass_price" value="pass_price" name="inlineDefaultRadiosExample">
						  <label class="custom-control-label" for="pass_price">이용권 가격</label>
						</div>
					  </div>
					  
					  
					</div>
					
							
				

                    
                    
                    <div id="listArea" class="property-listing-row" style="margin:250px; margin-top: 30px; margin-bottom: 30px;">
                        
               			
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

        <!--back to top-->
        <a href="#" class="back-to-top hidden-xs-down" id="back-to-top"><i class="ti-angle-up"></i></a>
        
        <!-- jQuery first, then Tether, then Bootstrap JS. -->
        <script src="js/plugins/plugins.js"></script> 
        <script src="js/assan.custom.js"></script> 
        
    </body>
</html>
