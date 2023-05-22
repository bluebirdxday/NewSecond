package project.kh.newsecond.goodsboard.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Files {
	
	private int fileNo;
	private int goodsNo;
	private String fileName;
	private int fileOrder;
	private String filePath;

}
