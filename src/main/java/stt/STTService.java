package stt;

import java.io.BufferedReader;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.JSONObject;
import org.springframework.stereotype.Service;

import project.two.shadow.NaverService;

@Service
public class STTService implements NaverService {

	@Override  //필수
	public String test(String file) {
		 return test(file, "Kor");
	}//test(String file) end
	//메소드 추가
	
	public String test(String file, String language) {
        String clientId = "1ha8ur3dox";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "jp0VCunkagZpYP8S9esAMFJIYQxnA5NtX17ft61A";//애플리케이션 클라이언트 시크릿값";
        StringBuffer response = new StringBuffer();

        try {
        	String imgFile = "C:/Users/JS/Desktop/" + file;
            File voiceFile = new File(imgFile);

            //String language = "Kor";        // 언어 코드 ( Kor, Jpn, Eng, Chn )
            String apiURL = "https://naveropenapi.apigw.ntruss.com/recog/v1/stt?lang=" + language;
            URL url = new URL(apiURL);

            HttpURLConnection conn = (HttpURLConnection)url.openConnection();
            conn.setUseCaches(false);
            conn.setDoOutput(true);
            conn.setDoInput(true);
            conn.setRequestProperty("Content-Type", "application/octet-stream");
            conn.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
            conn.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);

            OutputStream outputStream = conn.getOutputStream();
            FileInputStream inputStream = new FileInputStream(voiceFile);
            byte[] buffer = new byte[4096];
            int bytesRead = -1;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
            outputStream.flush();
            inputStream.close();
            BufferedReader br = null;
            int responseCode = conn.getResponseCode();
            if(responseCode == 200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            } else {  // 오류 발생
                System.out.println("error!!!!!!! responseCode= " + responseCode);
                br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            }
            String inputLine;

            if(br != null) {
                //StringBuffer response = new StringBuffer();
                while ((inputLine = br.readLine()) != null) {
                    response.append(inputLine);
                }
                br.close();
                //음성인식 결과 json형변환 -> "text"값 내용만 추출
                JSONObject obj = new JSONObject(response.toString());
            	String text = (String)obj.get("text");                
                //System.out.println(text);//{text:xxxx}텍스트변환
            } else 
            {
                System.out.println("error !!!");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return response.toString();
	}
}
