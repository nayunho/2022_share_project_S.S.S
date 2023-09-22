package MemberDto;

public class MemberDto {
	public String email;
	public String pw;
	public String nicname;
	public String number;
	public MemberDto() {
		
	}
	public MemberDto(String nameDb, String pwDb, String emailDb, String numberDb) {
		this.nicname=nameDb;
		this.pw=pwDb;
		this.email=emailDb;
		this.number=numberDb;

	}
	public String getnumber() {
		return number;
	}
	public void setnumber(String number) {
		this.number = number;
	}
	public String getemail() {
		return email;
	}
	public void setemail(String email) {
		this.email = email;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getNicname() {
		return nicname;
	}
	public void setNicname(String nicname) {
		this.nicname = nicname;
	}
}
