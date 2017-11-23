package com.wangsd.web.controller;

import com.wangsd.core.entity.JSONResult;
import com.wangsd.core.util.ImportExcelUtil;
import com.wangsd.core.util.InfoVo;
import com.wangsd.web.model.Roominfo;
import com.wangsd.web.modelCustom.HousinginfoCustom;
import com.wangsd.web.modelCustom.ParentCustom;
import com.wangsd.web.modelCustom.RoominfoCustom;
import com.wangsd.web.modelCustom.UserCustom;
import com.wangsd.web.service.AlipayService;
import com.wangsd.web.service.HousinginfoServic;
import com.wangsd.web.service.RoominfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 房屋信息Controller
 */
@Controller
@RequestMapping("/roominfo")
public class RoominfoController {

    @Autowired
    RoominfoService roominfoService;
    @Autowired
    HousinginfoServic housinginfoServic;
    @Autowired
    AlipayService alipayService;


    /**
     * 查询房间列表
     *
     * @param query
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/roominfoList")
    public String roominfoList(RoominfoCustom query, HttpServletRequest request, Model model) {
        UserCustom loginUser = (UserCustom) request.getSession().getAttribute("userInfo");
        List<ParentCustom> parentList = housinginfoServic.queryParentHousingByCode(loginUser.getParentCode());
        model.addAttribute("parentList", parentList);
        query.setHousingCode(loginUser.getParentCode());
        List<RoominfoCustom> list = roominfoService.queryRoominfoList(query);
        model.addAttribute("roominfoList", list);
        model.addAttribute("query", query);
        return "/roominfo/roominfo-list";
    }

    /**
     * 打开info页面
     *
     * @param id
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/openRoominfo")
    public String openRoominfo(Integer id, HttpServletRequest request, Model model) {
        UserCustom loginUser = (UserCustom) request.getSession().getAttribute("userInfo");
        List<ParentCustom> parentList = housinginfoServic.queryParentHousingByCode(loginUser.getParentCode());
        model.addAttribute("parentList", parentList);
        if (id != null) {
            Roominfo roominfo = roominfoService.selectRoominfoById(id);
            model.addAttribute("roominfo", roominfo);
        }
        return "/roominfo/roominfo-info";
    }

    /**
     * 删除房间信息
     *
     * @param id
     * @param session
     * @return
     */
    @RequestMapping("/deleteRoominfo")
    @ResponseBody
    public JSONResult deleteRoominfo(Integer id, HttpSession session) {
        //获取公钥 私钥
        UserCustom loginUser = (UserCustom) session.getAttribute("userInfo");
        Roominfo roominfo = roominfoService.selectRoominfoById(id);
        if (roominfo.getStatus()) { //已同步
            HousinginfoCustom housing = housinginfoServic.selectHousingCustomById(roominfo.getParentId());
            List<String> roomids = new ArrayList<>();
            roomids.add(roominfo.getId().toString());
            alipayService.roominfoDeleteRequest(housing.getCommunityId(), roomids, housing.getToken(), loginUser);
        }
        boolean bl = roominfoService.deleteRoominfo(id);
        JSONResult obj = new JSONResult();
        obj.setSuccess(bl);
        return obj;
    }

    /**
     * 保存房间信息
     *
     * @param roominfo
     * @return
     */
    @RequestMapping(path = "/saveOrUpdateRoominfo", method = RequestMethod.POST)
    @ResponseBody
    public JSONResult saveOrUpdateRoominfo(Roominfo roominfo) {
        boolean bl;
        roominfo.setAddress(roominfo.getGroupName() + roominfo.getBuilding() + roominfo.getUnit() + roominfo.getRoom());
        if (roominfo.getId() == null) {
            roominfo.setCreateTime(new Date());
            bl = roominfoService.insertRoominfo(roominfo);
        } else {
            bl = roominfoService.updateRoominfo(roominfo);
        }
        JSONResult obj = new JSONResult();
        obj.setSuccess(bl);
        return obj;
    }

    /**
     * 根据小区查询房间
     *
     * @param housingId
     * @return
     */
    @RequestMapping(path = "/queryParentRoomById")
    @ResponseBody
    public List<ParentCustom> queryParentRoomById(Integer housingId) {
        return roominfoService.queryParentRoomById(housingId);
    }

    /**
     * 打开导入Excel页面
     *
     * @param model
     * @return
     */
    @RequestMapping(path = "/openExcel")
    public String openExcel(Model model) {
        return "/roominfo/roomExcel";
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
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        MultipartFile file = multipartRequest.getFile("upfile");
        if (file.isEmpty()) {
            throw new Exception("文件不存在！");
        }
        InputStream in = file.getInputStream();
        List<List<Object>> listob = new ImportExcelUtil().getBankListByExcel(in,file.getOriginalFilename());
        //List<List<Object>> listob = ExcelUtils.getBankListByExcel(in, file.getOriginalFilename());
        in.close();

        //该处可调用service相应方法进行数据保存到数据库中，现只对数据输出
        for (int i = 0; i < listob.size(); i++) {
            List<Object> lo = listob.get(i);
            InfoVo vo = new InfoVo();
            vo.setCode(String.valueOf(lo.get(0)));
            vo.setName(String.valueOf(lo.get(4)));
            vo.setDate(String.valueOf(lo.get(5)));

            System.out.println("打印信息-->机构:" + vo.getCode() + "  名称：" + vo.getName() + "   时间：" + vo.getDate() + "   资产：" + vo.getMoney());
        }
        return null;
    }

    @RequestMapping(path = "/uploadExcel2")
    @ResponseBody
    public JSONResult uploadExcel2(@RequestParam(value = "excelRoomInfoFile") MultipartFile file,
                                   HttpServletRequest request, ModelMap model) throws Exception {
        String name = file.getOriginalFilename();
        List<ArrayList<String>> listob = new ExcelRead().readExcel(file);

//        //该处可调用service相应方法进行数据保存到数据库中，现只对数据输出
//        for (int i = 0; i < listob.size(); i++) {
//            List<Object> lo = listob.get(i);
//            InfoVo vo = new InfoVo();
//            vo.setCode(String.valueOf(lo.get(0)));
//            vo.setName(String.valueOf(lo.get(4)));
//            vo.setDate(String.valueOf(lo.get(5)));
//
//            System.out.println("打印信息-->机构:" + vo.getCode() + "  名称：" + vo.getName() + "   时间：" + vo.getDate() + "   资产：" + vo.getMoney());
//        }
        return null;
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
        String fileName = "roominfo.xlsx";
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
