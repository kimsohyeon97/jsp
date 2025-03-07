package kr.co.farmstory.dao;

import java.util.List;

import kr.co.farmstory.dto.UserDTO;
import kr.co.farmstory.util.DBHelper;

public class UserDAO extends DBHelper {
	private static final UserDAO INSTANCE = new UserDAO();
	public static UserDAO getInstance() {return INSTANCE;}
	private UserDAO() {};
	
	public void insertUser(UserDTO dto) {
		try {
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public UserDTO selectUser(String uid) {
		try {
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public List<UserDTO> selectAllUser() {
		try {
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void updateUser(UserDTO dto) {
		try {
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteUser(String no) {
		try {
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
