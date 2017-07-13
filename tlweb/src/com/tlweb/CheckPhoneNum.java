package com.tlweb;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class CheckPhoneNum {
	Dao d=new Dao();
	Connection con=d.getcon();
	public boolean Check(String num){
		boolean b=false;
		try{
			Statement sql = con.createStatement();
			ResultSet res = sql.executeQuery("select*from webcustom where userid='"+num+"'");
			if(res.next()==true){
				b=true;
			}else{
				b=false;
			}
		}catch(Exception e){
			
		}
		return b;
	}
}
