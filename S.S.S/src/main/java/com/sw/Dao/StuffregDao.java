package com.sw.Dao;

import java.util.ArrayList;

import com.sw.command.StuffregCommand;

import MemberDto.SearchDto;
import MemberDto.StuffregDto;

public interface StuffregDao {
	public int insertStuff(StuffregDto sDto);
	public ArrayList<StuffregDto> stuffregShow();
	public StuffregDto viewContent(String context);
	public ArrayList<StuffregDto> Similar_Stuff(String title);
	public ArrayList<StuffregDto> main2stuffregShow();
	public ArrayList<StuffregDto> search_stuff_check(String search_stuff);
	public int insertSearch_list(SearchDto scDto);
	public ArrayList<SearchDto> Search_stuff_get();
	public int viewContent_delete(String file);
	public int search_stuff_delete(String toemil);
}
