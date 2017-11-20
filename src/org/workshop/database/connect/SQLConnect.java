package org.workshop.database.connect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SQLConnect 
{
	public static final String DBDRIVER = "com.mysql.jdbc.Driver";
    public static final String DBURL = "jdbc:mysql://localhost:3306/tas";
    public static final String DBUSER = "root";
    public static final String DBPASS = "";

    static Connection conn;
    
    public static Connection connetDB()
    {
        try 
        {
            Class.forName(DBDRIVER);
        } 
        catch (ClassNotFoundException e) 
        {
            e.printStackTrace();
        }

        try 
        {
        	conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);
        } 
        catch (SQLException e) 
        {
            return null;
        }

        return conn;

    }
    public static void closeDB() {
        try 
        {
            conn.close();
        } 
        catch (SQLException e) 
        {
            e.printStackTrace();
        }
    }
}
