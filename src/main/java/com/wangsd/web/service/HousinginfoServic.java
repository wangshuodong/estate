package com.wangsd.web.service;

import com.wangsd.web.model.Housinginfo;
import com.wangsd.web.modelCustom.ParentCustom;

import java.util.List;

/**
 * Created by Administrator on 2017/11/19.
 */
public interface HousinginfoServic {

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
    public List<Housinginfo> queryAllList(String code);

    /**
     * 根据主键查询服务商
     * @param id
     * @return
     */
    public Housinginfo selectHousinginfoById(Integer id);

    /**
     * 查询parent下面的最大code
     * @param parentId
     * @return
     */
    public String selectMaxByParentCode(Integer parentId);

    /**
     * 新增或者修改服务商
     * @param housinginfo
     * @return
     */
    public boolean saveOrUpdateHousing(Housinginfo housinginfo);

    /**
     * 根据id删除服务商
     * @param id
     * @return
     */
    public boolean deleteHousingById(Integer id);
}
