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
    public Roominfo selectRoominfoById(Integer id) {
        return roominfoMapper.selectByPrimaryKey(id);
    }

    @Override
    public boolean deleteRoominfo(int id) {
        Roominfo roominfo = new Roominfo();
        roominfo.setId(id);
        roominfo.setDeletestatus(true);
        roominfo.setStatus(false);
        int ret = roominfoMapper.updateByPrimaryKeySelective(roominfo);
        if (ret > 0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public boolean insertRoominfo(Roominfo roominfo) {
        int ret = roominfoMapper.insertSelective(roominfo);
        if (ret > 0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public boolean updateRoominfo(Roominfo roominfo) {
        int ret = roominfoMapper.updateByPrimaryKeySelective(roominfo);
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
