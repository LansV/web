<%@ page language="java" import="java.util.*" pageEncoding="GB18030" %>
<%@ page  import="com.tlweb.*" %>
<%	
	try{
		String s=request.getHeader("referer");
		String arr[]=s.split("/");
		s=arr[arr.length-1]; 
		//System.out.println(s);
		if(s.equals("Register.jsp")){
			//System.out.println("yes");
			if(request.getParameter("user")==null){
				response.sendRedirect(request.getContextPath()+"/Login.jsp");
			}else{
				String num=new String(request.getParameter("user").getBytes("ISO-8859-1"),"UTF-8");
				String time=new String(request.getParameter("datetime").getBytes("ISO-8859-1"),"UTF-8");
				CheckPhoneNum ck=new CheckPhoneNum();
				if(ck.Check(num)==true){
					out.println("该手机号已注册");			//输出检测结果
				}else{
					out.println("");			//输出检测结果
				} 
			}
		}else{
			//System.out.println("get");
			response.sendRedirect(request.getContextPath()+"/Register.jsp");
		}
	}catch(Exception e){
		response.sendRedirect(request.getContextPath()+"/Register.jsp");
	}
	
%>