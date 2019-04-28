package Model;

import java.util.*;
import java.sql.*;
import com.*;
import java.io.*;

public class Category extends Connect
{
    /////Function for connect to the MySQL Server Database////////////
	public Category()
    {
		Connect.connect_mysql();
    }
	//////////Save User Details /////
	public String saveCategory(HashMap categoryData)
	{
		String SQL = "INSERT INTO `category` (`category_name`, `category_description`) VALUES (?, ?);";
		int record=0; 
		String error = "";
		
		try
		{
			pstmt = connection.prepareStatement(SQL);
			pstmt.setString(1,(String) categoryData.get("category_name"));
			pstmt.setString(2,(String) categoryData.get("category_description"));
			
			record = pstmt.executeUpdate();
			pstmt.close();
			connection.close();
		}
		catch(Exception e)
		{
			StringWriter writer = new StringWriter();
			PrintWriter printWriter = new PrintWriter( writer );
			e.printStackTrace( printWriter );
			printWriter.flush();
			String stackTrace = writer.toString();
			error+="Error : "+stackTrace;
			System.out.println(" Error : "+ e.toString());
		}
		return error;
	}
	//////////////////Function for getting Users Details//////////	
    public HashMap getCategoryDetails(int category_id)
	{
        HashMap results = new HashMap();
        int count=0;
		try
		{
            String SQL =  "SELECT * FROM `category` WHERE category_id = "+category_id ;
            statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while(rs.next())
			{
				results.put("category_id",rs.getString("category_id"));
				results.put("category_name",rs.getString("category_name"));
				results.put("category_description",rs.getString("category_description"));
				count++;
            }
			if(count==0)
			{
				results.put("category_id","");
				results.put("category_name","");
				results.put("category_description","");
			}
         }
		 catch(Exception e)
		 {
            System.out.println("Error is: "+ e);
       	 }
        return results;
    }
    /// Update the Category ////
	public String updateCategory(HashMap categoryData)
	{
		String SQL = "UPDATE `category` SET `category_name` = ?, `category_description` = ? WHERE `category_id` = ?;";
		String error = "";
		
		int record=0;	
		
		try
		{
			pstmt = connection.prepareStatement(SQL);
			
			pstmt.setString(1,(String) categoryData.get("category_name"));
			pstmt.setString(2,(String) categoryData.get("category_description"));
			pstmt.setString(3,(String) categoryData.get("category_id"));
			
			record = pstmt.executeUpdate();
			pstmt.close();
			connection.close();
		}
		catch(Exception e)
		{
			StringWriter writer = new StringWriter();
			PrintWriter printWriter = new PrintWriter( writer );
			e.printStackTrace( printWriter );
			printWriter.flush();
			String stackTrace = writer.toString();
			error+="Error : "+stackTrace;
			System.out.println(" Error : "+ e.toString());
		}
		return error;
	}
	
	////////////////Function for getting all the Airport Details////////////////////  
    public ArrayList getAllCategory()
	{
		String SQL = "SELECT * FROM `category`";
		int count=0;
        ArrayList resultArray = new ArrayList();
        try
		{			
			statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while(rs.next())
			{		
				HashMap results = new HashMap();
				results.put("category_id",rs.getString("category_id"));
				results.put("category_name",rs.getString("category_name"));
				results.put("category_description",rs.getString("category_description"));
				
				count++;
                resultArray.add(results);
            }
         }
		catch(Exception e)
		{
            System.out.println("Error is: "+ e);
        }
        return resultArray;
    }
}
