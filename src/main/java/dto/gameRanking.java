package dto;

public class gameRanking {
	private int rank;
	private String name;
	private String company;
	private String genre;
	private String payment;
	private String img;
	
	public gameRanking(int rank, String name, String company, String genre, String payment, String img) {
		super();
		this.rank = rank;
		this.name = name;
		this.company = company;
		this.genre = genre;
		this.payment = payment;
		this.img = img;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
	
	
}
