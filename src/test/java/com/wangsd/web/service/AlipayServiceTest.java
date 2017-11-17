package com.wangsd.web.service;

import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayEcoCplifeCommunityCreateRequest;
import com.alipay.api.response.AlipayEcoCplifeCommunityCreateResponse;
import com.wangsd.core.feature.test.TestSupport;
import com.wangsd.core.util.StaticVar;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/11/17.
 */
public class AlipayServiceTest extends TestSupport {

    private String appid = "2016082000290066";
    private String privateKey = "MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAJh7pRQLGNPmSRwho2R7YDlF3odXEYwWUv6riOu/8u/TLesG3xn7H/1fpHxWUzSsfLD427zT798fXhD7U9a26BzSmNMw3aR0NjWfkXqsK4xgfj6eWd6nQ2uk/k6tGZpHSXhnqxGzwMgsc6hV+gUEVGkc/OQZBLp8ICDCb+SFsNm5AgMBAAECgYA5ks30sG/yakwGhCj2YqMlXN01yslEVJWHtOrg4Lvwk5MN361TWP9uIrOvgsSt6ca252/Ib1ltrKFO1iaEttESo7ioTIhJjRnwQD3CHb+H6swFmb4EbXelS752I5A+4XvDxNV6gagyESNWi1eAh7R4JifGpqJs7HzOzb8SBoskhQJBAMeNQGAdoHOtnaU/2BWfmbM8qW2juq9GO5SFG+x2buNHtXCPVDoNw6LXvtbysJa4tZmN0JG5hhyiZ+6n0IsqxNsCQQDDndvnk5n3fzI/l6kHMUCQmYalnAl4A51hqELhgvBHdPd7uZ6iTFdcQAQeWWb0cQG6velDRWpomRKRp33zqbX7AkEAgt2UYTQsvJAYOX30FMI1BwF6T0e3ryiM/CqLFHja4bxuNeIZJ3VNXmbEZayEuGNr3MbPCDI1zGOJa06sigfDTwJAFhKi9K+ICRBWOCzByuj40xgvxFImE1+9C370BQREXpvJLTHVv5SDqwoiLNaDsoNp4Yt6XbfgeOsE2GCg6rS0rwJAYJOscOrgHbMHJooCdR+c3RMWh4RswzEVnTucEpo8ra2DIDFR+1e/jnSgqqvYZOFF/+tIRI4TOomYUkbjsycfNQ==";
    private String publicKey = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDIgHnOn7LLILlKETd6BFRJ0GqgS2Y3mn1wMQmyh9zEyWlz5p1zrahRahbXAfCfSqshSNfqOmAQzSHRVjCqjsAw1jyqrXaPdKBmr90DIpIxmIyKXv4GGAkPyJ/6FTFY99uhpiq0qadD/uSzQsefWo0aTvP/65zi3eof7TcZ32oWpwIDAQAB";
//    private String appid = "2017110209689666";
//    private String privateKey = "MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAI7BUfdThHq/FXHKLqEAINBd1iJD3MmOrol9G4B0WIf45kmmascHTOn2cw1xFKSg+6d84zm/axA0kiesjHdmSqIjPEJv7eVwGLGHiMb3zrKvszf4VhTCByIsMKCo4dNkh/U1uQknEoUWrYJ00Nx+1Dc1vaRfBxp99QEbsJKpgQrxAgMBAAECgYB+7ZbSoNi3RvVrQoipMHL8saJ2vv4t3IaFys5MLaaV55HixGxGYNBbanyr4/Kl2llHd3yV2QP52bRmQD5432PVXruBs3IG/qmVpTwMIITJKgsOtXY7QTN9xNJPMHmLERtyJI56dfsbbfQgpq9HtRVeH6ijB1H+AXpXVCOFfU2SwQJBAPHNwyXE3pSXW/Q0RTbvfVI0mb0oOmG8WANo3aNqBT4YRNIut5ppFCcwbu0UuZljIuvP6Kf3K8zsRDh0X3YSO+kCQQCXIuMgemfcs7gjpDZYS4RcfNFkkp5D/MmRuM+8hfv+0whobEJ/AU8eydZQtaVPCtV4J9goQ3AG+CL0S3xd/FnJAkBCCEfXg5ipCWCCItgX9XTKwzSMtHSlBhMe8z87hhNibqw0na9kCngHb7GLKtK4cZsyvHczj0s1zfufUyBSlQ4pAkB3+djlemYivIRLvtrpQqGDLg6nUQDUJcL5rAU0ugPuKSZ+hppO6gIeBcnc7iWZVpdZOAAPDmHLFoXg+l9y2JWJAkEA1KPGSGv9tVYVmM5RQpQ1GuICWdHnUZQduFp4kU8/BWtvxA4pRW5m+plQ+Ceg9hFOFxGZpwQrFZ7ttYVYXdM2Ow==";
//    private String publicKey = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDDI6d306Q8fIfCOaTXyiUeJHkrIvYISRcc73s3vF1ZT7XN8RNPwJxo8pWaJMmvyTn9N4HQ632qJBVHf8sxHi/fEsraprwCtzvzQETrNRwVxLO5jVmRGi60j8Ue1efIlzPXV9je9mkjzOmdssymZkh2QhUrCmZYI/FCEa3/cNMW0QIDAQAB";

