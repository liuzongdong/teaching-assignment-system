package course.assign;

import java.sql.*;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import database.connect.SQLConnect;
import other.RandomString;

public class Course 
{
	private int courseID;
	private String courseName;
	private String courseCategory;
	private String courseStudent;
	private Double courseTeacherWorkload;
	private Double courseTAWorkload;
	private int courseType;
	private int courseIsDuplication;
	private String courseDuplicateCode;
	
	
	/**
	 * Empty Constructor
	 *
	 */
	public Course()
	{
		
	}
	
	/**
	 * Course constructor
	 * @author Chen Ruonan, Liu Zongdong, Weng Minghong, Xu Huan.
	 * @version     1.0
	 * @param courseName	Course name, data type is String.
	 * @param courseCategory	Course category, data type is String.
	 * @param courseStudent 	Course student, data type is String.
	 */
	public Course(String courseName, String courseCategory, String courseStudent)
	{
		this.courseName = courseName;
		this.courseCategory = courseCategory;
		this.courseStudent = courseStudent;
	}
	

	/**
	 * Get Course name.
	 * 
	 *
	 * @return Course name	Data type: String
	 */
	public String GetCourseName()
	{
		return courseName;
	}
	
	
	/**
	 * Get Course ID.
	 *
	 * @return Course ID	Data type is int.
	 */
	public int GetCourseID()
	{
		return courseID;
	}
	
	/**
	 * Set a New course ID for the current course.
	 * 
	 * @param value	 Data type is int
	 *
	 */
	public void SetCourseID(int value)
	{
		courseID = value;
	}
	
	
	/**
	 * Set a New course name for current course.
	 * 
	 * @param courseName Data type is String
	 *
	 */
	public void SetCourseName(String courseName)
	{
		this.courseName = courseName;
	}
	
	
	/**
	 * Get Course Category.
	 *
	 * @return current Course Category	 Data type is String
	 */
	public String GetCourseCategory()
	{
		return courseCategory;
	}
	
	
	/**
	 * Set a new Course Category for current course.
	 * 
	 * @param courseCategory Data type is String
	 *
	 */
	public void SetCourseCategory(String courseCategory)
	{
		this.courseCategory = courseCategory;
	}
	
	
	/**
	 * Get current Course Student.
	 *
	 * @return course_student	Data type is String.
	 */
	public String GetCourseStudent()
	{
		return courseStudent;
	}
	
	
	/**
	 * Set a new Course Category for current course.
	 * 
	 * @param courseStudent	Data type is String.
	 *
	 */
	public void SetCourseStudent(String courseStudent)
	{
		this.courseStudent = courseStudent;
	}
	
	
	/**
	 * Get Course workload for teacher.
	 *
	 * @return courseTeacherWorkload	Data type is Double.
	 */
	public Double GetCourseTeacherWorkLoad()
	{
		return courseTeacherWorkload;
	}
	
	
	/**
	 * Set a new value for course teacher workload.
	 * 
	 * @param newValue	Data type is Double.
	 *
	 *
	 */
	public void SetCourseTeacherWorkLoad(Double newValue)
	{
		courseTeacherWorkload = newValue;
	}
	
	
	/**
	 * Set a new value for course TA workload.
	 * 
	 * @param newValue	Data type is Double.
	 *
	 * 
	 */
	public void SetCourseTAWorkLoad(Double newValue)
	{
		courseTAWorkload = newValue;
	}
	
	
	/**
	 * Get Course workload for TA.
	 *
	 * @return courseTAWorkload	Data type is Double.
	 */
	public Double GetCourseTAWorkLoad()
	{
		return courseTAWorkload;
	}
	
