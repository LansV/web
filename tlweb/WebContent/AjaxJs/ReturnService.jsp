<%@ page language="java" import="java.util.*" pageEncoding="GB18030" %>
<%@ page  import="com.tlweb.*" %>
<%	
	try{
		String sre=request.getHeader("referer");
		String arr[]=sre.split("/");
		sre=arr[arr.length-1]; 
		if(request.getParameter("service")==null){
			response.sendRedirect(request.getContextPath()+"/Login.jsp");
		}else{
			String getservice=new String(request.getParameter("service").getBytes("ISO-8859-1"),"UTF-8");
			String userid=new String(request.getParameter("id").getBytes("ISO-8859-1"),"UTF-8");
			String service=getservice.replace("\"", "");
			if(service.equals("产品注册")){
				String st="<div id='add'><a href='javascript:void(0)' onclick='openQuestion()'><img src='pic/regadd.png'></img></a></div>";
				GetProductRegister gpr=new GetProductRegister();
				List<String> li=gpr.Check(userid);
				for(int i=0,l=li.size()/6;i<l;i++){
					String s=
							"<div id='registered'>"+
							"<table>"+
							"<tr><td colspan='2' style='border-bottom:1px solid red;' id='tablet'>"+li.get(0+i*7)+"</td></tr>"+
							"<tr><td id='tablel'>Model:</td><td>"+li.get(1+i*7)+"</td></tr>"+
							"<tr><td id='tablel'>PumpNo:</td><td>"+li.get(2+i*7)+"</td></tr>"+
							"<tr><td id='tablel'>CrankCaseNo:</td><td>"+li.get(3+i*7)+"</td></tr>"+
							"<tr><td id='tablel'>MotorNo:</td><td>"+li.get(4+i*7)+"</td></tr>"+
							"<tr><td id='tablel'>PD:</td><td>"+li.get(5+i*7)+"</td></tr>"+
							"<tr><td id='tablel'>RegDate:</td><td>"+li.get(6+i*7)+"</td></tr>"+
							"</table>"+
							"</div>";
							st=st+s;
				}
				out.print(st);		
			}
			if(service.equals("售后申请")){
				String st="<div id='add'><a href='javascript:void(0)' onclick='openQuestion()'><img src='pic/service.png'></img></a></div>";
				out.print(st);		
			}
			if(service.equals("维修申请")){
				String st="<div id='add'><a href='javascript:void(0)' onclick='openQuestion()'><img src='pic/repair.png'></img></a></div>";
				out.print(st);		
			}
			if(service.equals("投诉建议")){
				String st="<div id='add'><a href='javascript:void(0)' onclick='openQuestion()'><img src='pic/advise.png'></img></a></div>";
				out.print(st);		
			}
			if(service.equals("个人信息")){
				String st="<div></div>";
				out.print(st);		
			}
			
		}
	}catch(Exception e){
		response.sendRedirect(request.getContextPath()+"/Login.jsp");
	}
%>