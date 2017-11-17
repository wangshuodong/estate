package com.wangsd.web.service;

import com.wangsd.web.model.Billaccount;
import com.wangsd.web.model.Department;
import com.wangsd.web.modelCustom.BillAccountCustom;

import java.util.List;

public interface BillAccountService {

    /**
     * 根据条件查询所有账单
     * @return
     */
    public List<BillAccountCustom> queryBillAccountList(BillAccountCustom billAccountCustom);

    /**
     * 根据部门CODE所有账单
     * @return
     */
    public List<BillAccountCustom> queryBillAccountListByCode(Department department);

    /**
     * 根据id查询账单信息
     * @param id
     * @return
     */
    public Billaccount selectBillAccountById(Integer id);
}
