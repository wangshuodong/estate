package com.wangsd.web.service;

import com.wangsd.web.model.Housinginfo;
import com.wangsd.web.modelCustom.HousinginfoCustom;
import com.wangsd.web.modelCustom.ParentCustom;

import java.util.List;

/**
 * Created by Administrator on 2017/11/19.
 */
public interface HousinginfoServic {

    /**
     * 查询所有上级物业
     * @param code
     * @return
     */
    public List<ParentCustom> queryParentPropertyByCode(String code);

    /**
     * 查询所有上级小区
     * @param code
     * @return
     */
    public List<ParentCustom> queryParentHousingByCode(String code);

    /**
     * 查询所有小区
     * @param housinginfoCustom
     * @return
     */
    public List<Housinginfo> queryAllList(HousinginfoCustom housinginfoCustom);

    /**
     * 根据主键查询小区
     * @param id
     * @return
     */
    public Housinginfo selectHousinginfoById(Integer id);

    /**
     * 根据id查询小区和物业信息
     * @param id
     * @return
     */
    public HousinginfoCustom selectHousingCustomById(Integer id);

    /**
     * 查询parent下面的最大code
     * @param parentId
     * @return
     */
    public String selectMaxByParentCode(Integer parentId);

    /**
     * 新增小区
     * @param housinginfo
     * @return
     */
    public boolean insertHousing(Housinginfo housinginfo);

    /**
     * 修改小区
     * @param housinginfo
     * @return
     */
    public boolean updateHousing(Housinginfo housinginfo);

    /**
     * 根据支付宝id修改小区
     * @param status
     * @param communityId
     * @return
     */
    public boolean updateHousingByCommunityId(String status, String communityId);

    /**
     * 根据id删除小区
     * @param id
     * @return
     */
    public boolean deleteHousingById(Integer id);
}
