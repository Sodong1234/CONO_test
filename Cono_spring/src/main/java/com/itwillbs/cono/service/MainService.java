package com.itwillbs.cono.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.itwillbs.cono.mapper.MainMapper;
import com.itwillbs.cono.vo.ItemDTO;
import com.itwillbs.cono.vo.MemberDTO;


@Service
public class MainService {
	
	@Autowired
	MainMapper mapper;
	
	public MemberDTO loginMember(MemberDTO member) {
		return mapper.checkMember(member);
	}

	public int joinMember(MemberDTO member) {
		return mapper.insertMember(member);
	}

	public void joinCoupon(String member_id) {
		mapper.insertJoinCoupon(member_id);
	}

	public List<HashMap<String, String>> getCardList(String searchText) {
		return mapper.selectCardList(searchText);
	}

	public List<HashMap<String, String>> getCategoryCardList(String cgr) {
		return mapper.selectCategoryCardList(cgr);
	}

	public void setShopInfo(String member_id, String member_nick) {
		mapper.insertShopInfo(member_id, member_nick);
	}

	// 실시간 인기상품 - 김혜은
	public List<ItemDTO> getHotItemList() {
		
		return mapper.selectHotItemList();
	}
	// 최근게시물 조회
	public List<HashMap<String, String>> getRecent(String sId) {
		return mapper.selectRecent(sId);
	}
	
	// ------------- 카카오 로그인 토큰 발급 
//	 public String getAccessToken (String authorize_code) {
//         String access_Token = "";
//         String refresh_Token = "";
//         String reqURL = "https://kauth.kakao.com/oauth/token";
//
//         try {
//             URL url = new URL(reqURL);
//
//             HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//
//             //    POST 요청을 위해 기본값이 false인 setDoOutput을 true로
//
//             conn.setRequestMethod("POST");
//             conn.setDoOutput(true);
//
//             //    POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
//             BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
//             StringBuilder sb = new StringBuilder();
//             sb.append("grant_type=authorization_code");
//             sb.append("&client_id=f9f5f6880f6e92a9e2fabbf34781366d");  //본인이 발급받은 key
//             sb.append("&redirect_uri=http://localhost:8080/cono/kakao_callback");     // 본인이 설정해 놓은 경로
//             sb.append("&code=" + authorize_code);
//             bw.write(sb.toString());
//             bw.flush();
//
//             //    결과 코드가 200이라면 성공
//             int responseCode = conn.getResponseCode();
//             System.out.println("responseCode : " + responseCode);
//
//             //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
//             BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//             String line = "";
//             String result = "";
//
//             while ((line = br.readLine()) != null) {
//                 result += line;
//             }
//             System.out.println("response body : " + result);
//             //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
//             JsonParser parser = new JsonParser();
//             JsonElement element = parser.parse(result);
//             
//
//             access_Token = element.getAsJsonObject().get("access_token").getAsString();
//             refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
//
//             System.out.println("access_token : " + access_Token);
//             System.out.println("refresh_token : " + refresh_Token);
//
//             br.close();
//             bw.close();
//         } catch (IOException e) {
//             // TODO Auto-generated catch block
//             e.printStackTrace();
//         }
//
//         return access_Token;
//     }
	 
