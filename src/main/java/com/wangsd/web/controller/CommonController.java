package com.wangsd.web.controller;

import com.wangsd.core.entity.JSONResult;
import com.wangsd.core.util.ImportExcelUtil;
import com.wangsd.web.model.Costtype;
import com.wangsd.web.model.Housinginfo;
import com.wangsd.web.modelCustom.MenuCustom;
import com.wangsd.web.modelCustom.UserCustom;
import com.wangsd.web.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;

/**
 * 公共视图控制器
 *
 **/
@Controller
public class CommonController {

    @Autowired
    MenuService menuService;
    @Autowired
    HousinginfoService housinginfoService;
    @Autowired
    RoominfoService roominfoService;
    @Autowired
    BillAccountService billAccountService;
    @Autowired
    CosttypeService costtypeService;
    
    /**
     * 进入首页
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/index")
    public String index(HttpServletRequest request, Model model) {
        UserCustom obj = (UserCustom) request.getSession().getAttribute("userInfo");
        Integer roleId = obj.getRoleId();
        List<MenuCustom> list = menuService.queryMenuByRoleId(roleId);
        model.addAttribute("menuList", list);
        return "/index";
    }

    /**
     * 打开导入房屋Excel页面
     *
     * @param model
     * @return
     */
    @RequestMapping(path = "/openRoomExcel")
    public String openExcel(Model model) {
        return "/roominfo/roomExcel";
    }

    /**
     * 打开导入账单Excel页面
     *
     * @param model
     * @return
     */
    @RequestMapping(path = "/openBillExcel")
    public String openBillExcel(Model model) {
        List<Costtype> costList = costtypeService.queryAllList();
        model.addAttribute("costList", costList);
        return "/billaccount/billExcel";
    }

    /**
     * 导入Excel
     *
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(path = "/uploadExcel")
    @ResponseBody
    public JSONResult uploadExcel(HttpServletRequest request) throws Exception {
        JSONResult jsonResult = new JSONResult();
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        MultipartFile file = multipartRequest.getFile("upfile");
        if (file.isEmpty()) {
            throw new Exception("文件不存在！");
        }
        InputStream in = file.getInputStream();
        List<List<Object>> listob = new ImportExcelUtil().getBankListByExcel(in,file.getOriginalFilename());
        in.close();

        if (listob.size() > 0) {
            String housingName = listob.get(0).get(0).toString();
            Housinginfo housinginfo = housinginfoService.selectHousingByName(housingName);
            if (housinginfo != null) {
                //处理数据
                return roominfoService.importRoominfo(housinginfo.getId(), listob);
            }else {
                jsonResult.setSuccess(false);
                jsonResult.setMessage("小区不存在");
                return jsonResult;
            }
        }else {
            jsonResult.setSuccess(false);
            jsonResult.setMessage("数据为空");
            return jsonResult;
        }
    }

    /**
     * 导入账单Excel
     *
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(path = "/uploadBillExcel")
    @ResponseBody
    public JSONResult uploadBillExcel(HttpServletRequest request) throws Exception {
        JSONResult jsonResult = new JSONResult();
        String costType = request.getParameter("costType");
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        MultipartFile file = multipartRequest.getFile("upfile");
        if (file.isEmpty()) {
            throw new Exception("文件不存在！");
        }
        InputStream in = file.getInputStream();
        List<List<Object>> listob = new ImportExcelUtil().getBankListByExcel(in, file.getOriginalFilename());
        in.close();

        if (listob.size() > 0) {
            String housingName = listob.get(0).get(0).toString();
            Housinginfo housinginfo = housinginfoService.selectHousingByName(housingName);
            if (housinginfo != null) {
                //处理数据
                return billAccountService.importBillaccount(housinginfo.getId(), listob, Integer.parseInt(costType));
            } else {
                jsonResult.setSuccess(false);
                jsonResult.setMessage("小区不存在");
                return jsonResult;
            }
        } else {
            jsonResult.setSuccess(false);
            jsonResult.setMessage("数据为空");
            return jsonResult;
        }
    }
    /**
     * 下载模板
     *
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping("/downloadRoominfo")
    public void downloadRoominfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        BufferedInputStream in = null;
        BufferedOutputStream out = null;
        request.setCharacterEncoding("UTF-8");
        String rootpath = request.getSession().getServletContext().getRealPath("/");
        String fileName = "import.xlsx";
        try {
            File f = new File(rootpath + "download/" + fileName);
            response.setContentType("application/x-excel");
            response.setCharacterEncoding("UTF-8");
            response.setHeader("Content-Disposition", "attachment; filename=" + fileName);
            response.setHeader("Content-Length", String.valueOf(f.length()));
            in = new BufferedInputStream(new FileInputStream(f));
            out = new BufferedOutputStream(response.getOutputStream());
            byte[] data = new byte[1024];
            int len = 0;
            while (-1 != (len = in.read(data, 0, data.length))) {
                out.write(data, 0, len);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (in != null) {
                in.close();
            }
            if (out != null) {
                out.close();
            }
        }
    }

}