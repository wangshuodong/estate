package com.wangsd.web.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.domain.CplifeRoomInfoResp;
import com.alipay.api.request.*;
import com.alipay.api.response.*;
import com.wangsd.core.entity.JSONResult;
import com.wangsd.core.util.StaticVar;
import com.wangsd.web.model.Billaccount;
import com.wangsd.web.model.Housinginfo;
import com.wangsd.web.model.Roominfo;
import com.wangsd.web.modelCustom.BillAccountCustom;
import com.wangsd.web.modelCustom.HousinginfoCustom;
import com.wangsd.web.modelCustom.RoominfoCustom;
import com.wangsd.web.modelCustom.UserCustom;
import com.wangsd.web.service.AlipayService;
import com.wangsd.web.service.BillAccountService;
import com.wangsd.web.service.HousinginfoService;
import com.wangsd.web.service.RoominfoService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/11/17.
 */
@Service
public class AlipayServiceImpl implements AlipayService {

    private static final Logger logger = LogManager.getLogger(AlipayServiceImpl.class.getName());

    @Autowired
    HousinginfoService housinginfoService;
    @Autowired
    RoominfoService roominfoService;
    @Autowired
    BillAccountService billAccountService;

    /**
     * 同步小区到支付宝
     *
     * @param housing
     * @param token
     * @param loginUser
     * @return
     */
    @Override
    public JSONResult communityCreateRequest(HousinginfoCustom housing, String token, UserCustom loginUser) {
        JSONResult jsonResult = new JSONResult();
        AlipayClient alipayClient = new DefaultAlipayClient(StaticVar.serverUrl, loginUser.getAppId(), loginUser.getMerchantPrivateKey(),
                StaticVar.format, StaticVar.charset, loginUser.getAlipayPublicKey(), StaticVar.sign_type);
        AlipayEcoCplifeCommunityCreateRequest request = new AlipayEcoCplifeCommunityCreateRequest();
        JSONObject bizContent = new JSONObject();
        bizContent.put("community_name", housing.getName());
        bizContent.put("community_address", housing.getAddress());
        bizContent.put("district_code", housing.getDistrictCode());
        bizContent.put("city_code", housing.getCityCode());
        bizContent.put("province_code", housing.getProvinceCode());
        JSONArray array = new JSONArray();
        array.add(housing.getCommunityLocations());
        bizContent.put("community_locations", array);
        bizContent.put("hotline", housing.getHotline());
        bizContent.put("out_community_id", housing.getId());
        request.setBizContent(bizContent.toString());
        if (token != null) {
            request.putOtherTextParam("app_auth_token", token);
        }
        try {
            AlipayEcoCplifeCommunityCreateResponse response = alipayClient.execute(request);
            logger.debug("----response----" + response.getBody());
            if ("10000".equals(response.getCode())) {
                logger.debug("调用成功");
                //执行成功返回支付宝的小区统一编号和状态
                housing.setCommunityId(response.getCommunityId());
                housing.setStatus(StaticVar.HOUSING_STATUS2);
                housinginfoService.updateHousing(housing);
                jsonResult.setMessage("同步成功");
                jsonResult.setSuccess(true);
            } else {
                jsonResult.setMessage(response.getSubMsg());
                jsonResult.setSuccess(false);
                logger.info("调用失败");
            }
        } catch (AlipayApiException e) {
            jsonResult.setSuccess(false);
            logger.info("系统异常");
            logger.info(e.getMessage());
            e.printStackTrace();
        }
        return jsonResult;
    }

