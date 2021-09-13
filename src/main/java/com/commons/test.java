package com.commons;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class test {
    public static void main(String[] args) throws Exception {
        FtpClient ftpClient = new FtpClient("wjwan0.dothome.co.kr", 21, "wjwan0", "aqpalzm13!");
        File tempDir = new File("");

        String dir = tempDir.getAbsolutePath();

        File file = ftpClient.downloadTxt("107", dir);


        /*try(PrintWriter out = new PrintWriter(new BufferedWriter(new FileWriter("107.txt", true)))) {
            out.println("the text");
            //more code
            out.println("more text");
            //more code
        }catch (IOException e) {
            //exception handling left as an exercise for the reader
        }*/

        /*Path path = Paths.get(dir + "/107.txt");

        Stream<String> lines = Files.lines(path);

        String conetnt = lines.collect(Collectors.joining(System.lineSeparator()));
        System.out.println(conetnt);
        lines.close();
//        ftpClient.uploadTxt(file, "107.txt");

        file.delete();

        System.out.println("다운로드 후 삭제");*/




    }
}
