package com.wangsd.web.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.domain.CplifeRoomInfoResp;
import com.alipay.api.request.*;
import com.alipay.api.response.*;
import com.wangsd.web.model.Housinginfo;
import com.wangsd.web.model.Roominfo;
import com.wangsd.web.modelCustom.BillAccountCustom;
import com.wangsd.web.modelCustom.HousinginfoCustom;
import com.wangsd.web.service.AlipayService;
import com.wangsd.web.service.HousinginfoServic;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/11/17.
 */
@Service
public class AlipayServiceImpl implements AlipayService {

    private static final Logger logger = LogManager.getLogger(AlipayServiceImpl.class.getName());

    @Autowired
    HousinginfoServic housinginfoServic;

    /**
     * 同步小区到支付宝
     * @param housing
     * @param token
     * @param alipayClient
     * @return
     */
    @Override
    public HousinginfoCustom communityCreateRequest(HousinginfoCustom housing, String token, AlipayClient alipayClient) {
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
            if("10000".equals(response.getCode())){
                logger.debug("调用成功");
                //执行成功返回支付宝的小区统一编号和状态
                housing.setCommunityId(response.getCommunityId());
                housing.setStatus(response.getStatus());
            } else {
                logger.info("调用失败");
            }
        } catch (AlipayApiException e) {
            logger.info(e.getMessage());
            e.printStackTrace();
        }
        return housing;
    }

    /**
     * 变更物业小区信息
     * @param housing
     * @param token
     * @param alipayClient
     * @return
     */
    @Override
    public Housinginfo communityModifyRequest(Housinginfo housing, String token, AlipayClient alipayClient) {
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
            if("10000".equals(response.getCode())){
                logger.debug("调用成功");
                //执行成功返回支付宝的小区统一编号和状态
                housing.setStatus(response.getStatus());
            } else {
                logger.info("调用失败");
            }
        } catch (AlipayApiException e) {
            logger.info(e.getMessage());
            e.printStackTrace();
        }
        return housing;
    }

    /**
     * 查询单个物业小区信息
     * @param community_id
     * @param token
     * @param alipayClient
     * @return
     */
    public String communityDetailsQueryRequest(String community_id, String token, AlipayClient alipayClient) {
        String retStatus = null;
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
            if("10000".equals(response.getCode())){
                logger.debug("调用成功");
                //执行成功返回支付宝的小区统一编号和状态
            } else {
                logger.info("调用失败");
            }
        } catch (AlipayApiException e) {
            logger.info(e.getMessage());
            e.printStackTrace();
        }
        return retStatus;
    }

    /**
     * 批量查询支付宝小区编号
     * @param status
     * @param token
     * @param alipayClient
     * @return
     */
    public void communityBatchqueryRequest(String status, String token, AlipayClient alipayClient) {
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
            if("10000".equals(response.getCode())){
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
    public boolean basicserviceInitializeRequest(String community_id, String token, AlipayClient alipayClient) {
        boolean retStatus = false;
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
            if("10000".equals(response.getCode())){
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
    public boolean basicserviceModifyRequest(String community_id, String token, AlipayClient alipayClient) {
        boolean retStatus = false;
        AlipayEcoCplifeBasicserviceModifyRequest request = new AlipayEcoCplifeBasicserviceModifyRequest();
        JSONObject bizContent = new JSONObject();
        bizContent.put("community_id", community_id);
        bizContent.put("service_type", "PROPERTY_PAY_BILL_MODE");
        bizContent.put("status", "ONLINE");
        bizContent.put("external_invoke_address", "https://www.alipayjf.com/rest/page/alipay_estate_return");
        request.setBizContent(bizContent.toString());
        if (token != null) {
            request.putOtherTextParam("app_auth_token", token);
        }
        try {
            AlipayEcoCplifeBasicserviceModifyResponse response = alipayClient.execute(request);
            logger.debug("----response----" + response.getBody());
            if("10000".equals(response.getCode())){
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
    public List<Roominfo> roominfoUploadRequest(String community_id, List<Roominfo> roominfos, String token, AlipayClient alipayClient) {
        List<Roominfo> retList = null;
        AlipayEcoCplifeRoominfoUploadRequest request = new AlipayEcoCplifeRoominfoUploadRequest();
        JSONObject bizContent = new JSONObject();
        bizContent.put("batch_id", Long.valueOf(System.currentTimeMillis()));
        bizContent.put("community_id", community_id);
        JSONArray jsonArray = new JSONArray();
        for (Roominfo room : roominfos) {
            JSONObject room_info_set = new JSONObject();
            room_info_set.put("out_room_id", room.getId());
            if (room.getGroupName() != null) {
                room_info_set.put("group ", room.getGroupName());
            }
            room_info_set.put("building", room.getBuilding());
            if (room.getUnit() != null) {
                room_info_set.put(" unit ", room.getUnit());
            }
            room_info_set.put("room", room.getRoom());
            room_info_set.put("address", room.getAddress());
            jsonArray.add(room_info_set);
        }
        bizContent.put("room_info_set ", jsonArray);
        request.setBizContent(bizContent.toString());
        if (token != null) {
            request.putOtherTextParam("app_auth_token", token);
        }
        try {
            AlipayEcoCplifeRoominfoUploadResponse response = alipayClient.execute(request);
            logger.debug("----response----" + response.getBody());
            if("10000".equals(response.getCode())){
                logger.debug("调用成功");
                //执行成功返回支付宝房间编号和系统房间编号
                retList = new ArrayList<Roominfo>();
                List<CplifeRoomInfoResp> roomInfoSet = response.getRoomInfoSet();
                for(CplifeRoomInfoResp cprifr : roomInfoSet) {
                    Roominfo roominfo = new Roominfo();
                    roominfo.setId(Integer.parseInt(cprifr.getOutRoomId()));
                    roominfo.setRoomId(cprifr.getRoomId());
                    retList.add(roominfo);
                }
            } else {
                logger.info("调用失败");
            }
        } catch (AlipayApiException e) {
            logger.info(e.getMessage());
            e.printStackTrace();
        }
        return retList;
    }

    @Override
    public boolean roominfoDeleteRequest(String community_id, List<Integer> roominfoid, String token, AlipayClient alipayClient) {
        boolean retStatus = false;
        AlipayEcoCplifeRoominfoDeleteRequest request = new AlipayEcoCplifeRoominfoDeleteRequest();
        JSONObject bizContent = new JSONObject();
        bizContent.put("community_id", community_id);
        bizContent.put("out_room_id_set ", roominfoid);
        request.setBizContent(bizContent.toString());
        if (token != null) {
            request.putOtherTextParam("app_auth_token", token);
        }
        try {
            AlipayEcoCplifeRoominfoDeleteResponse response = alipayClient.execute(request);
            logger.debug("----response----" + response.getBody());
            if("10000".equals(response.getCode())){
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
    public void roominfoQueryRequest(String community_id, String token, AlipayClient alipayClient) {
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
            if("10000".equals(response.getCode())){
                logger.debug("调用成功");
            } else {
                logger.info("调用失败");
            }
        } catch (AlipayApiException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<BillAccountCustom> billBatchUploadRequest(String community_id, List<BillAccountCustom> billList, String token, AlipayClient alipayClient) {
        AlipayEcoCplifeBillBatchUploadRequest request = new AlipayEcoCplifeBillBatchUploadRequest();
        JSONObject bizContent = new JSONObject();
        bizContent.put("batch_id", Long.valueOf(System.currentTimeMillis()));
        bizContent.put("community_id", community_id);
        JSONArray jsonArray = new JSONArray();
        for (BillAccountCustom billaccount : billList) {
            JSONObject room_info_set = new JSONObject();
            room_info_set.put("bill_entry_id", billaccount.getId());
            room_info_set.put("out_room_id", billaccount.getRoominfoId());
            room_info_set.put("cost_type", billaccount.getCostType());
            room_info_set.put("bill_entry_amount", billaccount.getBillEntryAmount());
            room_info_set.put("acct_period", billaccount.getAcctPeriod());
            room_info_set.put("release_day", billaccount.getReleaseDay());
            room_info_set.put("deadline", billaccount.getDeadline());
            if (billaccount.getOwnerName() != null) {
                room_info_set.put("remark_str", billaccount.getOwnerName());
            }
            jsonArray.add(room_info_set);
        }
        bizContent.put("bill_set ", jsonArray);
        request.setBizContent(bizContent.toString());
        if (token != null) {
            request.putOtherTextParam("app_auth_token", token);
        }
        try {
            AlipayEcoCplifeBillBatchUploadResponse response = alipayClient.execute(request);
            logger.debug("----response----" + response.getBody());
            if("10000".equals(response.getCode())){
                logger.debug("调用成功");
                return billList;
            } else {
                logger.info("调用失败");
                return null;
            }
        } catch (AlipayApiException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 删除已上传的物业账单数据
     * @param community_id
     * @param bill_entry_id_list
     * @param token
     * @param alipayClient
     * @return
     */
    @Override
    public boolean billDeleteRequest(String community_id, List<String> bill_entry_id_list, String token, AlipayClient alipayClient) {
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
            if("10000".equals(response.getCode())){
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

}
