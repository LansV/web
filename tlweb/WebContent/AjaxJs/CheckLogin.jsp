<%@ page language="java" import="java.util.*" pageEncoding="GB18030" %>
<%@ page  import="com.tlweb.*" %>
<%	
	try{
		String sre=request.getHeader("referer");
		String arr[]=sre.split("/");
		sre=arr[arr.length-1]; 
		if(request.getParameter("user")==null){
			response.sendRedirect(request.getContextPath()+"/Login.jsp");
		}else{
			String num=new String(request.getParameter("user").getBytes("ISO-8859-1"),"UTF-8");
			String pass=new String(request.getParameter("passw").getBytes("ISO-8859-1"),"UTF-8");
			LoginCheck c=new LoginCheck();
			String st=c.Check(num, pass);
			if(st.length()==0){
				out.print("error");
			}else{
				session.setAttribute(st,"tu");
				out.print("success");
			}
		}
	}catch(Exception e){
		response.sendRedirect(request.getContextPath()+"/Login.jsp");
	}
	
%>