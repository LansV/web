/**
 * 
 */
//---------------------------------------------------
//******************************************************
//******************************************************
	function createRequest(url) {
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
	    http_request.onreadystatechange = getNameResult;					   //调用返回结果处理函数
	    http_request.open('GET', url, true);							   //创建与服务器的连接
	    http_request.send(null);									   //向服务器发送请求
	}
	function getNameResult() {
	    if (http_request.readyState == 4) {     		// 判断请求状态
	        if (http_request.status == 200) {     		// 请求成功，开始处理返回结果
	            document.getElementById("showtip").innerHTML=http_request.responseText;	//设置提示内容
	            //alert(http_request.responseText);
	           // document.getElementById("toolTip").style.display="block";	//显示提示框
	        } else {     						// 请求页面有错误
	            alert("您所请求的页面有错误！");
	        }
	    }
	}
function checkUser(){
	var user= document.getElementById("usert");
	var regex =/^1[3|4|5|7|8][0-9]\d{8}$/;
	if(user.value==""){
		document.getElementById("showtip").innerHTML="请输入手机号";return;
	}else{
		if(regex.test(user.value)){
			createRequest('AjaxJs/CheckUser.jsp?user='+encodeURI(user.value)+'&datetime='+new Date().getTime());
		}else{
			document.getElementById("showtip").innerHTML="您输入的手机号不正确";
		}
		
	}
}
function checkPass(){
	var pass= document.getElementById("passt1");
	var pass2= document.getElementById("passt2");
	var passregex=/^[0-9a-zA-Z@#%^_]{6,16}$/;
	if(pass.value==""){
		document.getElementById("showpass1").innerHTML="请输入密码";return;
	}else{
		if(passregex.test(pass.value)){
			document.getElementById("showpass1").innerHTML="";
			if(pass.value==pass2.value){
				document.getElementById("showpass2").innerHTML="";
			}else{
				document.getElementById("showpass2").innerHTML="两次密码不一致";
			}
		}else{
			document.getElementById("showpass1").innerHTML="密码长度不足6位或含有非法字符，请重新填写";
		}
	}
}
function equalsPass(){
	var pass= document.getElementById("passt1");
	var pass2= document.getElementById("passt2");
	if(pass.value==pass2.value){
		document.getElementById("showpass2").innerHTML="";
	}else{
		document.getElementById("showpass2").innerHTML="两次密码不一致";
	}
}//------------------------------------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------------------------------------
 function createProvince(url) {
    http_requestP = false;
    if (window.XMLHttpRequest) {    							   // 非IE浏览器
        http_requestP = new XMLHttpRequest();	                      //创建XMLHttpRequest对象
    } else if (window.ActiveXObject) {     						   // IE浏览器
        try {
            http_requestP = new ActiveXObject("Msxml2.XMLHTTP");	   //创建XMLHttpRequest对象
        } catch (e) {
            try {
                http_requestP = new ActiveXObject("Microsoft.XMLHTTP");  //创建XMLHttpRequest对象
           } catch (e) {}
        }
    }
    if (!http_requestP) {
        alert("不能创建XMLHttpRequest对象实例！");
        return false;
    }
    http_requestP.onreadystatechange = getProvinceResult;					   //调用返回结果处理函数
    http_requestP.open('GET', url, true);							   //创建与服务器的连接
    http_requestP.send(null);									   //向服务器发送请求
} 
function getProvinceResult() {
    if (http_requestP.readyState == 4) {     		// 判断请求状态
        if (http_requestP.status == 200) {     		// 请求成功，开始处理返回结果
            var provinceArr=http_requestP.responseText.split(",");	//设置提示内容
            var province=document.getElementById("province");
            var city=document.getElementById("city");
            province.length=0;
            city.length=0;
            city.options[0]=new Option("请选择城市","请选择城市");
            for(i=0;i<provinceArr.length;i++){
            	  province.options[i]=new Option(provinceArr[i],provinceArr[i]);
            } 
            province.options[provinceArr.length-1].disabled=true;
           // document.getElementById("toolTip").style.display="block";	//显示提示框
        } else {     						// 请求页面有错误
            alert("您所请求的页面有错误！");
        }
    }
}
function getProvince(country){
	var countryindex=document.getElementById("country").selectedIndex;
	if(countryindex==0){
		var province=document.getElementById("province");
        var city=document.getElementById("city");
        province.length=0;
        province.options[0]=new Option("请选择省份","请选择省份");
        city.length=0;
        city.options[0]=new Option("请选择城市","请选择城市");
	}else{
		createProvince('AjaxJs/GetProvince.jsp?country='+encodeURI(country)+'&datetime='+new Date().getTime());
	}
}
//**********************************************************************************************************************
 function createCity(url) {
    http_requestC = false;
    if (window.XMLHttpRequest) {    							   // 非IE浏览器
        http_requestC = new XMLHttpRequest();	                      //创建XMLHttpRequest对象
    } else if (window.ActiveXObject) {     						   // IE浏览器
        try {
            http_requestC = new ActiveXObject("Msxml2.XMLHTTP");	   //创建XMLHttpRequest对象
        } catch (e) {
            try {
                http_requestC = new ActiveXObject("Microsoft.XMLHTTP");  //创建XMLHttpRequest对象
           } catch (e) {}
        }
    }
    if (!http_requestC) {
        alert("不能创建XMLHttpRequest对象实例！");
        return false;
    }
    http_requestC.onreadystatechange = getCityResult;					   //调用返回结果处理函数
    http_requestC.open('GET', url, true);							   //创建与服务器的连接
    http_requestC.send(null);									   //向服务器发送请求
} 
function getCityResult() {
    if (http_requestC.readyState == 4) {     		// 判断请求状态
        if (http_requestC.status == 200) {     		// 请求成功，开始处理返回结果
            var cityArr=http_requestC.responseText.split(",");	//设置提示内容
            var city=document.getElementById("city");
            city.length=0;
            for(i=0;i<cityArr.length;i++){
            	  city.options[i]=new Option(cityArr[i],cityArr[i]);
            } 
           
           // document.getElementById("toolTip").style.display="block";	//显示提示框
        } else {     						// 请求页面有错误
            alert("您所请求的页面有错误！");
        }
    }
}
function getCity(province){
		var provinceindex=document.getElementById("province").selectedIndex;
		if(provinceindex==0){
			 var city=document.getElementById("city");
	         city.length=0;
	         city.options[0]=new Option("请选择城市","请选择城市");
		}else{
			createCity('AjaxJs/GetCity.jsp?province='+encodeURI(province)+'&datetime='+new Date().getTime());
		}
		
}
//--------------------------*********************************************
//************************************************************************
function createRegister(url) {
    http_requestR = false;
    if (window.XMLHttpRequest) {    							   // 非IE浏览器
        http_requestR = new XMLHttpRequest();	                      //创建XMLHttpRequest对象
    } else if (window.ActiveXObject) {     						   // IE浏览器
        try {
            http_requestR = new ActiveXObject("Msxml2.XMLHTTP");	   //创建XMLHttpRequest对象
        } catch (e) {
            try {
                http_requestR = new ActiveXObject("Microsoft.XMLHTTP");  //创建XMLHttpRequest对象
           } catch (e) {}
        }
    }
    if (!http_requestR) {
        alert("不能创建XMLHttpRequest对象实例！");
        return false;
    }
    http_requestR.onreadystatechange = getRegisterResult;					   //调用返回结果处理函数
    http_requestR.open('GET', url, true);							   //创建与服务器的连接
    http_requestR.send(null);									   //向服务器发送请求
} 
function getRegisterResult() {
    if (http_requestR.readyState == 4) {     		// 判断请求状态
        if (http_requestR.status == 200) {     		// 请求成功，开始处理返回结果
        	var restr=http_requestR.responseText;
        	var str=JSON.stringify(restr);
        	if(str.indexOf("success")>0){
        		alert("注册成功\n客服将在三日内验证账号\n确认后跳转至首页");
        		window.location.href='index.html';
        	}else{
        		alert("注册失败\n请重试");
        	}
        } else {     						// 请求页面有错误
            alert("您所请求的页面有错误！");
        }
    }
}



function getFocus(){
	document.getElementById("registerB").focus();
}
function registerID(){
	var phonenum=document.getElementById("usert").value;     //获取ID文本框 不能为空
	
	var phonetip=document.getElementById("showtip").innerText;//获取错误信息 必须为空
	
	var pass=document.getElementById("passt1").value;       //获取密码文本框 不能为空
	
	var passtip1=document.getElementById("showpass1").innerText;//获取错误信息 必须为空
	
	var passtip2=document.getElementById("showpass2").innerText;//获取错误信息 必须为空
	
	var contact=document.getElementById("contactt").value;       //获取联系人文本框 不能为空
	
	var contacttip=document.getElementById("contacttip").innerText;       //获取联系人错误 必须为空
	
	var company=document.getElementById("company").value;       //获取企业文本框 不能为空
	
	var companytip=document.getElementById("companytip").innerText;       //获取企业错误 必须为空
	
	var hyindex=document.getElementById("hy").selectedIndex;       //获取行业列表索引值
	
	var zwindex=document.getElementById("zw").selectedIndex;       //获取职位列表索引值
	
	var provinceindex=document.getElementById("province").selectedIndex;  //获取省列表索引值
	
	var cityindex=document.getElementById("city").selectedIndex;     //获取市列表索引值
	
	var address=document.getElementById("daddt").value;       //获取地址文本框 不能为空
	
	var addresstip=document.getElementById("addresstip").innerText;       //获取地址错误 必须为空
	//&&pass!=""&&passtip1==""&&passtip2==""&&contact!=""&&contacttip==""&&company!=""&&companytip==""&&
	//hyinde!=0&&zwindex!=0&&provinceindex!=0&&cityindex!=0&&address!=""&&addresstip==""
	//||pass.length==0||contact.length==0||company.length==0||hyindex==0||zwindex==0||provinceindex==0||cityindex==0||address.length==0
	if(phonenum.length==0||pass.length==0||contact.length==0||company.length==0||hyindex==0||zwindex==0||provinceindex==0||cityindex==0||address.length==0){
		alert("请保证信息完整\n\n如已填写完整，请联系天澜公司报告BUG\nBUG核实后可领取最大金额¥100现金红包\n现金红包适用范围:采购与维修抵扣" +
				"\n\n联系电话:18026753608");
	}else{
		if(phonetip.length==0&&passtip1.length==0&&passtip2.length==0&&contacttip.length==0&&companytip.length==0&&addresstip.length==0){
			var hy=document.getElementById("hy"); 
			
			var zw=document.getElementById("zw"); 
			
			var country=document.getElementById("country");  
			
			var countryindex=document.getElementById("country").selectedIndex; 
			
			var province=document.getElementById("province");  
			
			var city=document.getElementById("city");     
			//createCity('AjaxJs/GetCity.jsp?province='+encodeURI(province)+'&datetime='+new Date().getTime());
createRegister('AjaxJs/RegisterUser.jsp?user='+encodeURI(phonenum)+'&passw='+encodeURI(pass)+'&company='+encodeURI(company)+'&hy='+encodeURI(hy.options[hyindex].text)+'&contact='+encodeURI(contact)+'&zw='+encodeURI(zw.options[zwindex].text)+'&country='+encodeURI(country.options[countryindex].text)+'&province='+encodeURI(province.options[provinceindex].text)+'&city='+encodeURI(city.options[cityindex].text)+'&address='+encodeURI(address)+'&datetime='+new Date().getTime());
			//+'&hy='+encodeURI(hy.options[hyindex].text+'&contact='+encodeURI(contact)+'&zw='+encodeURI(zw.options[zwindex].text)
			//+'&country='+encodeURI(country.options[countryindex].text)+'&province='+encodeURI(province.options[provinceindex].text)
			//+'&city='+encodeURI(city.options[cityindex].text)+'&address='+encodeURI(address)
		}else{
			alert("请保证信息格式正确\n\n如信息格式正确，请联系天澜公司报告BUG\nBUG核实后可领取最大金额¥100现金红包\n现金红包适用范围:采购与维修抵扣" +
					"\n\n联系电话:18026753608");
		}		
	}
}
function checkUserAgree(obj){
	if(obj.checked){
		document.getElementById("registerB").disabled=false; 
	}else{
		document.getElementById("registerB").disabled=true; 
	}
	
}
function checkStr(value,id){
	  var pattern = new RegExp("[%--`~!@#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？]")
	  if(pattern.test(value)){
		  document.getElementById(id).innerHTML="含有非法字符，请重新填写";
	  }else{
		  document.getElementById(id).innerHTML="";
	  }
}