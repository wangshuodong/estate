package com.wangsd.web.dao;

import com.wangsd.web.model.Propertyinfo;
import com.wangsd.web.model.PropertyinfoExample;
import com.wangsd.web.modelCustom.ParentCustom;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PropertyinfoMapper {
    int countByExample(PropertyinfoExample example);

    int deleteByExample(PropertyinfoExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Propertyinfo record);

    int insertSelective(Propertyinfo record);

    List<Propertyinfo> selectByExample(PropertyinfoExample example);

    Propertyinfo selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Propertyinfo record, @Param("example") PropertyinfoExample example);

    int updateByExample(@Param("record") Propertyinfo record, @Param("example") PropertyinfoExample example);

    int updateByPrimaryKeySelective(Propertyinfo record);

    int updateByPrimaryKey(Propertyinfo record);

    /**
     * 查询所有上级物业
     * @param code
     * @return
     */
    List<ParentCustom> queryParentPropertyByCode(String code);

    /**
     * 查询parent下面的最大code
     * @param parentId
     * @return
     */
    String selectMaxByParentCode(Integer parentId);
}