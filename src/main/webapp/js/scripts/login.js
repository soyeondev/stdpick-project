function login(id, pwd, type) {
	var data = {"id": id, "pwd": pwd, "type": type};
	$.ajax({
		url:"login",
		type:"POST",
		data : JSON.stringify(data),
		contentType: 'application/json',
		success : function(data){
			console.log(data);
			if(data.result == 0) location.href="index.do";
			else if(data.result == 1) alert("아이디가 없습니다");
			else alert("비밀번호가 틀렸습니다.");
			
		},
		error: function(error){
			console.log(error);
		}
	})
}