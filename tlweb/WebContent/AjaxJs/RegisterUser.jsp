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
			String userid=new String(request.getParameter("user").getBytes("ISO-8859-1"),"UTF-8");
			String passw=new String(request.getParameter("passw").getBytes("ISO-8859-1"),"UTF-8");
			String company=new String(request.getParameter("company").getBytes("ISO-8859-1"),"UTF-8");
			String hy=new String(request.getParameter("hy").getBytes("ISO-8859-1"),"UTF-8");
			String contact=new String(request.getParameter("contact").getBytes("ISO-8859-1"),"UTF-8");
			String zw=new String(request.getParameter("zw").getBytes("ISO-8859-1"),"UTF-8");
			String country=new String(request.getParameter("country").getBytes("ISO-8859-1"),"UTF-8");
			String province=new String(request.getParameter("province").getBytes("ISO-8859-1"),"UTF-8");
			String city=new String(request.getParameter("city").getBytes("ISO-8859-1"),"UTF-8");
			String address=new String(request.getParameter("address").getBytes("ISO-8859-1"),"UTF-8"); 
			//String result=userid+" "+passw+" "+company+" "+hy+" "+contact+" "+zw+" "+country+" "+province+" "+city+" "+address;
			String result="";
			InsertRegister ir=new InsertRegister();
			boolean b=ir.Register(userid, passw, company, hy, contact, zw, country, province, city, address);
			if(b==true){
				result="success";
				out.print(result);
			}else{
				result="error";
				out.print(result);
			}
		}
	}catch(Exception e){
		response.sendRedirect(request.getContextPath()+"/Login.jsp");
	}
	
%>