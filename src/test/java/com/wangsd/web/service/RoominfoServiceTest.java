package com.wangsd.web.service;

import com.wangsd.core.feature.test.TestSupport;
import com.wangsd.web.modelCustom.RoominfoCustom;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by Administrator on 2017/11/21.
 */
public class RoominfoServiceTest extends TestSupport {

    @Autowired
    RoominfoService roominfoService;

    @Test
    public void queryRoominfoList() throws Exception {
        RoominfoCustom query = new RoominfoCustom();
        query.setStatus(false);
        query.setParentId(9);
        List<RoominfoCustom> roomList = roominfoService.queryRoominfoList(query);
    }

    @Test
    public void selectRoominfoById() throws Exception {

    }

    @Test
    public void deleteRoominfo() throws Exception {

    }

    @Test
    public void insertRoominfo() throws Exception {

    }

    @Test
    public void updateRoominfo() throws Exception {

    }

    @Test
    public void queryRoominfoDistinct() throws Exception {

    }

}