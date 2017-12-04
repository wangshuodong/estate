package com.wangsd.core.util.nuonuo.util;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import org.apache.commons.codec.binary.Base64;


/**
 * 电子发票
 *  businessSign 字段生成规则
 * @author Administrator
 *
 */
public class EInvoiceSign {

	private static final String TIMESTEMP  =  "timestamp";
	private static final String APPID  =  "appid";
	private static final String TAXNUM  =  "taxNum";
	
//	public static void main(String[] arge){
//		
//		EInvoiceSign es = new EInvoiceSign();
//		long time = System.currentTimeMillis();
//		String fff = es.eInvoiceEncodeData(String.valueOf(time));
//		System.out.println("加密串："+fff);
//		Object ddd = AESDecrypt(fff, SecurityUtil.appsecret_value);
//		System.out.println("解密串："+ddd.toString());
//	}
	/**
     * 组装电子发票数据
     * @param appid
     * @param appsecret
     * @param timestemp
     * @param taxnum
     * @return
     */
    public static String eInvoiceEncodeData(String timestemp){
    	Map<String,String> map = new HashMap<String,String>();
    	map.put(EInvoiceSign.APPID, SecurityUtil.appid_value);
    	map.put(EInvoiceSign.TIMESTEMP, timestemp);
    	map.put(EInvoiceSign.TAXNUM, SecurityUtil.taxNum_value);
    	String inputData = "";
    	String businessSign = "";
    	try {
    	    inputData = eInvoicesign(map);
			businessSign = (String)SecurityUtil.AESEncrypt(inputData, SecurityUtil.appsecret_value);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
    	return businessSign;
    }
    
    private static String eInvoicesign(Map<String, String> paramValues){
		if (paramValues == null || paramValues.isEmpty()){
			throw new RuntimeException("请检查签名参数");
		}
		StringBuilder sb = new StringBuilder();
		String sign = "";
		try{
			List<String> paramNames = new ArrayList<String>(paramValues.size());
			paramNames.addAll(paramValues.keySet());
			Collections.sort(paramNames);
			for (String paramName : paramNames)
			{
				sb.append(paramName).append("=").append(paramValues.get(paramName)).append("&");
			}
			System.out.println(sb.toString());
			sb.substring(0, sb.length()-1);
			sign = sb.substring(0, sb.length()-1);
		}catch (Exception e){
			throw new RuntimeException("加密签名计算错误", e);
		}
		return sign;
	}
    
    /**
     *  AES加密
     * @param sSrc  待加密字符串
     * @param sKey	加密Key值
     * @return
     */
    public static Object AESEncrypt(String sSrc, String sKey) {
    	try{
    		if (sKey == null) {
                System.out.print("Key为空");
                throw new Exception();
            }
            if (sKey.length() != 16) {
                System.out.print("Key长度不等于16位");
                throw new Exception();
            }
            byte[] raw = sKey.getBytes("utf-8");
            SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
            Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
            cipher.init(Cipher.ENCRYPT_MODE, skeySpec);
            byte[] encrypted = cipher.doFinal(sSrc.getBytes("utf-8"));
            return new Base64().encodeToString(encrypted);
    	}catch (Exception e) {
    		e.printStackTrace();
    		return null;
		}
    }
    
    /**
     * AES 解密
     * @param sSrc
     * @param sKey
     * @return
     */
    public static Object AESDecrypt(String sSrc, String sKey){
        try {
        	if (sKey == null) {
                return null;
             }
             if (sKey.length() != 16) {
             	return  null;
             }
            byte[] raw = sKey.getBytes("UTF-8");
            SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
            Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
            cipher.init(Cipher.DECRYPT_MODE, skeySpec);
            byte[] encrypted1 = new Base64().decode(sSrc);
            byte[] original = cipher.doFinal(encrypted1);
            String originalString = new String(original,"utf-8");
            return originalString;
        } catch (Exception ex) {
        	ex.printStackTrace();
            return null;
        }
    }
}
