package com.wangsd.web.service;

import com.alibaba.fastjson.JSON;
import com.wangsd.core.feature.test.TestSupport;
import com.wangsd.web.modelCustom.MenuCustom;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by Administrator on 2017/11/8.
 */
public class MenuServiceTest extends TestSupport {
    @Autowired
    MenuService menuService;

    @Test
    public void queryMenuByRoleId() throws Exception {
        List<MenuCustom> list = menuService.queryMenuByRoleId(1);
        System.out.println(JSON.toJSONStringWithDateFormat(list, "yyyy-MM-dd HH:mm:ss"));
    }

    @Test
    public void queryAllMenuTreeList() throws Exception {
        List<MenuCustom> list = menuService.queryAllMenuTreeList();
        System.out.println(JSON.toJSONStringWithDateFormat(list, "yyyy-MM-dd HH:mm:ss"));
    }

    @Test
    public void queryMenuTreeListByRoleId() throws Exception {
        List<MenuCustom> list = menuService.queryMenuTreeListByRoleId(1);
        System.out.println(JSON.toJSONStringWithDateFormat(list, "yyyy-MM-dd HH:mm:ss"));
    }

}