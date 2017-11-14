package com.wangsd.web.service;

import com.wangsd.web.model.Department;
import com.wangsd.web.model.Users;
import com.wangsd.web.modelCustom.UserCustom;

import java.util.List;

public interface UsersService {
	
	/**
	 * 根据用户名查询用户
	 * @param username
	 * @return
	 */
	public UserCustom selectByUsername(String username);

	/**
	 * 用户验证
	 *
	 * @param user
	 * @return
	 */
	Users authentication(Users user);

	/**
	 *
	 * 根据条件查询所有用户
	 *
	 * @param
	 * @return
	 */
	public List<UserCustom> selectUserList(UserCustom userCustom);

	/**
	 *
	 * Description: 删除用户信息
	 * @param id
	 * @return
	 */
	public int deleteUserInfo(int id);

	/**
	 *
	 * Description: 新增用户信息
	 * @param
	 * @return
	 */
	public int addUserInfo(Users user);

	/**
	 * 根据部门code查询所有用户
	 * @param
	 * @return
	 */
	public List<UserCustom> queryUserListByCode(Department department);

	public boolean saveOrUpdateUser(Users user);
}
