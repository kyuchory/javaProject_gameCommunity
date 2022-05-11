package assembler;

import dao.ChangePasswordService;
import dao.MemberDao;
import dao.MemberRegisterService;

public class Assembler {
	//의존 주입을 위한 클래스
	
	private MemberDao memberDao;
	private MemberRegisterService regSvc;
	private ChangePasswordService pwdSvc;

	public Assembler() {
		//기본생성자로 의존 주입
		memberDao = new MemberDao();
		regSvc = new MemberRegisterService(memberDao); 
		pwdSvc = new ChangePasswordService();
		pwdSvc.setMemberDao(memberDao); 
	}

	//getter
	public MemberDao getMemberDao() {
		return memberDao;
	}

	public MemberRegisterService getMemberRegisterService() {
		return regSvc;
	}

	public ChangePasswordService getChangePasswordService() {
		return pwdSvc;
	}

}
