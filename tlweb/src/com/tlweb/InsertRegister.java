package com.tlweb;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
public class InsertRegister {
	Dao d=new Dao();
	Connection con=d.getcon();
	public boolean Register(String user,String pass,String company,String hy,String contact,String zw,String country,String province,String city,String address){
		Date yd=new Date();
		String date=String.format("%tF", yd);
		SimpleDateFormat timef=new SimpleDateFormat("HH:mm:ss");
		String time=timef.format(yd);
		try{
			Statement query = con.createStatement();
			ResultSet res=query.executeQuery("select max(id) as id from webcustom");
			int id=0;
			while(res.next()){
				int s=res.getInt("id");
				if(s==0){
					id=10000;
				}else{
					id=s+1;
				}
			}
			Statement sql = con.createStatement();
			sql.execute("insert into webcustom values("+id+",'"+user+"','"+pass+"','"+company+"','"+hy+"','"+contact+"','"+zw+"','"+country+"',"
					+ "'"+province+"','"+city+"','"+address+"','"+date+"','"+time+"',0)");
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
}
