package com.wangsd.core.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class RadomUtil {
	
	public static String getFlowId() {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		String dateString=sdf.format(new Date());
		String random=getRandom(4);
		return dateString+random;
	}
	
	public static String getUserId() {
		SimpleDateFormat sdf=new SimpleDateFormat("MMddHHmmss");
		String dateString=sdf.format(new Date());
		String preUserid=getRandom(2);
		String endUserid=getRandom(2);
		return preUserid + dateString + endUserid;
	}
	
	/**
	 * 产生n位随机数
	 * @param n 随机数数量
	 * @return n位随机数
	 */
	public static String getRandom(int n) {
		String result = "";
		Random random = new Random();
		for (int i = 0; i < n; i++) {
			result += random.nextInt(10);
		}
		return result;
	}
	
	public static void main(String[] args) {
		for (int i=0; i<7; i++) {
			System.out.println(getFlowId());
		}		
	}
}
