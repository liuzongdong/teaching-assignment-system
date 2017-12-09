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
 * Servlet implementation class TAList
 */
@WebServlet("/TAList")
public class TAList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TAList() {
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
			String sql = "SELECT * FROM ta WHERE ta_workload < 6";
			PreparedStatement ps = null;
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				TeacherOutput += "<option data-subtext=\"" + rs.getString("ta_workload") + "\" value='" + rs.getInt("ta_id") + "'>" + rs.getString("ta_name") + "</option>\n";
			}
		} 
		catch (Exception e) 
		{
			System.out.println(e);
		}
		try 
		{
			String sql = "SELECT * FROM ta WHERE ta_workload >= 6";
			PreparedStatement ps = null;
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				OverTeacherOuput += "<option data-subtext=\"" + rs.getString("ta_workload") + "\" value='" + rs.getInt("ta_id") + "'>" + rs.getString("ta_name") + "</option>\n";
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
		
		output = "<optgroup label=\"Workload less than 6.0\">\n" + TeacherOutput + "</optgroup>" + "<optgroup disabled label=\"Workload more than 6.0\">" + OverTeacherOuput + "</optgroup>";
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
