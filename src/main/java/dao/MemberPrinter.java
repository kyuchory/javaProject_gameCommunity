package dao;

import dto.Member;

public class MemberPrinter {

	
	public void print(Member member) {
		System.out.printf("�쉶�썝 �젙蹂�: �븘�씠�뵒=%d, �씠硫붿씪=%s, �씠由�=%s, �벑濡앹씪=%tF\n", member.getId(), member.getEmail(), member.getName(), member.getRegisterDateTime());
	}
}
