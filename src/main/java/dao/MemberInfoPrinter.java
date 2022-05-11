package dao;

import dto.Member;


public class MemberInfoPrinter {

	private MemberDao memDao;
	private MemberPrinter printer;
	
	public void printMemberInfo(String eamil) {
		Member member = memDao.selectByEmail(eamil);
		if(member == null) {
			System.out.println("�벑濡앸맂 �뜲�씠�꽣 �뾾�쓬\n");
			return;
		}
		printer.print(member);
		System.out.println();
	}
	
	public void setMemberDao(MemberDao memberDao) {
		this.memDao = memberDao;
	}
	
	public void setPrinter(MemberPrinter printer) {
		this.printer = printer;
	}
}
