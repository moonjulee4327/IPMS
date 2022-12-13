package com.ipms.commons.ftp;

import java.io.IOException;
import java.net.SocketException;

import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPFile;
import org.apache.commons.net.ftp.FTPReply;

import com.ipms.proj.docs.vo.DocsVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class FtpUtilHome {
	
	// FTP 서버의 아이피 주소
	private static final String host = "192.168.0.7";
	// FTP 포트번호 (기본값 21)
	private static final int port = 21;
	// user name
	private static final String user = "mjhome";
	// user password
	private static final String pwd = "java";
	
	/**
	 * FTP 서버에 접속이 되면 FTPClient 반환
	 * @return FTPClient ftp
	 * @throws SocketException 
	 * @throws IOException
	 */
	public static FTPClient ftpServerHomeConnect() {
		
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
			e.printStackTrace();
		}
		
		// 응답코드 체크
		reply = ftp.getReplyCode();
		
		// 연결 체크
		if(!FTPReply.isPositiveCompletion(reply)) { // 비정상 연결
			try {
				ftp.disconnect();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		try {
			ftp.login(user, pwd);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return ftp;
		
	}
	
	
	
	public static DocsVO docsMkdirHome(String filename1, String filename2) {
		DocsVO docsVO = new DocsVO();
		
		FTPClient ftp = ftpServerHomeConnect();
		
		
		try {
			FTPFile[] ftpFiles = ftp.listFiles();
			
			String temp = "";
			
			for(int i = 0; i < ftpFiles.length; i++) {
				FTPFile ftpFile = ftpFiles[i];
				
				log.info("FTP SERVER DIR LIST {}", ftpFile.getName());
				
				if(ftpFile.getName().equals(filename1)) {
					log.info("폴더 이름 중복");
					return docsVO;
				}else {
					continue;
				}
				
			}
			
			ftp.makeDirectory("/" + filename1 + "/" + filename2);
//			ftp.changeWorkingDirectory("/" + filename1 + "/" + filename2 + "/");
			log.info("현재 디렉토리 : " + ftp.printWorkingDirectory());
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		try {
			ftp.disconnect();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
//		docsVO.setFoldName(dirName);
		
		return docsVO;
	}
	
}
