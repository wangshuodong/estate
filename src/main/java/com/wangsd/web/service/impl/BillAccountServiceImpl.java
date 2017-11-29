package com.wangsd.web.service.impl;

import com.wangsd.core.entity.JSONResult;
import com.wangsd.web.dao.BillaccountMapper;
import com.wangsd.web.model.Billaccount;
import com.wangsd.web.model.Roominfo;
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
    RoominfoService roominfoService;



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
    public JSONResult importBillaccount(Integer housingId, List<List<Object>> listob) {
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
            String acctPeriod = lo.get(8).toString();
            String releaseDay = lo.get(9).toString();
            String deadline = lo.get(10).toString();
            String costType = lo.get(11).toString();
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
                billaccount.setCostType(Integer.valueOf(costType));
                List<BillAccountCustom> bi = queryBillAccountList(billaccount);
                if(bi.size() > 0) {
                    jsonResult.setSuccess(false);
                    jsonResult.setMessage("第" + a + "行，账单信息已存在");
                    return jsonResult;
                }else {
                    billaccount.setReleaseDay(releaseDay);
                    billaccount.setDeadline(deadline);
                    billaccount.setCreateTime(new Date());
                    insertBillaccount(billaccount);
                }
            } else {
                jsonResult.setSuccess(false);
                jsonResult.setMessage("第" + a + "行，房间不存在");
                return jsonResult;
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
}
