package com.sw.command;

import java.util.ArrayList;

import MemberDto.SearchDto;
import MemberDto.StuffregDto;

public interface Stuffcmd {
	ArrayList<StuffregDto> stuffregShow();
	ArrayList<StuffregDto> main2stuffregShow();
	public int stuffreg(StuffregDto sDto);
	public StuffregDto viewContent(String context);
	ArrayList<StuffregDto> Similar_Stuff(String title);
	ArrayList<StuffregDto> search_stuff_check(String search_stuff);
	int insertSearch_list(SearchDto scDto);
	ArrayList<SearchDto> Search_stuff_get();
	int viewContent_delete(String file);
}
