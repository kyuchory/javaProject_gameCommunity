package dto;

import java.time.LocalDateTime;

public class CheckTime {
	private String email;
	private LocalDateTime time;
	
	public CheckTime() {
		
	}
	
	public CheckTime(String email, LocalDateTime time) {
		this.email = email;
		this.time = time;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public LocalDateTime getTime() {
		return time;
	}
	public void setTime(LocalDateTime time) {
		this.time = time;
	}
}
