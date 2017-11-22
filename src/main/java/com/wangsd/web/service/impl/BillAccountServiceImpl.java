package com.wangsd.web.service.impl;

import com.wangsd.web.dao.BillaccountMapper;
import com.wangsd.web.model.Billaccount;
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
    public Billaccount selectBillAccountById(Integer id) {
        return billaccountMapper.selectByPrimaryKey(id);
    }

    /**
     * 新增账单信息
     * @param billaccount
     * @return
     */
    public boolean insertBillaccount(Billaccount billaccount) {
        int ret = billaccountMapper.insertSelective(billaccount);
        if (ret > 0) {
            return true;
        }else {
            return true;
        }
    }

    /**
     * 更新账单信息
     * @param billaccount
     * @return
     */
    public boolean updateBillaccount(Billaccount billaccount) {
        int ret = billaccountMapper.updateByPrimaryKeySelective(billaccount);
        if (ret > 0) {
            return true;
        }else {
            return true;
        }
    }

}
