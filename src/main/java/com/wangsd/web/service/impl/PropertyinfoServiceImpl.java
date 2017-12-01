package com.wangsd.web.service.impl;

import com.wangsd.core.util.ApplicationUtils;
import com.wangsd.web.dao.PropertyinfoMapper;
import com.wangsd.web.model.Propertyinfo;
import com.wangsd.web.model.PropertyinfoExample;
import com.wangsd.web.model.Serviceinfo;
import com.wangsd.web.modelCustom.ParentCustom;
import com.wangsd.web.service.PropertyinfoService;
import com.wangsd.web.service.ServiceinfoService;
import com.wangsd.web.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/11/19.
 */
@Service
public class PropertyinfoServiceImpl implements PropertyinfoService {

    @Autowired
    PropertyinfoMapper propertyinfoMapper;
    @Autowired
    ServiceinfoService serviceinfoService;
    @Autowired
    UsersService usersService;

    @Override
    public List<ParentCustom> queryParentServiceAndPropertyByCode(String code) {
        List<ParentCustom> list = new ArrayList<ParentCustom>();
        List<ParentCustom> serviceList = serviceinfoService.queryParentServiceByCode(code);
        List<ParentCustom> propertyList = propertyinfoMapper.queryParentPropertyByCode(code);
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
    public boolean insertProperty(Propertyinfo propertyinfo) {
        String code = getParentCode(propertyinfo.getParentId());
        propertyinfo.setCode(code);
        int ret = propertyinfoMapper.insertSelective(propertyinfo);
        if (ret > 0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public boolean updateProperty(Propertyinfo propertyinfo) {
        Propertyinfo oldDept = selectPropertyinfoById(propertyinfo.getId());
        if (oldDept.getParentId() != propertyinfo.getParentId()) {
            String code = getParentCode(propertyinfo.getParentId());
            propertyinfo.setCode(code);
            //更新用户code
            usersService.updateUserCodeById(propertyinfo.getId(), code);
        }
        int ret = propertyinfoMapper.updateByPrimaryKeySelective(propertyinfo);
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

    public String getParentCode(Integer parentId) {
        String code;
        //查询上级物业
        Propertyinfo propertyParent = selectPropertyinfoById(parentId);
        //propertyParent==null,说明选的上级是服务商
        if (propertyParent == null) {
            Serviceinfo serviceParent = serviceinfoService.selectServiceinfoById(parentId);
            code = serviceParent.getCode();
        } else {
            code = propertyParent.getCode();
        }
        String maxCode = selectMaxByParentCode(parentId);
        if (maxCode == null) {
            return code + "0001";
        } else {
            return ApplicationUtils.getOrgCode(maxCode);
        }
    }
}
