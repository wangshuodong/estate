package com.wangsd.web.service;

import com.wangsd.core.entity.JSONResult;
import com.wangsd.web.model.Billaccount;
import com.wangsd.web.modelCustom.BillAccountCustom;

import java.util.List;

public interface BillAccountService {

    /**
     * 根据条件查询所有账单
     * @return
     */
    public List<BillAccountCustom> queryBillAccountList(BillAccountCustom billaccount);

    /**
     * 根据id查询账单信息
     * @param id
     * @return
     */
    public Billaccount selectBillAccountById(Integer id);

    /**
     * 新增账单信息
     * @param billaccount
     * @return
     */
    public boolean insertBillaccount(Billaccount billaccount);

    /**
     * 更新账单信息
     * @param billaccount
     * @return
     */
    public boolean updateBillaccount(Billaccount billaccount);

    /**
     * 删除账单
     * @param id
     * @return
     */
    public boolean deleteBillaccount(Integer id);

    /**
     * 导入账单Excel信息
     * @param
     * @return
     */
    public JSONResult importBillaccount(Integer housingId, List<List<Object>> listob);

    /**
     * 根据code查询账单缴纳情况
     * @param
     * @return
     */
    public List<BillAccountCustom> queryAllGroupByPayType(String code);
}
