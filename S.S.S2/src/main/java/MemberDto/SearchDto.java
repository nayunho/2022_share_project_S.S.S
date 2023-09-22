package MemberDto;

public class SearchDto {
	String search_stuff=null;
	public SearchDto() {
	}
	public SearchDto(String dbsearch_stuff) {
		this.search_stuff=dbsearch_stuff;
	}

	public String getSearch_stuff() {
		return search_stuff;
	}

	public void setSearch_stuff(String search_stuff) {
		this.search_stuff = search_stuff;
	}
	
}
