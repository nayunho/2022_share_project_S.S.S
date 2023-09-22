package com.sw.command;

import com.sw.Dao.MemberDaoImpl;

import MemberDto.MemberDto;

public class InsertCommand {

	public int execute(MemberDto mdto) {
		MemberDaoImpl mdao = new MemberDaoImpl();
		
		return mdao.insertMember(mdto);
	}

}
