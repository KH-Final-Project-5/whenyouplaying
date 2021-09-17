package com.commons;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import jdk.nashorn.internal.runtime.regexp.joni.Config;
import org.apache.http.HttpResponse;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.apache.http.impl.client.BasicAuthCache;
import org.apache.http.impl.auth.BasicScheme;
import org.apache.http.client.AuthCache;
import org.apache.http.HttpHost;
import org.apache.http.client.protocol.HttpClientContext;



/* XXX didn't use org.json to be simple
import org.json.JSONObject; 
*/

public class test {
    public static void main(String[] args) throws Exception {

        FtpClient ftpClient = new FtpClient("wjwan0.dothome.co.kr", 21, "wjwan0", "aqpalzm13!");


        String deal = String.valueOf(111);

        File tempDir = new File("");

        String dir = tempDir.getAbsolutePath();

        File file = ftpClient.downloadTxt(deal, dir);

        Path path = Paths.get(dir + "/" + deal + ".txt");

        Stream<String> lines = Files.lines(path);

        String line = lines.collect(Collectors.joining(System.lineSeparator()));

        System.out.println(line);


        file.delete();

    }
}