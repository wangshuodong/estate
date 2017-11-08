package com.wangsd.web.service.impl;


import com.wangsd.web.dao.UsersMapper;
import com.wangsd.web.model.Users;
import com.wangsd.web.model.UsersExample;
import com.wangsd.web.modelCustom.UserCustom;
import com.wangsd.web.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UsersServiceImpl implements UsersService {

    @Autowired
	UsersMapper usersMapper;

    @Override
	public UserCustom selectByUsername(String username) {
		UserCustom account = usersMapper.selectByUsername(username);
		return account;
	}

	@Override
	public Users authentication(Users user) {
		Users retobj = null;
		UsersExample example = new UsersExample();
		example.createCriteria().andUsernameEqualTo(user.getUsername());
		example.createCriteria().andPasswordEqualTo(user.getPassword());
		List<Users> list = usersMapper.selectByExample(example);
		if (list.size() > 0) {
			retobj = list.get(0);
		}
		return retobj;
	}

}
