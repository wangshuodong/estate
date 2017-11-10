package com.wangsd.web.modelCustom;


import com.wangsd.web.model.Role;

/**
 * Created by Administrator on 2017/6/23.
 */
public class RoleCustom extends Role {
    private int[] menuIds;

    public int[] getMenuIds() {
        return menuIds;
    }

    public void setMenuIds(int[] menuIds) {
        this.menuIds = menuIds;
    }
}
