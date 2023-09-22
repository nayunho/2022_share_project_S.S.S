package com.sw.Dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.cj.protocol.x.SyncFlushDeflaterOutputStream;

import MemberDto.ChatDto;
import MemberDto.MemberDto;
import MemberDto.StuffregDto;

public class MemberDaoImpl {

	public int insertMember(MemberDto mdto) {
		Connection con = getConnection();
		ResultSet set=null;
		ResultSet set1=null;
		ResultSet set2=null;
		PreparedStatement pstmt=null;
		PreparedStatement pstmt1=null;
		PreparedStatement pstmt2=null;
		int ret=0;
		
		String sql="insert into login (name,pw,email,number) values (?, ?, ?,?)";
		try {
			pstmt=con.prepareStatement(sql);
			String email=mdto.getemail();
			String pw=mdto.getPw();
			String nicname=mdto.getNicname();
			String number=mdto.getnumber();
			pstmt.setString(1,nicname);
			pstmt.setString(2,pw);
			pstmt.setString(3,email);
			pstmt.setString(4,number);
			
			String sql1="select name from login";
			pstmt1=con.prepareStatement(sql1);
			set1=pstmt1.executeQuery();
			while(set1.next()) {
				if(nicname.equals(set1.getString("name"))) {
					int result = 10 / 0;
				}
			}
			
			String sql2="select email from login";
			pstmt2=con.prepareStatement(sql2);
			set2=pstmt2.executeQuery();
			while(set2.next()) {
				if(email.equals(set2.getString("email"))) {
					int result = 10 / 0;
				}
			}
			ret=pstmt.executeUpdate();
			System.out.println("insert ok");
		}catch (SQLException e){
			ret=-1;
			System.out.println("access error.");
			System.out.println(e.getMessage());
			e.printStackTrace();
		}catch (ArithmeticException e) {
		    ret=-1;
		    System.out.println("access error.");
		}
		finally {
			closeConnection(set,pstmt,con);
			closeConnection(set1,pstmt1,con);
			closeConnection(set2,pstmt2,con);
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
			while(rs.next()) {
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

	public String email(String dnicname) {
		Connection con = getConnection();
		ResultSet set=null;
		PreparedStatement pstmt=null;
		String idDb=null;
		ResultSet rs=null;
		int ret=0;
		String sql="select email from login where name = ?";

		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,dnicname);
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
	public ArrayList<MemberDto> membershow() {
		Connection con = getConnection();
		ResultSet set=null;
		PreparedStatement pstmt=null;
		String nameDb=null;
		String pwDb=null;
		String emailDb=null;
		String numberDb=null;
		ResultSet rs=null;
		int ret=0;
		ArrayList<MemberDto> memberdtos = new ArrayList<MemberDto>();

		String sql="select * from login ";

		try {
			pstmt=con.prepareStatement(sql);
			rs= pstmt.executeQuery();
			while (rs.next()) {
				   nameDb=rs.getString("name");
				   pwDb=rs.getString("pw");
				   emailDb=rs.getString("email");
				   numberDb=rs.getString("number");
				   MemberDto dto = new MemberDto(nameDb,pwDb ,emailDb,numberDb);
				   memberdtos.add(dto);   
			}
		}catch(SQLException e){
			System.out.println("SQLException error.");
			e.printStackTrace();
		}finally{
			closeConnection(rs,pstmt,con); 
		}
		return memberdtos;
	}
	public int memberdelete(String toemil) {
		Connection con = getConnection();
		ResultSet set=null;
		PreparedStatement pstmt=null;
		int ret=0;
		
		String sql="DELETE FROM login WHERE email=?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,toemil);
			ret=pstmt.executeUpdate();
			System.out.println("delete  ok");
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
