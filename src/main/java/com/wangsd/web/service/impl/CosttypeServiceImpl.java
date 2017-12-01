package com.wangsd.web.service.impl;

import com.wangsd.core.util.ApplicationUtils;
import com.wangsd.web.dao.CosttypeMapper;
import com.wangsd.web.model.Costtype;
import com.wangsd.web.model.CosttypeExample;
import com.wangsd.web.model.Propertyinfo;
import com.wangsd.web.model.Serviceinfo;
import com.wangsd.web.modelCustom.ParentCustom;
import com.wangsd.web.service.CosttypeService;
import com.wangsd.web.service.PropertyinfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/11/19.
 */
@Service
public class CosttypeServiceImpl implements CosttypeService {

    @Autowired
    CosttypeMapper costtypeMapper;

    @Override
    public List<Costtype> queryAllList() {
        CosttypeExample example = new CosttypeExample();
        List<Costtype> list = costtypeMapper.selectByExample(example);
        return list;
    }

    @Override
    public Costtype selectCosttypeById(Integer id) {
        return costtypeMapper.selectByPrimaryKey(id);
    }

    @Override
    public boolean insertCosttype(Costtype costtype) {
        int ret = costtypeMapper.insertSelective(costtype);
        if (ret > 0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public boolean updateCosttype(Costtype costtype) {
        int ret = costtypeMapper.updateByPrimaryKeySelective(costtype);
        if (ret > 0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public boolean deleteCosttypeById(Integer id){
        int ret = costtypeMapper.deleteByPrimaryKey(id);
        if (ret > 0) {
            return true;
        } else {
            return false;
        }
    }
}
