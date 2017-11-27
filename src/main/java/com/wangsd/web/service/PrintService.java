package com.wangsd.web.service;

import com.wangsd.web.model.Printinfo;

import java.util.List;

/**
 * Created by Administrator on 2017/11/25.
 */
public interface PrintService {

    /**
     * 根据关联id查询打印机
     * @param deptId
     * @return
     */
    public Printinfo selectPrintinfoBydeptId(Integer deptId);

    /**
     * 添加打印机
     * @param printinfo
     * @return
     */
    public boolean insertPrintinfo(Printinfo printinfo);

    /**
     * 更新打印机
     * @param printinfo
     * @return
     */
    public boolean updatePrintinfo(Printinfo printinfo);

    /**
     * 根据状态查询打印机列表
     * @param status
     * @return
     */
    public List<Printinfo> selectBystatus(Integer status);
}
