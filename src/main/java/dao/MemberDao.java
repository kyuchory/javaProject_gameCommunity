package dao;
import java.util.Collection;
//�쉶�썝�뜲�씠�꽣
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.Vector;

import dto.Member;


public class MemberDao {
	//member 정보를 관리하는 클래스
	
	private static long nextId = 0;
	
	private Map<String, Member> map = new HashMap<>();
	//map에 회원 정보 관리..
	
	//아래는 삽입, 검색, 업데이트
	//검색
	public Member selectByEmail(String email) {
		return map.get(email);
	}
	
	//삽입
	public void insert(Member member) {
		
		member.setId(++nextId);
		map.put(member.getEmail(), member);
		
	}
	
	public void update(Member member) {
		map.put(member.getEmail(), member);
	}

	public Collection<Member> selectAll() {
		Set<String> keys = map.keySet(); 
		Iterator<String> it = keys.iterator();
		Vector<Member> vec = new Vector<>();
		while(it.hasNext()) {
			Member member = map.get(it.next());
			vec.add(member);
		}
		return vec;
	}
}
