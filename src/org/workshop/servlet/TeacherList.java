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
 * Servlet implementation class TeacherList
 */
@WebServlet("/TeacherList")
public class TeacherList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TeacherList() {
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
		String TeacherOutput = "";
		String OverTeacherOuput = "";
		String output = "";
		SQLConnect connection = new SQLConnect();
		Connection conn = connection.connetDB();
		try 
		{
			String sql = "SELECT * FROM teacher WHERE teacher_workload < 3";
			PreparedStatement ps = null;
			//Connection conn = SQLConnect.connetDB();
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				TeacherOutput += "<option class=\"lessthan3\" data-subtext=\"" + rs.getString("teacher_workload") + "\" value='" + rs.getInt("teacher_id") + "'>" + rs.getString("teacher_name") + "</option>\n";
			}
		} 
		catch (Exception e) 
		{
			System.out.println(e);
		}
		try 
		{
			String sql = "SELECT * FROM teacher WHERE teacher_workload >= 3";
			PreparedStatement ps = null;
			//Connection conn = SQLConnect.connetDB();
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				OverTeacherOuput += "<option class=\"morethan3\" data-subtext=\"" + rs.getString("teacher_workload") + "\" value='" + rs.getInt("teacher_id") + "'>" + rs.getString("teacher_name") + "</option>\n";
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
		
		output = "<optgroup label=\"Workload less than 3.0\">\n" + TeacherOutput + "</optgroup>" + "<optgroup label=\"Workload more than 3.0\">" + OverTeacherOuput + "</optgroup>";
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
