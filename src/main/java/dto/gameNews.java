package dto;

public class gameNews {
	private String title;
	private String summary;
	private String info;
	private String image;
	private String url;
	
	public gameNews(String title, String summary, String info, String image, String url) {
		super();
		this.title = title;
		this.summary = summary;
		this.info = info;
		this.image = image;
		this.url = url;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}

}
