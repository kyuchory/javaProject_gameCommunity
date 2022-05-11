package dao;

import dto.Member;

//암호 변경
public class ChangePasswordService {

	private MemberDao memberDao;
	// 의존

	public void ChangePassword(String email, String oldPwd, String newPwd) {
		Member member = memberDao.selectByEmail(email); // 매개변수 email과 같은 dao의 맵에서 member를 가져옴.
		if (member == null) {
			// 존재하지 않으면
			throw new MemberNotFoundException();

		}

		member.changePassword(oldPwd, newPwd);

		memberDao.update(member); // 업데이트
	}
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
}
