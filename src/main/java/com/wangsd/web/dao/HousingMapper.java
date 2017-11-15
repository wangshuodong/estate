package com.wangsd.web.dao;

import com.wangsd.web.model.Housing;
import com.wangsd.web.model.HousingExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface HousingMapper {
    int countByExample(HousingExample example);

    int deleteByExample(HousingExample example);

    int deleteByPrimaryKey(Integer housId);

    int insert(Housing record);

    int insertSelective(Housing record);

    List<Housing> selectByExample(HousingExample example);

    Housing selectByPrimaryKey(Integer housId);

    int updateByExampleSelective(@Param("record") Housing record, @Param("example") HousingExample example);

    int updateByExample(@Param("record") Housing record, @Param("example") HousingExample example);

    int updateByPrimaryKeySelective(Housing record);

    int updateByPrimaryKey(Housing record);
}