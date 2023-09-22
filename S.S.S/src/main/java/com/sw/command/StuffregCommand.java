package com.sw.command;

import java.util.ArrayList;

import com.sw.Dao.MemberDaoImpl;
import com.sw.Dao.StuffregDao;
import com.sw.Dao.StuffregDaoImpl;

import MemberDto.SearchDto;
import MemberDto.StuffregDto;

public class StuffregCommand implements Stuffcmd{
	@Override
	public int stuffreg(StuffregDto sDto) {
		StuffregDaoImpl Sdao = new StuffregDaoImpl();
		
		return Sdao.insertStuff(sDto);
	}
	@Override
	public ArrayList<StuffregDto> stuffregShow() {
		StuffregDao Sdao = new StuffregDaoImpl();
		ArrayList<StuffregDto> stfdto = Sdao.stuffregShow();
		return stfdto;
	}
	@Override
	public StuffregDto viewContent(String context) {
		StuffregDao dao = new StuffregDaoImpl();
		StuffregDto dto = dao.viewContent(context);
		return dto;
	}
	@Override
	public ArrayList<StuffregDto> Similar_Stuff(String title) {
		StuffregDao dao = new StuffregDaoImpl();
		ArrayList<StuffregDto> dto = dao.Similar_Stuff(title);
		return dto;
	}
	@Override
	public ArrayList<StuffregDto> main2stuffregShow() {
		StuffregDao Sdao = new StuffregDaoImpl();
		ArrayList<StuffregDto> stfdto = Sdao.main2stuffregShow();
		return stfdto;
	}
	@Override
	public ArrayList<StuffregDto> search_stuff_check(String search_stuff) {
		StuffregDao Sdao = new StuffregDaoImpl();
		ArrayList<StuffregDto> stfdto = Sdao.search_stuff_check(search_stuff);
		return stfdto;
	}
	@Override
	public int insertSearch_list(SearchDto scDto) {
		StuffregDao Sdao = new StuffregDaoImpl();
		return Sdao.insertSearch_list(scDto);
	}
	@Override
	public ArrayList<SearchDto> Search_stuff_get() {
		StuffregDao Sdao = new StuffregDaoImpl();
		ArrayList<SearchDto> stfdto = Sdao.Search_stuff_get();
		return stfdto;
	}
	@Override
	public int viewContent_delete(String file) {
		StuffregDao dao = new StuffregDaoImpl();
		
		return dao.viewContent_delete(file);
	}
	@Override
	public int search_stuff_delete(String name) {
		StuffregDao dao = new StuffregDaoImpl();
		return dao.search_stuff_delete(name);
	}

}
