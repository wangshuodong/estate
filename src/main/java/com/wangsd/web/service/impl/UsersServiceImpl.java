package com.wangsd.web.service.impl;


import com.wangsd.web.dao.UsersMapper;
import com.wangsd.web.model.Department;
import com.wangsd.web.model.Users;
import com.wangsd.web.model.UsersExample;
import com.wangsd.web.modelCustom.UserCustom;
import com.wangsd.web.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
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
	@Override
	public List<UserCustom> selectUserList(UserCustom userCustom){
		List<UserCustom> list = usersMapper.selectUserList(userCustom);
		return list;
	}
	@Override
	public int deleteUserInfo(int id) {
		int num = usersMapper.deleteByPrimaryKey(id);
		return num;
	}
	@Override
	public int addUserInfo(Users user){
		//user.setEnable(true);
		user.setCreateTime(new Date());
		int num=usersMapper.insertSelective(user);
		return num;
	}
	@Override
	public List<UserCustom> queryUserListByCode(Department department){
		List<UserCustom> list = usersMapper.queryUserListByCode(department);
		return list;
	}
	@Override
	public boolean saveOrUpdateUser(Users user){
		int ret = 0;
		if (user.getId() != null) {
			ret = usersMapper.updateByPrimaryKeySelective(user);
		} else {
			user.setCreateTime(new Date());
			user.setPassword("111111");
			ret = usersMapper.insertSelective(user);
		}
		if (ret > 0) {
			return true;
		} else {
			return false;
		}
	}
}
