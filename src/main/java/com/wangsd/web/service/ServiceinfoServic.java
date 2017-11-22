package com.wangsd.web.service;

import com.wangsd.web.model.Serviceinfo;
import com.wangsd.web.modelCustom.ParentCustom;

import java.util.List;

/**
 * Created by Administrator on 2017/11/19.
 */
public interface ServiceinfoServic {
    /**
     * 根据code查询服务商
     * @param code
     * @return
     */
    public Serviceinfo selectServiceinfoByCode(String code);

    /**
     * 查询所有上级服务商
     * @param code
     * @return
     */
    public List<ParentCustom> queryParentServiceByCode(String code);

    /**
     * 查询所有服务商
     * @param code
     * @return
     */
    public List<Serviceinfo> queryAllList(String code);

    /**
     * 根据主键查询服务商
     * @param id
     * @return
     */
    public Serviceinfo selectServiceinfoById(Integer id);

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
    public boolean insertService(Serviceinfo serviceinfo);

    /**
     * 修改服务商
     * @param serviceinfo
     * @return
     */
    public boolean updateService(Serviceinfo serviceinfo);

    /**
     * 根据id删除服务商
     * @param id
     * @return
     */
    public boolean deleteServiceById(Integer id);
}
