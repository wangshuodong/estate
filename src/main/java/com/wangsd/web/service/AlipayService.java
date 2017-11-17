package com.wangsd.web.service;

import com.alipay.api.AlipayClient;
import com.wangsd.web.modelCustom.HousingCustom;

import java.util.List;

/**
 * Created by Administrator on 2017/11/17.
 */
public interface AlipayService {
    /**
     *同步小区到支付宝
     * @param housing
     * @param token
     * @param alipayClient
     * @return
     */
    public HousingCustom alipayEcoCplifeCommunityCreateRequest(HousingCustom housing, String token, AlipayClient alipayClient);

    /**
     * 变更物业小区信息
     * @param housing
     * @param token
     * @param alipayClient
     * @return
     */
    public HousingCustom AlipayEcoCplifeCommunityModifyRequest(HousingCustom housing, String token, AlipayClient alipayClient);

    /**
     * 查询单个物业小区信息
     * @param community_id
     * @param token
     * @param alipayClient
     * @return
     */
    public String AlipayEcoCplifeCommunityDetailsQueryRequest(String community_id, String token, AlipayClient alipayClient);

    /**
     * 批量查询支付宝小区编号
     * @param status
     * @param token
     * @param alipayClient
     * @return
     */
    public String AlipayEcoCplifeCommunityBatchqueryRequest(String status, String token, AlipayClient alipayClient);

    /**
     * 删除已上传的物业账单数据
     * @param community_id
     * @param bill_entry_id_list
     * @param token
     * @param alipayClient
     * @return
     */
    public boolean AlipayEcoCplifeBillDeleteRequest(String community_id, List<String> bill_entry_id_list, String token, AlipayClient alipayClient);
}
