package MemberDto;

public class StuffregDto {

	String nicname=null;
	String position=null;
	String title=null;
	String context=null;
	String file=null;
	String img=null;
	String toID=null;
	
	public StuffregDto() {
	}
	public StuffregDto(String dbNicname, String dbFile, String dbPosition, String dbTitle, String dbContent) {
		this.nicname=dbNicname;
		this.file=dbFile;
		this.position=dbPosition;
		this.title=dbTitle;
		this.context=dbContent;
	}
	public StuffregDto(String dbNicname, String dbFile, String dbPosition, String dbTitle, String dbContent,String dbId) {
		this.nicname=dbNicname;
		this.file=dbFile;
		this.position=dbPosition;
		this.title=dbTitle;
		this.context=dbContent;
		this.toID=dbId;
	}
	public String getNicname() {
		return nicname;
	}
	public void setNicname(String nicname) {
		this.nicname = nicname;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public String getImg() {
		return img;
	}
	public String getToID() {
		return toID;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public void setToID(String dbId) {
		this.toID = dbId;
	}
}
