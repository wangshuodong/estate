package com.wangsd.web.service;

import com.wangsd.core.feature.orm.mybatis.Page;
import com.wangsd.core.feature.test.TestSupport;
import com.wangsd.web.modelCustom.BillAccountCustom;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by Administrator on 2017/12/5.
 */
public class BillAccountServiceTest extends TestSupport {

    @Autowired
    BillAccountService billAccountService;

    @Test
    public void queryBillAccountList() throws Exception {
        Page<BillAccountCustom> page = new Page<>(1, 3);
        BillAccountCustom query = new BillAccountCustom();
        billAccountService.queryInvoiceListTicketstatus(page, query);
    }

    @Test
    public void selectBillAccountById() throws Exception {

    }

    @Test
    public void selectBillAccountByTradeNo() throws Exception {

    }

    @Test
    public void insertBillaccount() throws Exception {

    }

    @Test
    public void updateBillaccount() throws Exception {

    }

    @Test
    public void deleteBillaccount() throws Exception {

    }

    @Test
    public void importBillaccount() throws Exception {

    }

    @Test
    public void queryAmountGroupByPayType() throws Exception {

    }

    @Test
    public void queryCountGroupByPayType() throws Exception {

    }

    @Test
    public void selectAllGroupByStatus() throws Exception {

    }

    @Test
    public void insertTicket() throws Exception {

    }

    @Test
    public void selectTicketById() throws Exception {

    }

}