package project.kh.newsecond.shop.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Follow {

	private int activeUserNo;
	private int passiveUserNo;
	
	private String shopTitle;
	private String shopInfo;
	private String shopProfile;
	
	private int followYou;
	
}
