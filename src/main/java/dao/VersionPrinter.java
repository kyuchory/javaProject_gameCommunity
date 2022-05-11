package dao;

public class VersionPrinter {
	
	private int majorVersion;
	private int minorVersion;
	
	public void print() {
		System.out.printf("버젼", majorVersion, minorVersion);
	}

	public void setMajorVersion(int majorVersion) {
		this.majorVersion = majorVersion;
	}

	public void setMinorVersion(int minorVersion) {
		this.minorVersion = minorVersion;
	}

}
