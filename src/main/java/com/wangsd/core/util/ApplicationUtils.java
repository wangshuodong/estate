package com.wangsd.core.util;

import java.util.UUID;

/**
 * ApplicationUtils : 程序工具类，提供大量的便捷方法
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
     *
     * @param maxCode
     * @return
     */
    public static String getOrgCode(String maxCode) {
        String code = maxCode.substring(0, maxCode.length() - 4);
        Long max = Long.parseLong(maxCode.substring(maxCode.length() - 4, maxCode.length())) + 1;
        String end = DecimalFormatUtils.format("0000", max);
        return code + end;
    }

    /**
     * 获取支付方式
     *
     * @param pay_type
     * @return
     */
    public static String getPayType(Integer pay_type) {
        String payType;
        if (pay_type == StaticVar.BILLACCOUNT_PAYSTATUS1) {
            payType = "现金";
        } else if (pay_type == StaticVar.BILLACCOUNT_PAYSTATUS2) {
            payType = "支付宝";
        } else if (pay_type == StaticVar.BILLACCOUNT_PAYSTATUS3) {
            payType = "微信";
        } else if (pay_type == StaticVar.BILLACCOUNT_PAYSTATUS4) {
            payType = "POS机";
        }  else if (pay_type == StaticVar.BILLACCOUNT_PAYSTATUS5) {
            payType = "银行转帐";
        }  else if (pay_type == StaticVar.BILLACCOUNT_PAYSTATUS6) {
            payType = "抵用券";
        } else {
            payType = "其他";
        }
        return payType;
    }

    public static void main(String[] args) {

        System.out.println(getOrgCode("00100010002"));
    }

}
