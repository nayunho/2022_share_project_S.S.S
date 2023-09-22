package com.sw.command;

import org.apache.coyote.Request;

import com.sw.Dao.MemberDaoImpl;

import MemberDto.MemberDto;

public class LoginCommand {

	public int execute(MemberDto mdto) {
		String email=mdto.getemail();
		String pw=mdto.getPw();
		
		MemberDaoImpl mdao = new MemberDaoImpl();
		String dbpw=mdao.logincheck(email);
		
		
		if(pw.equals(dbpw)) {
			return 1;
		}else {
			return 0;
		}
	}

	public String name(String email) {
		MemberDaoImpl mdao = new MemberDaoImpl();
		String dbname=mdao.name(email);
		return dbname;
	}

	public String id(String email) {
		MemberDaoImpl mdao = new MemberDaoImpl();
		String dbname=mdao.id(email);
		return dbname;
	}

	
}
