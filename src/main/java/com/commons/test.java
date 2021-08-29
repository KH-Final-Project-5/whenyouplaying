package com.commons;

import java.io.File;

public class test {
    public static void main(String[] args) throws Exception {
        FtpClient ftpClient = new FtpClient("wjwan0.dothome.co.kr", 21, "wjwan0", "aqpalzm13!");
        File path = new File("/Users/wj/Downloads/KakaoTalk_20210811_192808556.jpg");

        ftpClient.upload(path, "KakaoTalk_20210811_192808556.jpg", "");

    }
}
