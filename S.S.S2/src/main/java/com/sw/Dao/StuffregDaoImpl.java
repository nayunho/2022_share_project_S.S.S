package com.sw.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.sw.command.StuffregCommand;

import MemberDto.SearchDto;
import MemberDto.StuffregDto;

public class StuffregDaoImpl implements StuffregDao{
	@Override
	public int insertStuff(StuffregDto sDto) {
		Connection con = getConnection();
		ResultSet set=null;
		PreparedStatement pstmt=null;
		int ret=0;
		
		String sql="insert into stuff1 (nicname,file,position,title,context,stuffID) values (?,?,?,?,?,null)";
		try {
			pstmt=con.prepareStatement(sql);
			String nicname=sDto.getNicname();
			String file=sDto.getFile();
			String position=sDto.getPosition();
			String title=sDto.getTitle();
			String context=sDto.getContext();
			pstmt.setString(1,nicname);
			pstmt.setString(2,file);
			pstmt.setString(3,position);
			pstmt.setString(4,title);
			pstmt.setString(5,context);
			ret=pstmt.executeUpdate();
			System.out.println("insert stuff ok");
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

	@Override
	public ArrayList<StuffregDto> stuffregShow() {
		Connection con = getConnection();
		ResultSet set=null;
		PreparedStatement pstmt=null;
		ArrayList<StuffregDto> stufdtos = new ArrayList<StuffregDto>();
		String sql="SELECT * FROM stuff1 order by stuffID  ";
		try {
			pstmt=con.prepareStatement(sql);
			set=pstmt.executeQuery();
			
			while(set.next()) {
				String dbNicname = set.getString("nicname");
				String dbFile = set.getString("file");
				String dbPosition = set.getString("position");
				String dbTitle = set.getString("title");
				String dbContent = set.getString("context");
				
				StuffregDto stufdto = new StuffregDto(dbNicname, dbFile, dbPosition, dbTitle, dbContent);
				stufdtos.add(stufdto);
			}
		}catch (SQLException e){
			e.printStackTrace();
		}finally {
			closeConnection(set,pstmt,con);
		}
		return stufdtos;
		
	}
	

	@Override
	public ArrayList<StuffregDto> main2stuffregShow() {
		Connection con = getConnection();
		ResultSet set=null;
		PreparedStatement pstmt=null;
		ArrayList<StuffregDto> stufdtos = new ArrayList<StuffregDto>();
		String sql="SELECT * FROM stuff1 order by stuffID  desc LIMIT 4";
		try {
			pstmt=con.prepareStatement(sql);
			set=pstmt.executeQuery();
			
			while(set.next()) {
				String dbNicname = set.getString("nicname");
				String dbFile = set.getString("file");
				String dbPosition = set.getString("position");
				String dbTitle = set.getString("title");
				String dbContent = set.getString("context");
				
				StuffregDto stufdto = new StuffregDto(dbNicname, dbFile, dbPosition, dbTitle, dbContent);
				stufdtos.add(stufdto);
			}
		}catch (SQLException e){
			e.printStackTrace();
		}finally {
			closeConnection(set,pstmt,con);
		}
		return stufdtos;
		
	}


	@Override
	public StuffregDto viewContent(String context) {
	
		
		StuffregDto dto = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = getConnection();
			
			String query = "select * from stuff1 where context = ?";
			System.out.println(query);
			pstmt = con.prepareStatement(query);
			String idDb=null;;
			pstmt.setString(1,context);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String dbName = rs.getString("nicname");
				String dbFile = rs.getString("file");
				String dbPosition=rs.getString("position");
				String dbTitle = rs.getString("title");
				String dbContent = rs.getString("context");
				
				String sql="select email from login where name = ?";

				try {
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1,dbName);
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
				dto = new StuffregDto(dbName,dbFile ,dbPosition,dbTitle, dbContent,idDb);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			closeConnection(rs, pstmt, con);
		}
		return dto;
	}

	@Override
	public ArrayList<StuffregDto> Similar_Stuff(String title) {
		StuffregDto dto = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<StuffregDto> stufdtos = new ArrayList<StuffregDto>();

		try {
			
			con = getConnection();
			String query = "select * from stuff1";
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				if(rs.getString("title").contains(title)){
				String dbName = rs.getString("nicname");
				String dbFile = rs.getString("file");
				String dbPosition=rs.getString("position");
				String dbTitle = rs.getString("title");
				String dbContent = rs.getString("context");
				int dbStuffID = rs.getInt("stuffID");
				dto = new StuffregDto(dbName,dbFile ,dbPosition,dbTitle, dbContent);
				stufdtos.add(dto);
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			closeConnection(rs, pstmt, con);
		}
		return stufdtos;
	}
	

	@Override
	public ArrayList<StuffregDto> search_stuff_check(String search_stuff) {
		StuffregDto dto = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<StuffregDto> stufdtos = new ArrayList<StuffregDto>();
		
		try {
			con = getConnection();
			
			String query = "select * from stuff1";
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				if(rs.getString("title").contains(search_stuff)) {
				String dbName = rs.getString("nicname");
				String dbFile = rs.getString("file");
				String dbPosition=rs.getString("position");
				String dbTitle = rs.getString("title");
				String dbContent = rs.getString("context");
				
				dto = new StuffregDto(dbName,dbFile ,dbPosition,dbTitle, dbContent);
				stufdtos.add(dto);
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			closeConnection(rs, pstmt, con);
		}
		return stufdtos;
	}

	@Override
	public int insertSearch_list(SearchDto scDto) {
		Connection con = getConnection();
		ResultSet set=null;
		PreparedStatement pstmt=null;
		int ret=0;
		
		String sql="insert into search_stuff (stuffID,search_stuff) values (null,?)";
		try {
			pstmt=con.prepareStatement(sql);
			String search_stuff=scDto.getSearch_stuff();;
			pstmt.setString(1,search_stuff);
			ret=pstmt.executeUpdate();
			System.out.println("insert stuff ok");
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


	@Override
	public int viewContent_delete(String file) {
		Connection con = getConnection();
		ResultSet set=null;
		PreparedStatement pstmt=null;
		int ret=0;
		
		String sql="DELETE FROM stuff1 WHERE file=?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,file);
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
	@Override
	public ArrayList<SearchDto> Search_stuff_get() {
		SearchDto dto = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<SearchDto> stufdtos = new ArrayList<SearchDto>();
		
		try {
			con = getConnection();
			
			String query = "select * from search_stuff order by stuffID desc LIMIT 7";
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String dbsearch_stuff = rs.getString("search_stuff");
				
				dto = new SearchDto(dbsearch_stuff);
				stufdtos.add(dto);
				}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			closeConnection(rs, pstmt, con);
		}
		return stufdtos;
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
