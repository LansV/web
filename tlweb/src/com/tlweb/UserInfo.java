package com.tlweb;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class UserInfo {
	Dao d=new Dao();
	Connection con=d.getcon();
	public String getCompany(String user){
		String s="";
		try{
			Statement sql = con.createStatement();
			ResultSet res=sql.executeQuery("select company from webcustom where userid = '"+user+"'");
			while(res.next()){
				s=res.getString("company");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return s;
	}
	public String getId(String user){
		String s="";
		try{
			Statement sql = con.createStatement();
			ResultSet res=sql.executeQuery("select * from webcustom where userid = '"+user+"'");
			while(res.next()){
				s=res.getString("id");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return s;
	}
}
