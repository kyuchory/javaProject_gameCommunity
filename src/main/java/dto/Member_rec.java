package dto;

public class Member_rec {
	private String email;
	private String genre;
	private String graphic;
	private String pay;
	private int age;
	
	
	public Member_rec() {}
	public Member_rec(String email, String genre, String graphic, String pay, int age) {
		super();
		this.email = email;
		this.genre = genre;
		this.graphic = graphic;
		this.pay = pay;
		this.age = age;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getGraphic() {
		return graphic;
	}

	public void setGraphic(String graphic) {
		this.graphic = graphic;
	}

	public String getPay() {
		return pay;
	}

	public void setPay(String pay) {
		this.pay = pay;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	@Override
	public String toString() {
		return "Member_rec [email=" + email + ", genre=" + genre + ", graphic=" + graphic + ", pay=" + pay + ", age="
				+ age + "]";
	}
	
	
	
}
