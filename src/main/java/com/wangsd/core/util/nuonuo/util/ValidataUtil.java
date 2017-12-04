package com.wangsd.core.util.nuonuo.util;


/**
 *
 */
public class ValidataUtil {

	public static boolean isEmpty(String str){
		if(str == null || str.trim().equals("")){
			return true;
		}
		return false;
	}
}
