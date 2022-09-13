package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import dto.Game;
import dto.Member;
import dto.Member_rec;


public class GameDaoImpl {
	private Connection conn = null;

	public GameDaoImpl(Connection conn) {
		this.conn = conn;
	}
	
	public List<Game> selectList() throws SQLException{
		Statement stmt = null;

		stmt = conn.createStatement();

		String sql = "select * from game";

		ResultSet rs = stmt.executeQuery(sql);

		List<Game> list = new ArrayList<>();

		try {
			while (rs.next()) {
				// db의 다음행이 있으면 반복
				int rank = rs.getInt("rank");
				String name = rs.getString("name");
				String company = rs.getString("company");
				String genre = rs.getString("genre");
				String payment = rs.getString("payment");
				String img = rs.getString("img");
				String e = rs.getString("e");
				String n = rs.getString("n");
				String t = rs.getString("t");
				String j = rs.getString("j");

				Game game = new Game(rank,name,company, genre, payment, img, e, n, t, j);
				// 추출한 데이터로 객체생성 이후 리스트에 add
				list.add(game);
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
	public Game select(int num) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "select * from game where num=?";
			// sampleid가 ?인 것의 테이블을 전부 출력해주는 sql문
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
			int rank = rs.getInt("rank");
			String name = rs.getString("name");
			String company = rs.getString("company");
			String genre = rs.getString("genre");
			String payment = rs.getString("payment");
			String img = rs.getString("img");
			Game game = new Game(rank,name,company, genre, payment, img);
			return game;}
			else {return null;}
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
	public List<Game> select_rec(String gen,String pay,int age,String grp) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Game> list = new ArrayList<>();
		try {
			String sql = "select * from game where genre=? and payment not in (?) and num2<=? and graphic=?";
			// sampleid가 ?인 것의 테이블을 전부 출력해주는 sql문
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gen);
			if(pay=="no") {//무료 선호
				pstmt.setString(2, "유료");
			}
			else if(pay=="well") {//상관없음
				pstmt.setString(2, "null");
			}
			else{//유료 선호
				pstmt.setString(2,"무료");
			}
			pstmt.setInt(3, age);
			pstmt.setString(4,grp);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
			int rank = rs.getInt("rank");
			String name = rs.getString("name");
			String company = rs.getString("company");
			String genre = rs.getString("genre");
			String payment = rs.getString("payment");
			String img = rs.getString("img");
			Game game = new Game(rank,name,company, genre, payment, img);
			list.add(game);
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
		return list;
	}
	public int insert(Member_rec member_rec) {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(
					"insert into member_rec (EMAIL, GENRE, PAY, GRAPHIC, AGE) " +
					"values (?, ?, ?, ?, ?)");
			// 인덱스 파라미터 값 설정
			pstmt.setString(1, member_rec.getEmail());
			pstmt.setString(2, member_rec.getGenre());
			pstmt.setString(3, member_rec.getPay());
			pstmt.setString(4, member_rec.getGraphic());
			pstmt.setInt(5, member_rec.getAge());
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
	public Member_rec selectByEmail(String email) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "select * from member_rec where EMAIL=?";
			// sampleid가 ?인 것의 테이블을 전부 출력해주는 sql문
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery(); 
			if (rs.next()) {
				String email1 = rs.getString("email");
				String genre = rs.getString("genre");
				String pay = rs.getString("pay");
				String graphic = rs.getString("graphic");
				int age = rs.getInt("age");
				Member_rec member = new Member_rec(email1, genre, graphic,pay,age);
				return member;
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
	 public List<Game> selectListGenre(String ggenre) {
	      PreparedStatement pstmt = null;

	      ResultSet rs = null;

	      List<Game> list = new ArrayList<>();
	      try {
	         String sql = "select * from game where genre=?";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, ggenre);
	         rs = pstmt.executeQuery();
	         while(rs.next()) {
	            int rank = rs.getInt("rank");
	            String name = rs.getString("name");
	            String company = rs.getString("company");
	            String genre = rs.getString("genre");
	            String payment = rs.getString("payment");
	            String img = rs.getString("img");
	            String e = rs.getString("e");
	            String n = rs.getString("n");
	            String t = rs.getString("t");
	            String j = rs.getString("j");

	            Game game = new Game(rank,name,company, genre, payment, img, e, n, t, j);
	            list.add(game);
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
}
