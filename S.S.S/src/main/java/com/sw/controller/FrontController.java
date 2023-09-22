package com.sw.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.swing.text.Document;

import com.sw.Dao.chatDao;
import com.sw.Dao.chatDaoImpl;
import com.sw.command.InsertCommand;
import com.sw.command.LoginCommand;
import com.sw.command.Stuffcmd;
import com.sw.command.StuffregCommand;

import MemberDto.ChatDto;
import MemberDto.MemberDto;
import MemberDto.SearchDto;
import MemberDto.StuffregDto;
@MultipartConfig(
	fileSizeThreshold=1024*1024,
	maxFileSize=1024*1024*50,
	maxRequestSize=1024*1024*50*5
	)
/**
 * Servlet implementation class FrontController
 */
@WebServlet({"/FrontController","*.do"})
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		actionDo(request, response);
	}

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		actionDo(request, response);
	}
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uri = request.getRequestURI();
		String conPath=request.getContextPath();
		String com=uri.substring(conPath.length());
		System.out.println("uri - "+uri);
		System.out.println("conPath - "+conPath);
		System.out.println("com - "+com);
		
		HttpSession session = request.getSession();
		MemberDto mdto = new MemberDto();
		StuffregDto SDto = new StuffregDto();
		Stuffcmd stufCmd = new StuffregCommand();
		chatDao cdao = new chatDaoImpl();
		SearchDto ScDto = new SearchDto();
		String result_page=null;
		String email=null;
		String pw=null;
		String nicname=null;
		String number=null;
		String position=null;
		String title=null;
		String context=null;
		String file=null;
		if(com.equals("/join.do")) {
			email=request.getParameter("id");
			pw=request.getParameter("pw");
			nicname=request.getParameter("nicname");
			number=request.getParameter("number");
			mdto.setemail(email);
			mdto.setPw(pw);
			mdto.setNicname(nicname);
			mdto.setnumber(number);
			InsertCommand command=new InsertCommand();
			int result=command.execute(mdto);
			
			if(result==1)
			{
			session.setAttribute("insertResult", "join success");
			result_page="join_result.jsp";
			}
			else {
			session.setAttribute("insertResult", "join fail");
			result_page="join_result_failed.jsp";
			}
			response.sendRedirect(result_page);
		}else if(com.equals("/login.do")) {
			email=request.getParameter("email");
			pw=request.getParameter("pw");
			
			mdto.setemail(email);
			mdto.setPw(pw);
			
			LoginCommand command=new LoginCommand();
			
			ArrayList<StuffregDto> stufList=stufCmd.main2stuffregShow();
			session.setAttribute("stufboard1",stufList);
			ArrayList<SearchDto> search_get=stufCmd.Search_stuff_get();
			session.setAttribute("search_stuff", search_get);
			int result=command.execute(mdto);
			
			
			
			if(email.equals("관리자")&&pw.equals("4862")) {
				session.setAttribute("nicname", email);
				result_page="main2_manager.jsp";
			}else if(result==1) {
				String name=command.name(email);
				String ID=command.id(email);
				session.setAttribute("nicname", name);
				session.setAttribute("userID", ID);
				result_page="main2.jsp";
			}else {
				result_page="login_ressult.jsp";
			}
			response.sendRedirect(result_page);
		}else if(com.equals("/reg.do")) {
			
			Part filePart=request.getPart("file");
			String fileName=filePart.getSubmittedFileName();
			InputStream fis=filePart.getInputStream();
			
			String realPath=request.getServletContext().getRealPath("/upload");
			
			
			String filePath = "C:"+File.separator+"Users"+File.separator+"NYH"+File.separator+"eclipse-workspace"+File.separator+"S.S.S"+File.separator+"WebContent"+File.separator+"upload"+File.separator+fileName;
			FileOutputStream fos = new FileOutputStream(filePath);
			byte[] buf= new byte[1024];
			int size=0;
			while((size=fis.read(buf))!=-1) {
				fos.write(buf,0,size);
			}
			fos.close();
			fis.close();
			nicname=request.getParameter("nicname");
			URLEncoder.encode(nicname, "utf-8");
			position=request.getParameter("position");
			title=request.getParameter("title");
			context=request.getParameter("context");
			SDto.setNicname(nicname);
			SDto.setPosition(position);
			SDto.setTitle(title);
			SDto.setContext(context);
			SDto.setFile(fileName);
			StuffregCommand Stuffcommand=new StuffregCommand();
			int result=Stuffcommand.stuffreg(SDto);
			if(result==1)
			{
			session.setAttribute("insertResult", "join success");
			result_page="stuff_reg_complet.jsp";
			}
			else {
				
			result_page="reg_filed.jsp";
			}
			response.sendRedirect(result_page);
		}else if(com.equals("/reg_show.do")) {
			ArrayList<StuffregDto> stufList=stufCmd.stuffregShow();

			session.setAttribute("stufboard",stufList);
			result_page="stuff_reg_main.jsp";
			response.sendRedirect(result_page);
		}else if(com.equals("/reg_show_manager.do")) {
			ArrayList<StuffregDto> stufList=stufCmd.stuffregShow();

			session.setAttribute("stufboard",stufList);
			result_page="stuff_reg_main_manager.jsp";
			response.sendRedirect(result_page);
		}else if(com.equals("/stuff_reg_details.do")) {
			context=request.getParameter("bcontext");
			Stuffcmd Stuffcommand=new StuffregCommand();
			StuffregDto bdto=Stuffcommand.viewContent(context);
			LoginCommand command=new LoginCommand();
			String email1 = command.email(bdto.getNicname());
			session.setAttribute("email_hero", email1);
			session.setAttribute("content_view", bdto);
			ArrayList<StuffregDto> bdto1=Stuffcommand.Similar_Stuff(bdto.getTitle());
			session.setAttribute("Similar_view", bdto1);
			result_page="stuff_reg_details.jsp";
			response.sendRedirect(result_page);
		}else if(com.equals("/stuff_reg_details_manager.do")) {
			context=request.getParameter("bcontext");
			Stuffcmd Stuffcommand=new StuffregCommand();
			StuffregDto bdto=Stuffcommand.viewContent(context);
			LoginCommand command=new LoginCommand();
			String email1 = command.email(bdto.getNicname());
			session.setAttribute("email_hero", email1);
			session.setAttribute("content_view", bdto);
			ArrayList<StuffregDto> bdto1=Stuffcommand.Similar_Stuff(bdto.getTitle());
			session.setAttribute("Similar_view", bdto1);
			result_page="stuff_reg_details_manager.jsp";
			response.sendRedirect(result_page);
		}else if(com.equals("/stuff_details_delete_manager.do")) {
			file=(String)request.getParameter("dbfile");
			Stuffcmd Stuffcommand=new StuffregCommand();
			int result=Stuffcommand.viewContent_delete(file);
			
			if(result==1)
			{
			session.setAttribute("insertResult", "join success");
			result_page="stuff_reg_manager_delete_complet.jsp";
			}
			else {
				
			result_page="stuff_reg_manager_delete_failed.jsp";
			}
			
			response.sendRedirect(result_page);
		}
		else if(com.equals("/chatting.do")) {
			String heronicname=request.getParameter("heronicname");
			Stuffcmd Stuffcommand=new StuffregCommand();
			StuffregDto bdto=Stuffcommand.viewContent(context);
			System.out.println(bdto.getNicname());
			session.setAttribute("content_view", bdto);
			session.setAttribute("toID", bdto.getToID());
			ArrayList<StuffregDto> bdto1=Stuffcommand.Similar_Stuff(bdto.getTitle());
			session.setAttribute("Similar_view", bdto1);
			result_page="stuff_reg_details.jsp";
			response.sendRedirect(result_page);
		}else if(com.equals("/chatting_resend.do")) {
			String fromID =request.getParameter("fromID");
			String toID =request.getParameter("toID");
			String chatContent =request.getParameter("chatContent");
			if(fromID ==null|| fromID.equals("")||toID ==null|| toID.equals("")||chatContent ==null|| chatContent.equals("")) {
				response.getWriter().write("0");
			}else {
				fromID =URLDecoder.decode(fromID,"UTF-8");
				toID =URLDecoder.decode(toID,"UTF-8");
				chatContent =URLDecoder.decode(chatContent,"UTF-8");
				response.getWriter().write( cdao.submit(fromID,toID,chatContent)+" ");
			}
		}else if(com.equals("/chatting_List.do")) {
			String fromID =request.getParameter("fromID");
			String toID =request.getParameter("toID");
			String listType=request.getParameter("listType");
			
			if(fromID ==null|| fromID.equals("")||toID ==null|| toID.equals("")||listType ==null|| listType.equals("")) {
				response.getWriter().write("");
			}else if(listType.equals("0")){
				response.getWriter().write(getTen(URLDecoder.decode(fromID,"utf-8"),URLDecoder.decode(toID,"utf-8")));
			}else {
				try {
					response.getWriter().write(getID(URLDecoder.decode(fromID,"utf-8"),URLDecoder.decode(toID,"utf-8"),listType));
				}catch (Exception e) {
					response.getWriter().write("");
				}
			}
		}else if(com.equals("/search.do")) {
			String search_stuff =request.getParameter("search_stuff");
			Stuffcmd Stuffcommand=new StuffregCommand();
			ArrayList<StuffregDto> bdto1=Stuffcommand.search_stuff_check(search_stuff);
			ScDto.setSearch_stuff(search_stuff);
			int result=Stuffcommand.insertSearch_list(ScDto);
			if(bdto1.isEmpty()) {
				response.sendRedirect("Search_failed.jsp");
			}else {
				session.setAttribute("search_stuff", bdto1);
				result_page="Search_Complete.jsp";
				response.sendRedirect(result_page);
			}
			}else if(com.equals("/search_manager.do")) {
				String search_stuff =request.getParameter("search_stuff");
				Stuffcmd Stuffcommand=new StuffregCommand();
				ArrayList<StuffregDto> bdto1=Stuffcommand.search_stuff_check(search_stuff);
				ScDto.setSearch_stuff(search_stuff);
				int result=Stuffcommand.insertSearch_list(ScDto);
				if(bdto1.isEmpty()) {
					response.sendRedirect("Search_failed_manager.jsp");
				}else {
					session.setAttribute("search_stuff", bdto1);
					result_page="Search_Complete_manager.jsp";
					response.sendRedirect(result_page);
				}
				}else if(com.equals("/home.do")) {
				ArrayList<StuffregDto> stufList=stufCmd.main2stuffregShow();
				session.setAttribute("stufboard1",stufList);
				ArrayList<SearchDto> search_get=stufCmd.Search_stuff_get();
				session.setAttribute("search_stuff", search_get);
				result_page="main2.jsp";
				response.sendRedirect(result_page);
			}else if(com.equals("/home_manager.do")) {
				ArrayList<StuffregDto> stufList=stufCmd.main2stuffregShow();
				session.setAttribute("stufboard1",stufList);
				ArrayList<SearchDto> search_get=stufCmd.Search_stuff_get();
				session.setAttribute("search_stuff", search_get);
				result_page="main2_manager.jsp";
				response.sendRedirect(result_page);
			}else if(com.equals("/message_show.do")) {
				String dnicname=request.getParameter("dbnicname");
				LoginCommand cmd=new LoginCommand();
				String mesage_email=cmd.email(dnicname);
				chatDao mdao = new chatDaoImpl();
				ArrayList<ChatDto> message_box_List=mdao.get_from_message_box(mesage_email);
				session.setAttribute("message_hero",message_box_List);
				result_page="Message_box.jsp";
				response.sendRedirect(result_page);
			}else if(com.equals("/message_show_manager.do")) {
				String Email=request.getParameter("dbnicname");
				chatDao mdao = new chatDaoImpl();
				ArrayList<ChatDto> message_box_List=mdao.get_from_message_box(Email);
				session.setAttribute("message_hero",message_box_List);
				result_page="Message_box_manager.jsp";
				response.sendRedirect(result_page);
			}else if(com.equals("/member_management_manager.do")) {
				LoginCommand cmd=new LoginCommand();
				ArrayList<MemberDto> memberList=cmd.membershow();
				session.setAttribute("memberList",memberList);
				result_page="member_management_manager.jsp";
				response.sendRedirect(result_page);
			}else if(com.equals("/Member_delete.do")) {
				String toemil=(String)request.getParameter("toemil");
				LoginCommand cmd=new LoginCommand();
				String name = cmd.name(toemil);
				Stuffcmd Stuffcommand=new StuffregCommand();
				int ret2 = Stuffcommand.search_stuff_delete(name);
				
				int ret1=cmd.memberdelete(toemil);

				
				result_page="member_delete_result_manager.jsp";
				response.sendRedirect(result_page);
			}
	}
		public String getTen(String fromID, String toID) {
			StringBuffer result=new StringBuffer("");
			result.append("{\"result\":[");
			chatDao cdao = new chatDaoImpl();
			ArrayList<ChatDto> chatList=cdao.getChatListByRecent(fromID,toID,15);
			if(chatList.size()==0) {;return"";}
			for(int i=0;i<chatList.size();i++) {
				result.append("[{\"value\":\"" +chatList.get(i).getFromID()+"\"},");
				result.append("{\"value\":\"" +chatList.get(i).getToID()+"\"},");
				result.append("{\"value\":\"" +chatList.get(i).getChatContent()+"\"},");
				result.append("{\"value\":\"" +chatList.get(i).getChatTime()+"\"}]");
				if(i!=chatList.size() -1) {
					result.append(",");
				}
			}
			result.append("],\"last\":\""+chatList.get(chatList.size() -1).getChatID()+"\"}");
			System.out.println(result.toString());
			return result.toString();
		}
		public String getID(String fromID, String toID,String chatID) {
			StringBuffer result=new StringBuffer("");
			result.append("{\"result\":[");
			chatDao cdao = new chatDaoImpl();
			ArrayList<ChatDto> chatList=cdao.getChatListByID(fromID,toID,chatID);
			if(chatList.size()==0) {;return"";}
			for(int i=0;i<chatList.size();i++) {
				result.append("[{\"value\":\"" +chatList.get(i).getFromID()+"\"},");
				result.append("{\"value\":\"" +chatList.get(i).getToID()+"\"},");
				result.append("{\"value\":\"" +chatList.get(i).getChatContent()+"\"},");
				result.append("{\"value\":\"" +chatList.get(i).getChatTime()+"\"}]");
				if(i!=chatList.size() -1) {
					result.append(",");
				}
			}
			result.append("],\"last\":\""+chatList.get(chatList.size() -1).getChatID()+"\"}");
			return result.toString();
		}
	}
