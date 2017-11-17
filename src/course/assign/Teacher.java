package course.assign;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import database.connect.SQLConnect;
import other.RandomString;

public class Teacher 
{
	private int teacherID;
	private String teacherName;
	private Double teacherWorkaLoad;
	private boolean hasITCourseStatus;
	
	public void SetID(int value)
	{
		teacherID = value;
	}
	
	public int GetID()
	{
		return teacherID;
	}
	
	public String GetName()
	{
		return teacherName;
	}
	
	public void SetName(String value)
	{
		teacherName = value;
	}
	
	public Double GetWorkLoad()
	{
		return teacherWorkaLoad;
	}
	
	public void SetWorkLoad(Double value)
	{
		teacherWorkaLoad = value;
	}
	
	public void SetHasITCourseStatus(boolean status)
	{
		hasITCourseStatus = status;
	}
	
	public boolean GetHasITCourseStatus()
	{
		return hasITCourseStatus;
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
	        	hasITCourseStatus = rs.getBoolean("teacher_has_it");
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
			String sql = "SELECT * FROM course_assign, course, teacher WHERE course_assign_id = course_id AND teacher_id = ? AND course_type = 1";
			PreparedStatement ps = null;
	        Connection conn = SQLConnect.connetDB();
	        ps = conn.prepareStatement(sql);
	        ps.setInt(1, teacherID);
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
	
	public JsonArray ViewTeacher()
	{
		JsonArray array = new JsonArray();
		try 
		{
			String sql = "select * from teacher";
			PreparedStatement ps = null;
	        Connection conn = SQLConnect.connetDB();
	        ps = conn.prepareStatement(sql);
	        ResultSet rs = ps.executeQuery();
	        while(rs.next())
	        {
	        	JsonObject object = new JsonObject();
	        	object.addProperty("teacher_id", rs.getString("teacher_id"));
	        	object.addProperty("teacher_name", rs.getString("teacher_name"));
	        	object.addProperty("teacher_workload", rs.getString("teacher_workload"));
	        	array.add(object);
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
		return array;
	}
	
}
