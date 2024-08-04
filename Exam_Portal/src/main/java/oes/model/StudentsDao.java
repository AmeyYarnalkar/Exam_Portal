package oes.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import oes.db.Provider;
import oes.db.Students;

public class StudentsDao {

	public static boolean doValidate(Students sd) {
		// TODO Auto-generated method stub
		boolean status = false;
		try
		{
		
		Connection con = Provider.getOracleConnection();
		String sql = "select * from Students where username=? and password=?";
		PreparedStatement pst = con.prepareStatement(sql);
		pst.setString(1, sd.getUsername());
		pst.setString(2, sd.getPassword());
		ResultSet rs = pst.executeQuery();
		
		if(rs.next())
		{
			sd.setName(rs.getString("name"));
			status = true;
		}
		else
		{
			status = false;
		}
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return status;
	}

	public static boolean insertStudent(Students st) {
		// TODO Auto-generated method stub
		boolean status = false;
		try
		{
		
		Connection con = Provider.getOracleConnection();
		String sql = "insert into Students (username,password,name) values(?,?,?)";
		PreparedStatement pst = con.prepareStatement(sql);
		pst.setString(1, st.getUsername());
		pst.setString(2, st.getPassword());
		pst.setString(3, st.getName());
		int val = pst.executeUpdate();
		if(val > 0)
		{
			status = true;
		}
		else
		{
			status = false;
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return status;
	}
	public static ArrayList<Students> getAllRecords() {
	    ArrayList<Students> studentsList = new ArrayList<Students>();
	    try {
	        Connection con = Provider.getOracleConnection();
	        String sql = "SELECT * FROM Students";
	        PreparedStatement pst = con.prepareStatement(sql);

	        ResultSet rs = pst.executeQuery();
	        while (rs.next()) {
	            Students s = new Students();
	            s.setUsername(rs.getString("username"));  // Ensure this matches the actual column name
	            s.setPassword(rs.getString("password"));  // Ensure this matches the actual column name
	            s.setName(rs.getString("name"));          // Ensure this matches the actual column name
	            studentsList.add(s);
	        }
	        rs.close();
	        pst.close();
	        con.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return studentsList;
	}

	public static int deleteRecord(Students st) {
		// TODO Auto-generated method stub
		int status = 0;
		try
		{
		
		Connection con = Provider.getOracleConnection();
		String sql = "delete from  Students where username=?";
		PreparedStatement pst = con.prepareStatement(sql);
		pst.setString(1, st.getUsername());
	
		int val = pst.executeUpdate();
		if(val > 0)
		{
			status = 1;
		}
		else
		{
			status = 0;
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return status;
	}
	public static String getStudentName(String username) {
		// TODO Auto-generated method stub
		String name = null;
		try
		{
		
		Connection con = Provider.getOracleConnection();
		String sql = "select name from Students where username=?";
		PreparedStatement pst = con.prepareStatement(sql);
		pst.setString(1,username);
	
		ResultSet rs = pst.executeQuery();
		if(rs.next())
		{
			name = rs.getString(1);
		}
		else
		{
			name="DB-Error";
		}
		
	    }
		catch(Exception e)
		{
			name = e.getMessage();
		}
		return name;

   }
	public static int doUpdateNowRecord(String originalusername,String newuserid,String newpassword,String newname)
	{
		int status = 0;
		try
		{
		
		Connection con = Provider.getOracleConnection();
		String sql = "update Students set username=?,password=?,name=? where username=?";
		PreparedStatement pst = con.prepareStatement(sql);
		pst.setString(1,newuserid);
		pst.setString(2, newpassword);
		pst.setString(3, newname);
		pst.setString(4, originalusername);
	
		int val = pst.executeUpdate();
		if(val > 0)
		{
			status = 1;
		}
		else
		{
			status = -1;
		}
		}
		catch(Exception f)
		{
			status = 2;
			f.printStackTrace();
		}
		
	    
		return status;
	}
		
}
