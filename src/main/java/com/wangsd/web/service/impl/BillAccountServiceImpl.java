package com.wangsd.web.service.impl;

import com.wangsd.core.entity.JSONResult;
import com.wangsd.core.feature.orm.mybatis.Page;
import com.wangsd.core.util.StaticVar;
import com.wangsd.web.dao.BillaccountMapper;
import com.wangsd.web.dao.TicketMapper;
import com.wangsd.web.model.Billaccount;
import com.wangsd.web.model.BillaccountExample;
import com.wangsd.web.model.Roominfo;
import com.wangsd.web.model.Ticket;
import com.wangsd.web.modelCustom.BillAccountCustom;
import com.wangsd.web.service.BillAccountService;
import com.wangsd.web.service.RoominfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/11/16.
 */
@Service
public class BillAccountServiceImpl implements BillAccountService {

    @Autowired
    BillaccountMapper billaccountMapper;
    @Autowired
    TicketMapper ticketMapper;
    @Autowired
    RoominfoService roominfoService;



    @Override
    public List<BillAccountCustom> queryBillAccountList(BillAccountCustom billAccountCustom) {
        return billaccountMapper.queryBillAccountList(billAccountCustom);
    }

    @Override
    public Billaccount selectBillAccountById(Integer id) {
        return billaccountMapper.selectByPrimaryKey(id);
    }

    @Override
    public Billaccount selectBillAccountByTradeNo(String tradeNo) {
        BillaccountExample example = new BillaccountExample();
        example.createCriteria().andAlipayTradeNoEqualTo(tradeNo);
        List<Billaccount> list = billaccountMapper.selectByExample(example);
        if (list.size() > 0) {
            return list.get(0);
        }else {
            return null;
        }
    }

    /**
     * 新增账单信息
     * @param billaccount
     * @return
     */
    @Override
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
    @Override
    public boolean updateBillaccount(Billaccount billaccount) {
        int ret = billaccountMapper.updateByPrimaryKeySelective(billaccount);
        if (ret > 0) {
            return true;
        }else {
            return true;
        }
    }

    @Override
    public boolean deleteBillaccount(Integer id) {
        Billaccount billaccount = new Billaccount();
        billaccount.setId(id);
        billaccount.setDeletestatus(true);
        int ret = billaccountMapper.updateByPrimaryKeySelective(billaccount);
        if (ret > 0) {
            return true;
        }else {
            return true;
        }
    }

    @Override
    public JSONResult importBillaccount(Integer housingId, List<List<Object>> listob, Integer costType) {
        JSONResult jsonResult = new JSONResult();
        BillAccountCustom billaccount = new BillAccountCustom();
        for (int i = 0; i < listob.size(); i++) {
            List<Object> lo = listob.get(i);
            String groupName = lo.get(1).toString();
            String building = lo.get(2).toString();
            String unit = lo.get(3).toString();
            String room = lo.get(4).toString();
//            String ownerName = lo.get(5).toString();
//            String ownerPhone = lo.get(6).toString();
            String billEntryAmount = lo.get(7).toString();
            if (billEntryAmount == null || "".equals(billEntryAmount)) {
                continue;
            }
            String acctPeriod = lo.get(8).toString();
            String releaseDay = lo.get(9).toString();
            String deadline = lo.get(10).toString();
            //String costType = lo.get(11).toString();
            Roominfo roominfo = new Roominfo();
            roominfo.setGroupName(groupName);
            roominfo.setBuilding(building);
            roominfo.setUnit(unit);
            roominfo.setRoom(room);
            Roominfo old = roominfoService.selectRoominfoByContent(roominfo);
            int a = i + 1;
            if (old != null) {
                billaccount.setHousingId(housingId);
                billaccount.setRoominfoId(old.getId());
                billaccount.setBillEntryAmount(Double.valueOf(billEntryAmount));
                billaccount.setAcctPeriod(acctPeriod);
                billaccount.setCostType(costType);
                List<BillAccountCustom> bi = queryBillAccountList(billaccount);
                if(bi.size() > 0) {
                    jsonResult.setSuccess(false);
                    jsonResult.setMessage(jsonResult.getMessage() + "。第" + a + "行，账单信息已存在");
                    continue;
                }else {
                    billaccount.setReleaseDay(releaseDay);
                    billaccount.setDeadline(deadline);
                    billaccount.setCreateTime(new Date());
                    insertBillaccount(billaccount);
                }
            } else {
                jsonResult.setSuccess(false);
                jsonResult.setMessage(jsonResult.getMessage() + "。第" + a + "行，房间不存在");
                continue;
            }

        }
        jsonResult.setMessage("导入成功");
        jsonResult.setSuccess(true);
        return jsonResult;
    }
    @Override
    public List<BillAccountCustom> queryAmountGroupByPayType(BillAccountCustom billAccountCustom){
        return billaccountMapper.queryAmountGroupByPayType(billAccountCustom);
    }
    @Override
    public List<BillAccountCustom> queryCountGroupByPayType(BillAccountCustom billAccountCustom){
        return billaccountMapper.queryCountGroupByPayType(billAccountCustom);
    }
    @Override
    public BillAccountCustom selectAllGroupByStatus(BillAccountCustom billAccountCustom){
        return billaccountMapper.selectAllGroupByStatus(billAccountCustom);
    }

    /**
     * 新增电子发票信息
     * @param ticket
     * @return
     */
    @Override
    public boolean insertTicket(Ticket ticket) {
        Billaccount billaccount = new Billaccount();
        billaccount.setId(ticket.getBillaccountId());
        billaccount.setTicketstatus(StaticVar.BILLACCOUNT_TICKETSTATUS1);
        this.updateBillaccount(billaccount);
        int ret = ticketMapper.insertSelective(ticket);
        if (ret > 0) {
            return true;
        }else {
            return false;
        }
    }

    /**
     * 根据主键查询电子发票
     * @return
     */
    @Override
    public Ticket selectTicketById(Integer id) {
        return ticketMapper.selectByPrimaryKey(id);
    }


    public List<BillAccountCustom> queryInvoiceListTicketstatus(Page<BillAccountCustom> page, BillAccountCustom query) {
        return billaccountMapper.queryInvoiceListTicketstatus(page, query);
    }
}
