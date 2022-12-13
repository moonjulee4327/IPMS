package com.ipms.commons.ftp;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.net.PrintCommandListener;
import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;

public class FilezillaUtil {
	
	/**
	 * FTP 서버 접속과 파일을 업로드 하는 기능
	 * 
	 * @param host : FTP 서버의 IP
	 * @param port : 포트번호(기본 포트번호 21)
	 * @param user : 서버 사용자
	 * @param pwd : 비밀번호
	 * @param revFile : 저장할 파일 객체
	 * @throws IOException
	 */
	public static void FTPUploader(String host, int port, String user, String pwd, File revFile) throws IOException {
		
		// commons-net으로 FTPClient 생성
		FTPClient ftp = null;
		ftp = new FTPClient();
		
		ftp.addProtocolCommandListener(new PrintCommandListener(new PrintWriter(revFile)));
		
		int reply = 0;
		
		// 호스트 연결
		ftp.connect(host, port);
		
		// 응답코드 체크
		reply = ftp.getReplyCode();
		
		// 연결 체크
		if(!FTPReply.isPositiveCompletion(reply)) { // 비정상 연결
			ftp.disconnect();
		}else { // 정상일 경우 진행
			
			Date from = new Date();
			
			// 현재 시간
			SimpleDateFormat nowDateHHmmss = new SimpleDateFormat("HHmmss");
			SimpleDateFormat nowDateymd = new SimpleDateFormat("yyyyMMdd");
			
			String nowHHmmss = nowDateHHmmss.format(from);
			String nowymd = nowDateymd.format(from);
			
			// 로그인
			ftp.login(user, pwd);
			showServerReply(ftp);
			
			// ftop 디렉토리 생성
			ftp.makeDirectory("/VOL1/personalApi/" + nowymd);
			showServerReply(ftp);
			
			ftp.makeDirectory("/VOL1/personalApi/" + nowymd + "/" + nowHHmmss);
			showServerReply(ftp);
			
			// 디렉토리 변경
			ftp.changeWorkingDirectory("/VOL1/personalApi/" + nowymd + "/" + nowHHmmss);
			showServerReply(ftp);
			System.out.println(ftp.printWorkingDirectory());
			
			// ctive Mode -> PassvieMode로 변경

//            FTP의 active Mode, Passive Mode
//                 Active Mode : Server가 client의 해당 포트 접속해 데이터를 보내줌.
//                 Passive Mode : Server에서 클라이언트에 port 전달 , 그 Port로 server는 보내줌.
//                                     방화벽, 네트워크 구조 신경쓸 필요 없음. 
//                                     이러한 이유로 방화벽 및 네트워크 구조에 신경 안쓰기 위해 Passive Mode로 변경
			
			ftp.enterLocalPassiveMode();
			showServerReply(ftp);
			
			FileInputStream fis = null;
			fis = new FileInputStream(revFile);
			
			ftp.setFileType(FTP.BINARY_FILE_TYPE);
			// ftp 파일 업로드 
			boolean isSuccess = ftp.storeFile(revFile.getName(), fis);
			
			// 파일업로드 성공 시
			if(isSuccess) {
				System.out.println("업로드 성공");
			}
			
			
		}
		
		
		
	}

	private static void showServerReply(FTPClient ftp) {
		String[] replies = ftp.getReplyStrings();
		if(replies != null && replies.length > 0) {
			for(String aReply : replies) {
				System.out.println("SERVER : " + aReply);
			}
		}
	}
}
