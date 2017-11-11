package com.wangsd.web.dao;

import com.wangsd.web.model.Printinfo;
import com.wangsd.web.model.PrintinfoExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PrintinfoMapper {
    int countByExample(PrintinfoExample example);

    int deleteByExample(PrintinfoExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Printinfo record);

    int insertSelective(Printinfo record);

    List<Printinfo> selectByExample(PrintinfoExample example);

    Printinfo selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Printinfo record, @Param("example") PrintinfoExample example);

    int updateByExample(@Param("record") Printinfo record, @Param("example") PrintinfoExample example);

    int updateByPrimaryKeySelective(Printinfo record);

    int updateByPrimaryKey(Printinfo record);
}