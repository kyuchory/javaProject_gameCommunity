package dto;

import java.time.LocalDateTime;

public class Community {
	
	private Long num;
	private String email;
	private String subject;
	private String content;
	private Long readCount;
	private LocalDateTime registerDateTime;
	
	public Community() {
		
	}
	
	public Community(String email, String subject, String content, LocalDateTime registerDateTime) {
		this.email = email;
		this.subject =subject;
		this.content = content;
		this.registerDateTime = registerDateTime;
	}
	
	public Long getReadCount() {
		return readCount;
	}

	public void setReadCount(Long readCount) {
		this.readCount = readCount;
	}

	public Long getNum() {
		return num;
	}
	public void setNum(Long num) {
		this.num = num;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public LocalDateTime getRegisterDateTime() {
		return registerDateTime;
	}
	public void setRegisterDateTime(LocalDateTime registerDateTime) {
		this.registerDateTime = registerDateTime;
	}

	@Override
	public String toString() {
		return "Community [num=" + num + ", email=" + email + ", subject=" + subject + ", content=" + content
				+ ", readCount=" + readCount + ", registerDateTime=" + registerDateTime + "]";
	}
	
	
	
}
