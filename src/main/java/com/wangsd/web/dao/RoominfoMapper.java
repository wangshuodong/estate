package com.wangsd.web.dao;

import com.wangsd.web.model.Roominfo;
import com.wangsd.web.model.RoominfoExample;
import com.wangsd.web.modelCustom.ParentCustom;
import com.wangsd.web.modelCustom.RoominfoCustom;
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

    /**
     * 查询所有房屋信息
     * @param roominfo
     * @return
     */
    List<RoominfoCustom> queryRoominfoList(RoominfoCustom roominfo);

    /**
     * 查询小区下面的所有房间
     * @param housingId
     * @return
     */
    List<ParentCustom> queryParentRoomById(Integer housingId);

}