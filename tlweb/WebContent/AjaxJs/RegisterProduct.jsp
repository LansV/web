<%@ page language="java" import="java.util.*" pageEncoding="GB18030" %>
<%@ page  import="com.tlweb.*" %>
<%
	try{
		String sre=request.getHeader("referer");
		String arr[]=sre.split("/");
		sre=arr[arr.length-1]; 
		if(request.getParameter("sn")==null||request.getParameter("uid")==null){
			response.sendRedirect(request.getContextPath()+"/Login.jsp");
		}else{
			String sn=new String(request.getParameter("sn").getBytes("ISO-8859-1"),"UTF-8");
			String uid=new String(request.getParameter("uid").getBytes("ISO-8859-1"),"UTF-8");
			GetProductRegister gpr=new GetProductRegister();
			if(gpr.register(uid,sn)){
				out.print(0);
				System.out.println("0");
			}else{
				out.print(1);
				System.out.println("1");
			}
		}
	}catch(Exception e){
		response.sendRedirect(request.getContextPath()+"/Login.jsp");
	}
%>