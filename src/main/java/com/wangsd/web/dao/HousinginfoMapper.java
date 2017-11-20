package com.wangsd.web.dao;

import com.wangsd.web.model.Housinginfo;
import com.wangsd.web.model.HousinginfoExample;
import com.wangsd.web.modelCustom.HousinginfoCustom;
import com.wangsd.web.modelCustom.ParentCustom;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface HousinginfoMapper {
    int countByExample(HousinginfoExample example);

    int deleteByExample(HousinginfoExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Housinginfo record);

    int insertSelective(Housinginfo record);

    List<Housinginfo> selectByExample(HousinginfoExample example);

    Housinginfo selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Housinginfo record, @Param("example") HousinginfoExample example);

    int updateByExample(@Param("record") Housinginfo record, @Param("example") HousinginfoExample example);

    int updateByPrimaryKeySelective(Housinginfo record);

    int updateByPrimaryKey(Housinginfo record);

    /**
     * 查询所有上级小区
     * @param code
     * @return
     */
    List<ParentCustom> queryParentCustomByCode(String code);

    /**
     * 查询parent下面的最大code
     * @param parentId
     * @return
     */
    String selectMaxByParentCode(Integer parentId);

    /**
     * 根据id查询小区和物业信息
     * @param id
     * @return
     */
    HousinginfoCustom selectHousingCustomById(Integer id);
}