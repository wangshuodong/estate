package com.wangsd.web.service;

import com.wangsd.core.entity.JSONResult;
import com.wangsd.web.model.Roominfo;
import com.wangsd.web.modelCustom.ParentCustom;
import com.wangsd.web.modelCustom.RoominfoCustom;

import java.util.List;

/**
 * Created by Administrator on 2017/11/13.
 */
public interface RoominfoService {

    /**
     * 查询所有房屋信息
     * @param roominfo
     * @return
     */
    public List<RoominfoCustom> queryRoominfoList(RoominfoCustom roominfo);

    /**
     * 查询小区下面的所有房间
     * @param housingId
     * @return
     */
    public List<ParentCustom> queryParentRoomById(Integer housingId);

    /**
     * 根据id查询房屋信息
     * @param id
     * @return
     */
    public Roominfo selectRoominfoById(Integer id);

    /**
     * 根据id删除房屋信息
     * @param id
     * @return
     */
    public boolean deleteRoominfo(int id);

    /**
     * 新增房间信息
     * @param roominfo
     * @return
     */
    public boolean insertRoominfo(Roominfo roominfo);

    /**
     * 更新房间信息
     * @param roominfo
     * @return
     */
    public boolean updateRoominfo(Roominfo roominfo);

    /**
     * 根据条件查询房间信息
     * @param roominfo
     * @return
     */
    public Roominfo selectRoominfoByContent(Roominfo roominfo);

    public JSONResult importRoominfo(Integer housingId, List<List<Object>> listob);

}
