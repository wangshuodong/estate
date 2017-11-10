package com.wangsd.web.service.impl;

import com.wangsd.web.controller.UserController;
import com.wangsd.web.dao.RoleMapper;
import com.wangsd.web.dao.RoleMenuMapper;
import com.wangsd.web.model.Role;
import com.wangsd.web.model.RoleExample;
import com.wangsd.web.model.RoleMenu;
import com.wangsd.web.model.RoleMenuExample;
import com.wangsd.web.modelCustom.RoleCustom;
import com.wangsd.web.service.RoleService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {

	private static final Logger logger = LogManager.getLogger(UserController.class.getName());
	
//	@Autowired
//	AccountMapper accountMapper;
	@Autowired
    RoleMapper roleMapper;
//	@Autowired
//	MenuMapper menuMapper;
	@Autowired
	RoleMenuMapper roleMenuMapper;
//
//    @Override
//    public List<MenuCustom> queryMenuListByRoleId(Integer roleIds) {
//		List<MenuCustom> list = menuMapper.queryMenuListByRoleId(roleIds);
//		return list;
//	}
//
    @Override
	public List<Role> queryAllRoleList(Integer roleId) {
    	RoleExample example = new RoleExample();
    	if (roleId != null) {
            example.createCriteria().andIdNotEqualTo(roleId);
        }
		List<Role> list = roleMapper.selectByExample(example);
		return list;
	}
//
//    @Override
//	public Role findRoleById(int id) {
//		Role role = roleMapper.selectByPrimaryKey(id);
//		return role;
//	}
//
//    @Override
//    public List<Integer> queryMenuIdByRoleid(Integer roleid) {
//    	return menuMapper.queryMenuIdByRoleid(roleid);
//    }
//
    @Override
	public boolean saveOrUpdateRole(RoleCustom roleCustom) {
    	boolean bl = false;
		try {
			if (roleCustom.getId() == null) {
				roleCustom.setCreateTime(new Date());
				roleMapper.insertSelective(roleCustom);
			} else {
				roleMapper.updateByPrimaryKeySelective(roleCustom);
				RoleMenuExample example = new RoleMenuExample();
				example.createCriteria().andRoleIdEqualTo(roleCustom.getId());
				roleMenuMapper.deleteByExample(example);
			}
			int[] menuIds = roleCustom.getMenuIds();
			for (int menuid : menuIds) {
				RoleMenu roleMenu = new RoleMenu();
				roleMenu.setRoleId(roleCustom.getId());
				roleMenu.setMenuId(menuid);
				roleMenuMapper.insert(roleMenu);
			}
			bl = true;
		} catch (Exception e) {
			logger.info(e);
		}
		return bl;
	}
//
//    @Override
//	public int deleteRoleInfo(Integer roleId) {
//    	RoleMenuExample example = new RoleMenuExample();
//    	example.createCriteria().andRoleidEqualTo(roleId);
//    	roleMenuMapper.deleteByExample(example);
//		return roleMapper.deleteByPrimaryKey(roleId);
//	}
	
}
