package project.kh.newsecond.writing.model.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

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
	private int userNo;
	
	private String title;
	private List<MultipartFile> image;
	private String detailText;
	private int price;
	private int quantity;
	private String condition;
	private String category2;
	
	private int categoryNo;
}
