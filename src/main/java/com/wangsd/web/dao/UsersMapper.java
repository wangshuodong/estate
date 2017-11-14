package com.wangsd.web.dao;

import com.wangsd.web.model.Department;
import com.wangsd.web.model.Users;
import com.wangsd.web.model.UsersExample;
import com.wangsd.web.modelCustom.UserCustom;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UsersMapper {
    int countByExample(UsersExample example);

    int deleteByExample(UsersExample example);

    int deleteByPrimaryKey(Integer userId);

    int insert(Users record);

    int insertSelective(Users record);

    List<Users> selectByExample(UsersExample example);

    Users selectByPrimaryKey(Integer userId);

    int updateByExampleSelective(@Param("record") Users record, @Param("example") UsersExample example);

    int updateByExample(@Param("record") Users record, @Param("example") UsersExample example);

    int updateByPrimaryKeySelective(Users record);

    int updateByPrimaryKey(Users record);

    /**
     * 更加登录名查询用户信息
     * @param username
     * @return
     */
    UserCustom selectByUsername(String username);

    List<UserCustom> selectUserList(UserCustom userCustom);

    List<UserCustom> queryUserListByCode(Department department);

}