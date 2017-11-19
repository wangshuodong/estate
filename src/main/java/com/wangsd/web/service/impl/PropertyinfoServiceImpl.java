package com.wangsd.web.service.impl;

import com.wangsd.web.dao.PropertyinfoMapper;
import com.wangsd.web.dao.ServiceinfoMapper;
import com.wangsd.web.model.Propertyinfo;
import com.wangsd.web.model.PropertyinfoExample;
import com.wangsd.web.modelCustom.ParentCustom;
import com.wangsd.web.service.PropertyinfoServic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/11/19.
 */
@Service
public class PropertyinfoServiceImpl implements PropertyinfoServic {

    @Autowired
    PropertyinfoMapper propertyinfoMapper;
    @Autowired
    ServiceinfoMapper serviceinfoMapper;

    @Override
    public List<ParentCustom> queryParentCustomByCode(String code) {
        List<ParentCustom> list = new ArrayList<ParentCustom>();
        List<ParentCustom> serviceList = serviceinfoMapper.queryParentCustomByCode(code);
        List<ParentCustom> propertyList = propertyinfoMapper.queryParentCustomByCode(code);
        list.addAll(serviceList);
        list.addAll(propertyList);
        return list;
    }

    @Override
    public List<Propertyinfo> queryAllList(String code) {
        PropertyinfoExample example = new PropertyinfoExample();
        example.createCriteria().andCodeLike(code + "%");
        List<Propertyinfo> list = propertyinfoMapper.selectByExample(example);
        return list;
    }

    @Override
    public Propertyinfo selectPropertyinfoById(Integer id) {
        return propertyinfoMapper.selectByPrimaryKey(id);
    }

    @Override
    public String selectMaxByParentCode(Integer parentId) {
        return propertyinfoMapper.selectMaxByParentCode(parentId);
    }

    @Override
    public boolean saveOrUpdateProperty(Propertyinfo propertyinfo) {
        int ret = 0;
        if (propertyinfo.getId() != null) {
            ret = propertyinfoMapper.updateByPrimaryKeySelective(propertyinfo);
        } else {
            ret = propertyinfoMapper.insertSelective(propertyinfo);
        }
        if (ret > 0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public boolean deletePropertyById(Integer id){
        int ret = propertyinfoMapper.deleteByPrimaryKey(id);
        if (ret > 0) {
            return true;
        } else {
            return false;
        }
    }
}
