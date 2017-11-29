package com.wangsd.web.dao;

import com.wangsd.web.model.Billaccount;
import com.wangsd.web.model.BillaccountExample;
import com.wangsd.web.modelCustom.BillAccountCustom;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BillaccountMapper {
    int countByExample(BillaccountExample example);

    int deleteByExample(BillaccountExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Billaccount record);

    int insertSelective(Billaccount record);

    List<Billaccount> selectByExample(BillaccountExample example);

    Billaccount selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Billaccount record, @Param("example") BillaccountExample example);

    int updateByExample(@Param("record") Billaccount record, @Param("example") BillaccountExample example);

    int updateByPrimaryKeySelective(Billaccount record);

    int updateByPrimaryKey(Billaccount record);

    /**
     * 根据条件查询所有账单
     * @return
     */
    List<BillAccountCustom> queryBillAccountList(BillAccountCustom billAccountCustom);

    /**
     * 按支付方式统计小区
     * @param housingId
     * @return
     */
    List<BillAccountCustom> getPrintGroupByPayType(Integer housingId);

    /**
     * 统计物业下面的账单信息
     * @param propertyId
     * @return
     */
    List<BillAccountCustom> getPrintTotal(Integer propertyId);

    /**
     * 按费用类型统计小区
     * @param housingId
     * @return
     */
    List<BillAccountCustom> getPrintGroupByCostType(Integer housingId);

    /**
     * 每个小区的交易户数
     * @param billAccountCustom
     * @return
     */
    BillAccountCustom getPrintUserCount(BillAccountCustom billAccountCustom);
    /**
     * 账单缴纳情况
     * @param
     * @return
     */

    List<BillAccountCustom> queryAllGroupByPayType(BillAccountCustom billAccountCustom);
}