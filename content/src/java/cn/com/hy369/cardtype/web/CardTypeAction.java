package cn.com.hy369.cardtype.web;

import cn.com.hy369.cardtype.service.facade.CardTypeService;
import cn.com.hy369.model.LearningCardType;
import ins.framework.common.Page;
import ins.framework.common.QueryRule;
import ins.framework.web.Struts2Action;

/**
 * 学习卡类型管理类
 * @author wangzijian
 *
 */
@SuppressWarnings("serial")
public class CardTypeAction extends Struts2Action{
	// 一些页面上的信息
	CardTypeService cardTypeService ;
	LearningCardType learningCardType ;
	private String actionType;
	private String cardTypeCode;
	// 一些需要用到的service
	// 开始完成动作
	public String prepareQueryCardType(){
		learningCardType = null;
		return SUCCESS;
	}
	
	public String queryCardType(){
		if (pageNo == 0) {
			pageNo = 1;
		}
		if (pageSize == 0) {
			pageSize = 20;
		}
		QueryRule queryRule = QueryRule.getInstance();
		if(learningCardType.getCardTypeCode() != null && !"".equals(learningCardType.getCardTypeCode().trim())){
			queryRule.addEqual("cardTypeCode", learningCardType.getCardTypeCode());
		}
		if(learningCardType.getCardTypeName() != null && !"".equals(learningCardType.getCardTypeName() )){
			queryRule.addEqual("cardTypeName", learningCardType.getCardTypeName() );
		}
		Page page = cardTypeService.findCardType(queryRule, pageNo, pageSize);	
		try {
				
			this.writeJSONData(page, "cardTypeCode", "cardTypeName", "cardDeno","defalutTime");
		} catch (Exception e) {
			this.writeJSONMsg(e.getMessage());}
		return null;
	}
	
	public String prepareAddCardType(){
		learningCardType = null;
		actionType = "add";
		return SUCCESS;
	}
	
	public String addCardType(){
		cardTypeService.addCardType(learningCardType);
		return SUCCESS;
	}
	
	public String prepareUpdateCardType(){
		learningCardType = cardTypeService.findCardTypeByPrim(cardTypeCode);
		actionType = "update";
		return SUCCESS;
	}
	
	public String updateCardType(){
		cardTypeService.updateCardType(learningCardType);
		return SUCCESS;
	}
	
	public String deleteCardType(){
		learningCardType = cardTypeService.findCardTypeByPrim(cardTypeCode);
		cardTypeService.deleteCardType(learningCardType);
		return SUCCESS;
	}
	// 华丽的分割线--------------------------------------------

	public LearningCardType getLearningCardType() {
		return learningCardType;
	}

	public void setLearningCardType(LearningCardType learningCardType) {
		this.learningCardType = learningCardType;
	}

	public String getActionType() {
		return actionType;
	}

	public void setActionType(String actionType) {
		this.actionType = actionType;
	}

	public CardTypeService getCardTypeService() {
		return cardTypeService;
	}

	public void setCardTypeService(CardTypeService cardTypeService) {
		this.cardTypeService = cardTypeService;
	}

	public String getCardTypeCode() {
		return cardTypeCode;
	}

	public void setCardTypeCode(String cardTypeCode) {
		this.cardTypeCode = cardTypeCode;
	}
	
}
