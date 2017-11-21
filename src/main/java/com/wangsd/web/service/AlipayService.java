package com.wangsd.web.service;

import com.alipay.api.AlipayClient;
import com.wangsd.web.model.Housinginfo;
import com.wangsd.web.model.Roominfo;
import com.wangsd.web.modelCustom.BillAccountCustom;
import com.wangsd.web.modelCustom.HousinginfoCustom;

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
    public HousinginfoCustom communityCreateRequest(HousinginfoCustom housing, String token, AlipayClient alipayClient);

    /**
     * 变更物业小区信息
     * @param housing
     * @param token
     * @param alipayClient
     * @return
     */
    public Housinginfo communityModifyRequest(Housinginfo housing, String token, AlipayClient alipayClient);

    /**
     * 查询单个物业小区信息
     * @param community_id
     * @param token
     * @param alipayClient
     * @return
     */
    public String communityDetailsQueryRequest(String community_id, String token, AlipayClient alipayClient);

    /**
     * 批量查询支付宝小区编号
     * @param status
     * @param token
     * @param alipayClient
     * @return
     */
    public void communityBatchqueryRequest(String status, String token, AlipayClient alipayClient);

    /**
     * 初始化小区物业基础服务
     * @param community_id
     * @param token
     * @param alipayClient
     * @return
     */
    public boolean basicserviceInitializeRequest(String community_id, String token, AlipayClient alipayClient);

    /**
     * 修改小区物业基础服务(申请服务上线)
     * @param community_id
     * @param token
     * @param alipayClient
     * @return
     */
    public boolean basicserviceModifyRequest(String community_id, String status, String token, AlipayClient alipayClient);

    /**
     * 上传物业小区内部房屋信息
     * @param community_id
     * @param roominfos
     * @param token
     * @param alipayClient
     * @return
     */
    public List<Roominfo> roominfoUploadRequest(String community_id, List<Roominfo> roominfos, String token, AlipayClient alipayClient);

    /**
     * 删除物业小区房屋信息
     * @param community_id
     * @param roominfoid
     * @param token
     * @param alipayClient
     * @return
     */
    public boolean roominfoDeleteRequest(String community_id, List<Integer> roominfoid, String token, AlipayClient alipayClient);

    /**
     * 查询小区房屋信息列表
     * @param community_id
     * @param token
     * @param alipayClient
     */
    public void roominfoQueryRequest(String community_id, String token, AlipayClient alipayClient);

    /**
     * 批量上传待缴物业费账单
     * @param community_id
     * @param billList
     * @param token
     * @param alipayClient
     * @return
     */
    public List<BillAccountCustom> billBatchUploadRequest(String community_id, List<BillAccountCustom> billList, String token, AlipayClient alipayClient);

    /**
     * 修改已上传的物业费账单数据
     * @param community_id
     * @param billList
     * @param token
     * @param alipayClient
     * @return
     */
    public void billModifyRequest(String community_id, List<BillAccountCustom> billList, String token, AlipayClient alipayClient);

    /**
     * 删除已上传的物业账单数据
     * @param community_id
     * @param bill_entry_id_list
     * @param token
     * @param alipayClient
     * @return
     */
    public boolean billDeleteRequest(String community_id, List<String> bill_entry_id_list, String token, AlipayClient alipayClient);
}
