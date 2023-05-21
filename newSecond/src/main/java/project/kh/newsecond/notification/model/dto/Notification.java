package project.kh.newsecond.notification.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Notification {

	private int notificationNo;
	private int targetNo;
	private int senderNo;
	private String notificationMessage;
	private String readOrNot;
	private String sendDate;
	private String notificationType;
	
}
