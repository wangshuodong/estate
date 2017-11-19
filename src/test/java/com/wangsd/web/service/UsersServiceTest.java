package com.wangsd.web.service;

import com.alibaba.fastjson.JSON;
import com.wangsd.core.feature.test.TestSupport;
import com.wangsd.web.model.Users;
import com.wangsd.web.modelCustom.UserCustom;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by Administrator on 2017/11/8.
 */
public class UsersServiceTest extends TestSupport {

    @Autowired
    UsersService usersService;

    @Test
    public void selectByUsername() throws Exception {
        Users obj = usersService.selectByUsername("admin");
        System.out.println(JSON.toJSONStringWithDateFormat(obj, "yyyy-MM-dd HH:mm:ss"));
    }

    @Test
    public void authentication() throws Exception {
        Users user = new Users();
        user.setUsername("admin1");
        user.setPassword("123456");
        Users obj = usersService.authentication(user);
        System.out.println(JSON.toJSONStringWithDateFormat(obj, "yyyy-MM-dd HH:mm:ss"));
    }

}