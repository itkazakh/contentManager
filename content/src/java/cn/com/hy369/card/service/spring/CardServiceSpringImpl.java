package cn.com.hy369.card.service.spring;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import com.sinosoft.sysframework.common.datatype.DateTime;

import ins.framework.common.Page;
import ins.framework.common.QueryRule;
import ins.framework.dao.GenericDaoHibernate;
import cn.com.hy369.card.service.facade.CardService;
import cn.com.hy369.card.vol.CardInfo;
import cn.com.hy369.cardtype.service.facade.CardTypeService;
import cn.com.hy369.model.LearningCard;
import cn.com.hy369.model.LearningCardType;

public class CardServiceSpringImpl extends
GenericDaoHibernate<LearningCard, String> implements CardService {

	public void addCard(LearningCard learningCard) {
		super.save(learningCard);
	}

	public void deleteCard(LearningCard learningCard) {
		super.deleteByPK(learningCard.getCardCode());
	}

	public Page findCard(QueryRule queryRule, int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		return null;
	}

	public LearningCard findCardByPrim(String cardCode) {
		return super.get(cardCode);
	}

	public void updateCard(LearningCard learningCard) {
		super.update(learningCard);
	}

	public void addCardAll(ArrayList<LearningCard> learningCardList) {
			super.saveAll(learningCardList);
	}

	public Page findCardInfo(QueryRule queryRule, int pageNo, int pageSize) {
		CardTypeService cardTypeService = (CardTypeService) applicationContext.getBean("cardTypeService");
		List<CardInfo> cardInfoList = new ArrayList<CardInfo>(0);
		Page cardInfoPage = null;
		Page cardListPage = super.find(queryRule, pageNo, pageSize);
		Collection<LearningCard> cardList = cardListPage.getResult();
		CardInfo cardInfo = null;
		LearningCardType learningCardType = null;
		for(LearningCard learningCard : cardList){
			cardInfo = new CardInfo();
			learningCardType = cardTypeService.findCardTypeByPrim(learningCard.getCardTypeCode());
			cardInfo.setCardCode(learningCard.getCardCode());
			cardInfo.setCardTypeCode(learningCard.getCardTypeCode());
			cardInfo.setCardTypeName(learningCardType.getCardTypeName());
			cardInfo.setCardDeno(learningCardType.getCardDeno());
			cardInfo.setCreateDate(learningCard.getCreateDate());
			cardInfo.setStartDate(learningCard.getStartDate());
			cardInfo.setEndDate(learningCard.getEndDate());
			cardInfo.setPassWord(learningCard.getPassWord());
			cardInfo.setPhoneNo(learningCard.getPhoneNo());
			String statusName = "";
			if(learningCard.getStartDate() == null){
				statusName = "未使用";
			}
			if(learningCard.getStartDate() != null && learningCard.getEndDate().compareTo(DateTime.current()) > 0){
				statusName = "正在使用";
			}
			if(learningCard.getStartDate() != null && learningCard.getEndDate().compareTo(DateTime.current()) <= 0){
				statusName = "已过期";
			}
			cardInfo.setStatusName(statusName);
			cardInfoList.add(cardInfo);
		}
		cardInfoPage = new Page(cardListPage.getStart(),cardListPage.getTotalCount(),pageSize,cardInfoList);

		return cardInfoPage;
	}

}
