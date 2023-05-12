package project.kh.newsecond.user.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class User {
	private int userNo;
	private String userEmail;
	private String userPassword;
	private String userNickname;
	private String userTel;
	private String userAddress;
	private String userImage;
	private String userStatues;
	private String enrollDate;
	private int userRole;
}
