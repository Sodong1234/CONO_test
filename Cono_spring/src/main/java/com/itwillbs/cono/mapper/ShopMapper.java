package com.itwillbs.cono.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.cono.vo.CategoryDTO;
import com.itwillbs.cono.vo.FollowDTO;
import com.itwillbs.cono.vo.ImgDTO;
import com.itwillbs.cono.vo.ItemDTO;
import com.itwillbs.cono.vo.MemberDTO;
import com.itwillbs.cono.vo.OrdDTO;
import com.itwillbs.cono.vo.PageInfo;
import com.itwillbs.cono.vo.ShopDTO;

public interface ShopMapper {

	// 상점 정보 조회
	HashMap<String, String> selectMyShop(String member_id);

	// 상점 판매 횟수 조회
	String selectShopSellCnt(String member_id);

	// 상점 상품 개수 조회
	String selectShopItemCnt(String member_id);
	
	// 등록된 상품 개수(item_idx) 조회
	Integer selectItemIdx();
	
	// item 테이블 insert
	int insertItem(@Param("item") ItemDTO item, @Param("member_id") String member_id);
	
	// category 테이블 insert
	int insertCategory(@Param("category") CategoryDTO category, @Param("item") ItemDTO item);
	
	// img 테이블 img_idx 조회
//	Integer selectImgIdx(ItemDTO item);
	
	// img 테이블 insert
	void insertImgList(@Param("img") ImgDTO img, @Param("item") ItemDTO item);
	
	// 상품 관리 (상품 리스트 조회)
	List<HashMap<String, String>> selectItemList(@Param("member_id") String member_id, @Param("keyword") String keyword, @Param("sell_status") String sell_status, @Param("pageInfo") PageInfo pageInfo);
	
	// 상품 숨김 기능
	int updateItemHide(@Param("item_idx") String item_idx, @Param("item_hide") String item_hide);
	
	// 상품 상세 정보 조회
	HashMap<String, String> selectItemDetail(String item_idx);
	
	// 상품 이미지 조회
	List<ImgDTO> selectImgList(String item_idx);

	// 상품 이미지 변경
	int updateImg(@Param("item") ItemDTO item, @Param("img") ImgDTO img, @Param("img_idx") String img_idx);
	
	// 상품 정보 변경
	void updateItem(ItemDTO item);
	
	// 카테고리 정보 변경
	void updateCategory(@Param("category") CategoryDTO category, @Param("item") ItemDTO item);
	
	// 상품이 ord 테이블에 등록된 경우 삭제 방지
	int isOrdered(String item_idx);
	
	// 상품 삭제 (item)
	int deleteItem(@Param("member") MemberDTO member, @Param("item_idx") String item_idx);
	
	// 상품 삭제 (img)
	int deleteImg(String item_idx);
	
	// 상품 삭제 (category)
	int deleteCategory(String item_idx);
	
	// 상점 수정 회원 확인
	MemberDTO selectMember(MemberDTO member);
	
	// 상점 정보 수정
	void updateMyshop(@Param("shop") ShopDTO shop);
	
	// 상품 평균 평점과 후기 달린 상품의 개수 조회
	HashMap<String, String> selectItemAvg(String member_id);
	
	// 각 점수 별 상품 개수 조회
	String selectItemScore(@Param("member_id") String member_id, @Param("i") String i);

	//상품 고를 때 클릭할 이미지 조회
//	List<HashMap<String, String>> selectItemImgName(@Param("member_id") String member_id, @Param("imgPageInfo") PageInfo imgPageInfo);
	List<HashMap<String, String>> selectItemImgName(@Param("member_id") String member_id);

	// 후기 개수 조회
	public int selectReviewListCount(String member_id);
	
	// 후기 리스트 조회
	List<HashMap<String, String>> selectReviewList(@Param("member_id") String member_id, @Param("item_idx") String item_idx, @Param("pageInfo") PageInfo pageInfo);
	
	// 클릭된 이미지 조회
	String selectImg(String item_idx);

	// 상품 주문(진행중) 개수 조회
	public int selectOrdListCount(String member_id);
	
	// 상품 주문 (진행중) 리스트 조회
	List<HashMap<String, String>> selectOrdList(@Param("member_id") String member_id, @Param("pageInfo") PageInfo pageInfo);
	
	// 상품 주문(완료) 개수 조회
	public int selectFinishOrdListCount(String member_id);

	// 상품 주문 (완료) 리스트 조회
	List<HashMap<String, String>> selectFinishOrdList(@Param("member_id") String member_id, @Param("pageInfo") PageInfo pageInfo);
	
	// 상품 조회 (페이징 처리를 위한 ListCount 조회)
	Integer selectItemListCount(String member_id);
	
	// 상품이 ord 테이블이 등록된 경우 삭제 방지
	Integer selectItemOrd(String item_idx);
	
	// ===========================================================================
	
	FollowDTO selectFollow(@Param("sId")String sId);

	String selectShop_idx(String sId);
	
	// 팔로잉
	public List<HashMap<String, String>> selectFollowingList(String sId);
	
	// 팔로워
	public List<HashMap<String, String>> selectFollowerList(String shop_idx);
	
	// 팔로잉 수
	public int selectFollowingCount(String sId);
	
	// 팔로워 수
	public int selectFollowerCount(String member_id);
	
	//팔로우 추가
	int insertFollow(@Param("sId")String sId, @Param("shop_idx")String shop_idx);
	
	// 팔로잉 삭제
	public int deleteFollowing(@Param("sId")String sId, @Param("shop_idx")String shop_idx);
	
	// 후기 이미지 개수 조회
	int selectReviewImgListCount(String member_id);
	
	// ==========================================================================================
	
	// 상점 조회
	HashMap<String, String> selectShop(@Param("item_idx")String item_idx);
	
	// 판매 횟수 조회
	String selectShopSellCntBuyer(String item_idx);
	
	// 상품 횟수 조회
	String selectShopItemCntBuyer(String item_idx);
	
	// 상점 별점 조회
	String selectShopAvgStar(String item_idx);
	
	// 팔로워 수 조회
	String selectFollowerCnt(String item_idx);
	
	// 상점 상품 조회
	List<HashMap<String, String>> selectItemListBuyer(String shop_idx);
	
	// shop 주인 member_id 가져오기
	String selectMemberId(String shop_idx);

	// 팔로우조회
	FollowDTO selectFollow(@Param("sId")String sId, @Param("shop_idx")String shop_idx);
	
	// 내상점 팔로워 수 조회
	int selectFollowCount(String item_idx);



	

	

	



}
