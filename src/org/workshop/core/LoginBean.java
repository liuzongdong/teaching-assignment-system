package org.workshop.core;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.workshop.database.connect.SQLConnect;

public class LoginBean 
{
	private String username;
	private String password;
	
	public String getUsername()
	{
		return username;
	}
	
	public void setUsername(String username)
	{
		this.username = username;
	}
	
	public String getPassword()
	{
		return password;
	}
	
	public void setPassword(String password)
	{
		this.password = password;
	}
	
	public boolean validate()
	{
		boolean status = false;
		SQLConnect connection = new SQLConnect();
		Connection conn = connection.connetDB();
		try 
		{
			String sql = "select * from user where username = ? and password = ?";
			PreparedStatement ps = null;
	        //Connection conn = SQLConnect.connetDB();
	        ps = conn.prepareStatement(sql);
	        ps.setString(1, username);
	        ps.setString(2, password);
	        ResultSet rs = ps.executeQuery();
	        status = rs.next();
		} 
		catch (Exception e) 
		{
			System.out.println(e);
		}
		finally 
		{
			connection.closeDB();
		}
		return status;
	}
}
