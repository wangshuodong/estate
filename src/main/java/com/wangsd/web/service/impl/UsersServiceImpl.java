package com.wangsd.web.service.impl;


import com.wangsd.web.dao.HousinginfoMapper;
import com.wangsd.web.dao.PropertyinfoMapper;
import com.wangsd.web.dao.ServiceinfoMapper;
import com.wangsd.web.dao.UsersMapper;
import com.wangsd.web.model.Users;
import com.wangsd.web.model.UsersExample;
import com.wangsd.web.modelCustom.ParentCustom;
import com.wangsd.web.modelCustom.UserCustom;
import com.wangsd.web.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class UsersServiceImpl implements UsersService {

    @Autowired
    UsersMapper usersMapper;
    @Autowired
    ServiceinfoMapper serviceinfoMapper;
    @Autowired
    PropertyinfoMapper propertyinfoMapper;
    @Autowired
    HousinginfoMapper housinginfoMapper;

    @Override
    public Users selectByUsername(String username) {
        Users retobj = null;
        UsersExample example = new UsersExample();
        UsersExample.Criteria criteria = example.createCriteria();
        criteria.andUsernameEqualTo(username);
        List<Users> list = usersMapper.selectByExample(example);
        if (list.size() > 0) {
            retobj = list.get(0);
        }
        return retobj;
    }

    @Override
    public Users authentication(Users user) {
        Users retobj = null;
        UsersExample example = new UsersExample();
        UsersExample.Criteria criteria = example.createCriteria();
        criteria.andUsernameEqualTo(user.getUsername());
        criteria.andPasswordEqualTo(user.getPassword());
        criteria.andEnableEqualTo(true);
        List<Users> list = usersMapper.selectByExample(example);
        if (list.size() > 0) {
            retobj = list.get(0);
        }
        return retobj;
    }

    @Override
    public List<UserCustom> queryUserList(UserCustom userCustom) {
        List<UserCustom> list = usersMapper.selectUserList(userCustom);
        return list;
    }

    @Override
    public int deleteUserInfo(int id) {
        int num = usersMapper.deleteByPrimaryKey(id);
        return num;
    }

    @Override
    public int addUserInfo(Users user) {
        //user.setEnable(true);
        user.setCreateTime(new Date());
        int num = usersMapper.insertSelective(user);
        return num;
    }

    @Override
    public List<UserCustom> queryUserListByCode(UserCustom userCustom) {
        List<UserCustom> list = usersMapper.queryUserListByCode(userCustom);
        return list;
    }

    @Override
    public List<ParentCustom> queryParentCustomByCode(String code) {
        List<ParentCustom> list = new ArrayList<ParentCustom>();
        List<ParentCustom> serviceList = serviceinfoMapper.queryParentServiceByCode(code);
        List<ParentCustom> propertyList = propertyinfoMapper.queryParentPropertyByCode(code);
        List<ParentCustom> housingList = housinginfoMapper.queryParentHousingByCode(code);
        list.addAll(serviceList);
        list.addAll(propertyList);
        list.addAll(housingList);
        return list;

    }

    @Override
    public boolean insertUser(Users user) {
        int  ret = usersMapper.insertSelective(user);
        if (ret > 0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public boolean updateUser(Users user) {
        int ret = usersMapper.updateByPrimaryKeySelective(user);
        if (ret > 0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public void updateUserCodeById(Integer parentId, String code) {
        Users user = new Users();
        user.setParentCode(code);
        UsersExample example = new UsersExample();
        example.createCriteria().andParentIdEqualTo(parentId);
        usersMapper.updateByExampleSelective(user, example);
    }

    @Override
    public Users selectByPrimaryKey(Integer userId) {
        Users user = usersMapper.selectByPrimaryKey(userId);
        return user;
    }

}
