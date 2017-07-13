package com.tlweb;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class CheckSN {
	Dao d=new Dao();
	Connection con=d.getcon();

	public boolean checkSn(String sn){
		boolean b=false;
		try {
			Statement sql = con.createStatement();
			ResultSet res =sql.executeQuery("");
			b=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			b=false;
		}
		return b;
	};
}
