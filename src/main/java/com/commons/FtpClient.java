package com.commons;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPFile;
import org.apache.commons.net.ftp.FTPReply;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.SocketException;
import java.util.Arrays;

@NoArgsConstructor
@Component
@Setter
@Getter
public class FtpClient {
    private String serverIp;
    private int serverPort;
    private String user;
    private String password;

    public FtpClient(String serverIp, int serverPort, String user, String password) {
        this.serverIp = serverIp;
        this.serverPort = serverPort;
        this.user = user;
        this.password = password;
    }

    public boolean upload(File fileObj, String filename, String directory) throws SocketException, IOException, Exception {
        boolean isExist;
        FileInputStream fis = null;
        FTPClient ftpClient = new FTPClient();
        FTPFile[] ftpFiles = null;

        try {
            ftpClient.connect(serverIp, serverPort);  //ftp 연결
            ftpClient.setControlEncoding("UTF-8");    //ftp 인코딩설정
            int reply = ftpClient.getReplyCode();     //응답코드받기

            if (!FTPReply.isPositiveCompletion(reply)) {  //응답이 false 라면 연결 해제 exception 발생
                ftpClient.disconnect();
                throw new Exception(serverIp + " FTP 서버 연결 실패");
            }

            ftpClient.setSoTimeout(1000 * 10);   //timeout 설정
            ftpClient.login(user, password);     //ftp 로그인

            isExist = ftpClient.changeWorkingDirectory("/html/stoarge/" + directory);

            if (!isExist) {
                ftpClient.makeDirectory("/html/stoarge/" + directory);
                ftpClient.changeWorkingDirectory("/html/stoarge/" + directory);
            }
            System.out.println("파일업로드위치 : " + ftpClient.printWorkingDirectory());
            ftpClient.setFileType(FTP.BINARY_FILE_TYPE); //파일타입설정
            ftpClient.enterLocalActiveMode();  //active 모드 설정
            String tmp = "/html/stoarge/" + directory;
            ftpFiles = ftpClient.listFiles(tmp);
            if (ftpFiles != null && ftpFiles.length > 0) {
                String fileoption = filename.substring(filename.indexOf("."));

                filename = (ftpFiles.length + 1) + fileoption;
            }

            fis = new FileInputStream(fileObj);
            return ftpClient.storeFile(filename, fis); //파일 업로드
        } finally {
            if (ftpClient.isConnected()) {
                ftpClient.disconnect();
            }
            if (fis != null) {
                fis.close();
            }
        }
    }

    public String fileName(String filename, String directory) throws Exception {
        boolean isExist;
        FileInputStream fis = null;
        FTPClient ftpClient = new FTPClient();
        FTPFile[] ftpFiles = null;

        try {
            ftpClient.connect(serverIp, serverPort);  //ftp 연결
            ftpClient.setControlEncoding("UTF-8");    //ftp 인코딩설정
            int reply = ftpClient.getReplyCode();     //응답코드받기

            if (!FTPReply.isPositiveCompletion(reply)) {  //응답이 false 라면 연결 해제 exception 발생
                ftpClient.disconnect();
                throw new Exception(serverIp + " FTP 서버 연결 실패");
            }

            ftpClient.setSoTimeout(1000 * 10);   //timeout 설정
            ftpClient.login(user, password);     //ftp 로그인

            isExist = ftpClient.changeWorkingDirectory("/html/stoarge/" + directory);

            if (!isExist) {
                ftpClient.makeDirectory("/html/stoarge/" + directory);
                ftpClient.changeWorkingDirectory("/html/stoarge/" + directory);
            }
            ftpClient.setFileType(FTP.BINARY_FILE_TYPE); //파일타입설정
            ftpClient.enterLocalActiveMode();  //active 모드 설정
            String tmp = "/html/stoarge/" + directory;
            ftpFiles = ftpClient.listFiles(tmp);
            if (ftpFiles != null && ftpFiles.length > 0) {
                String fileoption = filename.substring(filename.indexOf("."));
                filename = filename.substring(0, filename.indexOf("."));

                filename = (ftpFiles.length + 1) + fileoption;
            }


            return filename;
        } finally {
            if (ftpClient.isConnected()) {
                ftpClient.disconnect();
            }
            if (fis != null) {
                fis.close();
            }
        }

    }

