package com.tlweb;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class LoginCheck {
	Dao d=new Dao();
	Connection con=d.getcon();
	public String Check(String user,String pass){
		String s="";
		try{
			Statement sql = con.createStatement();
			ResultSet res=sql.executeQuery("select*from webcustom where userid='"+user+"' and pass='"+pass+"' and registerstatus = 1 ");
			if(res.next()){
				s=user;
				System.out.println(s);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return s;
	}
}
