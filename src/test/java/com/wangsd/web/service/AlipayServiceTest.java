package com.wangsd.web.service;

import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.wangsd.core.feature.test.TestSupport;
import com.wangsd.core.util.StaticVar;
import com.wangsd.web.modelCustom.HousinginfoCustom;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/11/17.
 */
public class AlipayServiceTest extends TestSupport {

//    private String appid = "2016082000296074";
//    private String privateKey = "MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAJh7pRQLGNPmSRwho2R7YDlF3odXEYwWUv6riOu/8u/TLesG3xn7H/1fpHxWUzSsfLD427zT798fXhD7U9a26BzSmNMw3aR0NjWfkXqsK4xgfj6eWd6nQ2uk/k6tGZpHSXhnqxGzwMgsc6hV+gUEVGkc/OQZBLp8ICDCb+SFsNm5AgMBAAECgYA5ks30sG/yakwGhCj2YqMlXN01yslEVJWHtOrg4Lvwk5MN361TWP9uIrOvgsSt6ca252/Ib1ltrKFO1iaEttESo7ioTIhJjRnwQD3CHb+H6swFmb4EbXelS752I5A+4XvDxNV6gagyESNWi1eAh7R4JifGpqJs7HzOzb8SBoskhQJBAMeNQGAdoHOtnaU/2BWfmbM8qW2juq9GO5SFG+x2buNHtXCPVDoNw6LXvtbysJa4tZmN0JG5hhyiZ+6n0IsqxNsCQQDDndvnk5n3fzI/l6kHMUCQmYalnAl4A51hqELhgvBHdPd7uZ6iTFdcQAQeWWb0cQG6velDRWpomRKRp33zqbX7AkEAgt2UYTQsvJAYOX30FMI1BwF6T0e3ryiM/CqLFHja4bxuNeIZJ3VNXmbEZayEuGNr3MbPCDI1zGOJa06sigfDTwJAFhKi9K+ICRBWOCzByuj40xgvxFImE1+9C370BQREXpvJLTHVv5SDqwoiLNaDsoNp4Yt6XbfgeOsE2GCg6rS0rwJAYJOscOrgHbMHJooCdR+c3RMWh4RswzEVnTucEpo8ra2DIDFR+1e/jnSgqqvYZOFF/+tIRI4TOomYUkbjsycfNQ==";
//    private String publicKey = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDIgHnOn7LLILlKETd6BFRJ0GqgS2Y3mn1wMQmyh9zEyWlz5p1zrahRahbXAfCfSqshSNfqOmAQzSHRVjCqjsAw1jyqrXaPdKBmr90DIpIxmIyKXv4GGAkPyJ/6FTFY99uhpiq0qadD/uSzQsefWo0aTvP/65zi3eof7TcZ32oWpwIDAQAB";
    String appid = "2017071807800670";
    String privateKey = "MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAJW2B/Wqka+T7s1HW/rFFKweF7fN+vtqmhkIvtXUoQi3+fiZKZjc1KHGLM8YS9BTUFNDcSvRva23qRlGp4ypbkl+QSx2spc0A2TKllVIBu9yWAvBIEVNBo3s8rRK1VWH8qKtMyYc2Q1rebeeEpFSJAjXGS99JS68GXo1QwDbH9kNAgMBAAECgYAHNHV5mzXbr1DkzDRfAzEVf3VAwUb85op3/fXBMLR3SPNcxXI9CxOonXL2nIK5iejpuOsvYq6wN5CJyN6zZEwMZpEXQ8ELhencbgYgBvBmvyPq5rnUb3MEt/W2B3EmgaCqYTfk0GWa50ybSh94ynBfK+DRy8NHYQg9kYzOfJt2gQJBAMUJ2wVR6PE2iK24jvcX/ajqE7kHRFf0T6bOKA4TRxxDMGNCH189RmXpxoPjrzsofKdh+qgvbLpz3e7cOG18Wp0CQQDCgqeSyxFecmmDvaDkn0Oj4GkgOdz6T23rsCfSVXWaBII0+nBlbWglQc/DwohTmdq8TBe6FnTfbOhDnIMo0DUxAkALXuQ6zF1K/kCo9cuaStIim0+ED/1LrheioqcBGO+zm9UBBWHWFy0m2HTSS6NjIJUA+9CBQCtgHyuhiyfeeZypAkBD4sfLgtYgCXxr/03dHPzFgDgQiEFolzo87PEpBqyRwYsUJGf/7kxP3IU/xHBCBUuDNmd9igLmS6NQnZplLy2xAkEAuIDbFGy34R8rEI5vXcqcMsn0tl5jBHSzbFcN1+3vz8dfudjl0RTqqpDXI1vtgbOph+NG3TVkSYbk0knjDNG15A==";
    String publicKey = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDDI6d306Q8fIfCOaTXyiUeJHkrIvYISRcc73s3vF1ZT7XN8RNPwJxo8pWaJMmvyTn9N4HQ632qJBVHf8sxHi/fEsraprwCtzvzQETrNRwVxLO5jVmRGi60j8Ue1efIlzPXV9je9mkjzOmdssymZkh2QhUrCmZYI/FCEa3/cNMW0QIDAQAB";