    @Autowired
    AlipayService alipayService;

    /**
     * 同步小区到支付宝
     * @throws Exception
     */
    @Test
    public void alipayEcoCplifeCommunityCreateRequest() throws Exception {
        AlipayClient alipayClient = new DefaultAlipayClient(StaticVar.serverUrl, appid, privateKey,
                StaticVar.format, StaticVar.charset, publicKey, StaticVar.sign_type);
//        HousingCustom housing = new HousingCustom();
//        housing.setName("滨江·万家名城1期");
//        housing.setAddress("东吴路");
//        housing.setDistrictCode("330110");
//        housing.setCityCode("330100");
//        housing.setProvinceCode("330000");
//        housing.setCommunityLocations("[120.120005,30.342917]");
//        housing.setHotline("0001");
//        alipayService.alipayEcoCplifeCommunityCreateRequest(housing,null, alipayClient);
        AlipayEcoCplifeCommunityCreateRequest request = new AlipayEcoCplifeCommunityCreateRequest();
        request.setBizContent("{" +
                "\"community_name\":\"金海湾花园\"," +
                "\"community_address\":\"福荣路46号\"," +
                "\"district_code\":\"440304\"," +
                "\"city_code\":\"440300\"," +
                "\"province_code\":\"440000\"," +
                "      \"community_locations\":[" +
                "        \"114.032395|22.519725\",\"114.032469|22.519336\"" +
                "      ]," +
                "      \"associated_pois\":[" +
                "        \"B02F37VVFP\",\"B0FFFQB4Y4\"" +
                "      ]," +
                "\"hotline\":\"0571-87654321\"," +
                "\"out_community_id\":\"12345\"" +
                "  }");
//        JSONObject bizContent = new JSONObject();
//        bizContent.put("community_name", "金海湾花园");
//        bizContent.put("community_address", "福荣路46号");
//        bizContent.put("district_code", "440304");
//        bizContent.put("city_code", "440300");
//        bizContent.put("province_code", "440000");
//        bizContent.put("community_locations", "[114.032395|22.519725]");
//        bizContent.put("hotline", "0571-87654321");
//        bizContent.put("out_community_id", "0001");
//        request.setBizContent(bizContent.toJSONString());
//        System.out.println(bizContent);
//        System.out.println(bizContent.toJSONString());
        AlipayEcoCplifeCommunityCreateResponse response = alipayClient.execute(request);
        if("10000".equals(response.getCode())){
            System.out.println("调用成功");
            System.out.println(response.getBody());
        } else {
            System.out.println("调用失败");
            System.out.println(response.getBody());
        }

    }

    /**
     * 变更物业小区信息
     * @throws Exception
     */
    @Test
    public void AlipayEcoCplifeCommunityModifyRequest() throws Exception {

    }

    /**
     * 批量查询支付宝小区编号
     * @throws Exception
     */
    @Test
    public void AlipayEcoCplifeCommunityBatchqueryRequest() throws Exception {
        AlipayClient alipayClient = new DefaultAlipayClient(StaticVar.serverUrl, appid, privateKey,
                StaticVar.format, StaticVar.charset, publicKey, StaticVar.sign_type);
        alipayService.AlipayEcoCplifeCommunityBatchqueryRequest(null, null, alipayClient);
    }

    /**
     * 查询单个物业小区信息
     * @return
     */
    @Test
    public void AlipayEcoCplifeCommunityDetailsQueryRequest() throws Exception {
        AlipayClient alipayClient = new DefaultAlipayClient(StaticVar.serverUrl, appid, privateKey,
                StaticVar.format, StaticVar.charset, publicKey, StaticVar.sign_type);
        alipayService.AlipayEcoCplifeCommunityDetailsQueryRequest("", null, alipayClient);
    }

    /**
     * 删除已上传的物业账单数据
     * @throws Exception
     */
    @Test
    public void AlipayEcoCplifeBillDeleteRequest() throws Exception {
        AlipayClient alipayClient = new DefaultAlipayClient(StaticVar.serverUrl, appid, privateKey,
                StaticVar.format, StaticVar.charset, publicKey, StaticVar.sign_type);
        String community_id = "AXJIXECXX3301";
        List<String> idList = new ArrayList<String>();
        idList.add("201711030004166");
        alipayService.AlipayEcoCplifeBillDeleteRequest(community_id, idList, null, alipayClient);
    }

}