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
import jdbc.ConnectionProvider;

public class CommunityRecommendDaoImpl {
	private Connection conn = null;
	
	public CommunityRecommendDaoImpl(Connection conn) {
		this.conn = conn;
	}
	
	//작성 글 db Insert
	public int insert(Community comm) {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(
					"insert into board_recommend (email, subject, content, regdate) " +
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
			String sql = "delete from board_recommend where email=?";
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
			String sql = "update board_recommend set subject=?, content=?, regdate=?, where EMAIL =?";
			

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
			String sql = "select * from board_recommend where email=?";
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

		String sql = "select * from board_recommend";

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
			System.out.println("에러");
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
	
	// 마이페이지에서 자기가 작성한 글 목록 출력할때 이거로 할거임. 이메일을 매개변수로 줘서 이메일로 작성된 글 ..
			public List<Community> selectListEmail(String email) {
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				List<Community> list = new ArrayList<>();
				Community comm = null;
				try {
					String sql = "select * from board_recommend where email=? order by num desc";
					// sampleid가 ?인 것의 테이블을 전부 출력해주는 sql문
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, email);
					rs = pstmt.executeQuery();
					//String email, String subject, String content, LocalDateTime registerDateTime
					while(rs.next()) {
						comm = createFromResultSet(rs);
						list.add(comm);
					}
					return list;
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
	
	public Community createFromResultSet(ResultSet rs) {
		try {
			String email = rs.getString("email");
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
	
	public List<Community> getList(int startRow, int endRow) {
		// 페이징 처리를 위한 sql / 인라인뷰, rownum 사용
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from board_recommend where num between ? and ? order by num desc";
		List<Community> list = null;
		try {
			conn = ConnectionProvider.getConnection(); // 커넥션을 얻어옴
			pstmt = conn.prepareStatement(sql); // sql 정의
			pstmt.setInt(1, startRow); // sql 물음표에 값 매핑
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery(); // sql 실행
			if (rs.next()) { // 데이터베이스에 데이터가 있으면 실행
				list = new ArrayList<>(); // list 객체 생성
				do {
					// 반복할 때마다 ExboardDTO 객체를 생성 및 데이터 저장
					Community board = new Community();
					board.setNum(rs.getLong("num"));
					board.setEmail(rs.getString("email"));
					board.setSubject(rs.getString("subject"));
					board.setContent(rs.getString("content"));
					board.setRegisterDateTime(rs.getTimestamp("REGDATE").toLocalDateTime());

					list.add(board); // list에 0번 인덱스부터 board 객체의 참조값을 저장
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} /*
			 * finally { quitDB(); // DB 연결 종료 / Connection 반환 }
			 */
		return list; // list 반환
	}
	
	//게시글 총 개수 반환
	public int getCount(){
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int count = 0;
		String sql = "select count(*) from board_recommend";
		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} /*
			 * finally { quitDB(); }
			 */
		return count; // 총 레코드 수 리턴
	}
	
	public Community selectByNum(Long num) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "select * from board_recommend where num=?";
			// sampleid가 ?인 것의 테이블을 전부 출력해주는 sql문
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, num);
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
	
	public List<Community> getListEmail(int startRow, int endRow, String email) {
		// 페이징 처리를 위한 sql / 인라인뷰, rownum 사용
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from board_recommend where email=? and num between ? and ? order by num desc";
		List<Community> list = null;
		try {
			conn = ConnectionProvider.getConnection(); // 커넥션을 얻어옴
			pstmt = conn.prepareStatement(sql); // sql 정의
			pstmt.setString(1, email);
			pstmt.setInt(2, startRow); // sql 물음표에 값 매핑
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery(); // sql 실행
			if (rs.next()) { // 데이터베이스에 데이터가 있으면 실행
				list = new ArrayList<>(); // list 객체 생성
				do {
					// 반복할 때마다 ExboardDTO 객체를 생성 및 데이터 저장
					Community board = new Community();
					board.setNum(rs.getLong("num"));
					board.setEmail(rs.getString("email"));
					board.setSubject(rs.getString("subject"));
					board.setContent(rs.getString("content"));
					board.setRegisterDateTime(rs.getTimestamp("REGDATE").toLocalDateTime());

					list.add(board); // list에 0번 인덱스부터 board 객체의 참조값을 저장
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} /*
			 * finally { quitDB(); // DB 연결 종료 / Connection 반환 }
			 */
		return list; // list 반환
	}
	
	
	public List<Community> selectListSearch(String text) throws SQLException {
		   PreparedStatement pstmt = null;
		   ResultSet rs = null;
		      String sql = "select * from board_recommend where subject like ? ";
		      // sampleid가 ?인 것의 테이블을 전부 출력해주는 sql문
		      pstmt = conn.prepareStatement(sql);
		      pstmt.setString(1, text);
		      rs = pstmt.executeQuery();
		   
		   List<Community> list = new ArrayList<>();

		   try {
		      while (rs.next()) {
		         // db의 다음행이 있으면 반복
		    	 Long num = rs.getLong("num");
		         String email = rs.getString("email");
		         String subject = rs.getString("subject");
		         String content = rs.getString("content");
		         LocalDateTime registerDateTime = rs.getTimestamp("REGDATE").toLocalDateTime();
		         
		         Community comm = new Community(email, subject, content, registerDateTime);
		         comm.setNum(num);
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
		      if (pstmt != null) {
		         try {
		            pstmt.close();
		         } catch (SQLException e) {
		            e.printStackTrace();
		         }
		      }
		   }

		   return list; // 리스트 반환
		}

}