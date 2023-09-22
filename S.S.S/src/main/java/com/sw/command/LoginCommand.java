package com.sw.command;

import java.util.ArrayList;

import org.apache.coyote.Request;

import com.sw.Dao.MemberDaoImpl;

import MemberDto.ChatDto;
import MemberDto.MemberDto;
import MemberDto.StuffregDto;

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

	public String email(String dnicname) {
		MemberDaoImpl mdao = new MemberDaoImpl();
		String dbname=mdao.email(dnicname);
		return dbname;
	}

	public ArrayList<MemberDto> membershow() {
		MemberDaoImpl mdao = new MemberDaoImpl();
		ArrayList<MemberDto> stfdto = mdao.membershow();

		return stfdto;
	}

	public int memberdelete(String toemil) {
		MemberDaoImpl mdao = new MemberDaoImpl();
		int ret=mdao.memberdelete(toemil);
		return ret;
	}

	
}
