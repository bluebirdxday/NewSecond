package project.kh.newsecond.priceView.model.dto;

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
public class PriceViewKeyword {

	private String title; // 제목
	private String detailText; // 상세설명
	// 이 안에 키워드가 있으면 확인
}
