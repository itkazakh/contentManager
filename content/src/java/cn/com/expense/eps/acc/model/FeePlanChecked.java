package cn.com.expense.eps.acc.model;

import java.math.BigDecimal;

/**
 * 作为中间表的信息，为了能够得到有勾选情况的feeplan信息
 * @author wangzijian
 *
 */
public class FeePlanChecked implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private boolean checked;
	/** 申请类型 */
	private String certiType;
	/** 申请类型名称 */
	private String certiTypeName;
	/** 申请单号 */
	private String certiNo;
	/** 申请人姓名 */
	private String appliUserName;
	/** 支付方式 */
	private String opPayWay;
	/** 支付币别 */
	private String payCurrency;
	/** 支付金额 */
	private BigDecimal realPayFee;
	/** 支付号 */
	private String payRefNo;
	/** 附件张数 */
	private BigDecimal auxNumber;
	public String getAppliUserName() {
		return appliUserName;
	}
	public void setAppliUserName(String appliUserName) {
		this.appliUserName = appliUserName;
	}
	public String getCertiNo() {
		return certiNo;
	}
	public void setCertiNo(String certiNo) {
		this.certiNo = certiNo;
	}
	public String getCertiType() {
		return certiType;
	}
	public void setCertiType(String certiType) {
		this.certiType = certiType;
	}
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	public String getPayCurrency() {
		return payCurrency;
	}
	public void setPayCurrency(String payCurrency) {
		this.payCurrency = payCurrency;
	}
	public BigDecimal getRealPayFee() {
		return realPayFee;
	}
	public void setRealPayFee(BigDecimal realPayFee) {
		this.realPayFee = realPayFee;
	}
	public String getOpPayWay() {
		return opPayWay;
	}
	public void setOpPayWay(String opPayWay) {
		this.opPayWay = opPayWay;
	}
	public String getPayRefNo() {
		return payRefNo;
	}
	public void setPayRefNo(String payRefNo) {
		this.payRefNo = payRefNo;
	}
	public BigDecimal getAuxNumber() {
		return auxNumber;
	}
	public void setAuxNumber(BigDecimal auxNumber) {
		this.auxNumber = auxNumber;
	}
	public String getCertiTypeName() {
		return certiTypeName;
	}
	public void setCertiTypeName(String certiTypeName) {
		this.certiTypeName = certiTypeName;
	}
	
	
}
