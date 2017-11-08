package com.wangsd.web.service;

import com.wangsd.web.modelCustom.MenuCustom;

import java.util.List;

public interface MenuService {

	/**
	 * 登录系统后查询用户的菜单
	 * @param roleId
	 * @return
	 */
	List<MenuCustom> queryMenuByRoleId(Integer roleId);

	/**
	 * 查询所有菜单
	 * @return
	 */
	public List<MenuCustom> queryAllMenuTreeList();

	/**
	 * 根据角色id查询所有菜单
	 * @param roleId
	 * @return
	 */
	public List<MenuCustom> queryMenuTreeListByRoleId(Integer roleId);

}
