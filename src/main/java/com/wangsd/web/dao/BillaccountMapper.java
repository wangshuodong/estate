package com.wangsd.web.dao;

import com.wangsd.web.model.Billaccount;
import com.wangsd.web.model.BillaccountExample;
import com.wangsd.web.model.Department;
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
    List<BillAccountCustom>  queryBillAccountList(BillAccountCustom billAccountCustom);

    List<BillAccountCustom> queryBillAccountListByCode(Department department);


}