<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page  import="com.tlweb.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="webicon.ico" rel="shortcut icon" />
<% 
	UserInfo uf=new UserInfo();
	String phone="";
	String ses="";
	String uid="";
	String company="";
 	try{
 		phone=request.getParameter("uid");
 		company=uf.getCompany(phone);
		if(session.getAttribute(phone)==null){
			response.sendRedirect("Login.jsp");
		}else{
			ses=session.getAttribute(phone).toString();
		}
	}catch(Exception e){
		response.sendRedirect("Login.jsp");
	} 
%>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<link rel="stylesheet" type="text/css" href="Css/CustomCtrl.css">
<title>�û�����</title>
</head>
<body>


	<div id="showques">
		<div id="question">
			<div id="questop" style="width:auto;height:60px;">
				<input  id="SN"
				style="text-align:center;border-radius:5px;border:1px solid #a0b1c4;width:350px;margin:10px;height:40px;float:left;" 
				placeholder="�������豸SN��  ��:MF1604060A" type="text" maxlength=20 onblur="checkSN(this)">
				<div id="sntip" style="float:left;text-align:left;margin:11px;height:40px;width:auto;font-size:18px; line-height:44px;color:red;"></div>
				<div id="close" style="height:24px;width:24px;float:right;margin-right:5px;margin-top:5px;"><a href='javascript:void(0)' onclick="closeQuestion()"><img src="pic/close.png"></a></div>
			</div>
			<div style="clear:both;margin-top:20px;">
				<table cellspacing="5">
					<tr><td><h4>��װҪ��</td></tr>
					<tr><td>1.�밴�հ�װͼֽ��װ 2.��ˮ��·�������Ʒ���� 3.��·��߱���ҵ�ʸ���Ա��װ</td></tr>
					<tr><td><h4>ʹ��Ҫ��</td></tr>
					<tr><td>1.����ϸ�Ķ�����Ʒʹ��˵���� 2.ʹ�ù������Ͻ�Υ����� 3.��ȷ��������Ա����ȷ֪����Ҫ��ȫ˵��</td></tr>
					<tr><td><h4>��������</td></tr>
					<tr><td>1.����Υ����������Ĺ��ϲ����Ա��� 2.������ʼ����Ϊע������ 3.��ע������������������15�հ��������ڼ��㱣������</td></tr>
					<tr><td><h4>��������</td></tr>
					<tr><td>1.�ջ�ǰ���뾭����ȷ�ϳ������� 2.������ϸ��������ñ���365�գ������������豸����30��</td></tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
					<tr>
					<tr><td><input  type="checkbox" id="agreement" onclick="checkUserAgree(this)">����ϸ�Ķ�����Ҫ��,��ͬ������</td></tr>
					<tr>
				</table>
			</div>
			<input id="registerB" style="position:absolute; border:0px;color:white;font-size:20px;border-radius:3px;
			width:300px;height:45px;background-color:gray;left:300px;bottom:30px;" type="button"  value="ע��" onmousemove="getFocus()" disabled=true>
		</div>
	</div>
	
	
	
	<div id="header">
		<a href="index.html">������ϴ�豸���޹�˾�û�ƽ̨</a>
	</div>
	
	
	
	<div id="main">
		<div id="all">
			<div id="sec">
				<div id="left">
					<table>
						<tr>
							<td style="text-align:center;" colspan="2"><%=company %></td>
						</tr>
						<tr>
						</tr>
						<tr>
							<td class="lef">�Ǽ�:</td>
							<td>����</td>
						</tr>
						<tr>
						</tr>
						<tr>
							<td class="lef">����:</td>
							<td>����</td>
						</tr>
						<tr>
						</tr>
						<tr>
							<td class="lef">����:</td>
							<td>����</td>
						</tr>
						<tr>
						</tr>
						<tr>
							<td style="text-align:center;" colspan="2"><a style="text-decoration:none;color:black;" href="#">ҵ���¼</a></td>
						</tr>
					</table>
				</div>
				<div id="right">
					<div id="top">
						<ul id="indexList">
							<li><a style="border:0px;color:white;background:#00a2e9;"  href="javascript:void(0)"  onclick='selectservice(this)'>��Ʒע��</a></li>
							<li><a href="javascript:void(0)" onclick='selectservice(this)'>�ۺ�����</a></li>
							<li><a href="javascript:void(0)" onclick='selectservice(this)'>ά������</a></li>
							<li><a href="javascript:void(0)" onclick='selectservice(this)'>Ͷ�߽���</a></li>
							<li><a href="javascript:void(0)" onclick='selectservice(this)'>������Ϣ</a></li>
						</ul>
					</div>
					<div id="center">
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	
</body>
<script type="text/javascript"> 
var start=createRequest('AjaxJs/ReturnService.jsp?service='+encodeURI("��Ʒע��")+'&datetime='+new Date().getTime());
function createRequest(url) {
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
    http_request.onreadystatechange = getResult;					   //���÷��ؽ����������
    http_request.open('GET', url, true);							   //�����������������
    http_request.send(null);									   //���������������
}
function getResult() {
    if (http_request.readyState == 4) {     		// �ж�����״̬
        if (http_request.status == 200) {     		// ����ɹ�����ʼ�������ؽ��
            document.getElementById("center").innerHTML=http_request.responseText;	//������ʾ����
            //alert(http_request.responseText);
           // document.getElementById("toolTip").style.display="block";	//��ʾ��ʾ��
        } else {     						// ����ҳ���д���
            alert("���������ҳ���д���");
        }
    }
}
function openQuestion(){  //�򿪰�div
	var ques=document.getElementById("question");
	ques.style.display="block";
}
function closeQuestion(){   //�رհ�div
	var ques=document.getElementById("question");
	ques.style.display="none";
}
function selectservice(obj){
 	var liarr=document.getElementById("indexList").getElementsByTagName("a");
	for(i=0;i<liarr.length;i++){  //���ѡ����ʽ
		liarr[i].style.backgroundColor="white";  
		liarr[i].style.color="#00a2e9";
	} 
	//����ѡ����ʽ
	obj.style.backgroundColor = "#00a2e9";
	obj.style.color="white";
	var str=JSON.stringify(obj.innerHTML);
	createRequest("AjaxJs/ReturnService.jsp?service="+encodeURI(str)+"&datetime="+new Date().getTime());
	//alert(str);
}
function checkUserAgree(obj){
	if(obj.checked){
		document.getElementById("registerB").disabled=false; 
		document.getElementById("registerB").style.backgroundColor="#5a98de";
	}else{
		document.getElementById("registerB").disabled=true; 
		document.getElementById("registerB").style.backgroundColor="gray";
		}
	
}
function getFocus(){
	document.getElementById("registerB").focus();
}
function createCheckSNRequest(url) {
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
    http_request.onreadystatechange = getResult;					   //���÷��ؽ����������
    http_request.open('GET', url, true);							   //�����������������
    http_request.send(null);									   //���������������
}
function getCheckSNResult() {
    if (http_request.readyState == 4) {     		// �ж�����״̬
        if (http_request.status == 200) {     		// ����ɹ�����ʼ�������ؽ��
            document.getElementById("sntip").innerHTML=http_request.responseText;	//������ʾ����
            //alert(http_request.responseText);
           // document.getElementById("toolTip").style.display="block";	//��ʾ��ʾ��
        } else {     						// ����ҳ���д���
            alert("���������ҳ���д���");
        }
    }
}
function checkSN(obj){
	var regex =/^MF[0-9]{8}[A-Z]$/;
	if(obj.value==""){
		document.getElementById("sntip").innerHTML="���������к�";
	}else{
		if(regex.test(obj.value)){
			createCheckSNRequest("AjaxJs/CheckSN?sn="+encodeURI(obj.value)+"&datetime="+new Date().getTime());
		}else{
			document.getElementById("sntip").innerHTML="���кŸ�ʽ������˶�";
		}
	}
}
</script>
</html>