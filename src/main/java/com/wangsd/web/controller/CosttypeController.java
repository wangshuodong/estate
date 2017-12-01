package com.wangsd.web.controller;

import com.wangsd.core.entity.JSONResult;
import com.wangsd.web.model.Costtype;
import com.wangsd.web.service.CosttypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Administrator on 2017/11/19.
 */
@Controller
@RequestMapping("/costtype")
public class CosttypeController {

    @Autowired
    CosttypeService costtypeService;

    /**
     * 查询所有费用类型
     *
     * @param model
     * @param session
     * @return
     */
    @RequestMapping(value = "costtypeList")
    public String costtypeList(Model model, HttpSession session) {
        List<Costtype> list = costtypeService.queryAllList();
        model.addAttribute("costtypeList", list);
        return "/costtype/costtype-list";
    }



    /**
     * 打开费用类型页面
     *
     * @param id
     * @param model
     * @param session
     * @return
     */
    @RequestMapping(value = "openCosttype")
    public String openCosttype(Integer id, Model model, HttpSession session) {
        if (id != null) {
            Costtype costtype = costtypeService.selectCosttypeById(id);
            model.addAttribute("costtype", costtype);
        }
        return "/costtype/costtype-info";
    }

    /**
     * 新增或者修改费用类型
     *
     * @param costtype
     * @param model
     * @return
     */
    @RequestMapping(path = "/saveOrUpdateCosttype", method = RequestMethod.POST)
    @ResponseBody
    public JSONResult saveOrUpdateCosttype(Costtype costtype, Model model) {
        boolean bl;
        if (costtype.getId() == null) {  //新增
            bl = costtypeService.insertCosttype(costtype);
        } else { //修改
            bl = costtypeService.updateCosttype(costtype);
        }
        JSONResult jsonResult = new JSONResult();
        jsonResult.setSuccess(bl);
        return jsonResult;
    }

    /**
     * 删除费用类型
     *
     * @param id
     * @return
     */
    @RequestMapping("/deleteCosttype")
    @ResponseBody
    public JSONResult deleteCosttype(Integer id) {
        JSONResult obj = new JSONResult();
        boolean delStatus = costtypeService.deleteCosttypeById(id);
        obj.setSuccess(delStatus);
        return obj;
    }
}
