package com.wangsd.web.service;

import com.wangsd.web.model.Permission;
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
	public Role selectRoleById(int id);

	/**
     * 根据角色id查询菜单id
     * @param roleid
     * @return
     */
    public List<Integer> queryMenuIdByRoleid(Integer roleid);

    /**
     * 新增角色
     * @param roleCustom
     */
	public boolean insertRole(RoleCustom roleCustom);

	/**
	 * 更新角色
	 * @param roleCustom
	 */
	public boolean updateRole(RoleCustom roleCustom);

	/**
	 * 删除角色
	 * @param roleId
	 * @return
	 */
	public boolean deleteRoleInfo(Integer roleId);

	/**
	 * 根据角色id查询所有权限
	 * @param roleId
	 * @return
	 */
	public List<Permission> queryPermissionsByRoleId(Integer roleId);



}
