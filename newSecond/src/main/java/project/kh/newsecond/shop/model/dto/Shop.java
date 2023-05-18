package project.kh.newsecond.shop.model.dto;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import project.kh.newsecond.review.model.dto.Review;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Shop {

	private int userNo;
	private String shopTitle;
	private String shopInfo;
	
	private int sellCount;
	
	private String userImage;
	
	private List<Review> reviewList;
	
}