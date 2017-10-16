package course.assign;

import java.sql.Connection;
import java.sql.PreparedStatement;

import database.connect.SQLConnect;

public class Teacher 
{
	private int teacherID;
	private String teacherName;
	private Double teacherWorkaLoad;
	
	public void setID(int value)
	{
		teacherID = value;
	}
	
	public int getID()
	{
		return teacherID;
	}
	
	public String getName()
	{
		return teacherName;
	}
	
	public void setName(String value)
	{
		teacherName = value;
	}
	
	public Double getWorkLoad()
	{
		return teacherWorkaLoad;
	}
	
	public void setWorkLoad(Double value)
	{
		teacherWorkaLoad = value;
	}
	
	public boolean AddTeacher()
	{
		boolean status = false;
		try 
		{
			String sql = "INSERT INTO teacher (teacher_name) VALUES(?)";
			PreparedStatement ps = null;
	        Connection conn = SQLConnect.connetDB();
	        ps = conn.prepareStatement(sql);
	        ps.setString(1, teacherName);
	        ps.executeUpdate();
	        status = true;
		} 
		catch (Exception e) 
		{
			System.out.println(e);
		}
		finally 
		{
			SQLConnect.closeDB();
		}
		return status;
	}
	
	public boolean HasITCourse()
	{
		return false;
	}
	
}
