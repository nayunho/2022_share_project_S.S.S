package com.sw.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.cj.protocol.a.NativeConstants.IntegerDataType;

import MemberDto.ChatDto;
import MemberDto.StuffregDto;

public class chatDaoImpl implements chatDao{
	@Override
	public ArrayList<ChatDto> getChatListByID(String fromID,String toID,String chatID){
		ArrayList<ChatDto> chatList=new ArrayList<ChatDto>();
		Connection con = getConnection();
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		
		String sql="select *from chat where((fromID=? and toID=?) or (fromID=? and toID=?)) and chatID>? order by chatTime";
		
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,fromID);
			pstmt.setString(2,toID);
			pstmt.setString(3,toID);
			pstmt.setString(4,fromID);
			pstmt.setInt(5,Integer.parseInt(chatID));
			rs=pstmt.executeQuery();
			while(rs.next()) {
				int dbchatID = rs.getInt("chatID");
				String dbfromID = rs.getString("fromID").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");
				String dbtoID = rs.getString("toID").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");;
				String dbchatContent = rs.getString("chatContent").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");;
				int chatTime = Integer.parseInt(rs.getString("chatTime").substring(11,13));
				String timetype="오전";
				if(chatTime>=12) {
					timetype="오후";
					chatTime-=12;
				}
				String dbchatTime=rs.getString("chatTime").substring(0,11)+" "+timetype+" "+ chatTime + ":"+ rs.getString("chatTime").substring(14,16);
				ChatDto chatdto = new ChatDto(dbchatID, dbfromID, dbtoID, dbchatContent, dbchatTime);
				chatList.add(chatdto);
			}
			System.out.println("성공5");
		}catch (SQLException e){
			System.out.println("access error.");
			System.out.println(e.getMessage());
			e.printStackTrace();
		}finally {
			closeConnection(rs,pstmt,con);
		}
		return chatList;
		
	}
	@Override
	public ArrayList<ChatDto> getChatListByRecent(String fromID,String toID,int number){
		ArrayList<ChatDto> chatList1 = new ArrayList<ChatDto>();
		Connection con = getConnection();
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		
		String sql = "SELECT * FROM CHAT WHERE ((fromID = ? AND toID = ?) or (fromID = ? AND toID = ?)) AND chatID > (SELECT MAX(chatID) -? FROM CHAT) ORDER BY chatTime";		

		System.out.println("성공4");
		try {

			pstmt=con.prepareStatement(sql);

			pstmt.setString(1,fromID);
			pstmt.setString(2,toID);
			pstmt.setString(3,toID);
			pstmt.setString(4,fromID);
			pstmt.setInt(5,number);
			rs=pstmt.executeQuery();

			while(rs.next()) {
				int dbchatID = rs.getInt("chatID");
				String dbfromID = rs.getString("fromID").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");
				String dbtoID = rs.getString("toID").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");;
				String dbchatContent = rs.getString("chatContent").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");;
				int chatTime = Integer.parseInt(rs.getString("chatTime").substring(11,13));
				String timetype="오전";
				if(chatTime>=12) {
					timetype="오후";
					chatTime-=12;
				}
				String dbchatTime=rs.getString("chatTime").substring(0,11)+" "+timetype+" "+ chatTime + ":"+ rs.getString("chatTime").substring(14,16);
				ChatDto chatdto = new ChatDto(dbchatID, dbfromID, dbtoID, dbchatContent, dbchatTime);
				chatList1.add(chatdto);
			}
		}catch (SQLException e){
			System.out.println("access error.");
			System.out.println(e.getMessage());
			e.printStackTrace();
		}finally {
			closeConnection(rs,pstmt,con);
		}
		return chatList1;
	}
	@Override
	public int submit(String fromID,String toID,String chatContent){
		ArrayList<ChatDto> chatList=null;
		Connection con = getConnection();
		ResultSet rs=null;
		int result=0;
		PreparedStatement pstmt=null;
		
		String sql = "insert into CHAT values(null,?,?,?,now())";	
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,fromID);
			pstmt.setString(2,toID);
			pstmt.setString(3,chatContent);
			result=pstmt.executeUpdate();
		}catch (SQLException e){
			System.out.println("access error.");
			System.out.println(e.getMessage());
			e.printStackTrace();
		}finally {
			closeConnection(rs,pstmt,con);
		}
		return result;
		
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