	 // ----------- 사용자 정보 요청
	 
//	 public HashMap<String, Object> getUserInfo (String access_Token) {
//
//         //    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
//         HashMap<String, Object> userInfo = new HashMap<>();
//         String reqURL = "https://kapi.kakao.com/v2/user/me";
//         try {
//             URL url = new URL(reqURL);
//             HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//             conn.setRequestMethod("GET");
//
//             //    요청에 필요한 Header에 포함될 내용
//             conn.setRequestProperty("Authorization", "Bearer " + access_Token);
//
//             int responseCode = conn.getResponseCode();
//             System.out.println("UI responseCode : " + responseCode);
//
//             BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//
//             String line = "";
//             String result = "";
//
//             while ((line = br.readLine()) != null) {
//                 result += line;
//             }
//             System.out.println("UI response body : " + result);
//
//             JsonParser parser = new JsonParser();
//             JsonElement element = parser.parse(result);
//             System.out.println("=====JSON parse ===== element : " + element);
//             JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
//             JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
//             System.out.println("=====JSON object ===== kakao_account : " + kakao_account);
//
//             String nickname = properties.getAsJsonObject().get("nickname").getAsString();
//             String email = kakao_account.getAsJsonObject().get("email").getAsString();
//             String birth = kakao_account.getAsJsonObject().get("birthday").getAsString();
////             String profile_image = properties.getAsJsonObject().get("profile_image").getAsString();
//             
//             System.out.println("nickname : " + nickname.isEmpty());
//             System.out.println("email : " + email.isEmpty());
//             System.out.println("birth : " + birth.isEmpty());
//             System.out.println("nickname : " + nickname);
//             System.out.println("birth : " + birth);
//             System.out.println("email : " + email);
//             
//             userInfo.put("nick", nickname);
//             userInfo.put("email", email);
//             userInfo.put("birth", birth);
////             userInfo.put("profile_image", profile_image);
//             System.out.println("==== UI 끝 ====");
//         } catch (IOException e) {
//             // TODO Auto-generated catch block
//             e.printStackTrace();
//         }
//
//         return userInfo;
//     }


     public String getReturnAccessToken(String code) {
         String access_token = "";
         String refresh_token = "";
         String reqURL = "https://kauth.kakao.com/oauth/token";

        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

             //HttpURLConnection 설정 값 셋팅
             conn.setRequestMethod("POST");
             conn.setDoOutput(true);

             


             // buffer 스트림 객체 값 셋팅 후 요청
             BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
             StringBuilder sb = new StringBuilder();
	         sb.append("grant_type=authorization_code");
	         sb.append("&client_id=f9f5f6880f6e92a9e2fabbf34781366d");  //본인이 발급받은 key
	         sb.append("&redirect_uri=http://localhost:8080/cono/kakao_callback");     // 본인이 설정해 놓은 경로
             
             sb.append("&code=" + code);
             bw.write(sb.toString());
             bw.flush();

             int responseCode = conn.getResponseCode();
             System.out.println("responseCode : " + responseCode);
             
             //  RETURN 값 result 변수에 저장
             BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
             String br_line = "";
             String result = "";

             while ((br_line = br.readLine()) != null) {
                 result += br_line;
             }

             JsonParser parser = new JsonParser();
             JsonElement element = parser.parse(result);

             System.out.println("중간");
             // 토큰 값 저장 및 리턴
             access_token = element.getAsJsonObject().get("access_token").getAsString();
             refresh_token = element.getAsJsonObject().get("refresh_token").getAsString();

             br.close();
             bw.close();
         } catch (IOException e) {
             e.printStackTrace();
         }

         return access_token;
     }

     public Map<String,Object> getUserInfo(String access_token) {
         Map<String,Object> resultMap =new HashMap<>();
         String reqURL = "https://kapi.kakao.com/v2/user/me";
          try {
              URL url = new URL(reqURL);
              HttpURLConnection conn = (HttpURLConnection) url.openConnection();
              conn.setRequestMethod("GET");

             //요청에 필요한 Header에 포함될 내용
              conn.setRequestProperty("Authorization", "Bearer " + access_token);

              int responseCode = conn.getResponseCode();
              System.out.println("UI responseCode : " + responseCode);

              BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

              String br_line = "";
              String result = "";

              while ((br_line = br.readLine()) != null) {
                  result += br_line;
              }
             System.out.println("response:" + result);


              JsonParser parser = new JsonParser();
              JsonElement element = parser.parse(result);
              JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
              JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
              
              System.out.println("kakao_acc : " + kakao_account);
              
              String id = element.getAsJsonObject().get("id").getAsString();
              String nickname = properties.getAsJsonObject().get("nickname").getAsString();
              String email = kakao_account.getAsJsonObject().get("email").getAsString();
              String birth = kakao_account.getAsJsonObject().get("birthday").getAsString();
              
              System.out.println("id:"+id);
              System.out.println("nickname:"+nickname);
              System.out.println("email:"+email);
              System.out.println("birth:"+birth);
              
              resultMap.put("nickname", nickname);
              resultMap.put("id", id);
              resultMap.put("email", email); 
              resultMap.put("birth", birth); 

              
              
          } catch (IOException e) {
              // TODO Auto-generated catch block
              e.printStackTrace();
          }
          return resultMap;
      }
	
}
