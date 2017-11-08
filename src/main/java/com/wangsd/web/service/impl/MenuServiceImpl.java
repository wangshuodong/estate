package com.wangsd.web.service.impl;


import com.wangsd.web.dao.MenuMapper;
import com.wangsd.web.model.Menu;
import com.wangsd.web.model.MenuExample;
import com.wangsd.web.modelCustom.MenuCustom;
import com.wangsd.web.service.MenuService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class MenuServiceImpl implements MenuService {

    @Autowired
	MenuMapper menuMapper;

	@Override
	public List<MenuCustom> queryAllMenuTreeList() {
		List<MenuCustom> returnList = new ArrayList<MenuCustom>();;
		MenuExample example = new MenuExample();
		List<Menu> list = menuMapper.selectByExample(example);
		for (Menu menu : list) {
			MenuCustom MenuCustom = new MenuCustom();
			BeanUtils.copyProperties(menu, MenuCustom);
			returnList.add(MenuCustom);
		}
		return returnList;
	}

	@Override
	public List<MenuCustom> queryMenuTreeListByRoleId(Integer roleId) {
		List<MenuCustom> list = menuMapper.queryMenuTreeListByRoleId(roleId);
		return list;
	}

	@Override
	public List<MenuCustom> queryMenuByRoleId(Integer roleId) {
		List<MenuCustom> list = menuMapper.queryMenuByRoleId(roleId);
		return list;
	}

}
