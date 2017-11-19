package com.wangsd.web.service;

import com.wangsd.web.model.Propertyinfo;
import com.wangsd.web.modelCustom.ParentCustom;

import java.util.List;

/**
 * Created by Administrator on 2017/11/19.
 */
public interface PropertyinfoServic {

    /**
     * 查询所有上级服务商
     * @param code
     * @return
     */
    public List<ParentCustom> queryParentCustomByCode(String code);

    /**
     * 查询所有服务商
     * @param code
     * @return
     */
    public List<Propertyinfo> queryAllList(String code);

    /**
     * 根据主键查询服务商
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
     * 新增或者修改服务商
     * @param serviceinfo
     * @return
     */
    public boolean saveOrUpdateProperty(Propertyinfo serviceinfo);

    /**
     * 根据id删除服务商
     * @param id
     * @return
     */
    public boolean deletePropertyById(Integer id);
}
