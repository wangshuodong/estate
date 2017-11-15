package com.wangsd.core.util;

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
	 * 生成组织机构代码
	 */
	public static String getOrgCode(String maxCode) {
		String code = maxCode.substring(0, maxCode.length()-4);
		Long max = Long.parseLong(maxCode.substring(maxCode.length()-4, maxCode.length())) +1;
		String end = DecimalFormatUtils.format("0000", max);
		return code + end;
	}
	
	public static void main(String[] args) {
		
		System.out.println(getOrgCode("00100010002"));
	}
    
}
