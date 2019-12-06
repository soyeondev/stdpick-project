<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>STUDER P!CK</title>    
        <!-- Plugins CSS -->
        <link href="css/plugins/plugins.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
          <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script type="text/javascript">
        $(function(){
        	
     
	        function GetURLParameter(sParam) {
				var sPageURL = location.search.substring(1);
				var sURLVariables = sPageURL.split('&');
				for (var i = 0; i < sURLVariables.length; i++) {
					var sParameterName = sURLVariables[i].split('=');
					if (sParameterName[0] == sParam) {
						return sParameterName[1];
					}
				}
			}

	        var cust_no = GetURLParameter('cust_no');
			
			$("#mp").attr({"href":"provMyPageView.do?cust_no="+cust_no+""});
        });
        </script>
        
    </head>

    <body data-spy="scroll" data-darget=".navbar-seconday">
        <div id="preloader">
            <div id="preloader-inner"></div>
        </div><!--/preloader-->

       

        <div class="fullscreen bg-parallax parallax-overlay" data-jarallax-video="https://www.youtube.com/watch?v=ZEum8ebGjDI" data-jarallax-original-styles="null">
            <div class="d-flex align-items-center text-center particle-content error-404-content">
                 <div class="container">
                <div class="row">
                    <div class=" col-md-12">
                        <h2 style="color: white; font-size: 80px">Complete</h2>
                        <p class="lead">카페 개설 완료 </p>
                        <a id="mp" class='btn btn-lg btn-white-outline'>My Page</a>
                    </div>
                </div>
            </div>
            </div>
        </div><!--page title end-->
       

        <!--back to top-->
        <a href="#" class="back-to-top hidden-xs-down" id="back-to-top"><i class="ti-angle-up"></i></a>
        <!-- jQuery first, then Tether, then Bootstrap JS. -->
        <script src="js/plugins/plugins.js"></script> 
        <script src="js/assan.custom.js"></script> 
    </body>
</html>