    /**
     * 变更物业小区信息
     *
     * @param housing
     * @param token
     * @param loginUser
     * @return
     */
    @Override
    public boolean communityModifyRequest(Housinginfo housing, String token, UserCustom loginUser) {
        AlipayClient alipayClient = new DefaultAlipayClient(StaticVar.serverUrl, loginUser.getAppId(), loginUser.getMerchantPrivateKey(),
                StaticVar.format, StaticVar.charset, loginUser.getAlipayPublicKey(), StaticVar.sign_type);
        AlipayEcoCplifeCommunityModifyRequest request = new AlipayEcoCplifeCommunityModifyRequest();
        JSONObject bizContent = new JSONObject();
        bizContent.put("community_name", housing.getName());
        bizContent.put("community_address", housing.getAddress());
        bizContent.put("district_code", housing.getDistrictCode());
        bizContent.put("city_code", housing.getCityCode());
        bizContent.put("province_code", housing.getProvinceCode());
        bizContent.put("community_locations", housing.getCommunityLocations());
        bizContent.put("hotline", housing.getHotline());
        bizContent.put("out_community_id", housing.getId());
        request.setBizContent(bizContent.toString());
        if (token != null) {
            request.putOtherTextParam("app_auth_token", token);
        }
        try {
            AlipayEcoCplifeCommunityModifyResponse response = alipayClient.execute(request);
            logger.debug("----response----" + response.getBody());
            if ("10000".equals(response.getCode())) {
                logger.debug("调用成功");
                //执行成功返回支付宝的小区统一编号和状态
                return true;
            } else {
                logger.info("调用失败");
            }
        } catch (AlipayApiException e) {
            logger.info(e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    /**
     * 查询单个物业小区信息
     *
     * @param community_id
     * @param token
     * @param loginUser
     * @return
     */
    public String communityDetailsQueryRequest(String community_id, String token, UserCustom loginUser) {
        AlipayClient alipayClient = new DefaultAlipayClient(StaticVar.serverUrl, loginUser.getAppId(), loginUser.getMerchantPrivateKey(),
                StaticVar.format, StaticVar.charset, loginUser.getAlipayPublicKey(), StaticVar.sign_type);
        AlipayEcoCplifeCommunityDetailsQueryRequest request = new AlipayEcoCplifeCommunityDetailsQueryRequest();
        JSONObject bizContent = new JSONObject();
        bizContent.put("community_id", community_id);
        request.setBizContent(bizContent.toString());
        if (token != null) {
            request.putOtherTextParam("app_auth_token", token);
        }
        try {
            AlipayEcoCplifeCommunityDetailsQueryResponse response = alipayClient.execute(request);
            logger.debug("----response----" + response.getBody());
            if ("10000".equals(response.getCode())) {
                logger.debug("调用成功");
                //执行成功返回支付宝推广二维码图片链接
                String codeImage = response.getQrCodeImage();
                if (codeImage == null) {
                    JSONObject jsonObject = JSONObject.parseObject(response.getBody());
                    JSONObject room_info_set = (JSONObject) jsonObject.get("alipay_eco_cplife_community_details_query_response");
                    JSONArray array = (JSONArray)room_info_set.get("community_services");
                    if (array.size() > 0) {
                            JSONObject object = array.getJSONObject(0);
                            codeImage = object.get("qr_code_image").toString();
                    }
                }
                return codeImage;
            } else {
                logger.info("调用失败");
            }
        } catch (AlipayApiException e) {
            logger.info(e.getMessage());
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 批量查询支付宝小区编号
     *
     * @param status
     * @param token
     * @param loginUser
     * @return
     */
    public void communityBatchqueryRequest(String status, String token, UserCustom loginUser) {
        AlipayClient alipayClient = new DefaultAlipayClient(StaticVar.serverUrl, loginUser.getAppId(), loginUser.getMerchantPrivateKey(),
                StaticVar.format, StaticVar.charset, loginUser.getAlipayPublicKey(), StaticVar.sign_type);
        AlipayEcoCplifeCommunityBatchqueryRequest request = new AlipayEcoCplifeCommunityBatchqueryRequest();
        if (status != null) {
            JSONObject bizContent = new JSONObject();
            bizContent.put("status", status);
            request.setBizContent(bizContent.toString());
        }
        if (token != null) {
            request.putOtherTextParam("app_auth_token", token);
        }
        try {
            AlipayEcoCplifeCommunityBatchqueryResponse response = alipayClient.execute(request);
            logger.debug("----response----" + response.getBody());
            if ("10000".equals(response.getCode())) {
                logger.debug("调用成功");
                //执行成功返回支付宝的小区统一编号和状态
            } else {
                logger.info("调用失败");
            }
        } catch (AlipayApiException e) {
            logger.info(e.getMessage());
            e.printStackTrace();
        }
    }

    @Override
    public boolean basicserviceInitializeRequest(String community_id, String token, UserCustom loginUser) {
        AlipayClient alipayClient = new DefaultAlipayClient(StaticVar.serverUrl, loginUser.getAppId(), loginUser.getMerchantPrivateKey(),
                StaticVar.format, StaticVar.charset, loginUser.getAlipayPublicKey(), StaticVar.sign_type);
        AlipayEcoCplifeBasicserviceInitializeRequest request = new AlipayEcoCplifeBasicserviceInitializeRequest();
        JSONObject bizContent = new JSONObject();
        bizContent.put("community_id", community_id);
        bizContent.put("service_type", "PROPERTY_PAY_BILL_MODE");
        bizContent.put("external_invoke_address", "https://www.alipayjf.com/rest/page/alipay_estate_return");
        request.setBizContent(bizContent.toString());
        if (token != null) {
            request.putOtherTextParam("app_auth_token", token);
        }
        try {
            AlipayEcoCplifeBasicserviceInitializeResponse response = alipayClient.execute(request);
            logger.debug("----response----" + response.getBody());
            if ("10000".equals(response.getCode())) {
                logger.debug("调用成功");
                return housinginfoService.updateHousingByCommunityId(StaticVar.HOUSING_STATUS3, community_id);
            } else {
                logger.info("调用失败");
            }
        } catch (AlipayApiException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean basicserviceModifyRequest(String community_id, String status, String token, UserCustom loginUser) {
        AlipayClient alipayClient = new DefaultAlipayClient(StaticVar.serverUrl, loginUser.getAppId(), loginUser.getMerchantPrivateKey(),
                StaticVar.format, StaticVar.charset, loginUser.getAlipayPublicKey(), StaticVar.sign_type);
        AlipayEcoCplifeBasicserviceModifyRequest request = new AlipayEcoCplifeBasicserviceModifyRequest();
        JSONObject bizContent = new JSONObject();
        bizContent.put("community_id", community_id);
        bizContent.put("service_type", "PROPERTY_PAY_BILL_MODE");
        bizContent.put("status", status);
        bizContent.put("external_invoke_address", "https://www.alipayjf.com/rest/page/alipay_estate_return");
        request.setBizContent(bizContent.toString());
        if (token != null) {
            request.putOtherTextParam("app_auth_token", token);
        }
        try {
            AlipayEcoCplifeBasicserviceModifyResponse response = alipayClient.execute(request);
            logger.debug("----response----" + response.getBody());
            if ("10000".equals(response.getCode())) {
                logger.debug("调用成功");
                return housinginfoService.updateHousingByCommunityId(StaticVar.HOUSING_STATUS4, community_id);
            } else {
                logger.info("调用失败");
            }
        } catch (AlipayApiException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public JSONResult roominfoUploadRequest(String community_id, List<RoominfoCustom> roominfos, String token, UserCustom loginUser) {
        JSONResult jsonResult = new JSONResult();
        AlipayClient alipayClient = new DefaultAlipayClient(StaticVar.serverUrl, loginUser.getAppId(), loginUser.getMerchantPrivateKey(),
                StaticVar.format, StaticVar.charset, loginUser.getAlipayPublicKey(), StaticVar.sign_type);
        AlipayEcoCplifeRoominfoUploadRequest request = new AlipayEcoCplifeRoominfoUploadRequest();
        JSONObject bizContent = new JSONObject();
        bizContent.put("batch_id", Long.valueOf(System.currentTimeMillis()));
        bizContent.put("community_id", community_id);
        JSONArray jsonArray = new JSONArray();
        for (Roominfo room : roominfos) {
            JSONObject room_info_set = new JSONObject();
            room_info_set.put("out_room_id", room.getId().toString());
            if (room.getGroupName() != null && !"".equals(room.getGroupName())) {
                room_info_set.put("group", room.getGroupName());
            }
            room_info_set.put("building", room.getBuilding());
            if (room.getUnit() != null && !"".equals(room.getUnit())) {
                room_info_set.put("unit", room.getUnit());
            }
            room_info_set.put("room", room.getRoom());
            room_info_set.put("address", room.getAddress());
            jsonArray.add(room_info_set);
        }
        bizContent.put("room_info_set", jsonArray);
        request.setBizContent(bizContent.toString());
        if (token != null) {
            request.putOtherTextParam("app_auth_token", token);
        }
        System.out.println(bizContent.toJSONString());
        try {
            AlipayEcoCplifeRoominfoUploadResponse response = alipayClient.execute(request);
            logger.debug("----response----" + response.getBody());
            if ("10000".equals(response.getCode())) {
                logger.debug("调用成功");
                //执行成功返回支付宝房间编号和系统房间编号
                List<CplifeRoomInfoResp> roomInfoSet = response.getRoomInfoSet();
                for (CplifeRoomInfoResp cprifr : roomInfoSet) {
                    Roominfo roominfo = new Roominfo();
                    roominfo.setId(Integer.parseInt(cprifr.getOutRoomId()));//商户系统小区房屋唯一ID标示.
                    roominfo.setRoomId(cprifr.getRoomId());//支付宝系统房间唯一标示.
                    roominfo.setStatus(true);//同步状态
                    roominfoService.updateRoominfo(roominfo);
                }
                jsonResult.setMessage("同步成功");
                jsonResult.setSuccess(true);
            } else {
                jsonResult.setMessage(response.getSubMsg());
                jsonResult.setSuccess(false);
                logger.info("调用失败");
            }
        } catch (AlipayApiException e) {
            jsonResult.setMessage("系统异常");
            jsonResult.setSuccess(false);
            logger.info(e.getMessage());
            e.printStackTrace();
        }
        return jsonResult;
    }

    @Override
    public boolean roominfoDeleteRequest(String community_id, List<String> roominfoid, String token, UserCustom loginUser) {
        AlipayClient alipayClient = new DefaultAlipayClient(StaticVar.serverUrl, loginUser.getAppId(), loginUser.getMerchantPrivateKey(),
                StaticVar.format, StaticVar.charset, loginUser.getAlipayPublicKey(), StaticVar.sign_type);
        AlipayEcoCplifeRoominfoDeleteRequest request = new AlipayEcoCplifeRoominfoDeleteRequest();
        JSONObject bizContent = new JSONObject();
        bizContent.put("batch_id", Long.valueOf(System.currentTimeMillis()));
        bizContent.put("community_id", community_id);
        bizContent.put("out_room_id_set", roominfoid);
        request.setBizContent(bizContent.toString());
        if (token != null) {
            request.putOtherTextParam("app_auth_token", token);
        }
        try {
            AlipayEcoCplifeRoominfoDeleteResponse response = alipayClient.execute(request);
            logger.debug("----response----" + response.getBody());
            if ("10000".equals(response.getCode())) {
                logger.debug("调用成功");
                return true;
            } else {
                logger.info("调用失败");
            }
        } catch (AlipayApiException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public void roominfoQueryRequest(String community_id, String token, UserCustom loginUser) {
        AlipayClient alipayClient = new DefaultAlipayClient(StaticVar.serverUrl, loginUser.getAppId(), loginUser.getMerchantPrivateKey(),
                StaticVar.format, StaticVar.charset, loginUser.getAlipayPublicKey(), StaticVar.sign_type);
        AlipayEcoCplifeRoominfoQueryRequest request = new AlipayEcoCplifeRoominfoQueryRequest();
        JSONObject bizContent = new JSONObject();
        bizContent.put("community_id", community_id);
        request.setBizContent(bizContent.toString());
        if (token != null) {
            request.putOtherTextParam("app_auth_token", token);
        }
        try {
            AlipayEcoCplifeRoominfoQueryResponse response = alipayClient.execute(request);
            logger.debug("----response----" + response.getBody());
            if ("10000".equals(response.getCode())) {
                logger.debug("调用成功");
            } else {
                logger.info("调用失败");
            }
        } catch (AlipayApiException e) {
            e.printStackTrace();
        }
    }

    @Override
    public JSONResult billBatchUploadRequest(String community_id, List<BillAccountCustom> billList, String token, UserCustom loginUser) {
        JSONResult jsonResult = new JSONResult();
        AlipayClient alipayClient = new DefaultAlipayClient(StaticVar.serverUrl, loginUser.getAppId(), loginUser.getMerchantPrivateKey(),
                StaticVar.format, StaticVar.charset, loginUser.getAlipayPublicKey(), StaticVar.sign_type);
        AlipayEcoCplifeBillBatchUploadRequest request = new AlipayEcoCplifeBillBatchUploadRequest();
        JSONObject bizContent = new JSONObject();
        bizContent.put("batch_id", Long.valueOf(System.currentTimeMillis()));
        bizContent.put("community_id", community_id);
        JSONArray jsonArray = new JSONArray();
        for (BillAccountCustom billaccount : billList) {
            JSONObject room_info_set = new JSONObject();
            room_info_set.put("bill_entry_id", billaccount.getId());
            room_info_set.put("out_room_id", billaccount.getRoominfoId());
            room_info_set.put("cost_type", billaccount.getCostTypeName());
            room_info_set.put("bill_entry_amount", billaccount.getBillEntryAmount());
            room_info_set.put("acct_period", billaccount.getAcctPeriod());
            room_info_set.put("release_day", billaccount.getReleaseDay());
            room_info_set.put("deadline", billaccount.getDeadline());
            if (billaccount.getOwnerName() != null && !"".equals(billaccount.getOwnerName())) {
                room_info_set.put("remark_str", billaccount.getOwnerName());
            }
            jsonArray.add(room_info_set);
        }
        bizContent.put("bill_set", jsonArray);
        request.setBizContent(bizContent.toString());
        if (token != null) {
            request.putOtherTextParam("app_auth_token", token);
        }
        logger.debug("----bizContent----" + bizContent.toString());
        try {
            AlipayEcoCplifeBillBatchUploadResponse response = alipayClient.execute(request);
            logger.debug("----response----" + response.getBody());
            if ("10000".equals(response.getCode())) {
                logger.debug("调用成功");
                for (BillAccountCustom billaccount : billList) {
                    billaccount.setStatus(true);
                    billAccountService.updateBillaccount(billaccount);
                }
                jsonResult.setMessage("同步成功");
                jsonResult.setSuccess(true);
            } else {
                jsonResult.setMessage(response.getSubMsg());
                jsonResult.setSuccess(false);
                logger.info("调用失败");
            }
        } catch (AlipayApiException e) {
            jsonResult.setMessage("系统异常");
            jsonResult.setSuccess(false);
            e.printStackTrace();
        }
        return jsonResult;
    }

    public boolean billModifyRequest(String community_id, List<BillAccountCustom> billList, String token, UserCustom loginUser) {
        AlipayClient alipayClient = new DefaultAlipayClient(StaticVar.serverUrl, loginUser.getAppId(), loginUser.getMerchantPrivateKey(),
                StaticVar.format, StaticVar.charset, loginUser.getAlipayPublicKey(), StaticVar.sign_type);
        AlipayEcoCplifeBillModifyRequest request = new AlipayEcoCplifeBillModifyRequest();
        JSONObject bizContent = new JSONObject();
        bizContent.put("batch_id", Long.valueOf(System.currentTimeMillis()));
        bizContent.put("community_id", community_id);
        JSONArray jsonArray = new JSONArray();
        for (BillAccountCustom billaccount : billList) {
            JSONObject room_info_set = new JSONObject();
            room_info_set.put("bill_entry_id", billaccount.getId());
            if (billaccount.getCostType() != null) {
                room_info_set.put("cost_type", billaccount.getCostTypeName());
            }
            room_info_set.put("bill_entry_amount", billaccount.getBillEntryAmount());
            room_info_set.put("acct_period", billaccount.getAcctPeriod());
            room_info_set.put("release_day", billaccount.getReleaseDay());
            room_info_set.put("deadline", billaccount.getDeadline());
            if (billaccount.getOwnerName() != null) {
                room_info_set.put("remark_str", billaccount.getOwnerName());
            }
            jsonArray.add(room_info_set);
        }
        bizContent.put("bill_entry_list", jsonArray);
        request.setBizContent(bizContent.toString());
        if (token != null) {
            request.putOtherTextParam("app_auth_token", token);
        }
        try {
            AlipayEcoCplifeBillModifyResponse response = alipayClient.execute(request);
            logger.debug("----response----" + response.getBody());
            if ("10000".equals(response.getCode())) {
                logger.debug("调用成功");
                return true;
            } else {
                logger.info("调用失败");
                return false;
            }
        } catch (AlipayApiException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * 物业费账单数据批量查询
     * @param community_id
     * @param billaccount
     * @param token
     * @param loginUser
     */
    public void billBatchqueryRequest(String community_id, Billaccount billaccount, String token, UserCustom loginUser) {
        AlipayClient alipayClient = new DefaultAlipayClient(StaticVar.serverUrl, loginUser.getAppId(), loginUser.getMerchantPrivateKey(),
                StaticVar.format, StaticVar.charset, loginUser.getAlipayPublicKey(), StaticVar.sign_type);
        AlipayEcoCplifeBillBatchqueryRequest request = new AlipayEcoCplifeBillBatchqueryRequest();
        JSONObject bizContent = new JSONObject();
        bizContent.put("community_id", community_id);
        if (billaccount.getRoominfoId() != null) {
            bizContent.put("out_room_id", billaccount.getRoominfoId());
        }
        request.setBizContent(bizContent.toString());
        if (token != null) {
            request.putOtherTextParam("app_auth_token", token);
        }
        try {
            AlipayEcoCplifeBillBatchqueryResponse response = alipayClient.execute(request);
            logger.debug("----response----" + response.getBody());
            if ("10000".equals(response.getCode())) {
                logger.debug("调用成功");
            } else {
                logger.info("调用失败");
            }
        } catch (AlipayApiException e) {
            e.printStackTrace();
        }
    }

    /**
     * 删除已上传的物业账单数据
     *
     * @param community_id
     * @param bill_entry_id_list
     * @param token
     * @param loginUser
     * @return
     */
    @Override
    public boolean billDeleteRequest(String community_id, List<String> bill_entry_id_list, String token, UserCustom loginUser) {
        AlipayClient alipayClient = new DefaultAlipayClient(StaticVar.serverUrl, loginUser.getAppId(), loginUser.getMerchantPrivateKey(),
                StaticVar.format, StaticVar.charset, loginUser.getAlipayPublicKey(), StaticVar.sign_type);
        boolean retStatus = false;
        AlipayEcoCplifeBillDeleteRequest request = new AlipayEcoCplifeBillDeleteRequest();
        JSONObject bizContent = new JSONObject();
        bizContent.put("community_id", community_id);
        bizContent.put("bill_entry_id_list", bill_entry_id_list);
        request.setBizContent(bizContent.toString());
        if (token != null) {
            request.putOtherTextParam("app_auth_token", token);
        }
        try {
            AlipayEcoCplifeBillDeleteResponse response = alipayClient.execute(request);
            logger.debug("----response----" + response.getBody());
            if ("10000".equals(response.getCode())) {
                logger.debug("调用成功");
                retStatus = true;
            } else {
                logger.info("调用失败");
                retStatus = false;
            }
        } catch (AlipayApiException e) {
            e.printStackTrace();
        }
        return retStatus;
    }

    @Override
    public void invoiceTitleListGetRequest(String user_id, String appid, String privateKey, String publicKey, String token) {
        AlipayClient alipayClient = new DefaultAlipayClient(StaticVar.serverUrl, appid, privateKey,
                StaticVar.format, StaticVar.charset, publicKey, StaticVar.sign_type);
        AlipayEbppInvoiceTitleListGetRequest request = new AlipayEbppInvoiceTitleListGetRequest();
        JSONObject bizContent = new JSONObject();
        bizContent.put("user_id", user_id);
        if (token != null) {
            request.putOtherTextParam("app_auth_token", token);
        }
        try {
            AlipayEbppInvoiceTitleListGetResponse response = alipayClient.execute(request, "authusrB8cb0f2bc71ad40d0af96374441056X44");
            logger.debug("----response----" + response.getBody());
            if ("10000".equals(response.getCode())) {
                logger.debug("调用成功");
            } else {
                logger.info("调用失败");
            }
        } catch (AlipayApiException e) {
            e.printStackTrace();
        }
    }

    public void InvoiceUserTradeQueryRequest(String einv_trade_id) {
        AlipayEbppInvoiceUserTradeQueryRequest request = new AlipayEbppInvoiceUserTradeQueryRequest();
    }

    public void invoiceApplyRequest() {

    }

}
