package restaurantDB_java;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class restaurantDao {
	String id = "root";
	String pass = "111111";
	
	String url = "jdbc:mysql://localhost:3306/jspdb?characterEncoding=utf-8";
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public void connect() {
		try {
			Context initctx = new InitialContext();
			Context envctx = (Context) initctx.lookup("java:/comp/env");
			DataSource ds = (DataSource) envctx.lookup("jdbc/pool");

			con = ds.getConnection();
			System.out.println("커넥션 풀을 이용하여 데이터베이스 연결");

		} catch (Exception e) { e.printStackTrace(); }
	}
	
	public void disConnect() {
		if (con != null){
			try {
				con.close();
			} catch (SQLException e) { e.printStackTrace(); }
		}
		
		if(pstmt != null){
			try {
				pstmt.close();
			} catch (SQLException e) { e.printStackTrace(); }
		}
		
		if(rs != null){
			try {
				rs.close();
			} catch (SQLException e) { e.printStackTrace(); }
		}
	}
	
	public void insertRestaurant(restaurantDo aDo){
		connect();
		
		String sql = "insert into restaurant (name, tel, email, people, allergy, date, time)"
				+ " values(?,?,?,?,?,?,?)";
		
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, aDo.getName());
			pstmt.setString(2, aDo.getTel());
			pstmt.setString(3, aDo.getEmail());
			pstmt.setString(4, aDo.getPeople());
			pstmt.setString(5, aDo.getAllergy());
			pstmt.setString(6, aDo.getDate());
			pstmt.setString(7, aDo.getTime());
			
			pstmt.executeUpdate();
			System.out.println("insertRestaurant() 처리 완료");
			
		} catch(Exception e) { e.printStackTrace(); }

		disConnect();
	}
	
	public ArrayList<restaurantDo> getAllRestaurant(String searchlist, String searchvalue) {
		connect();
		
		ArrayList<restaurantDo> rList = new ArrayList<restaurantDo>();
		String sql = "select * from restaurant order by date";
		
		try {
			if(searchvalue != null) {
				String sql2 = "select * from restaurant where "+searchlist+" like ? order by date";
	        	pstmt = con.prepareStatement(sql2);
	        	pstmt.setString(1, "%"+searchvalue+"%");
	        	rs = pstmt.executeQuery();
			} else {
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
			}
			
			while (rs.next()) {
				restaurantDo aDo = new restaurantDo();
				aDo.setNum(rs.getInt(1)); //num
				aDo.setName(rs.getString(2)); //name
				aDo.setTel(rs.getString(3)); //tel
				aDo.setEmail(rs.getString(4)); //email
				aDo.setPeople(rs.getString(5)); //people
				aDo.setAllergy(rs.getString(6)); //allergy
				aDo.setDate(rs.getString(7)); //date
				aDo.setTime(rs.getString(8)); //time
				
				rList.add(aDo);
			}
			
			System.out.println("getAllRestaurant() 처리 완료");
		}catch(Exception e) { e.printStackTrace(); }
		
		disConnect();		
		return rList;
	}
	
	public restaurantDo getRestaurantOne(int num){
		connect();
		restaurantDo aDo = new restaurantDo();
		
		try {
			String sql = "select * from restaurant where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				aDo.setNum(rs.getInt(1));
				aDo.setName(rs.getString(2));
				aDo.setTel(rs.getString(3));
				aDo.setEmail(rs.getString(4));
				aDo.setPeople(rs.getString(5));
				aDo.setAllergy(rs.getString(6));
				aDo.setDate(rs.getString(7));
				aDo.setTime(rs.getString(8));
			}
			
			disConnect();
			System.out.println("getSearch() 처리 완료");
		
		}catch(Exception e) { e.printStackTrace(); }
				
		return aDo;
	}
	
	public void modifyRestaurant(restaurantDo aDo){
		connect();
		
		try {
			String sql = "update restaurant set name=?, tel=?, email=?, people=?, "
					+ "allergy=?, date=?, time=? where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, aDo.getName());
			pstmt.setString(2, aDo.getTel());
			pstmt.setString(3, aDo.getEmail());
			pstmt.setString(4, aDo.getPeople());
			pstmt.setString(5, aDo.getAllergy());
			pstmt.setString(6, aDo.getDate());
			pstmt.setString(7, aDo.getTime());
			pstmt.setInt(8, aDo.getNum());
			pstmt.executeUpdate();
			
			disConnect();
			System.out.println("modifyRestaurant() 처리 완료");
			
		} catch (SQLException e) { e.printStackTrace(); }
	}
	
	public void deleteRestaurant(int num) {
		connect();
		
		try {
			String sql = "delete from restaurant where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();
			
			disConnect();
			System.out.println("deleteRestaurant() 처리 완료");
			
		} catch (SQLException e) { e.printStackTrace(); }
	}
}
