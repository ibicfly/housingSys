package com.easyhousing.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.easyhousing.model.User;

public interface UserDao {
	public void insertUser(User u);
	public int deleteUser(User u);
	public int updateUser(User u);
	public User selectUserByUserId(int userId);
	public User selectUserByUserNameAndPassword(User u);
	public User selectUserByUserName(User u);
	public List<User> selectAllUser(); 
}
