package com.wangsd.core.util;

import com.alibaba.fastjson.JSONObject;
import com.wangsd.core.util.nuonuo.bean.PrivateData;
import com.wangsd.core.util.nuonuo.bean.PublicData;
import com.wangsd.core.util.nuonuo.bean.RequestMode;
import com.wangsd.core.util.nuonuo.exception.OpensnsException;
import com.wangsd.core.util.nuonuo.service.OpenApiV1;
import com.wangsd.core.util.nuonuo.util.SecurityUtil;
import com.wangsd.core.util.nuonuo.util.ValidataUtil;
import com.wangsd.web.modelCustom.InvoiceTitle;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by wangsd on 2017-12-04.
 */
public class NuoNuoUtil {
    //定义请求头数据
    private Map<String, String> getHeaders() {
        Map<String, String> headers = new HashMap<String, String>();
        headers.put("appKey", StaticVar.nuonuo_appkey); //用户申请的appkey  J2VXxB2h_sbox   CmtXqndv
        headers.put("accessToken", StaticVar.nuonuo_accessToken); //用户Oauth登录后得到的令牌access token
        headers.put("compress", "");//压缩方式：提供GZIP 置空“”不压缩
        headers.put("signMethod", "AES"); //加密方式：提供AES ，不可为空
        headers.put("dataType", "json"); //数据请求格式： JSON/XML
        headers.put("appRate", SecurityUtil.app_rate); //app并发请求数  ，平台默认10如需升级请联系开放平台
        return headers;
    }

    //定义请求体中的公共数据
    private PublicData getPublicData() {
        PublicData pdData = new PublicData();
        pdData.setVersion("1.0"); //API版本
        pdData.setTimestamp(String.valueOf(System.currentTimeMillis()));
        pdData.setMethod("nuonuo.electronInvoice.requestBilling");//API名称
        return pdData;
    }

    private RequestMode getRequestMode(PublicData pdata, PrivateData<Object> pvData) {
        RequestMode requestMode = new RequestMode();
        requestMode.setPrivate(pvData);
        requestMode.setPublic(pdata);
        return requestMode;
    }

