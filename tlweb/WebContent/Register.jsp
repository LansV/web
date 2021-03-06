<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="webicon.ico" rel="shortcut icon" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>
<link rel="stylesheet" type="text/css" href="Css/Register.css">
<script language="javascript" src="Js/Register.js">
</script>
</head>
<body>
	<div id="regmain">
    	<form>
        	<table>
           	    <tr>
                <td style=" font-size:24px;text-align:center;height:45px;color:#00a2e9;text-shadow: 2px 2px 0px #fff;" colspan="2">
                <b><a style="font-size:24px;color:#00a2e9;" href="index.html">天澜用户注册</a></b>
                </td>
                </tr>
            	<tr>
            	<td class="rtb">用户名:</td>
            	<td><input type="text" id="usert" class="regt" maxlength="20" onblur="checkUser()" placeholder="仅支持手机注册">
            	*</td>
            	</tr>
                <tr>
                <td></td><td><div class="tip" id="showtip"></div></td>
                </tr>
                <tr>
                <td class="rtb">密码:</td><td><input type="password" id="passt1" class="regt" maxlength="20" onblur="checkPass()" placeholder="请输入密码">
                *</td>
                </tr>
                <tr>
                <td></td><td><div class="tip"  id="showpass1"></div></td>
                </tr>
                <tr>
                <td class="rtb">确认密码:</td>
                <td><input type="password" id="passt2" class="regt" maxlength="20" onkeyup="equalsPass()" placeholder="请确认密码">
                *</td>
                </tr>
                <tr>
                <td></td><td><div class="tip"  id="showpass2"></div></td>
                </tr>
                <tr>
                <td class="rtb">公司(店)名称:</td>
                <td>
                <input type="text" id="company" class="regt" maxlength="40" onblur="checkStr(this.value,'companytip')"  placeholder="请填写真实店名">
                *</td
                ></tr>
                <tr>
                <td></td><td><div class="tip" id="companytip"></div></td>
                </tr>
                <tr><td class="rtb">行业:</td>
                <td>
                <select id="hy">
                	<option>选择行业</option>
                    <option>美容</option>
                    <option>养殖</option>
                    <option>化工</option>
                    <option>电子</option>
                    <option>海事</option>
                    <option>煤矿</option>
                    <option>农业</option>
                    <option>市政</option>
                    <option>环卫</option>
                    <option>五金</option>
                    <option>造船</option>
                    <option>物业</option>
                    <option>其他</option>
                </select>
                *</td></tr>
                <tr>
                <td></td><td><div  class="tip" ></div></td>
                </tr>
                <tr>
                <td class="rtb">联系人:</td>
                <td>
                <input type="text" id="contactt" class="regt" maxlength="20" onblur="checkStr(this.value,'contacttip')" placeholder="请填写真实姓名">
                *</td>
                </tr>
                <tr>
                <td></td><td><div class="tip" id="contacttip"></div></td>
                </tr>
                <tr><td class="rtb">职位:</td>
                <td>
                <select id="zw">
                	<option>选择职位</option>
                    <option>企业所有人</option>
                    <option>经理</option>
                    <option>店长</option>
                    <option>主管</option>
                    <option>职员</option>
                    <option>操作员</option>
                    <option>其他</option>
                </select>
                *</td></tr>
                <tr>
                <td></td><td><div  class="tip" ></div></td>
                </tr>
                <tr><td class="rtb">国家:</td>
                <td>
                <select id="country" onchange="getProvince(this.value)">
                	<option>请选择国家</option>
                	<option value="中国">中国</option>
                	<option>越南</option>
                	<option>新加坡</option>
                </select>
                *</td></tr>
                <tr>
                <td></td><td><div  class="tip" ></div></td>
                </tr>
                <tr><td class="rtb">省份:</td>
                <td>
                <select id="province" onchange="getCity(this.value)">
                	<option>请选择省份</option>
                </select>
                *</td></tr>
                <tr>
                <td></td><td><div  class="tip" ></div></td>
                </tr>
                <tr><td class="rtb">选择城市:</td>
                <td  >
                <select id="city">
                	<option>请选择城市</option>
                </select>
                *</td></tr>
                <tr>
                <td></td><td><div  class="tip" ></div></td>
                </tr>
                <tr>
                <td class="rtb">详细地址:</td>
                <td><input type="text" id="daddt" maxlength="100" class="regt" onblur="checkStr(this.value,'addresstip')" placeholder="例:XX区(市，县)XX街道XX号;请勿使用标点符号">
                *</td>
                </tr>
                <tr>
                <td></td><td><div class="tip" id="addresstip"></div></td>
                </tr>
                <tr>
                <td style=" text-align:center;" colspan="2"><input type="checkbox" id="agreement" onclick="checkUserAgree(this)">我同意
                <a href="agreement/UserAgreement.html" target="view_window">《用户注册协议》</a></td>
                </tr>
                <tr>
                <td style=" text-align:center;" colspan="2"><input type="button" id="registerB"  onclick="registerID()" onmousemove="getFocus()" value="注册" disabled=true></td>
                </tr>
                <tr>
                <td colspan="2">
                <p><b>
                                      请保证注册信息真实有效，如填写虚假信息本公司有权拒绝服务。
           		注册后账号暂不可登录，需人工验证激活账号后方可登录。（验证时间:注册时间起三个工作日内）
                </b></p>
                </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>