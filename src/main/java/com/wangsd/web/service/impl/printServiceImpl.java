package com.wangsd.web.service.impl;

import com.wangsd.web.dao.PrintinfoMapper;
import com.wangsd.web.model.Printinfo;
import com.wangsd.web.model.PrintinfoExample;
import com.wangsd.web.service.PrintService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/11/25.
 */
@Service
public class printServiceImpl implements PrintService {

    @Autowired
    PrintinfoMapper printinfoMapper;

    @Override
    public Printinfo selectPrintinfoBydeptId(Integer deptId) {
        PrintinfoExample printinfoExample = new PrintinfoExample();
        printinfoExample.createCriteria().andDepartmentIdEqualTo(deptId);
        List<Printinfo> list = printinfoMapper.selectByExample(printinfoExample);
        if (list.size() > 0) {
            return list.get(0);
        }
        return null;
    }

    @Override
    public boolean insertPrintinfo(Printinfo printinfo) {
        int deptId = printinfo.getDepartmentId();
        printinfo.setDepartmentId(deptId);
        int ret = printinfoMapper.insertSelective(printinfo);
        if (ret > 0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public boolean updatePrintinfo(Printinfo printinfo) {
        int ret = printinfoMapper.updateByPrimaryKeySelective(printinfo);
        if (ret > 0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public List<Printinfo> selectBystatus(Integer status) {
        PrintinfoExample example = new PrintinfoExample();
        example.createCriteria().andStatusEqualTo(status);
        return printinfoMapper.selectByExample(example);
    }
}
