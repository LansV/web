<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="webicon.ico" rel="shortcut icon" />
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<link rel="stylesheet" type="text/css" href="Css/Login.css">
<script type="text/javascript"> 
	function createLogin(url) {
	    http_request = false;
	    if (window.XMLHttpRequest) {    							   // 非IE浏览器
	        http_request = new XMLHttpRequest();	                      //创建XMLHttpRequest对象
	    } else if (window.ActiveXObject) {     						   // IE浏览器
	        try {
	            http_request = new ActiveXObject("Msxml2.XMLHTTP");	   //创建XMLHttpRequest对象
	        } catch (e) {
	            try {
	                http_request = new ActiveXObject("Microsoft.XMLHTTP");  //创建XMLHttpRequest对象
	           } catch (e) {}
	        }
	    }
	    if (!http_request) {
	        alert("不能创建XMLHttpRequest对象实例！");
	        return false;
	    }
	    http_request.onreadystatechange = getLoginResult;					   //调用返回结果处理函数
	    http_request.open('get', url, true);							   //创建与服务器的连接
	    http_request.send(null);									   //向服务器发送请求
	}
	function getLoginResult() {
	    if (http_request.readyState == 4) {     		// 判断请求状态
	        if (http_request.status == 200) {     		// 请求成功，开始处理返回结果
	        	var restr=http_request.responseText;
	        	var str=JSON.stringify(restr);
	        	//alert(str);
	        	if(str.indexOf("success")>0){
	        		var user=document.getElementById("usern").value;
	        		window.location.href='CustomCtrl.jsp?uid='+encodeURI(user)+'&datetime='+new Date().getTime();
	        	}else{
	        		document.getElementById("showMessage").innerHTML="用户名或密码错误或账号未激活";
	        	}
	        } else {     						// 请求页面有错误
	            alert("您所请求的页面有错误！");
	        }
	    }
	}
	function getKey()  {  
	   if(event.keyCode==13){  
	    	checkLogin(); 
	    }     
	} 
 	function checkLogin(){
 		var user=document.getElementById("usern").value;
 		var pass=document.getElementById("pass").value;
 		var regex =/^1[3|4|5|7|8][0-9]\d{8}$/;
 		var passregex=/^[0-9a-zA-Z@#%^_]{6,16}$/;
 		var error=document.getElementById("showMessage").innerHTML;
 		if(user!=""&&pass!=""){
 			if(regex.test(user)&&passregex.test(pass)){
 				if(error!=""){
 	 				document.getElementById("showMessage").innerHTML="";
 	 			}
 				createLogin('AjaxJs/CheckLogin.jsp?user='+encodeURI(user)+'&passw='+encodeURI(pass)+'&datetime='+new Date().getTime());
 			}else{
 				document.getElementById("showMessage").innerHTML="用户名或密码格式错误或含有非法字符";
 			}
 		}else{
 			document.getElementById("showMessage").innerHTML="用户名或密码为空";
 		}
 		
 	}
</script>
<title>用户登录</title>
</head>
<body>
	<div id="login">
	<div id="company"><a href="index.html">天澜公司信息平台</a></div>
	<div id="showMessage"></div>
	<form action="index.html" method="post" name="loginform">
    <table  align="center">
    	<tr>
        <td><input type="text" id="usern" maxlength="40" placeholder="现仅支持手机号登录"></td>
        <tr>
        <tr>
        <td><input type="password" id="pass" maxlength="40" onkeyup="getKey()" placeholder="请输入密码"></td>
        <tr>
    </table>
    <input type="button" id="loginb" style="background-color:#5a98de;" value="登 录" onclick="checkLogin()">
    </form>
    <ul>
    	<li><a id="right" href="">忘记密码</a></li>
        <li><a id="right" href="Register.jsp">注册账号</a></li>
        <li><a id="last" href="">意见反馈</a></li>
    </ul>
    </div>
</body>
</html>