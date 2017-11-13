package com.wangsd.web.service;

import com.wangsd.web.model.Roominfo;
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
    public List<RoominfoCustom> queryRoominfoList(Roominfo roominfo);

    /**
     * 根据id查询房屋信息
     * @param id
     * @return
     */
    public Roominfo findRoominfoById(Integer id);
}
