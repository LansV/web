<%@ page language="java" import="java.util.*" pageEncoding="GB18030" %>
<%@ page  import="com.tlweb.*" %>
<%	
	try{
		String sre=request.getHeader("referer");
		String arr[]=sre.split("/");
		sre=arr[arr.length-1]; 
		if(request.getParameter("country")==null){
			response.sendRedirect(request.getContextPath()+"/Login.jsp");
		}else{
			String country=new String(request.getParameter("country").getBytes("ISO-8859-1"),"UTF-8");
			String province="��ѡ��ʡ��,������,�����,�Ϻ���,������,�ӱ�ʡ,ɽ��ʡ,����ʡ,����ʡ,������ʡ,����ʡ,�㽭ʡ,����ʡ,����ʡ,����ʡ,ɽ��ʡ,����ʡ,����ʡ,����ʡ,�㶫ʡ,����ʡ,�Ĵ�ʡ,����ʡ,����ʡ,����ʡ,����ʡ,�ຣʡ,̨��ʡ,���ɹ�������,����׳��������,����������,���Ļ���������,�½�ά���������,����ر�������,�����ر�������,";
			if(country.equals("�й�")){
				out.println(province);
			}
		}
	}catch(Exception e){
		response.sendRedirect(request.getContextPath()+"/Login.jsp");
	}
	
%>