package project.kh.newsecond.goodsboard.model.dto;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

// 상품 게시글 DTO
@NoArgsConstructor
@Getter
@Setter
@ToString
public class GoodsBoard {
	
	private int goodsNo;
	private int userNo;
	private int categoryNo;
	private String goodsTitle;
	private String goodsDescr;
	private int goodsPrice;
	private int viewCount;
	private int wishCount;
	private String sellEnrollDate;
	private String goodsStatus;
	
	// 카테고리(상준 사용)
	private String category2;
	
	// files 테이블 join
	private String thumbnail;
	
	// shop 테이블 join
	private String shopTitle;
	
	private int sortType;
	
	// 이미지 리스트 불러오기
	private List<Files> filesList;
}
