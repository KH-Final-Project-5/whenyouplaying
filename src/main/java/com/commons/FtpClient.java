package com.commons;

import lombok.NoArgsConstructor;
import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.SocketException;

@NoArgsConstructor
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
    public boolean upload(File fileObj, String filename) throws SocketException, IOException, Exception {
        FileInputStream fis = null;
        FTPClient ftpClient = new FTPClient();

        try {
            ftpClient.connect(serverIp, serverPort);  //ftp 연결
            ftpClient.setControlEncoding("UTF-8");    //ftp 인코딩설정
            int reply = ftpClient.getReplyCode();     //응답코드받기

            if (!FTPReply.isPositiveCompletion(reply)) {  //응답이 false 라면 연결 해제 exception 발생
                ftpClient.disconnect();
                throw new Exception(serverIp+" FTP 서버 연결 실패");
            }

            ftpClient.setSoTimeout(1000 * 10);   //timeout 설정
            ftpClient.login(user, password);     //ftp 로그인
            ftpClient.changeWorkingDirectory("/html/stoarge");
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

    public File convert(MultipartFile file) throws IOException {
        File file1 = new File(file.getOriginalFilename());
        file.transferTo(file1);
        return file1;
    }
}

