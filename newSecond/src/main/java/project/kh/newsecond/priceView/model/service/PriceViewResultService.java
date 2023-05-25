package project.kh.newsecond.priceView.model.service;

import java.util.List;
import java.util.Map;

import project.kh.newsecond.goodsboard.model.dto.GoodsBoard;
import project.kh.newsecond.priceView.model.dto.PriceViewKeyword;

public interface PriceViewResultService {

	int goodsPriceSelect(PriceViewKeyword keywords);

	int goodsPriceSelect2(PriceViewKeyword keywords);

	int goodsPriceSelect3(PriceViewKeyword keywords);

	List<GoodsBoard> selectSearchKeyword(GoodsBoard goodsBoard);

}
