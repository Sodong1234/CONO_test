package com.itwillbs.cono.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.cono.vo.AccountSearchRequestVO;
import com.itwillbs.cono.vo.AccountSearchResponseVO;
import com.itwillbs.cono.vo.RequestTokenVO;
import com.itwillbs.cono.vo.ResponseTokenVO;

@Service
public class OpenBankingService { // OpenBankingController - OpenBankingApiClient 객체 중간자 역할
	// OpenBankingApiClient 객체 자동 주입
	@Autowired
	private OpenBankingApiClient openBankingApiClient;
	
	// 엑세스토큰 발급 요청을 위한 requestToken() 메서드 호출
	public ResponseTokenVO requestToken(RequestTokenVO requestToken) {
		return openBankingApiClient.requestToken(requestToken);
	}
	public AccountSearchResponseVO findAccount(AccountSearchRequestVO accountSearchRequestVO) {
		return openBankingApiClient.findAccount(accountSearchRequestVO);

	}
}













