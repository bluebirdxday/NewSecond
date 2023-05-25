package project.kh.newsecond.goodsboard.model.dto;

import java.io.Serializable;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Category implements Serializable{
	
	private int categoryNo;
	private String categoryName;

}
