package project.kh.newsecond.shop.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Following {

	private int userNo;
	private String shopTitle;
	private String shopInfo;
	private String userImage;
}