    public String send(InvoiceTitle invoiceTitle) {
        Map<String, String> headers = getHeaders();
        PublicData pdData = getPublicData();
        PrivateData<Object> pvData = new PrivateData<Object>();
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        Map<String, Object> map_s = new HashMap<String, Object>();

        map_s.put("order", invoiceTitle);
        list.add(map_s);
        pvData.setServicedata(list);
        RequestMode requestMode = getRequestMode(pdData, pvData);
        OpenApiV1 sdk = new OpenApiV1();
        String result = "";
        try {
            result = sdk.handle(SecurityUtil.url, headers, requestMode);
            if (!ValidataUtil.isEmpty(result)) {
                System.out.println("服务端的响应：" + result);
                JSONObject data = JSONObject.parseObject(result);
                if ("E0000".equals(data.getString("code"))) {
                    return data.getJSONObject("result").getString("invoiceSerialNum");
                }
            }
        } catch (OpensnsException e) {
            System.out.printf("Request failed 【" + e.getErrorCode() + ":" + e.getMessage() + "】");
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        NuoNuoUtil nuoNuoUtil = new NuoNuoUtil();
        Map<String, String> headers = nuoNuoUtil.getHeaders();
        PublicData pdData = nuoNuoUtil.getPublicData();
        PrivateData<Object> pvData = new PrivateData<Object>();
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        List<Map<String, Object>> list_invoiceDetail = new ArrayList<Map<String, Object>>();
        Map<String, Object> map_s = new HashMap<String, Object>();
        Map<String, Object> map_order = new HashMap<String, Object>();
        Map<String, Object> map_invoiceDetails = new HashMap<String, Object>();
        Map<String, Object> map_invoiceDetails2 = new HashMap<String, Object>();

        map_order.put("buyerName", "个人");//购方名称 浙江爱信诺航天信息有限公司
        //map_order.put("buyerTaxNum", "110101TRDX8RQU1");//购方税号（企业要填，个人可为空）
        map_order.put("buyerPhone", "17784495260");//购方手机（开票成功会短信提醒购方，不受推送方式影响）
//        map_order.put("buyerAddress", "333");//购方地址（企业要填，个人可为空）
//        map_order.put("buyerAccount", "333");//购方银行账号及开户行地址（企业要填，个人可为空）
        map_order.put("orderNo", System.currentTimeMillis() + "001");//订单号（每个企业唯一）
        map_order.put("invoiceDate", DateUtils.getCurDatetime());//订单时间
        map_order.put("clerk", "袁牧庆");//开票员
        //map_order.put("salerAccount", "19000901040005646农行学院路支行");//(可选)销方银行账号和开户行地址
        map_order.put("salerTel", "0571-87022168");//销方电话
        map_order.put("salerAddress", "杭州市西湖区学院路159号9楼12楼");//销方地址
        map_order.put("salerTaxNum", "91330106143198931H");//销方税号
        map_order.put("invoiceType", "1");//开票类型:1,正票;2,红票
        //map_order.put("remark", "开票机号为02 请前往诺诺网(www.jss.com.cn)查询发票详情");//(可选)冲红时，在备注中注明“对应正数发票代码:XXXXXXXXX号码:YYYYYYYY”文案，其中“X”为发票代码，“Y”为发票号码，可以不填，接口会自动添加该文案
        //map_order.put("payee", "络克");//收款人(可选)
        //map_order.put("checker", "朱燕");//复核人(可选)
        //map_order.put("invoiceCode", "11");//(可选)冲红时填写的对应蓝票发票代码（红票必填，不满12位请左补0）
        //map_order.put("invoiceNum", "11");//(可选)冲红时填写的对应蓝票发票号码（红票必填，不满8位请左补0）
        map_order.put("pushMode", "1");//推送方式(可选):-1,不推送;0,邮箱;1,手机（默认）;2,邮箱、手机
//        map_order.put("email", "122@qq.com");//(可选)推送邮箱（pushMode为0或2时，此项为必填）
//        map_order.put("listFlag", "0");
//        map_order.put("listName", "1111");
//        map_order.put("buyerTel", "0571-88888888");//购方电话
//        map_order.put("proxyInvoiceFlag", "0");
//        map_order.put("departmentId", null);
//        map_order.put("clerkId", null);
        //电子发票明细，支持填写商品明细最大100行（包含折扣行、被折扣行）
        map_invoiceDetails.put("goodsName", "物业管理费");//商品名称（如invoiceLineProperty =1，则此商品行为折扣行，折扣行不允许多行折扣，折扣行必须紧邻被折扣行，商品名称必须与被折扣行一致）
        map_invoiceDetails.put("num", "1");//数量（冲红时项目数量为负数）
        map_invoiceDetails.put("withTaxFlag", "1");//单价含税标志，0:不含税,1:含税
        map_invoiceDetails.put("price", "1");//单价金额
        map_invoiceDetails.put("taxRate", "0.06");//税率
        map_invoiceDetails2.put("goodsName", "水费");//商品名称（如invoiceLineProperty =1，则此商品行为折扣行，折扣行不允许多行折扣，折扣行必须紧邻被折扣行，商品名称必须与被折扣行一致）
        map_invoiceDetails2.put("num", "1");
        map_invoiceDetails2.put("withTaxFlag", "1");//单价含税标志，0:不含税,1:含税
        map_invoiceDetails2.put("price", "1");//单价
        map_invoiceDetails2.put("taxRate", "0.03");//税率
//        map_invoiceDetails.put("specType", "1");//规格型号
//        map_invoiceDetails.put("unit", "1");//单位
//        map_invoiceDetails.put("goodsCode", "1090511030000000000");
//        map_invoiceDetails.put("selfCode", null);
//        map_invoiceDetails.put("invoiceLineProperty", "0");
//        map_invoiceDetails.put("favouredPolicyFlag", "0");
//        map_invoiceDetails.put("favouredPolicyName", null);
//        map_invoiceDetails.put("zeroRateFlag", null);
//        map_invoiceDetails.put("deduction", null);
//        map_invoiceDetails.put("tax", "6.8");
//        map_invoiceDetails.put("taxIncludedAmount", "46.79");
//        map_invoiceDetails.put("taxExcludedAmount", "39.99");
        list_invoiceDetail.add(map_invoiceDetails);
        list_invoiceDetail.add(map_invoiceDetails2);
        map_order.put("invoiceDetail", list_invoiceDetail);
        map_s.put("order", map_order);
        list.add(map_s);
        pvData.setServicedata(list);
        RequestMode requestMode = nuoNuoUtil.getRequestMode(pdData, pvData);
        OpenApiV1 sdk = new OpenApiV1();
        String result = "";
        try {
            //调用服务
            result = sdk.handle(SecurityUtil.url, headers, requestMode);
            if (!ValidataUtil.isEmpty(result)) {
                System.out.println("服务端的响应：" + result);
            }
        } catch (OpensnsException e) {
            System.out.printf("Request failed 【" + e.getErrorCode() + ":" + e.getMessage() + "】");
            e.printStackTrace();
        }
    }
}
