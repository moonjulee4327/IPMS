package com.ipms.commons.ftp;

import java.io.IOException;
import java.net.SocketException;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class FtpExTest {
	
	// FTP 서버의 아이피 주소
	private static final String host = "192.168.42.49"; // 서버 컴 : 192.168.142.9
	// FTP 포트번호 (기본값 21)
	private static final int port = 21;
	// user name
	private static final String user = "mjmj"; // 서버 컴 : finalproj
	// user password
	private static final String pwd = "java";
	
	/**
	 * FTP 서버에 접속이 되면 FTPClient 반환
	 * @return FTPClient ftp
	 * @throws SocketException 
	 * @throws IOException
	 */
	public static FTPClient ftpServerConnect() {
		
		// commons-net으로 FTPClient 생성
		FTPClient ftp = null;
		ftp = new FTPClient();
		
		ftp.setControlEncoding("UTF-8");
		
		// 응답 코드를 담는 변수
		int reply = 0;
		
		// 호스트 연결
		try {
			ftp.connect(host, port);
		} catch (IOException e) {
			log.error("FtpUtil - ftpServerConnect -> FTP 서버 호스트 연결 에러");
			e.printStackTrace();
		}
		
		// 응답코드 체크
		reply = ftp.getReplyCode();
		
		// 연결 체크
		if(!FTPReply.isPositiveCompletion(reply)) { // 비정상 연결
			try {
				ftp.disconnect();
			} catch (IOException e) {
				log.error("FtpUtil - ftpServerConnect -> 비정상적인 FTP 서버 연결");
				e.printStackTrace();
			}
		}
		
		try {
			ftp.login(user, pwd);
			ftp.setFileType(FTP.BINARY_FILE_TYPE);
			ftp.enterLocalPassiveMode();
		} catch (IOException e) {
			log.error("FtpUtil - ftpServerConnect -> FTP 서버 로그인 에러");
			e.printStackTrace();
		}
		
		return ftp;
		
	}
	
	
	
	
	
}
