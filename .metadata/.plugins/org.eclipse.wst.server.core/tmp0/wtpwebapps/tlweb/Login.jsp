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
	    if (window.XMLHttpRequest) {    							   // ��IE�����
	        http_request = new XMLHttpRequest();	                      //����XMLHttpRequest����
	    } else if (window.ActiveXObject) {     						   // IE�����
	        try {
	            http_request = new ActiveXObject("Msxml2.XMLHTTP");	   //����XMLHttpRequest����
	        } catch (e) {
	            try {
	                http_request = new ActiveXObject("Microsoft.XMLHTTP");  //����XMLHttpRequest����
	           } catch (e) {}
	        }
	    }
	    if (!http_request) {
	        alert("���ܴ���XMLHttpRequest����ʵ����");
	        return false;
	    }
	    http_request.onreadystatechange = getLoginResult;					   //���÷��ؽ��������
	    http_request.open('get', url, true);							   //�����������������
	    http_request.send(null);									   //���������������
	}
	function getLoginResult() {
	    if (http_request.readyState == 4) {     		// �ж�����״̬
	        if (http_request.status == 200) {     		// ����ɹ�����ʼ�����ؽ��
	        	var restr=http_request.responseText;
	        	var str=JSON.stringify(restr);
	        	//alert(str);
	        	if(str.indexOf("success")>0){
	        		var user=document.getElementById("usern").value;
	        		window.location.href='CustomCtrl.jsp?uid='+encodeURI(user)+'&datetime='+new Date().getTime();
	        	}else{
	        		document.getElementById("showMessage").innerHTML="�û��������������˺�δ����";
	        	}
	        } else {     						// ����ҳ���д���
	            alert("���������ҳ���д���");
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
 				document.getElementById("showMessage").innerHTML="�û����������ʽ������зǷ��ַ�";
 			}
 		}else{
 			document.getElementById("showMessage").innerHTML="�û���������Ϊ��";
 		}
 		
 	}
</script>
<title>�û���¼</title>
</head>
<body>
	<div id="login">
	<div id="company"><a href="index.html">������˾��Ϣƽ̨</a></div>
	<div id="showMessage"></div>
	<form action="index.html" method="post" name="loginform">
    <table  align="center">
    	<tr>
        <td><input type="text" id="usern" maxlength="40" placeholder="�ֽ�֧���ֻ��ŵ�¼"></td>
        <tr>
        <tr>
        <td><input type="password" id="pass" maxlength="40" onkeyup="getKey()" placeholder="����������"></td>
        <tr>
    </table>
    <input type="button" id="loginb" style="background-color:#5a98de;" value="�� ¼" onclick="checkLogin()">
    </form>
    <ul>
    	<li><a id="right" href="">��������</a></li>
        <li><a id="right" href="Register.jsp">ע���˺�</a></li>
        <li><a id="last" href="">�������</a></li>
    </ul>
    </div>
</body>
</html>