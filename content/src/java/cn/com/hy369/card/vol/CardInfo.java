package cn.com.hy369.card.vol;

import java.math.BigDecimal;
import java.util.Date;

public class CardInfo implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/** 学习卡代码 */
	private String cardCode;
	/** 学习卡密码 */
	private String passWord;
	/** 学习卡类型代码 */
	private String cardTypeCode;
	/** 电话号码 */
	private String phoneNo;
	/** 开始使用日期 */
	private Date startDate;
	/** 结束使用日期 */
	private Date endDate;
	/** 创建日期 */
	private Date createDate;
	/** 学习卡类型名称 */
	private String cardTypeName;
	/** 金额 */
	private BigDecimal cardDeno;
	/** 状态 */
	private String statusName;
	public CardInfo() {
	}
	public String getCardCode() {
		return cardCode;
	}
	public void setCardCode(String cardCode) {
		this.cardCode = cardCode;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public String getCardTypeCode() {
		return cardTypeCode;
	}
	public void setCardTypeCode(String cardTypeCode) {
		this.cardTypeCode = cardTypeCode;
	}
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getCardTypeName() {
		return cardTypeName;
	}
	public void setCardTypeName(String cardTypeName) {
		this.cardTypeName = cardTypeName;
	}
	public BigDecimal getCardDeno() {
		return cardDeno;
	}
	public void setCardDeno(BigDecimal cardDeno) {
		this.cardDeno = cardDeno;
	}
	public String getStatusName() {
		return statusName;
	}
	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}
	
}
