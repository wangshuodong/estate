package com.wangsd.web.service.impl;

import com.wangsd.core.util.ApplicationUtils;
import com.wangsd.web.dao.HousinginfoMapper;
import com.wangsd.web.dao.PropertyinfoMapper;
import com.wangsd.web.model.Housinginfo;
import com.wangsd.web.model.HousinginfoExample;
import com.wangsd.web.model.Propertyinfo;
import com.wangsd.web.modelCustom.HousinginfoCustom;
import com.wangsd.web.modelCustom.ParentCustom;
import com.wangsd.web.service.HousinginfoServic;
import com.wangsd.web.service.UsersService;
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
    @Autowired
    UsersService usersService;

    @Override
    public List<ParentCustom> queryParentPropertyByCode(String code) {
        List<ParentCustom> propertyList = propertyinfoMapper.queryParentPropertyByCode(code);
        return propertyList;
    }

    @Override
    public List<ParentCustom> queryParentHousingByCode(String code) {
        return housinginfoMapper.queryParentHousingByCode(code);
    }

    @Override
    public List<Housinginfo> queryAllList(HousinginfoCustom housinginfoCustom) {
        HousinginfoExample example = new HousinginfoExample();
        HousinginfoExample.Criteria criteria = example.createCriteria();
        if (housinginfoCustom.getParentCode() != null) {
            criteria.andCodeLike(housinginfoCustom.getParentCode() + "%");
        }
        if (housinginfoCustom.getParentId() != null) {
            criteria.andParentIdEqualTo(housinginfoCustom.getParentId());
        }
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
    public boolean insertHousing(Housinginfo housinginfo) {
        String code = getParentCode(housinginfo.getParentId());
        housinginfo.setCode(code);
        int ret = housinginfoMapper.insertSelective(housinginfo);
        if (ret > 0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public boolean updateHousing(Housinginfo housinginfo) {
        Housinginfo oldDept = selectHousinginfoById(housinginfo.getId());
        if (oldDept.getParentId() != housinginfo.getParentId()) {
            String code = getParentCode(housinginfo.getParentId());
            housinginfo.setCode(code);
            //更新用户code
            usersService.updateUserCodeById(housinginfo.getId(), code);
        }
        int ret = housinginfoMapper.updateByPrimaryKeySelective(housinginfo);
        if (ret > 0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public boolean updateHousingByCommunityId(String status, String communityId) {
        Housinginfo housing = new Housinginfo();
        housing.setStatus(status);
        HousinginfoExample example = new HousinginfoExample();
        example.createCriteria().andCommunityIdEqualTo(communityId);
        int ret = housinginfoMapper.updateByExampleSelective(housing, example);
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

    public String getParentCode(Integer parentId) {
        Propertyinfo parent = propertyinfoMapper.selectByPrimaryKey(parentId);
        String maxCode = selectMaxByParentCode(parentId);
        if (maxCode == null) {
            return parent.getCode() + "0001";
        }else {
            return  ApplicationUtils.getOrgCode(maxCode);
        }
    }
}
