package com.wangsd.core.util.nuonuo.util;

import java.util.BitSet;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import org.apache.commons.codec.binary.Base64;

/**
 * 安全类工具类
 * @author sdk.jss.com.cn
 * @version 1.0
 * @since jdk1.6
 */
public class SecurityUtil {

	/**
	 * 极速开票密钥
	 */
	public final static String speedBilling = "F59E1B2970D64B8F926E9932E0A1A1DB";

	/**
	 * 电子发票 身份标记字段（线下获取）
	 */
	public final static String appsecret_value = "";  //线下给的企业秘钥appsecret
	public final static String appid_value = "";  //线下给
	public final static String taxNum_value = ""; //税号
	
	/**
	 * APP 加密密钥
	 */
	public static String app_secret = "30B83388A0434039";  //填写本APP申请的  appSecret
	
	/**
	 * APP 请求并发数（平台默认）
	 */
	public static String app_rate = "10";
	
	/**
	 * 开放平台访问地址
	 */
	public static String url = "http://sdk.jss.com.cn/openPlatform/services";
	
	private static final BitSet UNRESERVED = new BitSet(256);
	private static final BitSet URLENCODER = new BitSet(256);
	private static final BitSet PUNCT = new BitSet(256);
	private static final BitSet USERINFO = new BitSet(256);
	private static final BitSet PATHSAFE = new BitSet(256);
	private static final BitSet URIC = new BitSet(256);
	private static final BitSet RESERVED = new BitSet(256);
	  
	  static
	  {
	    for (int i = 97; i <= 122; i++) {
	      UNRESERVED.set(i);
	    }
	    for (int i = 65; i <= 90; i++) {
	      UNRESERVED.set(i);
	    }
	    
	    for (int i = 48; i <= 57; i++) {
	      UNRESERVED.set(i);
	    }
	    UNRESERVED.set(95);
	    UNRESERVED.set(45);
	    UNRESERVED.set(46);
	    UNRESERVED.set(42);
	    URLENCODER.or(UNRESERVED);
	    UNRESERVED.set(33);
	    UNRESERVED.set(126);
	    UNRESERVED.set(39);
	    UNRESERVED.set(40);
	    UNRESERVED.set(41);
	    
	    PUNCT.set(44);
	    PUNCT.set(59);
	    PUNCT.set(58);
	    PUNCT.set(36);
	    PUNCT.set(38);
	    PUNCT.set(43);
	    PUNCT.set(61);
	    
	    USERINFO.or(UNRESERVED);
	    USERINFO.or(PUNCT);
	    
	    PATHSAFE.or(UNRESERVED);
	    PATHSAFE.set(47);
	    PATHSAFE.set(59);
	    PATHSAFE.set(58);
	    PATHSAFE.set(64);
	    PATHSAFE.set(38);
	    PATHSAFE.set(61);
	    PATHSAFE.set(43);
	    PATHSAFE.set(36);
	    PATHSAFE.set(44);
	    
	    RESERVED.set(59);
	    RESERVED.set(47);
	    RESERVED.set(63);
	    RESERVED.set(58);
	    RESERVED.set(64);
	    RESERVED.set(38);
	    RESERVED.set(61);
	    RESERVED.set(43);
	    RESERVED.set(36);
	    RESERVED.set(44);
	    RESERVED.set(91);
	    RESERVED.set(93);
	    
	    URIC.or(RESERVED);
	    URIC.or(UNRESERVED);
	  }
	  
//	 public static String urlEncode(String content, String charsetStr)
//	  {
//		Charset charset = Charset.forName(charsetStr);
//	    if (content == null) {
//	      return null;
//	    }
//	    StringBuilder buf = new StringBuilder();
//	    ByteBuffer bb = charset.encode(content);
//	    while (bb.hasRemaining()) {
//	      int b = bb.get() & 0xFF;
//	      if (URLENCODER.get(b)) {
//	        buf.append((char)b);
//	      } else if ((true) && (b == 32)) {
//	        buf.append('+');
//	      } else {
//	        buf.append("%");
//	        char hex1 = Character.toUpperCase(Character.forDigit(b >> 4 & 0xF, 16));
//	        char hex2 = Character.toUpperCase(Character.forDigit(b & 0xF, 16));
//	        buf.append(hex1);
//	        buf.append(hex2);
//	      }
//	    }
//	    return buf.toString();
//	  }

	
	
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
            // 判断Key是否为16位
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
             // 判断Key是否为16位
             if (sKey.length() != 16) {
             	return  null;

             }
            byte[] raw = sKey.getBytes("UTF-8");
            SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
            Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
            cipher.init(Cipher.DECRYPT_MODE, skeySpec);
            byte[] encrypted1 = new Base64().decode(sSrc);//先用base64解密
            byte[] original = cipher.doFinal(encrypted1);
            String originalString = new String(original,"utf-8");
            return originalString;
        } catch (Exception ex) {
        	ex.printStackTrace();
            return null;
        }
    }
    
	/**
	 * 仅针对极速开票MD5加密
	 * MD5加密
	 * validator+F59E1B2970D64B8F926E9932E0A1A1DB，然后再进行MD5加密；
	 * @param source
	 * @return
	 */
	public static String MD5Encrypt(String randomSixNum){
		String signidSource = new StringBuffer(randomSixNum).append(SecurityUtil.speedBilling).toString();
		String signidTarget  = MD5Util.toMD5(signidSource);
		return signidTarget;
	}
}
