package com.wangsd.web.service;

import com.wangsd.web.modelCustom.BillAccountCustom;

import java.util.List;

public interface BillAccountService {

    /**
     * 根据条件查询所有账单
     * @return
     */
    public List<BillAccountCustom> queryBillAccountList(BillAccountCustom billAccountCustom);
}
