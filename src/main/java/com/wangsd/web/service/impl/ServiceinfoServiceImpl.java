package com.wangsd.web.service.impl;

import com.wangsd.web.dao.ServiceinfoMapper;
import com.wangsd.web.model.Serviceinfo;
import com.wangsd.web.model.ServiceinfoExample;
import com.wangsd.web.modelCustom.ParentCustom;
import com.wangsd.web.service.ServiceinfoServic;
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
    public List<ParentCustom> queryParentCustomByCode(String code) {
        return serviceinfoMapper.queryParentCustomByCode(code);
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
    public boolean saveOrUpdateService(Serviceinfo serviceinfo) {
        int ret = 0;
        if (serviceinfo.getId() != null) {
            ret = serviceinfoMapper.updateByPrimaryKeySelective(serviceinfo);
        } else {
            ret = serviceinfoMapper.insertSelective(serviceinfo);
        }
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
}