    public boolean uploadTxt(File fileObj, String filename) throws SocketException, IOException, Exception {
        boolean isExist;
        FileInputStream fis = null;
        FTPClient ftpClient = new FTPClient();
        FTPFile[] ftpFiles = null;

        try {
            ftpClient.connect(serverIp, serverPort);  //ftp 연결
            ftpClient.setControlEncoding("UTF-8");    //ftp 인코딩설정
            int reply = ftpClient.getReplyCode();     //응답코드받기

            if (!FTPReply.isPositiveCompletion(reply)) {  //응답이 false 라면 연결 해제 exception 발생
                ftpClient.disconnect();
                throw new Exception(serverIp + " FTP 서버 연결 실패");
            }

            ftpClient.setSoTimeout(1000 * 10);   //timeout 설정
            ftpClient.login(user, password);     //ftp 로그인

            isExist = ftpClient.changeWorkingDirectory("/html/dealChat");

            if (!isExist) {
                ftpClient.makeDirectory("/html/dealChat");
                ftpClient.changeWorkingDirectory("/html/dealChat");
            }
            System.out.println("파일업로드위치 : " + ftpClient.printWorkingDirectory());
            ftpClient.setFileType(FTP.BINARY_FILE_TYPE); //파일타입설정
            ftpClient.enterLocalActiveMode();  //active 모드 설정

            fis = new FileInputStream(fileObj);
            return ftpClient.storeFile(filename, fis); //파일 업로드
        } finally {
            if (ftpClient.isConnected()) {
                ftpClient.disconnect();
            }
            if (fis != null) {
                fis.close();
            }
        }
    }

    public File downloadTxt(String dealNo, String dir) throws SocketException, IOException, Exception {
        FileInputStream fis = null;
        FTPClient ftpClient = new FTPClient();

        try {
            ftpClient.connect(serverIp, serverPort);  //ftp 연결
            ftpClient.setControlEncoding("UTF-8");    //ftp 인코딩설정
            int reply = ftpClient.getReplyCode();     //응답코드받기

            if (!FTPReply.isPositiveCompletion(reply)) {  //응답이 false 라면 연결 해제 exception 발생
                ftpClient.disconnect();
                throw new Exception(serverIp + " FTP 서버 연결 실패");
            }

            ftpClient.setSoTimeout(1000 * 10);   //timeout 설정
            ftpClient.login(user, password);     //ftp 로그인

            ftpClient.changeWorkingDirectory("/html/dealChat");

            ftpClient.setFileType(FTP.BINARY_FILE_TYPE); //파일타입설정
            ftpClient.enterLocalActiveMode();  //active 모드 설정

            String[] filesName = ftpClient.listNames(dealNo + ".txt");

            File file = null;
            FileOutputStream outputstream;


            for (int i = 0; i < filesName.length; i++) {
                file = new File(dir, filesName[i]);
                outputstream = new FileOutputStream(file);
                boolean abc = ftpClient.retrieveFile("/html/dealChat/" + filesName[i], outputstream);
            }

            return file;




//            fis = new FileInputStream(fileObj);
//            return ftpClient.storeFile(filename, fis); //파일 업로드
        } finally {
            if (ftpClient.isConnected()) {
                ftpClient.disconnect();
            }
            if (fis != null) {
                fis.close();
            }
        }
    }




    public File convert(MultipartFile file) throws IOException {
        File file1 = new File(file.getOriginalFilename());
        file.transferTo(file1);
        return file1;
    }
}

