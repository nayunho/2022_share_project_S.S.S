package MemberDto;

public class ChatDto {

		int chatID;
		String fromID;
		String toID;
		String chatContent;
		String chatTime;
		public ChatDto(int dbchatID, String dbfromID, String dbtoID, String dbchatContent, String dbchatTime) {
			this.chatID=dbchatID;
			this.fromID=dbfromID;
			this.toID=dbtoID;
			this.chatContent=dbchatContent;
			this.chatTime=dbchatTime;
		}
		public int getChatID() {
			return chatID;
		}
		public void setChatID(int chatID) {
			this.chatID = chatID;
		}
		public String getFromID() {
			return fromID;
		}
		public void setFromID(String fromID) {
			this.fromID = fromID;
		}
		public String getToID() {
			return toID;
		}
		public void setToID(String toID) {
			this.toID = toID;
		}
		public String getChatContent() {
			return chatContent;
		}
		public void setChatContent(String chatContent) {
			this.chatContent = chatContent;
		}
		public String getChatTime() {
			return chatTime;
		}
		public void setChatTime(String chatTime) {
			this.chatTime = chatTime;
		}
}
