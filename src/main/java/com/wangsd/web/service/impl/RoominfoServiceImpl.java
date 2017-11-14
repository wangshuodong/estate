package com.wangsd.web.service.impl;

import com.wangsd.web.dao.RoominfoMapper;
import com.wangsd.web.model.Roominfo;
import com.wangsd.web.modelCustom.RoominfoCustom;
import com.wangsd.web.service.RoominfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoominfoServiceImpl implements RoominfoService {

    @Autowired
    RoominfoMapper roominfoMapper;

    @Override
    public List<RoominfoCustom> queryRoominfoList(Roominfo roominfo) {
        return roominfoMapper.queryRoominfoList(roominfo);
    }
    @Override
    public Roominfo findRoominfoById(Integer id) {
        return roominfoMapper.selectByPrimaryKey(id);
    }

    @Override
    public int deleteRoominfo(int id) {
        int num = roominfoMapper.deleteByPrimaryKey(id);
        return num;
    }
}
