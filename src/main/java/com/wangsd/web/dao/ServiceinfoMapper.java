package com.wangsd.web.dao;

import com.wangsd.web.model.Serviceinfo;
import com.wangsd.web.model.ServiceinfoExample;
import com.wangsd.web.modelCustom.ParentCustom;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ServiceinfoMapper {
    int countByExample(ServiceinfoExample example);

    int deleteByExample(ServiceinfoExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Serviceinfo record);

    int insertSelective(Serviceinfo record);

    List<Serviceinfo> selectByExample(ServiceinfoExample example);

    Serviceinfo selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Serviceinfo record, @Param("example") ServiceinfoExample example);

    int updateByExample(@Param("record") Serviceinfo record, @Param("example") ServiceinfoExample example);

    int updateByPrimaryKeySelective(Serviceinfo record);

    int updateByPrimaryKey(Serviceinfo record);

    /**
     * 查询所有上级服务商
     * @param code
     * @return
     */
    List<ParentCustom> queryParentServiceByCode(String code);

    /**
     * 查询parent下面的最大code
     * @param parentId
     * @return
     */
    String selectMaxByParentCode(Integer parentId);
}