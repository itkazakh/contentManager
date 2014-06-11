package cn.com.hy369.cardtype.service.facade;

import java.util.List;

import ins.framework.common.Page;
import ins.framework.common.QueryRule;
import cn.com.hy369.model.LearningCardType;

public interface CardTypeService {
	/**
	 * 增加学习卡类型
	 * @param learningCardType
	 */
	void addCardType(LearningCardType learningCardType);

	Page findCardType(QueryRule queryRule, int pageNo, int pageSize);

	LearningCardType findCardTypeByPrim(String cardTypeCode);

	void updateCardType(LearningCardType learningCardType);

	void deleteCardType(LearningCardType learningCardType);
	// 查询得到列表
	List<LearningCardType> findCardTypeList(QueryRule queryRule);
	
}
