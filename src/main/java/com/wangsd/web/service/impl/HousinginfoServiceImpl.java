package com.wangsd.web.service.impl;

import com.wangsd.web.dao.HousinginfoMapper;
import com.wangsd.web.dao.PropertyinfoMapper;
import com.wangsd.web.model.Housinginfo;
import com.wangsd.web.model.HousinginfoExample;
import com.wangsd.web.modelCustom.HousinginfoCustom;
import com.wangsd.web.modelCustom.ParentCustom;
import com.wangsd.web.service.HousinginfoServic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/11/19.
 */
@Service
public class HousinginfoServiceImpl implements HousinginfoServic {

    @Autowired
    HousinginfoMapper housinginfoMapper;
    @Autowired
    PropertyinfoMapper propertyinfoMapper;

    @Override
    public List<ParentCustom> queryParentCustomByCode(String code) {
        return propertyinfoMapper.queryParentCustomByCode(code);
    }

    @Override
    public List<ParentCustom> queryParentHousingByCode(String code) {
        return housinginfoMapper.queryParentCustomByCode(code);
    }

    @Override
    public List<Housinginfo> queryAllList(String code) {
        HousinginfoExample example = new HousinginfoExample();
        example.createCriteria().andCodeLike(code + "%");
        List<Housinginfo> list = housinginfoMapper.selectByExample(example);
        return list;
    }

    @Override
    public Housinginfo selectHousinginfoById(Integer id) {
        return housinginfoMapper.selectByPrimaryKey(id);
    }

    @Override
    public HousinginfoCustom selectHousingCustomById(Integer id) {
        return  housinginfoMapper.selectHousingCustomById(id);
    }

    @Override
    public String selectMaxByParentCode(Integer parentId) {
        return housinginfoMapper.selectMaxByParentCode(parentId);
    }

    @Override
    public boolean saveOrUpdateHousing(Housinginfo housinginfo) {
        int ret = 0;
        if (housinginfo.getId() != null) {
            ret = housinginfoMapper.updateByPrimaryKeySelective(housinginfo);
        } else {
            ret = housinginfoMapper.insertSelective(housinginfo);
        }
        if (ret > 0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public boolean deleteHousingById(Integer id){
        Housinginfo housinginfo = new Housinginfo();
        housinginfo.setId(id);
        housinginfo.setDeletestatus(true);
        int ret = housinginfoMapper.updateByPrimaryKeySelective(housinginfo);
        if (ret > 0) {
            return true;
        } else {
            return false;
        }
    }
}
