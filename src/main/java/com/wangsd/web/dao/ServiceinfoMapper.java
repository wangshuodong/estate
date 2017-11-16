package com.wangsd.web.dao;

import com.wangsd.web.model.Serviceinfo;
import com.wangsd.web.model.ServiceinfoExample;
import com.wangsd.web.model.ServiceinfoWithBLOBs;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ServiceinfoMapper {
    int countByExample(ServiceinfoExample example);

    int deleteByExample(ServiceinfoExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(ServiceinfoWithBLOBs record);

    int insertSelective(ServiceinfoWithBLOBs record);

    List<ServiceinfoWithBLOBs> selectByExampleWithBLOBs(ServiceinfoExample example);

    List<Serviceinfo> selectByExample(ServiceinfoExample example);

    ServiceinfoWithBLOBs selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") ServiceinfoWithBLOBs record, @Param("example") ServiceinfoExample example);

    int updateByExampleWithBLOBs(@Param("record") ServiceinfoWithBLOBs record, @Param("example") ServiceinfoExample example);

    int updateByExample(@Param("record") Serviceinfo record, @Param("example") ServiceinfoExample example);

    int updateByPrimaryKeySelective(ServiceinfoWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(ServiceinfoWithBLOBs record);

    int updateByPrimaryKey(Serviceinfo record);
}