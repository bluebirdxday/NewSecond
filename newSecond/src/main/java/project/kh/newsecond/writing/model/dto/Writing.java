package project.kh.newsecond.writing.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Writing {
	private int goodsNo;
	private int categoryNo;
	private String goodsTitle;
	private String goodsDescr;
	private int goodsPrice;
	private int viewCount;
	private int wishCount;
	private String date;
	private char goodsStatus;
}
