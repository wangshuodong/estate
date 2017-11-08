package com.wangsd.web.dao;

import com.wangsd.web.model.Menu;
import com.wangsd.web.model.MenuExample;
import com.wangsd.web.modelCustom.MenuCustom;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MenuMapper {
    int countByExample(MenuExample example);

    int deleteByExample(MenuExample example);

    int deleteByPrimaryKey(Integer menuId);

    int insert(Menu record);

    int insertSelective(Menu record);

    List<Menu> selectByExample(MenuExample example);

    Menu selectByPrimaryKey(Integer menuId);

    int updateByExampleSelective(@Param("record") Menu record, @Param("example") MenuExample example);

    int updateByExample(@Param("record") Menu record, @Param("example") MenuExample example);

    int updateByPrimaryKeySelective(Menu record);

    int updateByPrimaryKey(Menu record);

    /**
     * 根据角色id查询所有菜单
     * @param roleId
     * @return
     */
    List<MenuCustom> queryMenuTreeListByRoleId(Integer roleId);

    /**
     * 登录系统后查询用户的菜单
     * @param roleId
     * @return
     */
    List<MenuCustom> queryMenuByRoleId(Integer roleId);
}