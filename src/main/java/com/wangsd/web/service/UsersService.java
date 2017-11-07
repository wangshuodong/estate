package com.wangsd.web.service;

import com.wangsd.web.model.Users;
import com.wangsd.web.modelCustom.UserCustom;

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

}
