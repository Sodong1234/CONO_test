package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import static db.JdbcUtil.*;

public class FollowDAO {
	private static FollowDAO instance = new FollowDAO();
	private FollowDAO() {}
	public static FollowDAO getInstance() {
		return instance;
	};
	Connection con;
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	// 팔로잉 검색
	public ArrayList<ArrayList<String>> selectFollowingList(String sId) {
		System.out.println("DAO - selectFollowingList");
		
		ArrayList<ArrayList<String>> articleList = new ArrayList<ArrayList<String>>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT s.shop_idx, s.shop_img, s.shop_name, s.shop_content "
					+ "FROM shop s, follow f "
					+ "WHERE f.member_id = ? AND s.shop_idx = f.shop_idx";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ArrayList<String> article = new ArrayList<String>();
				article.add(rs.getString("s.shop_idx"));
				article.add(rs.getString("s.shop_img"));
				article.add(rs.getString("s.shop_name"));
				article.add(rs.getString("s.shop_content"));
				
				articleList.add(article);
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return articleList;
	}
	
	// 팔로워 검색
	public ArrayList<ArrayList<String>> selectFollowerList(String sId) {
		System.out.println("DAO - selectFollowerList");
		
		ArrayList<ArrayList<String>> articleList = new ArrayList<ArrayList<String>>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT s.shop_idx, s.shop_img, s.shop_name, s.shop_content "
					+ "FROM shop s, follow f "
					+ "WHERE f.shop_idx = ? AND f.member_id = s.member_id";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sId);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ArrayList<String> article = new ArrayList<String>();
				article.add(rs.getString("s.shop_idx"));
				article.add(rs.getString("s.shop_img"));
				article.add(rs.getString("s.shop_name"));
				article.add(rs.getString("s.shop_content"));
				
				articleList.add(article);
			}
			
		} catch (SQLException e) {
			System.out.println("sql 구문오류 - selectFollowerList");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return articleList;
	}
	
	// 팔로잉 취소
		public int deleteFollowing(String sId, String shop_idx) {
			System.out.println("DAO - deleteFollowing");
			int deleteCount = 0;
			
			PreparedStatement pstmt = null;
			System.out.println("id : " + sId);
			System.out.println("shop_idx : " + shop_idx);
			try {
				String sql = "DELETE FROM follow f WHERE f.member_id = ? AND f.shop_idx = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, sId);
				pstmt.setString(2, shop_idx);
				deleteCount = pstmt.executeUpdate();
				System.out.println("DC : " + deleteCount);
			} catch (SQLException e) {
				System.out.println("sql 구문오류 - deleteFollow");
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			
			return deleteCount;
		}
	
}


