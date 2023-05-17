package project.kh.newsecond.qna.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Qna {

	private int qndNo;
	private int userNo;
	private String qnaType;
	private String qnaTitle;
	private String qnaContent;
	private String qnaEnrollDate;
	private String qnaDeleteFl;
	private String qnaCheckFl;
	private String qnaCategory;
	
}
