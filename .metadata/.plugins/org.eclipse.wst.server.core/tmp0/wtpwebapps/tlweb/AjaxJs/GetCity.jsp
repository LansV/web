<%@ page language="java" import="java.util.*" pageEncoding="GB18030" %>
<%@ page  import="com.tlweb.*" %>
<%	
	try{
		String sre=request.getHeader("referer");
		String arr[]=sre.split("/");
		sre=arr[arr.length-1]; 
		if(request.getParameter("province")==null){
			response.sendRedirect(request.getContextPath()+"/Login.jsp");
		}else{
			String Province=new String(request.getParameter("province").getBytes("ISO-8859-1"),"UTF-8");
			City c=new City();
			out.println(c.getCity(Province));
		}
	}catch(Exception e){
		response.sendRedirect(request.getContextPath()+"/Login.jsp");
	}
%>