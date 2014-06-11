package cn.com.hy369.card.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.sinosoft.sysframework.common.datatype.DateTime;

import cn.com.hy369.card.service.facade.CardService;
import cn.com.hy369.cardtype.service.facade.CardTypeService;
import cn.com.hy369.model.LearningCard;
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
public class CardAction extends Struts2Action{
	// 一些页面上的信息
	CardService cardService ;
	CardTypeService cardTypeService ;
	LearningCard learningCard ;
	private String actionType;
	private String cardCode;
	private String addType;
	private HashMap<String, String> cardTypeMap = new HashMap<String, String>();		// 为了得到下拉菜单
	private HashMap<String, String> addTypeRadio = new HashMap<String, String>();		// 为了得到单选
	private String cardList;
	// 学习卡查询用到的
	private HashMap<String, String> learningCardStatusList = new HashMap<String, String>(); // 为了得到状态，包括0,全部，1，未使用，2，过期
	private String learningCardStatus;			// 学习卡状态
	// 一些需要用到的service
	// 开始完成动作
	public String prepareQueryCard(){
		learningCard = null;
		return SUCCESS;
	}
	
	public String queryCard(){
		if (pageNo == 0) {
			pageNo = 1;
		}
		if (pageSize == 0) {
			pageSize = 20;
		}
		QueryRule queryRule = QueryRule.getInstance();
		if(learningCard.getCardCode() != null && !"".equals(learningCard.getCardCode().trim())){
			queryRule.addEqual("cardCode", learningCard.getCardCode());
		}
		if(learningCard.getCardTypeCode() != null && !"".equals(learningCard.getCardTypeCode().trim())){
			queryRule.addEqual("cardTypeCode", learningCard.getCardTypeCode());
		}
		// 根据状态判断时间的问题
		if(!"9".equals(learningCardStatus)){
			if("0".equals(learningCardStatus)){
				queryRule.addIsNull("startDate");
			}
			if("1".equals(learningCardStatus)){
				queryRule.addIsNotNull("startDate");
				queryRule.addGreaterThan("endDate", DateTime.current());
			}
			if("2".equals(learningCardStatus)){
				queryRule.addIsNotNull("startDate");
				queryRule.addLessThan("endDate", DateTime.current());
			}
		}
		Page page = cardService.findCardInfo(queryRule, pageNo, pageSize);	
		try {
			this.writeJSONData(page, "cardCode", "cardTypeName", "passWord","cardDeno","phoneNo","startDate","endDate","statusName");
		} catch (Exception e) {
			this.writeJSONMsg(e.getMessage());}
		return null;
	}
	
	public String prepareAddCard(){
		learningCard = null;
		actionType = "add";
		return SUCCESS;
	}
	
	public String addCard(){
		cardService.addCard(learningCard);
		return SUCCESS;
	}
	/**
	 * 手工增加学习卡的放法
	 * @return
	 */
	public String addCardHand(){
		// 首先判断添加类型，是单张还是批量
		// 单张，则保存卡号,密码，学习卡类型
		DateTime createDate = DateTime.current();
		if("0".equals(addType)){
			learningCard.setCreateDate(createDate);
			cardService.addCard(learningCard);
		}
		// 如果是多张则解析文本域中的内容进行批量添加。
		if("1".equals(addType)){
			String cardArray[] = cardList.split("\r\n");
			ArrayList<LearningCard> learningCardList = new ArrayList<LearningCard>(0);
			LearningCard learningCardTemp = null;
			for(String cardInfo:cardArray){
				learningCardTemp = new LearningCard();
				String cardCodePass[] = cardInfo.split("#");
				learningCardTemp.setCardCode(cardCodePass[0]);
				learningCardTemp.setCardTypeCode(learningCard.getCardTypeCode());
				learningCardTemp.setCreateDate(createDate);
				learningCardTemp.setPassWord(cardCodePass[1]);
				learningCardList.add(learningCardTemp);
			}
			cardService.addCardAll(learningCardList);
		}
		
		return SUCCESS;
	}
	public String prepareUpdateCard(){
		learningCard = cardService.findCardByPrim(cardCode);
		actionType = "update";
		return SUCCESS;
	}
	
	public String updateCard(){
		LearningCard learningCard2 = cardService.findCardByPrim(learningCard.getCardCode());
		learningCard2.setPassWord(learningCard.getPassWord());
		learningCard2.setPhoneNo(learningCard.getPhoneNo());
		cardService.updateCard(learningCard2);
		return SUCCESS;
	}
	
	public String deleteCard(){
		learningCard = cardService.findCardByPrim(cardCode);
		cardService.deleteCard(learningCard);
		return SUCCESS;
	}
	// 华丽的分割线--------------------------------------------

	public CardService getCardService() {
		return cardService;
	}

	public void setCardService(CardService cardService) {
		this.cardService = cardService;
	}

	public LearningCard getLearningCard() {
		return learningCard;
	}

	public void setLearningCard(LearningCard learningCard) {
		this.learningCard = learningCard;
	}

	public String getActionType() {
		return actionType;
	}

	public void setActionType(String actionType) {
		this.actionType = actionType;
	}

	public String getCardCode() {
		return cardCode;
	}

	public void setCardCode(String cardCode) {
		this.cardCode = cardCode;
	}

	public HashMap<String, String> getCardTypeMap() {
		QueryRule queryRule = QueryRule.getInstance();
		List<LearningCardType> cardTypeList = cardTypeService.findCardTypeList(queryRule);
		for (LearningCardType  learningCardType: cardTypeList) {
			cardTypeMap.put(learningCardType.getCardTypeCode(), learningCardType.getCardTypeName());
		}
		return cardTypeMap;
	}

	public void setCardTypeMap(HashMap<String, String> cardTypeMap) {
		this.cardTypeMap = cardTypeMap;
	}

	public CardTypeService getCardTypeService() {
		return cardTypeService;
	}

	public void setCardTypeService(CardTypeService cardTypeService) {
		this.cardTypeService = cardTypeService;
	}

	public HashMap<String, String> getAddTypeRadio() {
		addTypeRadio.put("0", "单张");
		addTypeRadio.put("1", "批量");
		return addTypeRadio;
	}

	public void setAddTypeRadio(HashMap<String, String> addTypeRadio) {
		this.addTypeRadio = addTypeRadio;
	}

	public String getAddType() {
		return addType;
	}

	public void setAddType(String addType) {
		this.addType = addType;
	}

	public String getCardList() {
		return cardList;
	}

	public void setCardList(String cardList) {
		this.cardList = cardList;
	}

	public HashMap<String, String> getLearningCardStatusList() {
		learningCardStatusList.put("0", "未使用");
		learningCardStatusList.put("1", "正在使用");
		learningCardStatusList.put("2", "已过期");
		learningCardStatusList.put("9", "全部");
		return learningCardStatusList;
	}

	public void setLearningCardStatusList(
			HashMap<String, String> learningCardStatusList) {
		this.learningCardStatusList = learningCardStatusList;
	}

	public String getLearningCardStatus() {
		return learningCardStatus;
	}

	public void setLearningCardStatus(String learningCardStatus) {
		this.learningCardStatus = learningCardStatus;
	}
	
}
