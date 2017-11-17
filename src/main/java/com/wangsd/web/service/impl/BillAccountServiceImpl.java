package com.wangsd.web.service.impl;

import com.wangsd.web.dao.BillaccountMapper;
import com.wangsd.web.model.Billaccount;
import com.wangsd.web.model.Department;
import com.wangsd.web.modelCustom.BillAccountCustom;
import com.wangsd.web.service.BillAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/11/16.
 */
@Service
public class BillAccountServiceImpl implements BillAccountService {

    @Autowired
    BillaccountMapper billaccountMapper;

    @Override
    public List<BillAccountCustom> queryBillAccountList(BillAccountCustom billAccountCustom) {
        return billaccountMapper.queryBillAccountList(billAccountCustom);
    }
    @Override
    public List<BillAccountCustom> queryBillAccountListByCode(Department department){
        return billaccountMapper.queryBillAccountListByCode(department);
    }
    @Override
    public Billaccount selectBillAccountById(Integer id){
        return billaccountMapper.selectByPrimaryKey(id);
    }

}
