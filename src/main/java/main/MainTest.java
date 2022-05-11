package main;

import java.sql.Connection;
import java.sql.SQLException;

import dao.CommunityDaoImpl;
import jdbc.ConnectionProvider;
public class MainTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		CommunityDaoImpl test = new CommunityDaoImpl(conn);
		
		System.out.println(test.getCount());
	}
}
