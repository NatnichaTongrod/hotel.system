package com;
import java.sql.*;
import java.util.*;
import java.io.*;

public class Connect
{
    public static Statement statement = null;
    public static Connection connection;
	public static ResultSet rs;
	public static PreparedStatement pstmt;
    /////Function for connect to the MySQL Server Database////////////
	public static void connect_mysql()
    {
    	try  
    	{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
    		connection = DriverManager.getConnection("jdbc:mysql://localhost/hotel_room_booking_system?" + "user=root");
			statement=connection.createStatement();
   		}
   		catch(Exception e)  
    	{
			System.out.println(" Error : "+ e.toString());
    	}
    }
	////////Function for geting the Option/////////////////////
	public static String  getOptionList(String tableName,String idColumn,String valueColumn,String Columns,int selID,String conn)
	{
		String SQL = "SELECT "+Columns+" FROM "+tableName+" where "+conn; 
		String Option="<option value=''>Please Select</option>";
		try
		{
			rs = statement.executeQuery(SQL);
			while(rs.next())
			{
				int selectedID = rs.getInt(idColumn);
				if(selectedID==selID)
					Option+="<option value=\""+selectedID+"\" Selected>"+rs.getString(valueColumn)+"</option>";
				else
					Option+="<option value=\""+selectedID+"\">"+rs.getString(valueColumn)+"</option>";
			}
		}
		catch(Exception e)
		{
			StringWriter writer = new StringWriter();
			PrintWriter printWriter = new PrintWriter( writer );
			e.printStackTrace( printWriter );
			printWriter.flush();
			String stackTrace = writer.toString();
			Option+="Error : "+stackTrace;
			System.out.println("Error : "+e);
		}
		return Option;
	}
	
	////////Function for geting the Checkbox Option/////////////////////
	public static String  getChekboxOptionList(String tableName,String idColumn,String valueColumn,String Columns,String selID,String conn, String inputName)
	{
		String SQL = "SELECT "+Columns+" FROM "+tableName+" where "+conn; 
		String Option="";
		String selArray[] = selID.split(",");

		try
		{
			rs = statement.executeQuery(SQL);
			while(rs.next())
			{
				String selectedID = rs.getString(idColumn);
				if(Arrays.asList(selArray).contains(selectedID))
					Option+="<div class='multi-checkbox'><input name='"+inputName+"' type='checkbox' value=\""+selectedID+"\" checked class='checkbox-list'> "+rs.getString(valueColumn)+"</div>";
				else
					Option+="<div class='multi-checkbox'><input name='"+inputName+"' type='checkbox' value=\""+selectedID+"\" class='checkbox-list'> "+rs.getString(valueColumn)+"</div>";
			}
		}
		catch(Exception e)
		{
			StringWriter writer = new StringWriter();
			PrintWriter printWriter = new PrintWriter( writer );
			e.printStackTrace( printWriter );
			printWriter.flush();
			String stackTrace = writer.toString();
			Option+="Error : "+stackTrace;
			System.out.println("Error : "+e);
		}
		return Option;
	}
}