	public static String GetDuplicateCode(int id)
	{
		String code = "";
		try 
		{
			String sql = "SELECT course_duplicate_code FROM course WHERE course_id = ?";
			PreparedStatement ps = null;
	        Connection conn = SQLConnect.connetDB();
	        ps = conn.prepareStatement(sql);
	        ps.setInt(1, id);
	        ResultSet rs = ps.executeQuery();
	        while(rs.next())
	        {
	        	code = rs.getString("course_duplicate_code");
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
		return code;
	}
	
	public static boolean HasThisDuplicateCourse(int cid, int tid)
	{
		boolean status = false;
		try 
		{
			String sql = "SELECT course_assign_id FROM course_assign WHERE course_teacher_id = ?";
			PreparedStatement ps = null;
	        Connection conn = SQLConnect.connetDB();
	        ps = conn.prepareStatement(sql);
	        ps.setInt(1, tid);
	        ResultSet rs = ps.executeQuery();
	        while(rs.next())
	        {
	        	if (GetDuplicateCode(cid).equals(GetDuplicateCode(rs.getInt("course_assign_id")))) 
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
			SQLConnect.closeDB();
		}
		return status;
	}
	
	/**
	 * Add a new course into databases.
	 *
	 * @return true if the action succeed, otherwise false.
	 */
	public boolean AddCourse()
	{
		boolean status = false;
		try 
		{
			String sql = "INSERT INTO course (course_name, course_category, course_student, course_duplicate_code) VALUES(?, ?, ?, ?)";
			PreparedStatement ps = null;
	        Connection conn = SQLConnect.connetDB();
	        ps = conn.prepareStatement(sql);
	        ps.setString(1, courseName);
	        ps.setString(2, courseCategory);
	        ps.setString(3, courseStudent);
	        ps.setString(4, RandomString.getSaltString());
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
	 * Add IT Course into databases.
	 * @param number	number of course, data type is int.
	 * @return true if the action succeed, otherwise false.
	 */
	public static boolean AddITCourse(int number)
	{
		boolean status = false;
		try 
		{
			for (int i = 1; i <= number; i++)
			{
				String sql = "INSERT INTO course (course_name, course_category, course_student, course_type) VALUES(?, ?, ?, ?)";
				PreparedStatement ps = null;
		        Connection conn = SQLConnect.connetDB();
		        ps = conn.prepareStatement(sql);
		        ps.setString(1, "IT Course (" + i + ")");
		        ps.setString(2, "GE");
		        ps.setString(3, "All Student");
		        ps.setString(4, "1");
		        ps.executeUpdate();
			}
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
	 * Delete all IT course in databases, should be used before add IT Course.
	 * @return true if the action succeed, otherwise false.
	 */
	public static boolean DeleteITCourse()
	{
		boolean status = false;
		try 
		{

			String sql = "DELETE FROM course WHERE course_type = 1";
			PreparedStatement ps = null;
		    Connection conn = SQLConnect.connetDB();
		    ps = conn.prepareStatement(sql);
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
	 * Delete course.
	 * @param id	Course ID, data type is int.
	 * @return	true if the action succeed, otherwise false.
	 */
	public static boolean DeleteCourse(int id)
	{
		boolean status = false;
		try 
		{

			String sql = "DELETE FROM course WHERE course_id = ?";
			PreparedStatement ps = null;
		    Connection conn = SQLConnect.connetDB();
		    ps = conn.prepareStatement(sql);
		    ps.setInt(1, id);
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
	
	public static boolean EditCourse(int id, String name, String category, String student)
	{
		boolean status = false;
		try 
		{

			String sql = "UPDATE course SET course_name = ?, course_category = ?, course_student = ? WHERE course_id = ?";
			PreparedStatement ps = null;
		    Connection conn = SQLConnect.connetDB();
		    ps = conn.prepareStatement(sql);
		    ps.setString(1, name);
		    ps.setString(2, category);
		    ps.setString(3, student);
		    ps.setInt(4, id);
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
	 * After PD Assign course to teacher. Get the Full course data, including Course_name, Course_id, Course_categoty, Teacher_name.
	 *
	 * @return Json Data. Can be printed in the table.(View Course Page)
	 */
	public JsonArray ViewCourse()
	{
		JsonArray jsonarray = new JsonArray();
		try 
		{
			String sql = "select * from course, teacher, course_assign WHERE course.course_id = course_assign.course_assign_id AND teacher.teacher_id = course_assign.course_teacher_id";
			PreparedStatement ps = null;
	        Connection conn = SQLConnect.connetDB();
	        ps = conn.prepareStatement(sql);
	        ResultSet rs = ps.executeQuery();
	        while(rs.next())
	        {
	        	JsonObject jsonobj = new JsonObject();
	        	jsonobj.addProperty("course_id", rs.getString("course_id"));
	        	jsonobj.addProperty("teacher_name", rs.getString("teacher_name"));
	        	jsonobj.addProperty("course_name", rs.getString("course_name"));
	        	jsonobj.addProperty("course_category", rs.getString("course_category"));
	        	jsonobj.addProperty("course_student", rs.getString("course_student"));
	        	jsonarray.add(jsonobj);
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
		return jsonarray;
	}
	
	
	/**
	 * After PD add course. Get the basic course data. including Course_name, Course_id, Course_student, Course_category.
	 *
	 * @return Json Data. Can be printed in the table.(Add Course Page)
	 */
	public JsonArray ViewBasicCourse()
	{
		JsonArray jsonarray = new JsonArray();
		try 
		{
			String sql = "select * from course";
			PreparedStatement ps = null;
	        Connection conn = SQLConnect.connetDB();
	        ps = conn.prepareStatement(sql);
	        ResultSet rs = ps.executeQuery();
	        while(rs.next())
	        {
	        	JsonObject jsonobj = new JsonObject();
	        	jsonobj.addProperty("course_id", rs.getString("course_id"));
	        	jsonobj.addProperty("course_name", rs.getString("course_name"));
	        	jsonobj.addProperty("course_category", rs.getString("course_category"));
	        	jsonobj.addProperty("course_student", rs.getString("course_student"));
	        	jsonobj.addProperty("course_duplicate", rs.getString("course_duplicate"));
	        	jsonobj.addProperty("course_type", rs.getString("course_type"));
	        	jsonarray.add(jsonobj);
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
		return jsonarray;
	}
	/**
	 * !!IMPORTANT Do not use this function
	 * Check the course is duplicated or not.
	 * @param course_id Data type is int.
	 * @return true if the course is duplicated, otherwise false.
	 */
	public static boolean IsDuplicate(int course_id)
	{
		boolean status = false;
		try 
		{
			String sql = "SELECT * FROM course_assign WHERE course_assign_id = ?";
			PreparedStatement ps = null;
	        Connection conn = SQLConnect.connetDB();
	        ps = conn.prepareStatement(sql);
	        ps.setInt(1, course_id);
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
	
	/**
	 * !!IMPORTANT Do not use this function
	 * Check the course is duplicated or not.
	 * @see IsDuplicate(int course_id) 
	 * @return true if the course is duplicated, otherwise false.
	 */
	public boolean IsDuplicate()
	{
		boolean status = false;
		try 
		{
			String sql = "SELECT * FROM course_assign WHERE course_assign_id = ?";
			PreparedStatement ps = null;
	        Connection conn = SQLConnect.connetDB();
	        ps = conn.prepareStatement(sql);
	        ps.setInt(1, courseID);
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
	
	
	/**
	 * Initialize a course form database, when PD assign a course, this function should be called.
	 * @param course_id	data type is int.
	 */
	public void InitCourse(int course_id)
	{
		try 
		{
			String sql = "SELECT * FROM course WHERE course_id = ?";
			PreparedStatement ps = null;
	        Connection conn = SQLConnect.connetDB();
	        ps = conn.prepareStatement(sql);
	        ps.setInt(1, course_id);
	        ResultSet rs = ps.executeQuery();
	        while(rs.next())
	        {
	        	courseID = course_id;
	        	courseName = rs.getString("course_name");
	        	courseStudent = rs.getString("course_student");
	        	courseTeacherWorkload = rs.getDouble("course_teacher_workload");
	        	courseTAWorkload = rs.getDouble("course_ta_workload");
	        	courseDuplicateCode = rs.getString("course_duplicate_code");
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
	
	public static boolean SetDuplication(int id)
	{
		boolean status = false;
		try 
		{
			String sql = "UPDATE course SET course_duplicate = 1, course_teacher_workload = 0.5 WHERE course_id = ?";
			PreparedStatement ps = null;
	        Connection conn = SQLConnect.connetDB();
	        ps = conn.prepareStatement(sql);
	        ps.setInt(1, id);
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
	
	
	/*
	 * 
	 * 
	 */
	public static boolean AddSection(int number, String name, String category, String student)
	{
		boolean status = false;
		try 
		{
			String randomString = RandomString.getSaltString();
			for(int i = 1; i <= number; i++)
			{
				String sql = "INSERT INTO course (course_name, course_category, course_student, course_duplicate, course_duplicate_code, course_teacher_workload) VALUES(?, ?, ?, ?, ?, ?)";
				PreparedStatement ps = null;
		        Connection conn = SQLConnect.connetDB();
		        ps = conn.prepareStatement(sql);
		        ps.setString(1, name + " (" + i + ")");
		        ps.setString(2, category);
		        ps.setString(3, student);
		        ps.setInt(4, 1);
		        ps.setString(5, randomString);
		        ps.setDouble(6, 0.5);
		        ps.executeUpdate();
			}
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
	 * Assign a course to a teacher. (database operation).
	 * @param teacher_id data type is int.
	 * @return true if the action succeed, otherwise false.
	 */
	public boolean AssginCourse(int teacher_id)
	{
		boolean status = false;
		try 
		{
			String sql = "INSERT INTO course_assign (course_assign_id, course_teacher_id) VALUES(?, ?)";
			PreparedStatement ps = null;
	        Connection conn = SQLConnect.connetDB();
	        ps = conn.prepareStatement(sql);
	        ps.setInt(1, courseID);
	        ps.setInt(2, teacher_id);
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
	 * Add Teacher workload (Databases operation)
	 * @param teacher_id data type is int.
	 * @return true if the action succeed, otherwise false.
	 */
	public boolean AddTeacherWorkLoad(int teacher_id)
	{
		boolean status = false;
		try 
		{
			String sql = "SELECT teacher_workload FROM teacher WHERE teacher_id = ?";
			Double workload = 0.0;
			PreparedStatement ps = null;
	        Connection conn = SQLConnect.connetDB();
	        ps = conn.prepareStatement(sql);
	        ps.setInt(1, teacher_id);
	        ResultSet rs = ps.executeQuery();
	        while(rs.next())
	        {
	        	workload = rs.getDouble("teacher_workload");
	        }
			String newsql = "UPDATE teacher SET teacher_workload = ? WHERE teacher_id = ?";
			PreparedStatement newps = null;
	        Connection newconn = SQLConnect.connetDB();
	        newps = newconn.prepareStatement(newsql);
	        newps.setDouble(1, workload + courseTeacherWorkload);
	        newps.setInt(2, teacher_id);
	        newps.executeUpdate();
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
}

