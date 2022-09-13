package dto;

public class Game {
	private int rank;
	private String name;
	private String company;
	private String genre;
	private String payment;
	private String img;
	private String e;
	private String n;
	private String t;
	private String j;
	
	public Game(int rank, String name, String company, String genre, String payment, String img) {
		super();
		this.rank = rank;
		this.name = name;
		this.company = company;
		this.genre = genre;
		this.payment = payment;
		this.img = img;
	}

	public Game(int rank, String name, String company, String genre, String payment, String img, String e, String n,
			String t, String j) {
		super();
		this.rank = rank;
		this.name = name;
		this.company = company;
		this.genre = genre;
		this.payment = payment;
		this.img = img;
		this.e = e;
		this.n = n;
		this.t = t;
		this.j = j;
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

	public String getE() {
		return e;
	}

	public void setE(String e) {
		this.e = e;
	}

	public String getN() {
		return n;
	}

	public void setN(String n) {
		this.n = n;
	}

	public String getT() {
		return t;
	}

	public void setT(String t) {
		this.t = t;
	}

	public String getJ() {
		return j;
	}

	public void setJ(String j) {
		this.j = j;
	}

	@Override
	public String toString() {
		return "Game [rank=" + rank + ", name=" + name + ", company=" + company + ", genre=" + genre + ", payment="
				+ payment + ", img=" + img + ", e=" + e + ", n=" + n + ", t=" + t + ", j=" + j + "]";
	}
	
}
