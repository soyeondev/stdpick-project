<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function(){
	
	$("#create").click(function(){
	
		$("r").trigger('click');
		$("p").trigger('click');
		$("c").trigger('click');
		
		var r =	$("#room").val();
		var rt =$("#roomt").val();
		var rp =$("#roomp").val();
		var p =$("#pass").val();
		var pt =$("#passt").val();
		var pp =$("#passp").val();
		var cc =$("#cancle").val();
		var re =$("#re").val();
		
		$("#roomR").val(r);
		$("#roomtR").val(rt);
		$("#roompR").val(rp);
		$("#passR").val(p);
		$("#passtR").val(pt);
		$("#passpR").val(pp);
		$("#cancleR").val(cc);
		$("#reR").val(re);
	

		
		
	})
})

	
	
	
</script>
</head>
<body>

<form action="list1" target="iframe1">
	룸:<input id="room" type="text">
	룸시간:<input id="roomt" type="text">
	룸가격:<input id="roomp" type="text">
	<input id="r" type="submit">
</form>

<form action="list2" target="iframe2">
	이용권:<input id="pass" type="text">
	이용권시간:<input id="passt" type="text">
	이용권가격:<input id="passp" type="text">
	<input id="p" type="submit">
</form>

<form action="list3" target="iframe2">
	취소:<input id="cancle" type="text">
	환불:<input  id="re" type="text">
	<input id="c" type="submit">
</form>

<form action="list4" target="iframe4">

	<input id="create" type="submit" value="개설">
</form>


<form action="listController.do" target="iframe5">
	<input id="roomR" type="text">
	<input id="roomtR" type="text">
	<input id="roompR" type="text">
	<input id="passR" type="text">
	<input id="passtR" type="text">
	<input id="passpR" type="text">
	<input id="cancleR" type="text">
	<input id="reR" type="text">
	<input type="submit" id="">
</form>

<iframe src="#" name="iframe1" style="width:1px; height:1px; border:0; visibility:hidden;"></iframe>
<iframe src="#" name="iframe2" style="width:1px; height:1px; border:0; visibility:hidden;"></iframe>
<iframe src="#" name="iframe3" style="width:1px; height:1px; border:0; visibility:hidden;"></iframe>
<iframe src="#" name="iframe4" style="width:1px; height:1px; border:0; visibility:hidden;"></iframe>
<iframe src="#" name="iframe5" style="width:1px; height:1px; border:0; visibility:hidden;"></iframe>

</body>
</html>