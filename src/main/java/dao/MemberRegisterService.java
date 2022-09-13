package dao;

import java.time.LocalDateTime;

import dto.Member;
//회원가입
public class MemberRegisterService {
	private MemberDao memberDao;
	

	public MemberRegisterService(MemberDao memberDao) {
		
		this.memberDao = memberDao;
	}

//	public Long regist(RegisterRequest req) {
//		
//		Member member = memberDao.selectByEmail(req.getEmail());
//		//요구된 회원가입 정보를 기반으로 검색
//		
//		if (member != null) {
//			//회원 정보가 이미 있으면
//			throw new DuplicateMemberException("dup email" + req.getEmail());
//			
//		}
//		//등록
//		Member newMember = new Member(req.getEmail(), req.getPassword(), req.getName(), LocalDateTime.now());
//		memberDao.insert(newMember);
//		return newMember.getId(); 
//	}
}
