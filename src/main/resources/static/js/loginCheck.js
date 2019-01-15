function checkPW(){
	if(document.getElementById("password").value.length<6){
		document.getElementById("pwd").innerHTML='密码少于6位，请重新输入';
		document.getElementById("pwd").value="";
	}
	else document.getElementById("pwd").innerHTML='';
}
function checkRPW(){
	var P1 = document.getElementById("password").value;
	var P2 = document.getElementById("passwordRepeat").value;
	if (P1 != P2 || P2==""){
		document.getElementById('rpwd').innerHTML='两次密码不一样，请重新输入';
		document.getElementById(pwd).value="";
		document.getElementById(rpwd).value="";
	}
	else document.getElementById('rpwd').innerHTML='';
}
//'nick_name','real_name','stu_pwd','telephone' nick_name,real_name,stu_pwd,telephone
function checkLogin(){
	var flag = true;
	if(document.getElementById("nick_name").value == ""){
		document.getElementById("nick").innerHTML='用户名不能为空';
		flag= false;
	}
	else document.getElementById("nick").innerHTML='';
	
	if(document.getElementById("real_name").value == ""){
		document.getElementById("real").innerHTML='真实姓名不能为空';
		flag= false;
	}
	else document.getElementById("real").innerHTML='';
	if(document.getElementById("pwd").value == ""){
		document.getElementById("pwd").innerHTML='密码不能为空';
		flag= false;
	}
	else document.getElementById("pwd").innerHTML='';
//	if(document.getElementById("stu_pwd").value.length<6){
//		document.getElementById("pint").innerHTML='密码少于6位，请重新输入';
//		document.getElementById("stu_pwd").value="";
//		document.getElementById("stu_repwd").value="";
//		document.getElementById('hint').innerHTML='';
//		flag= false;
//	}
//	else document.getElementById("pint").innerHTML='';	address
	if(document.getElementById("mobile").value == ""){
		document.getElementById("mb").innerHTML='联系方式不能为空';
		flag= false;
	}
	else document.getElementById("mb").innerHTML='';
	if(document.getElementById("address").value == ""){
		document.getElementById("addr").innerHTML='地址不能为空';
		flag= false;
	}
	else document.getElementById("addr").innerHTML='';
	
	if(flag == true)
		return true;
	else 
		return false;
}