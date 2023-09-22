package com.sw.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import MemberDto.MemberDto;

public class MemberDaoImpl {

	public int insertMember(MemberDto mdto) {
		Connection con = getConnection();
		ResultSet set=null;
		PreparedStatement pstmt=null;
		int ret=0;
		
		String sql="insert into student2 (ID,NAME,NUM,YEAR,PW,EMAIL) values (?, ?, ?,?,?,?)";
		try {
			pstmt=con.prepareStatement(sql);
			String ID=mdto.getID();
			String NAME=mdto.getNAME();
			String NUM=mdto.getNUM();
			String YEAR=mdto.getYEAR();
			String PW=mdto.getPW();
			String EMAIL=mdto.getEMAIL();
			pstmt.setString(1,ID);
			pstmt.setString(2,NAME);
			pstmt.setString(3,NUM);
			pstmt.setString(4,YEAR);
			pstmt.setString(5,PW);
			pstmt.setString(6,EMAIL);
			ret=pstmt.executeUpdate();
			System.out.println("insert ok");
		}catch (SQLException e){
			ret=-1;
			System.out.println("access error.");
			System.out.println(e.getMessage());
			e.printStackTrace();
		}finally {
			closeConnection(set,pstmt,con);
		}
		return ret;
	}
	public String logincheck(String email) {
		Connection con = getConnection();
		ResultSet set=null;
		PreparedStatement pstmt=null;
		String pwDb=null;
		ResultSet rs=null;
		int ret=0;
		String sql="select pw from login where email = ?";
		
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,email);
			rs= pstmt.executeQuery();
			while (rs.next()) {
				   pwDb = rs.getString("pw");
			   }
		}catch(SQLException e){
			System.out.println("SQLException error.");
			e.printStackTrace();
		}finally{
			closeConnection(rs,pstmt,con); 
		}
		return pwDb;	
	}

	public String name(String email) {
		Connection con = getConnection();
		ResultSet set=null;
		PreparedStatement pstmt=null;
		String nameDb=null;
		ResultSet rs=null;
		int ret=0;
		String sql="select name from login where email = ?";

		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,email);
			rs= pstmt.executeQuery();
			while (rs.next()) {
				   nameDb=rs.getString("name");
			   }
		}catch(SQLException e){
			System.out.println("SQLException error.");
			e.printStackTrace();
		}finally{
			closeConnection(rs,pstmt,con); 
		}
		return nameDb;
	}
	public String id(String email) {
		Connection con = getConnection();
		ResultSet set=null;
		PreparedStatement pstmt=null;
		String idDb=null;
		ResultSet rs=null;
		int ret=0;
		String sql="select email from login where email = ?";

		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,email);
			rs= pstmt.executeQuery();
			while (rs.next()) {
				   idDb=rs.getString("email");
			   }
		}catch(SQLException e){
			System.out.println("SQLException error.");
			e.printStackTrace();
		}finally{
			closeConnection(rs,pstmt,con); 
		}
		return idDb;
	}

	private Connection getConnection() {
			 Connection con=null;
				//step2
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					System.out.println("JDBC driver load success");
					} catch (ClassNotFoundException e) {
					System.out.println("JDBC driver load fail");
					}
				//step3
				try {
					con = DriverManager.getConnection("jdbc:mysql://localhost:3306/s.s.s?useSSL=false", "root","skdbsgh4520");
						System.out.println("Connect success");
					} catch (SQLException e) {
						System.out.println("Connect fail");
					}
				return con;
	}

	private void closeConnection(ResultSet set, PreparedStatement pstmt, Connection con) {
		if(set!=null){
			   try {
				   set.close();
			   } catch (Exception e2) {
				   	e2.printStackTrace();
			   }
		   }
		   if(pstmt!=null){
			   try {
				   pstmt.close();
			   } catch (Exception e2) {
				   	e2.printStackTrace();
			   }
		   }
		   if(con!=null){
			   try {
				   	con.close();
			   } catch (Exception e2) {
				   	e2.printStackTrace();
			   }
		   }
		
	}

	

}
