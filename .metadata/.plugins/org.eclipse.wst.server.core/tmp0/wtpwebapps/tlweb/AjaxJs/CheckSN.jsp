<%@ page language="java" import="java.util.*" pageEncoding="GB18030" %>
<%@ page  import="com.tlweb.*" %>
<%
	try{
		String sre=request.getHeader("referer");
		String arr[]=sre.split("/");
		sre=arr[arr.length-1]; 
		if(request.getParameter("sn")==null){
			response.sendRedirect(request.getContextPath()+"/Login.jsp");
		}else{
			String sn=new String(request.getParameter("sn").getBytes("ISO-8859-1"),"UTF-8");
		}
	}catch(Exception e){
		response.sendRedirect(request.getContextPath()+"/Login.jsp");
	}
%>