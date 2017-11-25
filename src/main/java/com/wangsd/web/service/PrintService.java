package com.wangsd.web.service;

import com.wangsd.web.model.Printinfo;

/**
 * Created by Administrator on 2017/11/25.
 */
public interface PrintService {

    /**
     * 根据id查询打印机
     * @param id
     * @return
     */
    public Printinfo selectPrintinfoById(Integer id);

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
}
