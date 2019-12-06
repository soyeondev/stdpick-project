<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
               <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
        
        <!--[if lt IE 9]>
          <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <link rel="apple-touch-icon" href="/bootstrap/img/apple-touch-icon.png">
        <link rel="apple-touch-icon" sizes="72x72" href="/bootstrap/img/apple-touch-icon-72x72.png">
        <link rel="apple-touch-icon" sizes="114x114" href="/bootstrap/img/apple-touch-icon-114x114.png">

<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" type="text/css" rel="stylesheet">

<!-- Latest compiled and minified JavaScript -->

  
        <!-- CSS code from Bootply.com editor -->
        
        <style type="text/css">
            li.active > a.hidden-xs {
 display: block!important;
}
li.active > a.visible-xs {
	display: none!important; 
}
.nav-pills.nav-wizard > li {
  position: relative;
  overflow: visible;
  border-right: 10px solid #fff;
  border-left: 10px solid #fff;
}
.nav-pills.nav-wizard > li:first-child {
  border-left: 0;
}
.nav-pills.nav-wizard > li:first-child a {
  border-radius: 5px 0 0 5px;
}
.nav-pills.nav-wizard > li:last-child {
  border-right: 0;
}
.nav-pills.nav-wizard > li:last-child a {
  border-radius: 0 5px 5px 0;
}
.nav-pills.nav-wizard > li a {
  border-radius: 0;
  background-color: #eee;
  padding: 10px;
}
.nav-pills.nav-wizard > li .nav-arrow {
  position: absolute;
  top: 0px;
  right: -20px;
  width: 0px;
  height: 0px;
  border-style: solid;
  border-width: 20px 0 20px 20px;
  border-color: transparent transparent transparent #eee;
  z-index: 150;
}
.nav-pills.nav-wizard > li .nav-wedge {
  position: absolute;
  top: 0px;
  left: -20px;
  width: 0px;
  height: 0px;
  border-style: solid;
  border-width: 20px 0 20px 20px;
  border-color: #eee #eee #eee transparent;
  z-index: 150;
}
.nav-pills.nav-wizard > li:hover .nav-arrow {
  border-color: transparent transparent transparent #aaa;
}
.nav-pills.nav-wizard > li:hover .nav-wedge {
  border-color: #aaa #aaa #aaa transparent;
}
.nav-pills.nav-wizard > li:hover a {
  background-color: #aaa;
  color: #fff;
}
.nav-pills.nav-wizard > li.active .nav-arrow {
  border-color: transparent transparent transparent #428bca;
}
.nav-pills.nav-wizard > li.active .nav-wedge {
  border-color: #428bca #428bca #428bca transparent;
}
.nav-pills.nav-wizard > li.active a {
  background-color: #428bca;
}
/* CSS for Credit Card Payment form */
.credit-card-box .panel-title {
    display: inline;
    font-weight: bold;	
}
.credit-card-box .form-control.error {
    border-color: red;
    outline: 0;
    box-shadow: inset 0 1px 1px rgba(0,0,0,0.075),0 0 8px rgba(255,0,0,0.6);
}
.credit-card-box label.error {
  font-weight: bold;
  color: red;
  padding: 2px 8px;
  margin-top: 2px;
}
.credit-card-box .payment-errors {
  font-weight: bold;
  color: red;
  padding: 2px 8px;
  margin-top: 2px;
}
.credit-card-box label {
    display: block;
}

