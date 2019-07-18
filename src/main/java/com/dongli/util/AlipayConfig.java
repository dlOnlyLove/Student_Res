package com.dongli.util;

import java.io.FileWriter;
import java.io.IOException;

public class AlipayConfig {
    // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
    public static String app_id = "2016092500594588";
    // 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDf8seQlyqW4BRyPUKrUWU8VsK6Gub1Ai68WrKXaKn8XYPeLnqvmu0cMszIpJ1YY6lt/M1deWCN+wpzF7DGqKuhU3xwiaEyxEWjh5Xp40L28Tlf29zIKplMEU3SMZHrEInrxTkzTrcx/ERcg+Tvn5jAevXGcskpXydHYBswvFISOohYqZqeNo3TAxFZ6uI+UD2j+I9QYqD1oeM4tBg7G5oTda+7RY1n06xS8GHv9qFeeShgxs4it8X2wiNZbHUPDKU7sKqa4x/nUMR9bxXBKm1DVgHfz24ETD+VKOB+qn2kKWBLjM6q8DDa2jidP6nqIcxX4fuwQbmkHWcUnUgpc1a9AgMBAAECggEBAJi7Yw9hiVJMkKU40nc0k+6K3VM/dbQzQNyEnrhUUVokDQNCf7mz13Ib0z4jxou5rJuuhgDx/r/WLlJAHffeoO7tmTjHJIETCst0dPGGZO01pwORVwnMw6/1PTXVSMcgCHAbmd88GASnH5hY+5HRLsRXF7e4ISluE8PB78lVJkP3EE6pZ44+wm8wXzlRhpHIouuPvWKulsvVDfI+CAgsr90E8IojX2il+87KR2RAfaPqnrc7gHCWQKnWm8/suksxMTrkv4Pv8rbd1bfO/gfZHgcbu5o9AAQ9fNsJagyrS+d65aQ65Cbk2tFThKvxlPFMwgCJLqv1beb61eNvdu8J3gECgYEA/dX073o6rmT5ae8aZyCm0ydM+CD3VyC8ZUFHVoSd2domxRTSDzXJ5lBrtYrca2cEWLawVJT72422lWNfpYGez7ClPEQXr6VVM4AQeGbX3OfkPYFdSIhHVPuDJe5IFmI6jgrSY5JLuhMRkSDcR200ZOYTRz91ix23y9dAuoYRUw0CgYEA4duWh1tMjx4zufcFc0L23ysMZ3jYypLkhQbjsa+XUY6lBxB1LfDCOM8eUguGD9GPpaLhmYNXGmJQTImioa+6jvS3+lE1J4wSUB8FUpSFBkxb/Jo9BwGxPdpynA70zAwN/u7X+HFYcA4gx2FRdrlmoGpGTSGkTp65M4L6cAvw5nECgYEAkLWTR5tVLOrfzebEFJrmwGYdWS/iEkfVX5xRgR9lpjbZ920hPA6cJbMfVIXvl0NJlRHBgNbWppopxwy6EG7PDPRVnv/qyPXmls+hlCJ9WbDRy8aeWaVnlSk14T/w1OH3I9dDjgRvK4uHbkdfjVDSl9sajnm9FyxABfOXMT8RTVkCgYAw1ydqBdg8aq+M21oWXri78bcw+PUIeVNpYOAEIJB8VnhhWrG8SX/2gPNxkoRfD1Yc32ghpkFDt1bd9jVw+WtCVrEiNEVmU+fx44NnJC7P+ds6eLARv8/wLDj0fld5eHHeWw/g7cHOGYAFHYpcPiNvNQwWyduaFMC/3ucBK9PgQQKBgDPgupNvr2X7SSOaYgwT3lrVhJBs/OmIIfz5LxRcK+/eir65UQxdSIOEc9/CbTgI8Kjn1czlol/YUY7VRkrYUAdX7AI+8JIiVKAWwABBNp2Fg5Vw2U5heWrPSyAElngIqqR1b8gokJUtg9/9Ae3xnjnna86NIyBrqAR0TKajfA6r";
    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvdY1s/6WssmoUM510CGLYIce8hWOy0a3AMx6xRsobRG+3+BOj6dOpfTCeO1OXK4C2xNfICalgwAdHPlhPzVaGPS+ez7nafl22Pkszi5AT5BoiRYzPo1CkMXbqusT4bMX5kC56wfnQR5l2XpRUtJUZyrfXw+igmOtxoAtQq89JbMxYB+ufwzge8AQ5o8xapiYpRBVTZr6czY/MVgM6zKqz2N99AuJtQqw07/F1I7V8fBdtlEAjA8Rzw2ip2N7/S+t+XXN8OAT/FnYNQ4XqfusYlYvF73PV/BKoFL2+Uz3gqdAE9LXvOLcoY2yQrC7dT/tgpN71D8E/ZWqVJFaLDjU0wIDAQAB";

    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "http://localhost:8080/student/notify_url";
    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String return_url = "http://localhost:8080/student/payReturn";
    // 签名方式
    public static String sign_type = "RSA2";

    // 字符编码格式
    public static String charset = "utf-8";

    // 支付宝网关
    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

    // 支付宝网关
    public static String log_path = "G:/logs/";


    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
