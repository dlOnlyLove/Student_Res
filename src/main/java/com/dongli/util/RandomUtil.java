package com.dongli.util;


/**
 * 随机数生成工具类
 */
public class RandomUtil {
    public static int getRandNum() {
        return (int)((Math.random()*9+1)*1000);
    }
}
