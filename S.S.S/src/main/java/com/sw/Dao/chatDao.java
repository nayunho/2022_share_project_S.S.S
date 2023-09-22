package com.sw.Dao;

import java.util.ArrayList;

import MemberDto.ChatDto;

public interface chatDao {
	public ArrayList<ChatDto> getChatListByID(String fromID,String toID,String chatID);

	ArrayList<ChatDto> getChatListByRecent(String fromID, String toID, int number);

	int submit(String fromID, String toID, String chatContent);

	public ArrayList<ChatDto> get_from_message_box(String mesage_email);
}
