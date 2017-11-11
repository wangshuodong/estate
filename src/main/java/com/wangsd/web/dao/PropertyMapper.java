package com.wangsd.web.dao;

import com.wangsd.web.model.Property;
import com.wangsd.web.model.PropertyExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PropertyMapper {
    int countByExample(PropertyExample example);

    int deleteByExample(PropertyExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Property record);

    int insertSelective(Property record);

    List<Property> selectByExample(PropertyExample example);

    Property selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Property record, @Param("example") PropertyExample example);

    int updateByExample(@Param("record") Property record, @Param("example") PropertyExample example);

    int updateByPrimaryKeySelective(Property record);

    int updateByPrimaryKey(Property record);
}