.credit-card-box .display-tr {
    display: table-row;
}
.credit-card-box .display-td {
    display: table-cell;
    vertical-align: middle;
    width: 50%;
}
/* Just looks nicer */
.credit-card-box .panel-heading img {
    min-width: 180px;
}
        </style>
        
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script type="text/javascript">
        $('.next').click(function(){

        	  var nextId = $(this).parents('.tab-pane').next().attr("id");
        	  $('[href=#'+nextId+']').tab('show');
        	  return false;
        	  
        	})

        	$('.back').click(function(){

        	  var prevId = $(this).parents('.tab-pane').prev().attr("id");
        	  $('[href=#'+prevId+']').tab('show');
        	  return false;
        	  
        	})

        	$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
        	  
        	  //update progress
        	  var step = $(e.target).data('step');
        	  var percent = (parseInt(step) / 4) * 100;

        	  $('.progress-bar').css({width: percent + '%'});
        	  $('.progress-bar').text("Step " + step + " of 5");
        	  
        	  //e.relatedTarget // previous tab
        	  
        	})

        	$('.first').click(function(){

        	  $('#myWizard a:first').tab('show')

        	})
        	// Generated by CoffeeScript 1.8.0

        	/*
        	jQuery Credit Card Validator 1.0

        	Copyright 2012-2015 Pawel Decowski

        	Permission is hereby granted, free of charge, to any person obtaining a copy
        	of this software and associated documentation files (the "Software"), to deal
        	in the Software without restriction, including without limitation the rights
        	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
        	copies of the Software, and to permit persons to whom the Software
        	is furnished to do so, subject to the following conditions:

        	The above copyright notice and this permission notice shall be included
        	in all copies or substantial portions of the Software.

        	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
        	OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
        	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
        	THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
        	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
        	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
        	IN THE SOFTWARE.
        	 */

        	(function() {
        	  var $,
        	    __indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

        	  $ = jQuery;

        	  $.fn.validateCreditCard = function(callback, options) {
        	    var bind, card, card_type, card_types, get_card_type, is_valid_length, is_valid_luhn, normalize, validate, validate_number, _i, _len, _ref;
        	    card_types = [
        	      {
        	        name: 'amex',
        	        pattern: /^3[47]/,
        	        valid_length: [15]
        	      }, {
        	        name: 'diners_club_carte_blanche',
        	        pattern: /^30[0-5]/,
        	        valid_length: [14]
        	      }, {
        	        name: 'diners_club_international',
        	        pattern: /^36/,
        	        valid_length: [14]
        	      }, {
        	        name: 'jcb',
        	        pattern: /^35(2[89]|[3-8][0-9])/,
        	        valid_length: [16]
        	      }, {
        	        name: 'laser',
        	        pattern: /^(6304|670[69]|6771)/,
        	        valid_length: [16, 17, 18, 19]
        	      }, {
        	        name: 'visa_electron',
        	        pattern: /^(4026|417500|4508|4844|491(3|7))/,
        	        valid_length: [16]
        	      }, {
        	        name: 'visa',
        	        pattern: /^4/,
        	        valid_length: [16]
        	      }, {
        	        name: 'mastercard',
        	        pattern: /^5[1-5]/,
        	        valid_length: [16]
        	      }, {
        	        name: 'maestro',
        	        pattern: /^(5018|5020|5038|6304|6759|676[1-3])/,
        	        valid_length: [12, 13, 14, 15, 16, 17, 18, 19]
        	      }, {
        	        name: 'discover',
        	        pattern: /^(6011|622(12[6-9]|1[3-9][0-9]|[2-8][0-9]{2}|9[0-1][0-9]|92[0-5]|64[4-9])|65)/,
        	        valid_length: [16]
        	      }
        	    ];
        	    bind = false;
        	    if (callback) {
        	      if (typeof callback === 'object') {
        	        options = callback;
        	        bind = false;
        	        callback = null;
        	      } else if (typeof callback === 'function') {
        	        bind = true;
        	      }
        	    }
        	    if (options == null) {
        	      options = {};
        	    }
        	    if (options.accept == null) {
        	      options.accept = (function() {
        	        var _i, _len, _results;
        	        _results = [];
        	        for (_i = 0, _len = card_types.length; _i < _len; _i++) {
        	          card = card_types[_i];
        	          _results.push(card.name);
        	        }
        	        return _results;
        	      })();
        	    }
        	    _ref = options.accept;
        	    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        	      card_type = _ref[_i];
        	      if (__indexOf.call((function() {
        	        var _j, _len1, _results;
        	        _results = [];
        	        for (_j = 0, _len1 = card_types.length; _j < _len1; _j++) {
        	          card = card_types[_j];
        	          _results.push(card.name);
        	        }
        	        return _results;
        	      })(), card_type) < 0) {
        	        throw "Credit card type '" + card_type + "' is not supported";
        	      }
        	    }
        	    get_card_type = function(number) {
        	      var _j, _len1, _ref1;
        	      _ref1 = (function() {
        	        var _k, _len1, _ref1, _results;
        	        _results = [];
        	        for (_k = 0, _len1 = card_types.length; _k < _len1; _k++) {
        	          card = card_types[_k];
        	          if (_ref1 = card.name, __indexOf.call(options.accept, _ref1) >= 0) {
        	            _results.push(card);
        	          }
        	        }
        	        return _results;
        	      })();
        	      for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
        	        card_type = _ref1[_j];
        	        if (number.match(card_type.pattern)) {
        	          return card_type;
        	        }
        	      }
        	      return null;
        	    };
        	    is_valid_luhn = function(number) {
        	      var digit, n, sum, _j, _len1, _ref1;
        	      sum = 0;
        	      _ref1 = number.split('').reverse();
        	      for (n = _j = 0, _len1 = _ref1.length; _j < _len1; n = ++_j) {
        	        digit = _ref1[n];
        	        digit = +digit;
        	        if (n % 2) {
        	          digit *= 2;
        	          if (digit < 10) {
        	            sum += digit;
        	          } else {
        	            sum += digit - 9;
        	          }
        	        } else {
        	          sum += digit;
        	        }
        	      }
        	      return sum % 10 === 0;
        	    };
        	    is_valid_length = function(number, card_type) {
        	      var _ref1;
        	      return _ref1 = number.length, __indexOf.call(card_type.valid_length, _ref1) >= 0;
        	    };
        	    validate_number = (function(_this) {
        	      return function(number) {
        	        var length_valid, luhn_valid;
        	        card_type = get_card_type(number);
        	        luhn_valid = false;
        	        length_valid = false;
        	        if (card_type != null) {
        	          luhn_valid = is_valid_luhn(number);
        	          length_valid = is_valid_length(number, card_type);
        	        }
        	        return {
        	          card_type: card_type,
        	          valid: luhn_valid && length_valid,
        	          luhn_valid: luhn_valid,
        	          length_valid: length_valid
        	        };
        	      };
        	    })(this);
        	    validate = (function(_this) {
        	      return function() {
        	        var number;
        	        number = normalize($(_this).val());
        	        return validate_number(number);
        	      };
        	    })(this);
        	    normalize = function(number) {
        	      return number.replace(/[ -]/g, '');
        	    };
        	    if (!bind) {
        	      return validate();
        	    }
        	    this.on('input.jccv', (function(_this) {
        	      return function() {
        	        $(_this).off('keyup.jccv');
        	        return callback.call(_this, validate());
        	      };
        	    })(this));
        	    this.on('keyup.jccv', (function(_this) {
        	      return function() {
        	        return callback.call(_this, validate());
        	      };
        	    })(this));
        	    callback.call(this, validate());
        	    return this;
        	  };

        	}).call(this);
        </script>
    </head>

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
        <div class="page-titles-img title-space-lg bg-parallax parallax-overlay mb70" data-jarallax='{"speed": 0.2}' style='background-image: url("images/wellness.jpg")'>
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
        
        
        
        
        
        
        
        
        <!-- ###################################################################### -->
	<div class="container" id="myWizard">
      		<div class="row">
              <div class="col-xs-10 col-md-10">
            	<h3><span class="glyphicon glyphicon-lock"></span>&nbsp;Secure Checkout</h3>
              </div>
              
      			<div class="col-xs-2 col-md-2 pull-right"><img src="https://trustsealinfo.websecurity.norton.com/images/vseal.gif"></div>
      </div>
            <hr>
            <div class="progress">
                <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="1" aria-valuemin="1" aria-valuemax="4" style="width: 25%;">
                    Step 1 of 4
                </div>
            </div>
            <div class="navbar">
                <div class="navbar-inner">
                    <ul class="nav nav-pills nav-wizard">
                        <li class="active">
                            <a class="hidden-xs" href="#step1" data-toggle="tab" data-step="1">1. Details</a>
                            <a class="visible-xs" href="#step1" data-toggle="tab" data-step="1">1.</a>
                            <div class="nav-arrow"></div>
                        </li>
                        <li class="disabled">
                            <div class="nav-wedge"></div>
                            <a class="hidden-xs" href="#step2" data-toggle="tab" data-step="2">2. Shipping</a>
                            <a class="visible-xs" href="#step2" data-toggle="tab" data-step="2">2.</a>
                            <div class="nav-arrow"></div>
                        </li>
                        <li class="disabled">
                            <div class="nav-wedge"></div>
                            <a class="hidden-xs" href="#step3" data-toggle="tab" data-step="3">3. Payment</a>
                            <a class="visible-xs" href="#step3" data-toggle="tab" data-step="3">3.</a>
                            <div class="nav-arrow"></div>
                        </li>
                        <li class="disabled">
                            <div class="nav-wedge"></div>
                            <a class="hidden-xs" href="#step4" data-toggle="tab" data-step="4">4. Review</a>
                            <a class="visible-xs" href="#step4" data-toggle="tab" data-step="4">4.</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="tab-content">
                <div class="tab-pane fade in active" id="step1">
                    <h3>1. Details</h3>
                    <div class="well">
                        <div class="row">
                            <div class="col-xs-12 col-md-12">
                                <div class="form-group ">
                                    <label>Email</label>
                                    <input class="form-control input-lg" placeholder="Email">
                                    <span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
                                    <span id="inputError2Status" class="sr-only">(error)</span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-6 col-md-6">
                                <div class="form-group">
                                    <label>First Name</label>
                                    <input class="form-control input-lg">
                                </div>
                            </div>
                            <div class="col-xs-6 col-md-6 pull-right">
                                <div class="form-group">
                                    <label>Last Name</label>
                                    <input class="form-control input-lg">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-md-13">
                                <div class="form-group">
                                    <label>Address</label>
                                    <input class="form-control input-lg">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-7 col-md-7">
                                <div class="form-group">
                                    <label>Suburb</label>
                                    <input class="form-control input-lg">
                                </div>
                            </div>
                            <div class="col-xs-5 col-md-5 pull-right">
                                <div class="form-group">
                                    <label>Postcode</label>
                                    <input class="form-control input-lg">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-7 col-md-7">
                                <div class="form-group">
                                    <label>State</label>
                                    <select id="billing:region_id" name="billing[region_id]" title="State/Province" class="form-control  input-lg validate-select required-entry" defaultvalue="">
                                        <option value="">Please select region, state or province</option>
                                        <option value="485">Australia Capital Territory</option>
                                        <option value="486">New South Wales</option>
                                        <option value="487">Northern Territory</option>
                                        <option value="488">Queensland</option>
                                        <option value="489">South Australia</option>
                                        <option value="490">Tasmania</option>
                                        <option value="491">Victoria</option>
                                        <option value="492">Western Australia</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-5 col-md-5 pull-right">
                                <div class="form-group">
                                    <label>Phone</label>
                                    <input type="tel" class="form-control input-lg" placeholder="(  ) ">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <button class="btn btn-primary btn-lg btn-block next" type="submit">Continue&nbsp;<span class="glyphicon glyphicon-chevron-right"></span></button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="step2">
                    <h3>2. Shipping</h3>
                    <div class="well">
                        <div class="row">
                            <div class="col-xs-12 col-md-12">
                                <h3>Shipping To</h3>
                                <address>
                                    <strong id="customer-name"></strong><br>
                                    <div id="address-line1"></div>
                                    <div id="address-line2"></div>
                                    <abbr title="Phone">P:</abbr> ( ) 
                                    <a href="mailto:#"></a>
                                </address>
                            </div>
                        </div>
                        <div>
                            <dl class="sp-methods">
                                <dt>Express Shipping</dt>
                                <dd>
                                    <ul>
                                        <li>
                                            <input name="shipping_method" type="radio" value="flatrate2_flatrate2" id="s_method_flatrate2_flatrate2" class="radio">
                                            <label for="s_method_flatrate2_flatrate2">1-2 Business Days                                                                                                 <span class="price">$14.95</span>                                                            </label>
                                        </li>
                                    </ul>
                                </dd>
                                <dt>Standard Shipping </dt>
                                <dd>
                                    <ul>
                                        <li>
                                            <input name="shipping_method" type="radio" value="flatrate_flatrate" id="s_method_flatrate_flatrate" class="radio">
                                            <label for="s_method_flatrate_flatrate">2-4 Business Days                                                                                                 <span class="price">$9.95</span>                                                            </label>
                                        </li>
                                    </ul>
                                </dd>
                            </dl>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-md-12">
                                <p>It is our priority to deliver your order as quickly as possible, which is why we offer same day dispatch on orders placed before 12:00pm AEST Monday to Friday.<br>
                                    Any order placed after 12:00pm AEST or on a weekend will be dispatched the next business day.</p>
                            </div>
                        </div>
                      <div class="btn-group btn-group-justified" role="group" aria-label="">
                              <div class="btn-group btn-group-lg" role="group" aria-label="">
                                <button class="btn btn-default back" type="button"><span class="glyphicon glyphicon-chevron-left">&nbsp;Back</span></button>
                            
                              </div>
                        <div class="btn-group btn-group-lg" role="group" aria-label="">
                                <button class="btn btn-primary btn-lg btn-block next" type="submit">Continue&nbsp;<span class="glyphicon glyphicon-chevron-right"></span></button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="step3">
                    <div class="row">
                        <div class="panel panel-default credit-card-box">
                            <div class="panel-heading display-table">
                                <div class="row display-tr">
                                    <h3 class="panel-title display-td">Payment Details</h3>
                                    <div class="display-td">
                                        <img class="img-responsive pull-right" src="http://i76.imgup.net/accepted_c22e0.png">
                                    </div>
                                </div>
                            </div>
                            <div class="panel-body">
                                <form role="form" id="payment-form">
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <div class="form-group">
                                                <label for="cardNumber">CARD NUMBER</label>
                                                <div class="input-group">
                                                    <input type="tel" class="form-control" name="cardNumber" placeholder="Valid Card Number" autocomplete="cc-number" required="" autofocus="">
                                                    <span class="input-group-addon">
                                                        <i class="fa fa-credit-card"></i>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-7 col-md-7">
                                            <div class="form-group">
                                                <label for="cardExpiry">
                                                    <span class="hidden-xs">EXPIRATION</span>
                                                    <span class="visible-xs-inline">EXP</span> DATE
                                                </label>
                                                <input type="tel" class="form-control" name="cardExpiry" placeholder="MM / YY" autocomplete="cc-exp" required="">
                                            </div>
                                        </div>
                                        <div class="col-xs-5 col-md-5 pull-right">
                                            <div class="form-group">
                                                <label for="cardCVC">CV CODE</label>
                                                <input type="tel" class="form-control" name="cardCVC" placeholder="CVC" autocomplete="cc-csc" required="">
                                            </div>
                                        </div>
                                    </div>
                      <div class="btn-group btn-group-justified" role="group" aria-label="">
                              <div class="btn-group btn-group-lg" role="group" aria-label="">
                                <button class="btn btn-default back" type="button">Back</button>
                            
                              </div>
                        <div class="btn-group btn-group-lg" role="group" aria-label="">
                                            <button class="btn btn-primary btn-lg btn-block next" type="submit">Continue</button>
                                        </div>
                                    </div>
                                    <div class="row" style="display:none;">
                                        <div class="col-xs-12">
                                            <p class="payment-errors"></p>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="step4">
                    <div class="well">
                        <h3>4. Review Order</h3> Add another almost done step here..
                        <div class="row">
                            <div class="col-xs-12 col-md-12">
                                <table class="table">
                                    <colgroup><col>
                                        <col width="1">
                                        <col width="1">
                                    </colgroup><thead>
                                        <tr>
                                            <th class="name">Product Name</th>
                                            <th class="qty">Qty</th>
                                            <th class="total">Subtotal</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <td style="" class="a-right" colspan="2">
                                                Tax            </td>
                                            <td style="" class="a-right"><span class="price">$3.18</span></td>
                                        </tr>
                                        <tr>
                                            <td style="" class="a-right" colspan="2">
                                                Subtotal    </td>
                                            <td style="" class="a-right">
                                                <span class="price">$18.18</span>    </td>
                                        </tr>
                                        <tr>
                                            <td style="" class="a-right" colspan="2">
                                                Shipping &amp; Handling (Express Shipping - 1-2 Business Days)    </td>
                                            <td style="" class="a-right">
                                                <span class="price">$14.95</span>    </td>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <h3 class="product-name">Hulk Singlet Black </h3>
                                                <dl class="item-options">
                                                    <dt>Size</dt>
                                                    <dd>M                                    </dd>
                                                </dl>
                                            </td>
                                            <td class="a-center">1</td>
                                            <td>
                                                <span class="cart-price">
                                                    <span class="price">$20.00</span>                            </span>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-md-12">
                                <div class="form-group ">
                                    <label>Gift Cards</label>
                                    <input class="form-control input-lg" placeholder="XXXXX-XXXX-XXXXX">
                                    <span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
                                    <span id="inputError2Status" class="sr-only">(error)</span>
                                </div>
                            </div>

                        </div>
						<div class="row">
                          <div class="col-xs-12 col-md-12">
                            <div class="form-group">
                              <label>Sign up for Newsletter</label>
                              <input type="checkbox">
                            </div>
                          </div>
                        </div>
                      <div class="btn-group btn-group-justified" role="group" aria-label="">
                              <div class="btn-group btn-group-lg" role="group" aria-label="">
                                <button class="btn btn-default back" type="button">Back</button>
                            
                              </div>
                        <div class="btn-group btn-group-lg" role="group" aria-label="">
                            <button class="btn btn-success next" type="submit">Place Order</button>
                        </div>
                      </div>
                    </div>

                </div>
            </div></div>


        <div id="push"></div>
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
