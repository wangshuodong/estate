package com.wangsd.web.service;

import com.wangsd.web.model.Propertyinfo;
import com.wangsd.web.modelCustom.ParentCustom;

import java.util.List;

/**
 * Created by Administrator on 2017/11/19.
 */
public interface PropertyinfoService {

    /**
     * 查询所有上级服务商和物业
     * @param code
     * @return
     */
    public List<ParentCustom> queryParentServiceAndPropertyByCode(String code);

    /**
     * 查询所有物业
     * @param code
     * @return
     */
    public List<Propertyinfo> queryAllList(String code);

    /**
     * 根据主键查询物业
     * @param id
     * @return
     */
    public Propertyinfo selectPropertyinfoById(Integer id);

    /**
     * 查询parent下面的最大code
     * @param parentId
     * @return
     */
    public String selectMaxByParentCode(Integer parentId);

    /**
     * 新增服务商
     * @param serviceinfo
     * @return
     */
    public boolean insertProperty(Propertyinfo serviceinfo);

    /**
     * 修改物业
     * @param serviceinfo
     * @return
     */
    public boolean updateProperty(Propertyinfo serviceinfo);

    /**
     * 根据id删除物业
     * @param id
     * @return
     */
    public boolean deletePropertyById(Integer id);
}
