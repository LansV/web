/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.75
 * Generated at: 2017-07-13 03:51:47 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.AjaxJs;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import com.tlweb.*;

public final class RegisterUser_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=GB18030");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
	
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
	

    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
