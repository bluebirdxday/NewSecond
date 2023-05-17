package project.kh.newsecond.notification.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class NotificationKeyword {
	private int keywordNo;
	private int userNo;
	private String keywordTitle;
	private String createDate;
}
