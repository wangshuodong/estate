package com.wangsd.web.service.impl;

import com.wangsd.web.dao.RoominfoMapper;
import com.wangsd.web.model.Roominfo;
import com.wangsd.web.modelCustom.RoominfoCustom;
import com.wangsd.web.service.RoominfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
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
    public Roominfo selectRoominfoById(Integer id) {
        return roominfoMapper.selectByPrimaryKey(id);
    }

    @Override
    public int deleteRoominfo(int id) {
        int num = roominfoMapper.deleteByPrimaryKey(id);
        return num;
    }

    @Override
    public boolean saveOrUpdateUser(Roominfo roominfo) {
        int ret = 0;
        roominfo.setAddress(roominfo.getGroupName() + roominfo.getBuilding() + roominfo.getUnit() + roominfo.getRoom());
        if (roominfo.getId() != null) {
            ret = roominfoMapper.updateByPrimaryKeySelective(roominfo);
        } else {
            roominfo.setCreateTime(new Date());
            ret = roominfoMapper.insertSelective(roominfo);
        }
        if (ret > 0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public List<RoominfoCustom> queryRoominfoDistinct(Roominfo roominfo){
        return roominfoMapper.queryRoominfoDistinct(roominfo);
    }
}
