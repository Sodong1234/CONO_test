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
import com.itwillbs.cono.vo.PageInfo;


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
	public List<HashMap<String, String>> getPriceList(String filter1, String filter2, String searchText, PageInfo pageInfo) {
		return mapper.selectPriceList(filter1, filter2, searchText,pageInfo);
	}
	

	// 실시간 인기상품 - 김혜은
	public List<ItemDTO> getHotItemList() {
		
		return mapper.selectHotItemList();
	}
	// 최근게시물 조회
	public List<HashMap<String, String>> getRecent(String sId) {
		return mapper.selectRecent(sId);
	}
	
	// 카톡 로그인 - 키를 이용하여 토큰 받아오기
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

           //결과 코드가 200이라면 성공 - 400 , 401 sb 부분 입력 확인
             int responseCode = conn.getResponseCode();
             System.out.println("responseCode : " + responseCode);
             
           //요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
             BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
             String br_line = "";
             String result = "";

             while ((br_line = br.readLine()) != null) {
                 result += br_line;
             }
             
           //Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성 	
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
         String reqURL = "https://kapi.kakao.com/v2/user/me"; // - Rest API - for 카카오톡 요소 사용(properties, kakao_accout)
         
       //access_token을 이용하여 사용자 정보 조회
          try {
              URL url = new URL(reqURL);
              HttpURLConnection conn = (HttpURLConnection) url.openConnection();
              conn.setRequestMethod("GET");

             //요청에 필요한 Header에 포함될 내용
              conn.setRequestProperty("Authorization", "Bearer " + access_token);

            //결과 코드가 200이라면 성공
              int responseCode = conn.getResponseCode();
              System.out.println("UI responseCode : " + responseCode);

              BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

              String br_line = "";
              String result = "";

              while ((br_line = br.readLine()) != null) {
                  result += br_line;
              }

              //Gson 라이브러리로 JSON파싱
              JsonParser parser = new JsonParser();
              JsonElement element = parser.parse(result);
              JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
              JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
              
              String nickname = properties.getAsJsonObject().get("nickname").getAsString();
              String email = kakao_account.getAsJsonObject().get("email").getAsString();
              String birth = kakao_account.getAsJsonObject().get("birthday").getAsString();
              String id = element.getAsJsonObject().get("id").getAsString();
              
              System.out.println("id: "+id);
              System.out.println("nickname: "+nickname);
              System.out.println("email: "+email);
              System.out.println("birth: "+birth);
              
              resultMap.put("nickname", nickname);
              resultMap.put("id", id);
              resultMap.put("email", email); 
              resultMap.put("birth", birth); 

              
              
          } catch (IOException e) {
              e.printStackTrace();
          }
          return resultMap;
      }

	public int getCardListCount(String filter1, String filter2, String searchText) {
		return mapper.selectCardListCount(filter1, filter2,searchText);
	}


	
}