    @Autowired
    AlipayService alipayService;
    @Autowired
    HousinginfoServic housinginfoServic;

    /**
     * 同步小区到支付宝
     * @throws Exception
     */
    @Test
    public void communityCreateRequest() throws Exception {
        AlipayClient alipayClient = new DefaultAlipayClient(StaticVar.serverUrl, appid, privateKey,
                StaticVar.format, StaticVar.charset, publicKey, StaticVar.sign_type);
        HousinginfoCustom housing = housinginfoServic.selectHousingCustomById(9);
        housing = alipayService.communityCreateRequest(housing, "201708BB85188ec4dcbc4be69df6ef6b5fa2fX42", alipayClient);

    }

    /**
     * 变更物业小区信息
     * @throws Exception
     */
    @Test
    public void communityModifyRequest() throws Exception {

    }

    /**
     * 批量查询支付宝小区编号
     * @throws Exception
     */
    @Test
    public void communityBatchqueryRequest() throws Exception {
        AlipayClient alipayClient = new DefaultAlipayClient(StaticVar.serverUrl, appid, privateKey,
                StaticVar.format, StaticVar.charset, publicKey, StaticVar.sign_type);
        alipayService.communityBatchqueryRequest("PENDING_ONLINE", "201708BB85188ec4dcbc4be69df6ef6b5fa2fX42", alipayClient);
    }

    /**
     * 查询单个物业小区信息
     * @return
     */
    @Test
    public void communityDetailsQueryRequest() throws Exception {
        AlipayClient alipayClient = new DefaultAlipayClient(StaticVar.serverUrl, appid, privateKey,
                StaticVar.format, StaticVar.charset, publicKey, StaticVar.sign_type);
        HousinginfoCustom housing = housinginfoServic.selectHousingCustomById(9);
        alipayService.communityDetailsQueryRequest(housing.getCommunityId(), housing.getToken(), alipayClient);
    }

    /**
     * 删除已上传的物业账单数据
     * @throws Exception
     */
    @Test
    public void billDeleteRequest() throws Exception {
        AlipayClient alipayClient = new DefaultAlipayClient(StaticVar.serverUrl, appid, privateKey,
                StaticVar.format, StaticVar.charset, publicKey, StaticVar.sign_type);
        String community_id = "ASAYZA2P45001";
        String token = "201708BB85188ec4dcbc4be69df6ef6b5fa2fX42";
        List<String> idList = new ArrayList<String>();
        idList.add("201711170000001");
        alipayService.billDeleteRequest(community_id, idList, token, alipayClient);
    }

}