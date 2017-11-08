package com.wangsd.web.service.impl;

import com.wangsd.web.service.RoleService;
import org.springframework.stereotype.Service;

@Service
public class RoleServiceImpl implements RoleService {
	
//	@Autowired
//	AccountMapper accountMapper;
//	@Autowired
//	RoleMapper roleMapper;
//	@Autowired
//	MenuMapper menuMapper;
//	@Autowired
//    RoleMenuMapper roleMenuMapper;
//
//    @Override
//    public List<MenuCustom> queryMenuListByRoleId(Integer roleIds) {
//		List<MenuCustom> list = menuMapper.queryMenuListByRoleId(roleIds);
//		return list;
//	}
//
//    @Override
//	public List<Role> queryAllRoleList(String companyid) {
//    	RoleExample example = new RoleExample();
//    	if (companyid != null) {
//    		example.createCriteria().andCompanyidLike(companyid);
//    	}
//		List<Role> list = roleMapper.selectByExample(example);
//		return list;
//	}
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
//    @Override
//	public void saveOrUpdateRole(RoleCustom roleCustom) {
//		if (roleCustom.getId() == null) {
//			roleMapper.insertSelective(roleCustom);
//		}else {
//			roleMapper.updateByPrimaryKeySelective(roleCustom);
//			RoleMenuExample example = new RoleMenuExample();
//	    	example.createCriteria().andRoleidEqualTo(roleCustom.getId());
//	    	roleMenuMapper.deleteByExample(example);
//		}
//		int[] menuIds = roleCustom.getMenuIds();
//		for (int menuid : menuIds) {
//			RoleMenu roleMenu = new RoleMenu();
//			roleMenu.setRoleid(roleCustom.getId());
//			roleMenu.setMenuid(menuid);
//			roleMenuMapper.insert(roleMenu);
//		}
//
//	}
//
//    @Override
//	public int deleteRoleInfo(Integer roleId) {
//    	RoleMenuExample example = new RoleMenuExample();
//    	example.createCriteria().andRoleidEqualTo(roleId);
//    	roleMenuMapper.deleteByExample(example);
//		return roleMapper.deleteByPrimaryKey(roleId);
//	}
	
}
