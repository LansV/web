package com.tlweb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

//import javax.swing.JOptionPane;

public class Dao {
	 Connection con;
	public  Connection getcon(){
		  try{
	 		   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	 	   }catch(ClassNotFoundException e){
	 		   //JOptionPane.showMessageDialog(null,"δ�ҵ��������ļ�");
	 		   //System.exit(0);
	 	   }
	 	   try{
	 		   con=DriverManager.getConnection("jdbc:sqlserver://192.168.0.13:1433;DatabaseName=CKsys3","sa","llfaicly1314@^");
	 	   }catch(SQLException e){
	 		   //JOptionPane.showMessageDialog(null, "�������ݿ�·������������");
	 		   //System.exit(0);
	 	   }
	 	   return con;
	 	   //test
	}
}
