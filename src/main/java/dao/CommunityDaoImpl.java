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

public class CommunityDaoImpl {
	private Connection conn = null;
	
	public CommunityDaoImpl(Connection conn) {
		this.conn = conn;
	}
	
	//작성 글 db Insert
	public int insert(Community comm) {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(
					"insert into board_free (email, subject, content, regdate) " +
					"values (?, ?, ?, ?)",
					new String[] { "ID" });
			// 인덱스 파라미터 값 설정
			pstmt.setString(1, comm.getEmail());
			pstmt.setString(2, comm.getSubject());
			pstmt.setString(3, comm.getContent());
			pstmt.setTimestamp(4,
					Timestamp.valueOf(comm.getRegisterDateTime()));
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
	
	//db의 내용물을 email 값과 일치하는 것을 삭제함.
	public int delete(String email) {
		PreparedStatement pstmt = null;
		try {
			String sql = "delete from board_free where email=?";
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
	
	//글수정 -- 일단 본인 이메일과 작성 글 이메일이 같다면 수정 가능하게 할 것
	//수정은 수정하기 폼에서 해야함.
	public int edit(Community comm) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "update board_free set subject=?, content=?, regdate=?, where EMAIL =?";
			

			pstmt = conn.prepareStatement(sql);
			

			pstmt.setString(1, comm.getSubject());
			pstmt.setString(2, comm.getContent());
			pstmt.setTimestamp(3, Timestamp.valueOf(comm.getRegisterDateTime()));
			

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
	
	//마이페이지에서 자기가 작성한 글 목록 출력할때 이거로 할거임. 이메일을 매개변수로 줘서 이메일로 작성된 글 ..
	public Community select(String email) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "select * from board_free where email=?";
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
	
	//
	public List<Community> selectList() throws SQLException {
		Statement stmt = null;

		stmt = conn.createStatement();

		String sql = "select * from board_free";

		ResultSet rs = stmt.executeQuery(sql);

		List<Community> list = new ArrayList<>();

		try {
			while (rs.next()) {
				// db의 다음행이 있으면 반복
				String email = rs.getString("email");
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				LocalDateTime registerDateTime = rs.getTimestamp("REGDATE").toLocalDateTime();
				
				Community comm = new Community(email, subject, content, registerDateTime);
				// 추출한 데이터로 객체생성 이후 리스트에 add
				list.add(comm);
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
	
	public Community createFromResultSet(ResultSet rs) {
		try {
			String email = rs.getString("eamil");
			String subject = rs.getString("subject");
			String content = rs.getString("content");
			LocalDateTime registerDateTime = rs.getTimestamp("REGDATE").toLocalDateTime();
			
			
			Community comm = new Community(email, subject, content, registerDateTime);
			return comm;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
