package kr.co.jboard.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard.dto.UserDTO;
import kr.co.jboard.util.DBHelper;
import kr.co.jboard.util.SQL;

public class UserDAO extends DBHelper{
	private static final UserDAO INSTANCE = new UserDAO(); 
	public static UserDAO getInstance() {return INSTANCE;}
	private UserDAO() {}
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void insertUser(UserDTO dto) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.INSERT_USER);
			psmt.setString(1, dto.getUid());
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getNick());
			psmt.setString(5, dto.getEmail());
			psmt.setString(6, dto.getHp());
			psmt.setString(7, dto.getZip());
			psmt.setString(8, dto.getAddr1());
			psmt.setString(9, dto.getAddr2());
			psmt.setString(10, dto.getRegip());
			psmt.executeUpdate();
			closeAll();
		}catch(Exception e) {e.printStackTrace();}
	}
	
	public int  selectCountUser(String type, String value) {
		int count = 0;
		
		// String 불변성을 고려해 StringBuilder로 동적 SQL 생성
		StringBuilder sql = new StringBuilder(SQL.SELECT_COUNT_USER);
		
		if(type.equals("uid")) {sql.append(SQL.WHERE_UID);} // 아이디 중복체크 쿼리문
		else if(type.equals("nick")) {sql.append(SQL.WHERE_NICK);} // 별명 중복체크 쿼리문
		else if(type.equals("email")) {sql.append(SQL.WHERE_EMAIL);} // 이메일 중복체크 쿼리문
		else if(type.equals("hp")) {sql.append(SQL.WHERE_HP);} // 휴대폰 중복체크 쿼리문
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql.toString());
			psmt.setString(1, value); // 아이디, 별명, 이메일, 휴대폰 value 값
			rs = psmt.executeQuery();
			if(rs.next()) // value 데이터가 있으면
				count = rs.getInt(1); // uid, nick, email, hp 의 count 값을 count에 저장 (1)
			closeAll();
		}catch(Exception e) {logger.error(e.getMessage());}
		return count; // 중복이면 1, 중복아니면 0 반환
	}
	
	public UserDTO selectUser(String uid) {
		return null;
	}
	
	public UserDTO selectUser(UserDTO dto) {
		UserDTO userDTO = null;
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_USER);
			psmt.setString(1, dto.getUid());
			psmt.setString(2, dto.getPass());
			rs = psmt.executeQuery();
			if(rs.next()) {
				userDTO = new UserDTO();
				userDTO.setUid(rs.getString(1));
				userDTO.setPass(rs.getString(2));
				userDTO.setName(rs.getString(3));
				userDTO.setNick(rs.getString(4));
				userDTO.setEmail(rs.getString(5));
				userDTO.setHp(rs.getString(6));
				userDTO.setRole(rs.getString(7));
				userDTO.setZip(rs.getString(8));
				userDTO.setAddr1(rs.getString(9));
				userDTO.setAddr2(rs.getString(10));
				userDTO.setRegip(rs.getString(11));
				userDTO.setRegDate(rs.getString(12));
				userDTO.setLeaveDate(rs.getString(13));
			}
			closeAll();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return userDTO;
	}
	
	public List<UserDTO> selectAllUser(){
		return null;
	}
	
	public void updateUser(UserDTO dto) {
		
	}
	
	public void deleteUser(String uid) {
		
	}

}
