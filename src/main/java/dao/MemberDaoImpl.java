package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import dto.Community;
import dto.Member;
import jdbc.ConnectionProvider;

public class MemberDaoImpl {
	private Connection conn = null;

	public MemberDaoImpl(Connection conn) {
		this.conn = conn;
	}

	
	public int insert(Member member) {
		PreparedStatement pstmt = null;
		System.out.println("인서트1");
		try {
			pstmt = conn.prepareStatement(
					"insert into MEMBER (EMAIL, PASSWORD, NAME, REGDATE) " +
					"values (?, ?, ?, ?)",
					new String[] { "ID" });
			// 인덱스 파라미터 값 설정
			pstmt.setString(1, member.getEmail());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getName());
			pstmt.setTimestamp(4,
					Timestamp.valueOf(member.getRegisterDateTime()));
			return pstmt.executeUpdate(); // 업데이트 실행
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return 0;
	}

	
	public int delete(String email) {
		PreparedStatement pstmt = null;
		try {
			String sql = "delete from member where EMAIL=?";
			// email 가 ? 인 것을 제거 하는 sql문
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return 0;
	}

	
	public int edit(Member member) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "update member set EMAIL=?, PASSWORD=?, NAME=?, where EMAIL =?";
			

			pstmt = conn.prepareStatement(sql);
			

			pstmt.setString(1, member.getEmail());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getName());
			pstmt.setTimestamp(4, Timestamp.valueOf(member.getRegisterDateTime()));
			

			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return 0;
	}

	
	public Member select(String email) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "select * from member where EMAIL=?";
			// sampleid가 ?인 것의 테이블을 전부 출력해주는 sql문
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery(); 
			if (rs.next()) {
				return createFromResultSet(rs);
			} else {
				return null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return null;
	}

	public String selectPasswordWhereEmail(String email) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select PASSWORD from member where EMAIL=?";
		try {
			
			// sampleid가 ?인 것의 테이블을 전부 출력해주는 sql문
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			String password = rs.getString("PASSWORD");
			return password;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return null;
	}
	
	public List<Member> selectList() throws SQLException {
		Statement stmt = null;

		stmt = conn.createStatement();

		String sql = "select * from member";

		ResultSet rs = stmt.executeQuery(sql);

		List<Member> list = new ArrayList<>();

		try {
			while (rs.next()) {
				// db의 다음행이 있으면 반복
				String email = rs.getString("EMAIL");
				String password = rs.getString("PASSWORD");
				String name = rs.getString("NAME");
				LocalDateTime registerDateTime = rs.getTimestamp("REGDATE").toLocalDateTime();
				
				Member member = new Member(email, password, name, registerDateTime);
				// 추출한 데이터로 객체생성 이후 리스트에 add
				list.add(member);
			}
		} catch (SQLException e) {
			System.out.println("ㅇㅔ러");
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return list; // 리스트 반환
	}

	
	public List<Member> selectListByCategory(String category) {
		// TODO Auto-generated method stub
		return null;
	}

	public Member createFromResultSet(ResultSet rs) {
		try {
			String email = rs.getString("EMAIL");
			String password = rs.getString("PASSWORD");
			String name = rs.getString("NAME");
			LocalDateTime registerDateTime = rs.getTimestamp("REGDATE").toLocalDateTime();
			
			
			Member member = new Member(email, password, name, registerDateTime);
			return member;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	/*
	 * public List getBoardList(int startRow, int pageSize){ List boardList = new
	 * ArrayList();
	 * 
	 * try { // 1,2 디비연결 con = getCon(); // 3. sql 작성 &amp; pstmt 객체 생성 // 글 re_ref
	 * 최신글 위쪽(내림차순), re_seq (오름차순) // DB 데이터를 원하는만큼씩 잘라내기 : limit 시작행-1, 페이지크기 sql =
	 * "select * from itwill_board order by re_ref desc, re_seq asc limit ?,?";
	 * pstmt = con.prepareStatement(sql);
	 * 
	 * // ? pstmt.setInt(1, startRow-1); //시작행-1 (시작 row 인덱스 번호) pstmt.setInt(2,
	 * pageSize); // 페이지크기 (한번에 출력되는 수)
	 * 
	 * // 4. sql 실행 rs = pstmt.executeQuery(); // 5. 데이터처리 ( 글1개의 정보 -&gt; DTO 1개에
	 * 담음 -&gt; ArrayList 1칸 ) while(rs.next()) { // 데이터가 있을때마다 글 1개의 정보를 저장하는 객체 생성
	 * BoardDTO bdto = new BoardDTO();
	 * 
	 * bdto.setContent(rs.getString("content")); bdto.setDate(rs.getDate("date"));
	 * bdto.setFile(rs.getString("file")); bdto.setIp(rs.getString("ip"));
	 * bdto.setName(rs.getString("name")); bdto.setNum(rs.getInt("num"));
	 * bdto.setPass(rs.getString("pass")); bdto.setRe_lev(rs.getInt("re_lev"));
	 * bdto.setRe_ref(rs.getInt("re_ref")); bdto.setRe_seq(rs.getInt("re_seq"));
	 * bdto.setReadcount(rs.getInt("readcount"));
	 * bdto.setSubject(rs.getString("subject"));
	 * 
	 * // DTO 객체를 ArrayList 한칸에 저장 boardList.add(bdto); }
	 * 
	 * System.out.println("DAO : 글 정보 저장완료! "+boardList.size());
	 * 
	 * } catch (Exception e) { e.printStackTrace(); } finally { closeDB(); } return
	 * boardList; } // getBoardList(startRow, pageSize)
	 */
}