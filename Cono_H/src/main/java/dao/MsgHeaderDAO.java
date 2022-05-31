package dao;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MsgHeaderDAO {
	private static MsgHeaderDAO instance = new MsgHeaderDAO();
	private MsgHeaderDAO() {}
	public static MsgHeaderDAO getInstance() {
		return instance;
	};
	Connection con;
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	public ArrayList<ArrayList<String>> selectDMHeaderList(String sId) {
		ArrayList<ArrayList<String>> articleList = new ArrayList<ArrayList<String>>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT "
				+ "FROM shop s, "
				+ "WHERE";
		
		
		return articleList;
	}
}
