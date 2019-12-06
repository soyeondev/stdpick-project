<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Dashboard</title>    
<!-- Bootstrap-->
<link href="admin-dashboardUi/lib/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<!--Common Plugins CSS -->
<link href="admin-dashboardUi/css/plugins/plugins.css" rel="stylesheet">
<!--fonts-->
<link href="admin-dashboardUi/lib/line-icons/line-icons.css" rel="stylesheet">
<link href="admin-dashboardUi/lib/font-awesome/css/fontawesome-all.min.css" rel="stylesheet">
<link href="admin-dashboardUi/css/style.css" rel="stylesheet">

<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="admin-dashboardUi/js/plugins/plugins.js"></script> 
        <script type="text/javascript" src="admin-dashboardUi/js/appUi-custom.js"></script> 
<script type="text/javascript">
$(function() {
	var mode = $("#mode").val();
	var type = $("#type").val();
	var no = $("#no").val();
	
	//ajax으로 가져온 배열데이터들을 list로 뽑는 메소드
	function list(data) {
		var arr = eval("(" +data+")");
		$.each(arr, function(idx, item) {
			var cust_no=-1;
			var provider_no=-1;
			var profile_img = "";
			
			if(item.type == 'customer') {
				cust_no = item.pick_no;
				profile_img += "cust_img/";
			}else {
				provider_no = item.pick_no;
				profile_img += "prov_img/";
			}
			
			profile_img += item.pick_img;
			
			var li = $('<li class="list-item"></li>');
				var a = $('<a class="list-link"></a>');
				$(a).click(function(){
				  parent.location.href = "snsMyPageView.do?cust_no="+cust_no+"&provider_no="+provider_no;
			});
				
				
			var div1 = $('<div class="list-thumb avatar avatar32 rounded"></div>');
		 	var img = $('<img src="'+profile_img+'" alt="" class="img-fluid rounded-circle">');
		 	
		 	var div2 = $('<div class="list-body"></div>');
		 	var span = $('<span class="list-title">'+item.pick_nick+'</span>');
		 	
		 	$(div1).append(img);
		 	$(div2).append(span);

			$(li).append(a, div1, div2);
			$("#listFollower").append(li);
		});
	}
	
	if(mode == 'follower') {
		$.ajax({url:"listFollower", data:{"f_type":type, "f_no":no},
			success:function(data) {
				list(data);
		}});
		
	}else {
		$.ajax({url:"listFollowing", data:{"type":type, "no":no},
			success:function(data) {
				list(data);
		}});
		
		
	}
	
	

	
	
	
});


</script>

</head>
<body class=" bg-white">
<input type="hidden" id="mode" value="${mode}">
<input type="hidden" id="type" value="${type}">
<input type="hidden" id="no" value="${no}">

<div class="flex slim-scroll">
  	<div class=" bg-white">
		<ul class="list contacts-list" id="listFollower">
		</ul>
	</div>
	</div>

</body>
</html>