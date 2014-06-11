package cn.com.hy369.card.service.facade;

import java.util.ArrayList;

import ins.framework.common.Page;
import ins.framework.common.QueryRule;
import cn.com.hy369.model.LearningCard;

public interface CardService {

	void deleteCard(LearningCard learningCard);

	void updateCard(LearningCard learningCard);

	LearningCard findCardByPrim(String cardCode);
	/**
	 * 单条增加学习卡
	 * @param learningCard
	 */
	void addCard(LearningCard learningCard);

	Page findCard(QueryRule queryRule, int pageNo, int pageSize);
	/**
	 * 批量增加学习卡，把整个学习卡list都存入数据库中
	 * @param learningCardList
	 */
	void addCardAll(ArrayList<LearningCard> learningCardList);
	/**
	 * 根据条件查询出封装之后的对象
	 * @param queryRule
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	Page findCardInfo(QueryRule queryRule, int pageNo, int pageSize);

}
