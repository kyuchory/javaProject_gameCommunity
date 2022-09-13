package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import dto.CheckTime;
import dto.Community;

public class CheckTimeDaoImpl {
	
	
	private Connection conn = null;

	public CheckTimeDaoImpl(Connection conn) {
		this.conn = conn;
	}
	
	// 작성 글 db Insert
		public int insert(CheckTime checktime) {
			PreparedStatement pstmt = null;
			try {
				pstmt = conn.prepareStatement("insert into check_time (email, time) " + "values (?, ?)");
				// 인덱스 파라미터 값 설정
				pstmt.setString(1, checktime.getEmail());
				pstmt.setTimestamp(2, Timestamp.valueOf(checktime.getTime()));
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
		
		//체크하고 만약 출석체크 안했으면 그날 날짜 넣기
		public int edit(CheckTime checktime) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				String sql = "update check_time set time=? where email=?";

				pstmt = conn.prepareStatement(sql);
				pstmt.setTimestamp(1, Timestamp.valueOf(checktime.getTime()));
				pstmt.setString(2, checktime.getEmail());
				

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
		
		// 마이페이지에서 자기가 작성한 글 목록 출력할때 이거로 할거임. 이메일을 매개변수로 줘서 이메일로 작성된 글 ..
		public CheckTime select(String email) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				String sql = "select * from check_time where email=?";
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
		
		public CheckTime createFromResultSet(ResultSet rs) {
			try {
				String email = rs.getString("email");
				LocalDateTime time = rs.getTimestamp("time").toLocalDateTime();

				CheckTime checkTime = new CheckTime(email, time);
				return checkTime;
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return null;
		}
}
