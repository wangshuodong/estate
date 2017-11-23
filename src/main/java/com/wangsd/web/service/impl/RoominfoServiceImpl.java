package com.wangsd.web.service.impl;

import com.wangsd.core.entity.JSONResult;
import com.wangsd.web.dao.RoominfoMapper;
import com.wangsd.web.model.Roominfo;
import com.wangsd.web.model.RoominfoExample;
import com.wangsd.web.modelCustom.ParentCustom;
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
    public List<RoominfoCustom> queryRoominfoList(RoominfoCustom roominfo) {
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
    public List<ParentCustom> queryParentRoomById(Integer housingId) {
        return roominfoMapper.queryParentRoomById(housingId);
    }

    @Override
    public Roominfo selectRoominfoByContent(Roominfo roominfo) {
        RoominfoExample example = new RoominfoExample();
        RoominfoExample.Criteria criteria = example.createCriteria();
        if (roominfo.getGroupName() != null) {
            criteria.andGroupNameEqualTo(roominfo.getGroupName());
        }
        if (roominfo.getBuilding() != null) {
            criteria.andBuildingEqualTo(roominfo.getBuilding());
        }
        if (roominfo.getUnit() != null) {
            criteria.andUnitEqualTo(roominfo.getUnit());
        }
        if (roominfo.getRoom() != null) {
            criteria.andRoomEqualTo(roominfo.getRoom());
        }
        if (roominfo.getAddress() != null) {
            criteria.andAddressEqualTo(roominfo.getAddress());
        }
        List<Roominfo> list = roominfoMapper.selectByExample(example);
        if (list.size() > 0) {
            return list.get(0);
        } else {
            return null;
        }
    }

    @Override
    public JSONResult importRoominfo(Integer housingId, List<List<Object>> listob) {
        JSONResult jsonResult = new JSONResult();
        for (int i = 0; i < listob.size(); i++) {
            List<Object> lo = listob.get(i);
            String groupName = lo.get(1).toString();
            String building = lo.get(2).toString();
            String unit = lo.get(3).toString();
            String room = lo.get(4).toString();
            String ownerName = lo.get(5).toString();
            String ownerPhone = lo.get(6).toString();
            Roominfo roominfo = new Roominfo();
            roominfo.setGroupName(groupName);
            roominfo.setBuilding(building);
            roominfo.setUnit(unit);
            roominfo.setRoom(room);
            roominfo.setGroupName(groupName);
            Roominfo old = selectRoominfoByContent(roominfo);
            if (old != null) {
                jsonResult.setSuccess(false);
                int a = i+1;
                jsonResult.setMessage("第" + a + "行，房屋信息已存在");
                return jsonResult;
            } else {
                roominfo.setParentId(housingId);
                roominfo.setOwnerName(ownerName);
                roominfo.setOwnerPhone(ownerPhone);
                roominfo.setAddress(groupName + building + unit + room);
                roominfo.setCreateTime(new Date());
                this.insertRoominfo(roominfo);
            }
        }
        jsonResult.setMessage("导入成功");
        jsonResult.setSuccess(true);
        return jsonResult;
    }
}
