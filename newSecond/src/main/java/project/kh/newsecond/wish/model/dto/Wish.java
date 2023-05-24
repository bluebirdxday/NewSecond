package project.kh.newsecond.wish.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Wish {
	
	private int wishNo;
	private int goodsNo;
	private int userNo;
	private String wishDate;
	private String goodsTitle;
	
	// files 테이블 join
	private String thumbnail;

}
