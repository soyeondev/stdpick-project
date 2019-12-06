<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Assan 3</title>    
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
    
	        var cafe_no = GetURLParameter('cafe_no');
			var cust_no = GetURLParameter('cust_no');
 
			$("#main").attr({"href":"cafeDetail2.do?cafe_no="+cafe_no+"&cust_no="+cust_no+""});
        });
        </script>
    </head>

    <body>
           <div id="preloader">
            <div id="preloader-inner"></div>
        </div><!--/preloader-->

        <div class="fullscreen bg-parallax accounts-page" data-jarallax='{"speed": 0.2}' style='background-color:#212121!important;background-image: url("images/appleGamsung.jpg");'>
            <div class="d-flex align-items-center">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6 ml-auto mr-auto">
                            <div class="media white-card">
                               <i class="fa fa-check fa-4x text-success mb0 align-self-center d-flex mr-3"></i>
                                <div class="media-body">
                                    <h4 class="mb20 mb-1 text-white">${msg}</h4>
                                    <a id="main" class='btn btn-white-outline'>메인으로</a>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>       
        <!-- jQuery first, then Tether, then Bootstrap JS. -->
        <script src="js/plugins/plugins.js"></script> 
        <script src="js/assan.custom.js"></script> 
    </body>
</html>
