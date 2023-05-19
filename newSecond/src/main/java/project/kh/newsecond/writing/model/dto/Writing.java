package project.kh.newsecond.writing.model.dto;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Writing {
	private int userNo;
	
	private String title;
	private List<WritingImage> image; // 이미지 리스트는 images
	private String detailText;
	private int price;
	private int quantity;
	private String condition;
	private String category2;
	
	private int categoryNo;
}
