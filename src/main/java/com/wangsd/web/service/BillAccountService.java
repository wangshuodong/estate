package com.wangsd.web.service;

import com.wangsd.core.entity.JSONResult;
import com.wangsd.core.feature.orm.mybatis.Page;
import com.wangsd.web.model.Billaccount;
import com.wangsd.web.model.Ticket;
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
     * 根据支付宝订单编号查询账单
     * @param tradeNo
     * @return
     */
    public Billaccount selectBillAccountByTradeNo(String tradeNo);

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
    public JSONResult importBillaccount(Integer housingId, List<List<Object>> listob, Integer costType);

    /**
     * 根据code查询账单缴纳金额
     * @param
     * @return
     */
    public List<BillAccountCustom> queryAmountGroupByPayType(BillAccountCustom billAccountCustom);

    /**
     * 根据code查询账单缴纳笔数
     * @param
     * @return
     */
    public List<BillAccountCustom> queryCountGroupByPayType(BillAccountCustom billAccountCustom);

    /**
     * 根据状态查询账单情况
     * @param
     * @return
     */
    public BillAccountCustom selectAllGroupByStatus(BillAccountCustom billAccountCustom);

    /**
     * 新增电子发票信息
     * @param ticket
     * @return
     */
    public boolean insertTicket(Ticket ticket);

    /**
     * 根据主键查询电子发票
     * @return
     */
    public Ticket selectTicketById(Integer id);

    /**
     * 根据开票状态查询账单
     * @param code
     * @param ticketstatus
     * @return
     */
    public List<BillAccountCustom> queryInvoiceListTicketstatus(Page<BillAccountCustom> page, BillAccountCustom query);
}
