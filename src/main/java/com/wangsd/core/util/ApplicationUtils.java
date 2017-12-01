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
        if (pay_type == StaticVar.billaccount_paystatus1) {
            payType = "现金";
        } else if (pay_type == StaticVar.billaccount_paystatus2) {
            payType = "支付宝";
        } else if (pay_type == StaticVar.billaccount_paystatus3) {
            payType = "微信";
        } else if (pay_type == StaticVar.billaccount_paystatus4) {
            payType = "POS机";
        } else {
            payType = "其他";
        }
        return payType;
    }

    /**
     * 获取费用类型
     * @param cost_type
     * @return
     */
//    public static String getCostType(Integer cost_type) {
//        String costType;
//        if (cost_type == StaticVar.billaccount_cost_type1) {
//            costType = "物业管理费";
//        } else if (cost_type == StaticVar.billaccount_cost_type2) {
//            costType = "水电公摊费";
//        } else if (cost_type == StaticVar.billaccount_cost_type3) {
//            costType = "垃圾清运费";
//        } else if (cost_type == StaticVar.billaccount_cost_type4) {
//            costType = "公共照明费";
//        } else if (cost_type == StaticVar.billaccount_cost_type5) {
//            costType = "水费";
//        } else if (cost_type == StaticVar.billaccount_cost_type6) {
//            costType = "电费";
//        } else if (cost_type == StaticVar.billaccount_cost_type7) {
//            costType = "蒸汽费";
//        } else {
//            costType = "其他";
//        }
//        return costType;
//    }

    public static void main(String[] args) {

        System.out.println(getOrgCode("00100010002"));
    }

}
