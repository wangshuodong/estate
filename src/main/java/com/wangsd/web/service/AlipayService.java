package com.wangsd.web.service;

import com.wangsd.core.entity.JSONResult;
import com.wangsd.web.model.Billaccount;
import com.wangsd.web.model.Housinginfo;
import com.wangsd.web.modelCustom.BillAccountCustom;
import com.wangsd.web.modelCustom.HousinginfoCustom;
import com.wangsd.web.modelCustom.RoominfoCustom;
import com.wangsd.web.modelCustom.UserCustom;

import java.util.List;

/**
 * Created by Administrator on 2017/11/17.
 */
public interface AlipayService {
    /**
     *同步小区到支付宝
     * @param housing
     * @param token
     * @param loginUser
     * @return
     */
    public JSONResult communityCreateRequest(HousinginfoCustom housing, String token, UserCustom loginUser);

    /**
     * 变更物业小区信息
     * @param housing
     * @param token
     * @param loginUser
     * @return
     */
    public boolean communityModifyRequest(Housinginfo housing, String token, UserCustom loginUser);

    /**
     * 查询单个物业小区信息
     * @param community_id
     * @param token
     * @param loginUser
     * @return
     */
    public String communityDetailsQueryRequest(String community_id, String token, UserCustom loginUser);

    /**
     * 批量查询支付宝小区编号
     * @param status
     * @param token
     * @param loginUser
     * @return
     */
    public void communityBatchqueryRequest(String status, String token, UserCustom loginUser);

    /**
     * 初始化小区物业基础服务
     * @param community_id
     * @param token
     * @param loginUser
     * @return
     */
    public boolean basicserviceInitializeRequest(String community_id, String token, UserCustom loginUser);

    /**
     * 修改小区物业基础服务(申请服务上线)
     * @param community_id
     * @param token
     * @param loginUser
     * @return
     */
    public boolean basicserviceModifyRequest(String community_id, String status, String token, UserCustom loginUser);

    /**
     * 上传物业小区内部房屋信息
     * @param community_id
     * @param roominfos
     * @param token
     * @param loginUser
     * @return
     */
    public JSONResult roominfoUploadRequest(String community_id, List<RoominfoCustom> roominfos, String token, UserCustom loginUser);

    /**
     * 删除物业小区房屋信息
     * @param community_id
     * @param roominfoid
     * @param token
     * @param loginUser
     * @return
     */
    public boolean roominfoDeleteRequest(String community_id, List<String> roominfoid, String token, UserCustom loginUser);

    /**
     * 查询小区房屋信息列表
     * @param community_id
     * @param token
     * @param loginUser
     */
    public void roominfoQueryRequest(String community_id, String token, UserCustom loginUser);

    /**
     * 批量上传待缴物业费账单
     * @param community_id
     * @param billList
     * @param token
     * @param loginUser
     * @return
     */
    public JSONResult billBatchUploadRequest(String community_id, List<BillAccountCustom> billList, String token, UserCustom loginUser);

    /**
     * 修改已上传的物业费账单数据
     * @param community_id
     * @param billList
     * @param token
     * @param loginUser
     * @return
     */
    public boolean billModifyRequest(String community_id, List<BillAccountCustom> billList, String token, UserCustom loginUser);

    /**
     * 物业费账单数据批量查询
     * @param community_id
     * @param billaccount
     * @param token
     * @param loginUser
     */
    public void billBatchqueryRequest(String community_id, Billaccount billaccount, String token, UserCustom loginUser);

    /**
     * 删除已上传的物业账单数据
     * @param community_id
     * @param bill_entry_id_list
     * @param token
     * @param loginUser
     * @return
     */
    public boolean billDeleteRequest(String community_id, List<String> bill_entry_id_list, String token, UserCustom loginUser);


    /**
     * 获取指定用户所有的有效抬头列表
     * @param user_id
     */
    public void invoiceTitleListGetRequest(String user_id, String appid, String privateKey, String publicKey, String token);

    /**
     * 查询用户的开票要素信息
     * @param einv_trade_id
     */
    public void invoiceUserTradeQueryRequest(String einv_trade_id);

    /**
     * 申请开票
     */
    public void invoiceApplyRequest(String appid, String privateKey, String publicKey, String token);
}
