package cn.com.hy369.cardtype.service.spring;

import java.util.List;

import ins.framework.common.Page;
import ins.framework.common.QueryRule;
import ins.framework.dao.GenericDaoHibernate;
import cn.com.hy369.cardtype.service.facade.CardTypeService;
import cn.com.hy369.model.LearningCardType;

public class CardTypeServiceSpringImpl extends
GenericDaoHibernate<LearningCardType, String> implements CardTypeService {

	public void addCardType(LearningCardType learningCardType) {
		super.save(learningCardType);
	}

	public Page findCardType(QueryRule queryRule, int pageNo, int pageSize) {
		return super.find(queryRule, pageNo, pageSize);
	}

	public LearningCardType findCardTypeByPrim(String cardTypeCode) {
		return super.get(cardTypeCode);
	}

	public void updateCardType(LearningCardType learningCardType) {
		super.update(learningCardType);
		
	}

	public void deleteCardType(LearningCardType learningCardType) {
		super.deleteByPK(learningCardType.getCardTypeCode());
		
	}

	public List<LearningCardType> findCardTypeList(QueryRule queryRule) {
		return super.find(queryRule);
	}

}
