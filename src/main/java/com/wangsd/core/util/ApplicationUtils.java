package com.wangsd.core.util;

import org.apache.commons.codec.digest.DigestUtils;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.UUID;

/**
 * ApplicationUtils : 程序工具类，提供大量的便捷方法
 *
 */
public class ApplicationUtils {

    /**
     * 产生一个36个字符的UUID
     *
     * @return UUID
     */
    public static String randomUUID() {
        return UUID.randomUUID().toString();
    }

    /**
     * md5加密
     *
     * @param value 要加密的值
     * @return md5加密后的值
     */
    public static String md5Hex(String value) {
        return DigestUtils.md5Hex(value);
    }

    /**
     * sha1加密
     *
     * @param value 要加密的值
     * @return sha1加密后的值
     */
    public static String sha1Hex(String value) {
        return DigestUtils.sha1Hex(value);
    }

    /**
     * sha256加密
     *
     * @param value 要加密的值
     * @return sha256加密后的值
     */
    public static String sha256Hex(String value) {
        return DigestUtils.sha256Hex(value);
    }
    
    /**
     * 将字节数组转换为16进制字符串  
     * @param bytes
     * @return
     */
    public static String BinaryToHexString(byte[] bytes) {  
        String hexStr = "0123456789ABCDEF";  
        String result = "";  
        String hex = "";  
        for (byte b : bytes) {  
            hex = String.valueOf(hexStr.charAt((b & 0xF0) >> 4));  
            hex += String.valueOf(hexStr.charAt(b & 0x0F));  
            result += hex;  
        }  
        return result;  
    }
    
    /**
     * 读取指定文件里的内容
     * @param path
     * @return
     * @throws IOException
     */
	public static byte[] input(String path) throws IOException {
		String basePath = PropertiesUtils.getProperty("uploadFieldName");
		File f = new File(basePath+path);
		InputStream is = new FileInputStream(f);
		byte[] b = new byte[is.available()];
		int islen = is.available();
		// 每次读取的偏移量
		int offset = 1024;
		int count = islen / offset;
		for (int i = 0; i < count; i++) {
			while ((is.read(b)) != -1) {
				is.read(b, offset * i, offset * (i + 1));
			}
		}
		is.read(b, offset * count, is.available());
		is.close();
		return b;
	}
	
	/**
	 * Description: 请求远程数据
	 * @param
	 * @return
	 */
	public static String getURLBackData(String getURL){		
		HttpURLConnection connection = null;
		InputStream inputStream = null;
		InputStreamReader inreReader = null;
		BufferedReader reader = null;
		StringBuffer sb = null;
		try {										
	        //创建一个链接对象
	        URL url = new URL(getURL);
	        //打开链接
	        connection = (HttpURLConnection) url.openConnection();
	        connection.setRequestMethod("POST");
	        //取得输入流，并使用Reader读取   
	        inputStream = connection.getInputStream();
	        inreReader = new InputStreamReader( inputStream, "utf-8");
	        reader = new BufferedReader(inreReader);
	        sb = new StringBuffer();
	        String line = "";
	        while ((line = reader.readLine()) != null) {
	            sb.append(line);	            
	        }
		} catch (Exception e) {
			System.err.println("connectionError");
		}finally{
			//关闭连接
			connection.disconnect();
			try {
				//关闭流
				reader.close();
				inreReader.close();
				inputStream.close();
			} catch (IOException e) {
				System.err.println("closeError");
			}  
		}		
        return sb.toString();
    }
	
	public static void main(String[] args) {
		
		System.out.println(Long.parseLong("01360009000200030001"));
	}
    
}
