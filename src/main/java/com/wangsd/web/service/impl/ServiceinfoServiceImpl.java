package com.wangsd.web.service.impl;

import com.wangsd.core.util.ApplicationUtils;
import com.wangsd.web.dao.ServiceinfoMapper;
import com.wangsd.web.model.Serviceinfo;
import com.wangsd.web.model.ServiceinfoExample;
import com.wangsd.web.modelCustom.ParentCustom;
import com.wangsd.web.service.ServiceinfoServic;
import com.wangsd.web.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/11/19.
 */
@Service
public class ServiceinfoServiceImpl implements ServiceinfoServic {

    @Autowired
    ServiceinfoMapper serviceinfoMapper;
    @Autowired
    UsersService usersService;

    @Override
    public Serviceinfo selectServiceinfoByCode(String code) {
        ServiceinfoExample example = new ServiceinfoExample();
        example.createCriteria().andCodeEqualTo(code);
        List<Serviceinfo> list = serviceinfoMapper.selectByExample(example);
        if (list != null && list.size() > 0) {
            return list.get(0);
        }
        return null;
    }

    @Override
    public List<ParentCustom> queryParentServiceByCode(String code) {
        return serviceinfoMapper.queryParentServiceByCode(code);
    }

    @Override
    public List<Serviceinfo> queryAllList(String code) {
        ServiceinfoExample example = new ServiceinfoExample();
        example.createCriteria().andCodeLike(code + "%");
        List<Serviceinfo> list = serviceinfoMapper.selectByExample(example);
        return list;
    }

    @Override
    public Serviceinfo selectServiceinfoById(Integer id) {
        return serviceinfoMapper.selectByPrimaryKey(id);
    }

    @Override
    public String selectMaxByParentCode(Integer parentId) {
        return serviceinfoMapper.selectMaxByParentCode(parentId);
    }

    @Override
    public boolean insertService(Serviceinfo serviceinfo) {
        String code = getParentCode(serviceinfo.getParentId());
        serviceinfo.setCode(code);
        int ret = serviceinfoMapper.insertSelective(serviceinfo);
        if (ret > 0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public boolean updateService(Serviceinfo serviceinfo) {
        Serviceinfo oldDept = selectServiceinfoById(serviceinfo.getId());
        if (oldDept.getParentId() != serviceinfo.getParentId()) { //判断有没有修改上级结构
            String code = getParentCode(serviceinfo.getParentId());
            serviceinfo.setCode(code);
            //更新用户code
            usersService.updateUserCodeById(serviceinfo.getId(), code);
        }
        int ret = serviceinfoMapper.updateByPrimaryKeySelective(serviceinfo);
        if (ret > 0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public boolean deleteServiceById(Integer id){
        int ret = serviceinfoMapper.deleteByPrimaryKey(id);
        if (ret > 0) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 设置上级code
     * @param parentId
     */
    public String getParentCode(Integer parentId) {
        Serviceinfo parent = selectServiceinfoById(parentId);
        String maxCode = selectMaxByParentCode(parentId);
        if (maxCode == null) {
            return parent.getCode() + "0001";
        }else {
            return ApplicationUtils.getOrgCode(maxCode);
        }
    }
}
