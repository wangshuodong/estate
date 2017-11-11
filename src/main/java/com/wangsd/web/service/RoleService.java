package com.wangsd.web.service;

import com.wangsd.web.model.Role;
import com.wangsd.web.modelCustom.RoleCustom;

import java.util.List;

public interface RoleService {

    /**
     * 查询所有角色，过滤掉最大权限的角色
     * @param roleId
     * @return
     */
	public List<Role> queryAllRoleList(Integer roleId);

	/**
	 * 根据id查询角色
	 * @param id
	 * @return
	 */
	public Role findRoleById(int id);

	/**
     * 根据角色id查询菜单id
     * @param roleid
     * @return
     */
    public List<Integer> queryMenuIdByRoleid(Integer roleid);

    /**
     * 保存权限和角色
     * @param roleCustom
     */
	public boolean saveOrUpdateRole(RoleCustom roleCustom);

	/**
	 * 删除角色
	 * @param roleId
	 * @return
	 */
	public int deleteRoleInfo(Integer roleId);
}
