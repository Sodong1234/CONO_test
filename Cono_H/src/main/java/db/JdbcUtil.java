package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

// 데이터베이스 관련 설정 및 관리작업을 수행하는 클래스
public class JdbcUtil {
	//  1. DB 연결 작업을 수행한 후 Connection 객체를 리턴하는  getConnection() 메서드 정의
	public static Connection getConnection() {
		Connection con = null;
		
		try {
			// context.xml 에 설정된 DBCP(커넷견풀)로부터 Connection 객체를 가져오기
			// 1. 톰캣으로부터 context.xml 파일의  Context 태그 부분(객체) 가져오기
			//=> InitialContext 객체 생성하여 Context 타입으로 
			Context initCtx = new InitialContext();
			
			//2. 생성된 Context 객체(initCtx)로부터 conteext.xml 의 Resource 태그 부분 가져오기
//			Context envCtx = (Context)initCtx.lookup("java:comp/env");
			
			// 3.
//			DataSource ds = (DataSource)envCtx.lookup("jdbc/MySQL");
			
			// ---- 2번 3번 결합하는 경우
			DataSource ds = (DataSource)initCtx.lookup("java:comp/env/jdbc/MySQL");

			// 4. 
			con = ds.getConnection();
			
			//-------------- 옵션 -------------------
			con.setAutoCommit(false);	// AutoCommit 기능 해제 (기능 실행 시 true 전달)
			
			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// Connection 객체 리턴
		return con;
		
	}// getConnection() 메서드 끝
	
	// 2. DB 작업 완료 후 자원을 반환하기 위한 close() 메서드 정의
	
	public static void close(Connection con) {
		if(con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void close(PreparedStatement pstmt) {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void close(ResultSet rs) {
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	// 3. 트랜젝션  처리에 필요한 commit, rollback 작업을 수행
	public static void commit(Connection con) {
		try {
			con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void rollback(Connection con) {
		try {
			con.rollback();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
}





