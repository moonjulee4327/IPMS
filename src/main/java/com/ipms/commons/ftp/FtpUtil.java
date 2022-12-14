package com.ipms.commons.ftp;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.SocketException;

import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPFile;
import org.apache.commons.net.ftp.FTPReply;
import org.springframework.web.multipart.MultipartFile;

import com.ipms.proj.docs.vo.DocsVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class FtpUtil {
	
	// FTP 서버의 아이피 주소
	private static final String host = "192.168.36.62"; // 서버 컴 : 192.168.142.9
	// FTP 포트번호 (기본값 21)
	private static final int port = 21;
	// user name
	private static final String user = "IPMSFOLDER"; // 서버 컴 : finalproj
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
		} catch (IOException e) {
			log.error("FtpUtil - ftpServerConnect -> FTP 서버 로그인 에러");
			e.printStackTrace();
		}
		
		return ftp;
		
	}
	
	
	
	/**
	 * 폴더 생성
	 * @param foldName
	 * @return
	 */
	public static boolean ftpDocsMkdir(String foldName) {
		
		boolean flag = false;
		
		FTPClient ftp = ftpServerConnect();
		
		try {
			FTPFile[] ftpFiles = ftp.listFiles();
			
			for(int i = 0; i < ftpFiles.length; i++) {
				FTPFile ftpFile = ftpFiles[i];
				
				log.info("FtpUtil - docsMkdir -> FTP SERVER DIR LIST {}", ftpFile.getName());
				
			}
			
			// 나중에 프로젝트 아이디와 폴더함 번호 받아서 프로젝트 별 폴더 생성 구현하기
			flag = ftp.makeDirectory("/" + foldName);
			
		} catch (IOException e) {
			log.error("FtpUtil - docsMkdir -> FTP 폴더 만들기 오류");
			e.printStackTrace();
		} finally {
			try {
				ftp.disconnect();
			} catch (IOException e) {
				log.error("FtpUtil - docsMkdir -> FTP 서버 접속 종료 에러");
				e.printStackTrace();
			}
		}
		
		
		return flag;
	}
	
	
	public static void ftpFileUpload(MultipartFile file) {
		
		FTPClient ftp = ftpServerConnect();
		
		try(InputStream is = file.getInputStream();
				OutputStream os = ftp.storeFileStream(file.getName());
			) {
			
			byte[] buffer = new byte[1024];
			int length = -1;
			
			while( (length = is.read(buffer, 0, buffer.length)) != -1) {
				os.write(buffer, 0, length);
			}
			
		} catch (IOException e) {
			log.error("FtpUtil - ftpFileUpload -> FTP 파일 생성 오류");
			e.printStackTrace();
		}finally {
			try {
				ftp.disconnect();
			} catch (IOException e) {
				log.error("FtpUtil - ftpFileUpload -> FTP 서버 접속 종료 에러");
				e.printStackTrace();
			}
			
		}
		
		
	}
}
