package course.assign;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
	
	/**
	 * Init a teacher from databases.
	 * @param teacher_id	teacher id, data type is int.
	 */
	public void InitTeacher(int teacher_id)
	{
		try 
		{
			String sql = "SELECT * FROM teacher WHERE teacher_id = ?";
			PreparedStatement ps = null;
	        Connection conn = SQLConnect.connetDB();
	        ps = conn.prepareStatement(sql);
	        ps.setInt(1, teacher_id);
	        ResultSet rs = ps.executeQuery();
	        while(rs.next())
	        {
	        	teacherName = rs.getString("teacher_name");
	        	teacherWorkaLoad = rs.getDouble("teacher_workload");
	        }
		} 
		catch (Exception e) 
		{
			System.out.println(e);
		}
		finally 
		{
			SQLConnect.closeDB();
		}
	}
	
	public boolean HasITCourse()
	{
		boolean status = false;
		try 
		{
			String sql = "SELECT * FROM course_assign, course, teacher WHERE course_assign_id = course";
			PreparedStatement ps = null;
	        Connection conn = SQLConnect.connetDB();
	        ps = conn.prepareStatement(sql);
	        //ps.setInt(1, course_id);
	        ResultSet rs = ps.executeQuery();
	        int counter = rs.getMetaData().getColumnCount();
	        if (counter >= 1) 
	        {
				status = true;
			}
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
	
}
