package org.workshop.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.workshop.database.SQLConnect;

/**
 * Servlet implementation class TAMCCourse
 */
@WebServlet("/TAMCCourse")
public class TAMCCourseList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TAMCCourseList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String MCOutput = "";
		String UnMCOuput = "";
		String output = "";
		SQLConnect connection = new SQLConnect();
		Connection conn = connection.connetDB();
		try 
		{
			String sql = "SELECT * FROM course WHERE course_category = 'MC' AND course_assigned = 1 AND course_has_ta = 0";
			PreparedStatement ps = null;
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				MCOutput += "<option value='" + rs.getInt("course_id") + "'>" + rs.getString("course_name") + "</option>\n";
			}
		} 
		catch (Exception e) 
		{
			System.out.println(e);
		}
		try 
		{
			String sql = "SELECT * FROM course WHERE course_category = 'MC' AND course_assigned = 1 AND course_has_ta = 1";
			PreparedStatement ps = null;
			//Connection conn = SQLConnect.connetDB();
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				UnMCOuput += "<option value='" + rs.getInt("course_id") + "'>" + rs.getString("course_name") + "</option>\n";
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
		
		output = "<optgroup label=\"Unassigned Course\">\n" + MCOutput + "</optgroup>" + "<optgroup label=\"Assigned Course\" disabled>" + UnMCOuput + "</optgroup>";
		out.append(output);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
