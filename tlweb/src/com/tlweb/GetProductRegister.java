package com.tlweb;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class GetProductRegister {
	Dao d=new Dao();
	Connection con=d.getcon();
	public List<String> Check(String user){
		List<String> s=new ArrayList<String>();
		try{
			Statement sql = con.createStatement();
			ResultSet res=sql.executeQuery("select*from productregister where registers_tatus=1 and registrant = '"+user+"'");
			while(res.next()){
				s.add(res.getString("tl_no"));
				s.add(res.getString("sp_name"));
				s.add(res.getString("pump_no"));
				s.add(res.getString("pump_no"));
				s.add(res.getString("motor_no"));
				s.add(res.getString("assemble_date"));
				s.add(res.getString("register_date"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return s;
	}
}
