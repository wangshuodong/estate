package com.wangsd.web.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.request.*;
import com.alipay.api.response.*;
import com.wangsd.web.modelCustom.HousingCustom;
import com.wangsd.web.service.AlipayService;
import com.wangsd.web.service.DepartmentService;
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
    DepartmentService departmentService;

    /**
     * 同步小区到支付宝
     * @param housing
     * @param token
     * @param alipayClient
     * @return
     */
    @Override
    public HousingCustom alipayEcoCplifeCommunityCreateRequest(HousingCustom housing, String token, AlipayClient alipayClient) {
        HousingCustom retStatus = null;
        AlipayEcoCplifeCommunityCreateRequest request = new AlipayEcoCplifeCommunityCreateRequest();
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
            AlipayEcoCplifeCommunityCreateResponse response = alipayClient.execute(request);
            if("10000".equals(response.getCode())){
                logger.debug("调用成功");
                logger.debug("----response----" + response.getBody());
                //执行成功返回支付宝的小区统一编号和状态
                retStatus = new HousingCustom();
                retStatus.setId(housing.getId());
                retStatus.setCommunityId(response.getCommunityId());
                retStatus.setStatus(response.getStatus());
            } else {
                logger.info("调用失败");
                logger.info("----response----" + response.getBody());
            }
        } catch (AlipayApiException e) {
            logger.info(e.getMessage());
            e.printStackTrace();
        }
        return retStatus;
    }

    /**
     * 变更物业小区信息
     * @param housing
     * @param token
     * @param alipayClient
     * @return
     */
    @Override
    public HousingCustom AlipayEcoCplifeCommunityModifyRequest(HousingCustom housing, String token, AlipayClient alipayClient) {
        HousingCustom retStatus = null;
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
            if("10000".equals(response.getCode())){
                logger.debug("调用成功");
                //执行成功返回支付宝的小区统一编号和状态
                retStatus = new HousingCustom();
                retStatus.setId(housing.getId());
                retStatus.setStatus(response.getStatus());
            } else {
                logger.info("调用失败");
                logger.info("----response----" + response.getBody());
            }
        } catch (AlipayApiException e) {
            logger.info(e.getMessage());
            e.printStackTrace();
        }
        return retStatus;
    }

    /**
     * 查询单个物业小区信息
     * @param community_id
     * @param token
     * @param alipayClient
     * @return
     */
    public String AlipayEcoCplifeCommunityDetailsQueryRequest(String community_id, String token, AlipayClient alipayClient) {
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
            if("10000".equals(response.getCode())){
                logger.debug("调用成功");
                //执行成功返回支付宝的小区统一编号和状态
            } else {
                logger.info("调用失败");
                logger.info("----response----" + response.getBody());
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
    public String AlipayEcoCplifeCommunityBatchqueryRequest(String status, String token, AlipayClient alipayClient) {
        String retStatus = null;
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
            if("10000".equals(response.getCode())){
                logger.debug("调用成功");
                //执行成功返回支付宝的小区统一编号和状态
            } else {
                logger.info("调用失败");
                logger.info("----response----" + response.getBody());
            }
        } catch (AlipayApiException e) {
            logger.info(e.getMessage());
            e.printStackTrace();
        }
        return retStatus;
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
    public boolean AlipayEcoCplifeBillDeleteRequest(String community_id, List<String> bill_entry_id_list, String token, AlipayClient alipayClient) {
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
            logger.debug(response.getBody());
            if(response.isSuccess()){
                retStatus = true;
                System.out.println("调用成功");
            } else {
                retStatus = false;
                System.out.println("调用失败");
            }
        } catch (AlipayApiException e) {
            e.printStackTrace();
        }
        return retStatus;
    }

}
