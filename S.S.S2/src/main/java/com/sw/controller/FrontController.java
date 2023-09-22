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
		String ID=null;
		String NAME=null;
		String NUM=null;
		String YEAR=null;
		String PW=null;
		String EMAIL=null;
		if(com.equals("/insert.do")) {
			ID=request.getParameter("id");
			NAME=request.getParameter("name");
			NUM=request.getParameter("num");
			YEAR=request.getParameter("year");
			PW=request.getParameter("password");
			EMAIL=request.getParameter("email");
			mdto.setID(ID);
			mdto.setNAME(NAME);
			mdto.setNUM(NUM);
			mdto.setYEAR(YEAR);
			mdto.setPW(PW);
			mdto.setEMAIL(EMAIL);
			InsertCommand command=new InsertCommand();
			int result=command.execute(mdto);
			
			if(result==1)
			{
			session.setAttribute("insertResult", "join success");
			result_page="studentinfo.jsp";
			}
			else {
			session.setAttribute("insertResult", "join fail");
			result_page="join_result_failed.jsp";
			}
			response.sendRedirect(result_page);
		}
		
	}
}
