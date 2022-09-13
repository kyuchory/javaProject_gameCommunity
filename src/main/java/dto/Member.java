package dto;

import java.time.LocalDateTime;

import dao.WrongIdPasswordException;

public class Member {

	private Long id;
	private String email;
	private String password;
	private String name;
	private LocalDateTime registerDateTime;
	private int exp;
	
	public Member() {
		System.out.println("생성자 테스트");
	}

	public Member(String email, String password, String name, LocalDateTime registerDateTime, int exp ) {

		// this.id = id;
		this.email = email;
		this.password = password;
		this.name = name;
		this.registerDateTime = registerDateTime;
		this.exp = exp;
	}

	

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setExp(int exp) {
		this.exp = exp;
	}

	public int getExp() {
		return exp;
	}
	
	public void addExp() {
		this.exp++;
	}

	public String getEmail() {
		return email;
	}

	public String getPassword() {
		return password;
	}

	public String getName() {
		return name;
	}

	public LocalDateTime getRegisterDateTime() {
		return registerDateTime;
	}

	public void changePassword(String oldPassword, String newPassword) {
		if (!password.equals(oldPassword)) {
			throw new WrongIdPasswordException();
		}
		this.password = newPassword;
	}
	
	public int printLevel() {
		if(exp < 10) {
			return 1;
		}else if(10 <= exp && exp < 30) {
			return 2;
		}else if(30 <= exp && exp < 60) {
			return 3;
		}else if(60 <= exp && exp < 100) {
			return 4;
		}else if(100 <= exp && exp < 150) {
			return 5;
		}else if(150 <= exp && exp < 210) {
			return 6;
		}else if(210 <= exp && exp < 280) {
			return 7;
		}else if(280 <= exp && exp < 360) {
			return 8;
		}else if(360 <= exp && exp < 450) {
			return 9;
		}else if(450 <= exp && exp < 550) {
			return 10;
		}else {
			return 0;
		}
		
	}
	public int printLevel(int exp) {
		if(exp < 10) {
			return 1;
		}else if(10 <= exp && exp < 30) {
			return 2;
		}else if(30 <= exp && exp < 60) {
			return 3;
		}else if(60 <= exp && exp < 100) {
			return 4;
		}else if(100 <= exp && exp < 150) {
			return 5;
		}else if(150 <= exp && exp < 210) {
			return 6;
		}else if(210 <= exp && exp < 280) {
			return 7;
		}else if(280 <= exp && exp < 360) {
			return 8;
		}else if(360 <= exp && exp < 450) {
			return 9;
		}else if(450 <= exp && exp < 550) {
			return 10;
		}else {
			return 0;
		}
		
	}
	
	public String printLevelImage() {
		if(exp < 10) {
			return "1.png";
		}else if(10 <= exp && exp < 30) {
			return "2.png";
		}else if(30 <= exp && exp < 60) {
			return "3.png";
		}else if(60 <= exp && exp < 100) {
			return "4.png";
		}else if(100 <= exp && exp < 150) {
			return "5.png";
		}else if(150 <= exp && exp < 210) {
			return "6.png";
		}else if(210 <= exp && exp < 280) {
			return "7.png";
		}else if(280 <= exp && exp < 360) {
			return "8.png";
		}else if(360 <= exp && exp < 450) {
			return "9.png";
		}else if(450 <= exp && exp < 550) {
			return "10.png";
		}else {
			return null;
		}
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", email=" + email + ", password=" + password + ", name=" + name
				+ ", registerDateTime=" + registerDateTime + ", exp=" + exp + "]";
	}
	
}
