package com.wangsd.web.dao;

import com.wangsd.web.model.Roominfo;
import com.wangsd.web.model.RoominfoExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoominfoMapper {
    int countByExample(RoominfoExample example);

    int deleteByExample(RoominfoExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Roominfo record);

    int insertSelective(Roominfo record);

    List<Roominfo> selectByExample(RoominfoExample example);

    Roominfo selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Roominfo record, @Param("example") RoominfoExample example);

    int updateByExample(@Param("record") Roominfo record, @Param("example") RoominfoExample example);

    int updateByPrimaryKeySelective(Roominfo record);

    int updateByPrimaryKey(Roominfo record);
}