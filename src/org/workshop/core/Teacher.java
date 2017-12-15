package org.workshop.core;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.workshop.database.SQLConnect;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

public class Teacher 
{
	private int teacherID;
	private String teacherName;
	private Double teacherWorkaLoad;

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

	public static Double GetWorkload(int teacher_id)
	{
		Double workload = 0.0;
		SQLConnect connection = new SQLConnect();
		Connection conn = connection.connetDB();
		try 
		{
			String sql = "SELECT teacher_workload FROM teacher WHERE teacher_id = ?";
			PreparedStatement ps = null;
			ps = conn.prepareStatement(sql);
			ps.setInt(1, teacher_id);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				workload = rs.getDouble("teacher_workload");
			}
		} 
		catch (Exception e) 
		{
			System.out.println(e);
		}
		finally 
		{
			connection.closeDB();
		}
		return workload;
	}

	public boolean AddTeacher()
	{
		boolean status = false;
		SQLConnect connection = new SQLConnect();
		Connection conn = connection.connetDB();
		try 
		{
			String sql = "INSERT INTO teacher (teacher_name) VALUES(?)";
			PreparedStatement ps = null;
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
			connection.closeDB();
		}
		return status;
	}
	
	public boolean AddTA()
	{
		boolean status = false;
		SQLConnect connection = new SQLConnect();
		Connection conn = connection.connetDB();
		try 
		{
			String sql = "INSERT INTO ta (ta_name) VALUES(?)";
			PreparedStatement ps = null;
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
			connection.closeDB();
		}
		return status;
	}

	/**
	 * Init a teacher from databases.
	 * @param teacher_id	teacher id, data type is int.
	 */
	public void InitTeacher(int teacher_id)
	{
		SQLConnect connection = new SQLConnect();
		Connection conn = connection.connetDB();
		try 
		{
			String sql = "SELECT * FROM teacher WHERE teacher_id = ?";
			PreparedStatement ps = null;
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
			connection.closeDB();
		}
	}
	
	public static String GetTAName(String id)
	{
		String name = "";
		SQLConnect connection = new SQLConnect();
		Connection conn = connection.connetDB();
		try 
		{
			String sql = "SELECT ta_name FROM ta WHERE ta_id = ?";
			PreparedStatement ps = null;
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				name = rs.getString("ta_name");
			}
		} 
		catch (Exception e) 
		{
			System.out.println(e);
		}
		finally 
		{
			connection.closeDB();
		}
		return name;
	}


	public boolean HasITCourse()
	{
		boolean status = false;
		SQLConnect connection = new SQLConnect();
		Connection conn = connection.connetDB();
		try 
		{
			String sql = "SELECT * FROM course_assign, course, teacher WHERE course_assign_id = course_id AND teacher_id = ? AND course_type = 1";
			PreparedStatement ps = null;
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
			connection.closeDB();
		}
		return status;
	}

	public JsonArray ViewTeacher()
	{
		JsonArray array = new JsonArray();
		SQLConnect connection = new SQLConnect();
		Connection conn = connection.connetDB();
		try 
		{
			String sql = "select * from teacher";
			PreparedStatement ps = null;
			//Connection conn = SQLConnect.connetDB();
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
			connection.closeDB();
		}
		return array;
	}
	
	public JsonArray ViewTAAssign()
	{
		JsonArray array = new JsonArray();
		SQLConnect connection = new SQLConnect();
		Connection conn = connection.connetDB();
		try 
		{
			String sql = "SELECT * FROM course";
			PreparedStatement ps = null;
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				JsonObject object = new JsonObject();
				object.addProperty("course_name", rs.getString("course_name"));
				object.addProperty("course_ta", rs.getString("course_ta"));
				object.addProperty("course_time", rs.getString("course_time"));
				array.add(object);
			}
		}
		catch (Exception e) 
		{
			System.out.println(e);
		}
		finally 
		{
			connection.closeDB();
		}
		return array;
	}
	
	public JsonArray ViewTA()
	{
		JsonArray array = new JsonArray();
		SQLConnect connection = new SQLConnect();
		Connection conn = connection.connetDB();
		try 
		{
			String sql = "SELECT * FROM ta";
			PreparedStatement ps = null;
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				JsonObject object = new JsonObject();
				object.addProperty("ta_id", rs.getString("ta_id"));
				object.addProperty("ta_name", rs.getString("ta_name"));
				object.addProperty("ta_workload", rs.getString("ta_workload"));
				array.add(object);
			}
		}
		catch (Exception e) 
		{
			System.out.println(e);
		}
		finally 
		{
			connection.closeDB();
		}
		return array;
	}
	
	public static boolean CheckTimeCrash(String ta_id, String day, String from, String to)
	{
		boolean status = false;
		SQLConnect connection = new SQLConnect();
		Connection conn = connection.connetDB();
		try 
		{
			String sql = "SELECT * FROM course_ta_assign WHERE course_ta_id = ?";
			PreparedStatement ps = null;
			ps = conn.prepareStatement(sql);
			ps.setString(1, ta_id);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				if (rs.getString("day").equals(day) && (((Integer.parseInt(rs.getString("time_from")) >= Integer.parseInt(from)) && (Integer.parseInt(to) >= Integer.parseInt(rs.getString("time_to"))) ) || (Integer.parseInt(rs.getString("time_from")) <= Integer.parseInt(from) && Integer.parseInt(rs.getString("time_to")) >= Integer.parseInt(from)) || ((Integer.parseInt(to) <= Integer.parseInt(rs.getString("time_to")) && (Integer.parseInt(to) >= Integer.parseInt(rs.getString("time_from"))))))) 
				{
					status = true;
				}
			}
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
	
	public static boolean AssignTACourse(String course_id, String ta_id, String plain_time, String day, String from, String to)
	{
		boolean status = false;
		SQLConnect connection = new SQLConnect();
		Connection conn = connection.connetDB();
		try 
		{
			String sql = "INSERT INTO course_ta_assign (course_ta_assign_id, course_ta_id, plain_time, day, time_from, time_to) VALUES(?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = null;
			ps = conn.prepareStatement(sql);
			ps.setString(1, course_id);
			ps.setString(2, ta_id);
			ps.setString(3, plain_time);
			ps.setString(4, day);
			ps.setString(5, from);
			ps.setString(6, to);
			ps.executeUpdate();
			status = true;
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
