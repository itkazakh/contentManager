package cn.com.expense.eps.acc.model;

import java.math.BigDecimal;

/**
 * 因为Tcode的存在使得我们很难在页面上直接使用epsvoucher的对象来进行显示，所以我通过这个中间的类来进行显示
 * @author wangzijain 
 *
 */
public class VoucherTemp implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/** 支票号 */
	private String checkNo;
	/** 摘要 */
	private String remark;
	/** 凭证分录号 */
	private Long suffixNo;
	/** 核算科目 */
	private String itemCode;
	/** 会计科目名称 */
	private String itemName;
	/** 币种 */
	private String currency;
	/** 当前汇率 */
	private BigDecimal exchangeRate;
	/** 原币借方金额 */
	private BigDecimal debitSource;
	/** 原币贷方金额 */
	private BigDecimal creditSource;
	/** 本位币借方金额 */
	private BigDecimal debitDest;
	/** 本位币贷方金额*/
	private BigDecimal creditDest;
	private String T1Code;
	private String T1;
	private String T2Code;
	private String T2;
	private String T3Code;
	private String T3;
	private String T4Code;
	private String T4;
	private String T5Code;
	private String T5;
	private String T6Code;
	private String T6;
	private String T7Code;
	private String T7;
	/** 凭证分类 */
	private String voucherType;
	public BigDecimal getCreditDest() {
		return creditDest;
	}
	public void setCreditDest(BigDecimal creditDest) {
		this.creditDest = creditDest;
	}
	public BigDecimal getCreditSource() {
		return creditSource;
	}
	public void setCreditSource(BigDecimal creditSource) {
		this.creditSource = creditSource;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public BigDecimal getDebitDest() {
		return debitDest;
	}
	public void setDebitDest(BigDecimal debitDest) {
		this.debitDest = debitDest;
	}
	public BigDecimal getDebitSource() {
		return debitSource;
	}
	public void setDebitSource(BigDecimal debitSource) {
		this.debitSource = debitSource;
	}
	public BigDecimal getExchangeRate() {
		return exchangeRate;
	}
	public void setExchangeRate(BigDecimal exchangeRate) {
		this.exchangeRate = exchangeRate;
	}
	public String getItemCode() {
		return itemCode;
	}
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Long getSuffixNo() {
		return suffixNo;
	}
	public void setSuffixNo(Long suffixNo) {
		this.suffixNo = suffixNo;
	}
	public String getT1() {
		return T1;
	}
	public void setT1(String t1) {
		T1 = t1;
	}
	public String getT2() {
		return T2;
	}
	public void setT2(String t2) {
		T2 = t2;
	}
	public String getT3() {
		return T3;
	}
	public void setT3(String t3) {
		T3 = t3;
	}
	public String getT4() {
		return T4;
	}
	public void setT4(String t4) {
		T4 = t4;
	}
	public String getT5() {
		return T5;
	}
	public void setT5(String t5) {
		T5 = t5;
	}
	public String getT6() {
		return T6;
	}
	public void setT6(String t6) {
		T6 = t6;
	}
	public String getT7() {
		return T7;
	}
	public void setT7(String t7) {
		T7 = t7;
	}
	public String getVoucherType() {
		return voucherType;
	}
	public void setVoucherType(String voucherType) {
		this.voucherType = voucherType;
	}
	public String getCheckNo() {
		return checkNo;
	}
	public void setCheckNo(String checkNo) {
		this.checkNo = checkNo;
	}
	public String getT1Code() {
		return T1Code;
	}
	public void setT1Code(String code) {
		T1Code = code;
	}
	public String getT2Code() {
		return T2Code;
	}
	public void setT2Code(String code) {
		T2Code = code;
	}
	public String getT3Code() {
		return T3Code;
	}
	public void setT3Code(String code) {
		T3Code = code;
	}
	public String getT4Code() {
		return T4Code;
	}
	public void setT4Code(String code) {
		T4Code = code;
	}
	public String getT5Code() {
		return T5Code;
	}
	public void setT5Code(String code) {
		T5Code = code;
	}
	public String getT6Code() {
		return T6Code;
	}
	public void setT6Code(String code) {
		T6Code = code;
	}
	public String getT7Code() {
		return T7Code;
	}
	public void setT7Code(String code) {
		T7Code = code;
	}
	
}
