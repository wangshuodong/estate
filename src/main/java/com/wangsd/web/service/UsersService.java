package com.wangsd.web.service;

import com.wangsd.web.model.Users;
import com.wangsd.web.modelCustom.ParentCustom;
import com.wangsd.web.modelCustom.UserCustom;

import java.util.List;

public interface UsersService {
	
	/**
	 * 根据用户名查询用户
	 * @param username
	 * @return
	 */
	public Users selectByUsername(String username);

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
	public List<UserCustom> queryUserList(UserCustom userCustom);

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
	 * 根据code查询所有用户
	 * @param
	 * @return
	 */
	public List<UserCustom> queryUserListByCode(UserCustom userCustom);

	/**
	 * 查询所有的上级服务商、物业、小区
	 * @param code
	 * @return
	 */
	List<ParentCustom> queryParentCustomByCode(String code);

	/**
	 * 新增用户
	 * @param user
	 * @return
	 */
	public boolean insertUser(Users user);

	/**
	 * 更新用户
	 * @param user
	 * @return
	 */
	public boolean updateUser(Users user);

	/**
	 * 更新用户的Code
	 * @param parentId
	 */
	public void updateUserCodeById(Integer parentId, String code);

	/**
	 * 根据主键查询单个用户
	 * @param userId
	 * @return
	 */
	public Users selectByPrimaryKey(Integer userId);
}
