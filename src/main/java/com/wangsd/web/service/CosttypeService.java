package com.wangsd.web.service;

import com.wangsd.web.model.Costtype;

import java.util.List;

/**
 * Created by Administrator on 2017/11/19.
 */
public interface CosttypeService {

    /**
     * 查询所有费用类型
     * @param
     * @return
     */
    public List<Costtype> queryAllList();

    /**
     * 根据主键查询费用类型
     * @param id
     * @return
     */
    public Costtype selectCosttypeById(Integer id);

    /**
     * 新增费用类型
     * @param costtype
     * @return
     */
    public boolean insertCosttype(Costtype costtype);

    /**
     * 修改费用类型
     * @param costtype
     * @return
     */
    public boolean updateCosttype(Costtype costtype);

    /**
     * 根据id删除费用类型
     * @param id
     * @return
     */
    public boolean deleteCosttypeById(Integer id);
}
