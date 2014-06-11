package cn.com.expense.eps.query.model;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 *  查询统计Pojo类
 *
 */
public class QueryVo implements Serializable {

	private static final long serialVersionUID = -9162023490445168681L;
  
	/**add  by zhangxiying begin**/
	
	private String certiNo; 		//申请单号码(每日付款)/预支单号(个人借款)/合同号
	private String appliUserCode; 	// 申请人
	private String appliDate;		//申请时间
	private String summReason;		// 简要原因代码
	private String payTime;			// 支付时间/支付日期
	private String payCurrency;		// 报销币别/支付币别/合同支付币别
	private BigDecimal payFee;		// 付款金额(每日付款)/预支金额(个人借款)/合同金额/报销单金额
	private BigDecimal returnFee;	// 还款金额
	private String loanDate; 		// 财务冲销日期
	private BigDecimal remainFee;	// 剩余金额
	private String userName;  		//员工姓名
	private String codeCName; 		//费用类型
	private String payee;   		//收款人
	private String accountNo; 		//银行账号
	private String bankName; 		//银行名称
	private String detailedReason; //费用详细(原因)描述
	private BigDecimal sumBaseFee; //预支金额(个人借款)
	/** add by zhangxiying end**/
	
	/** add by zhuqingxiang begin */
	private String  comCode;		//成本中心编码
	private String  comCName;		//成本中心名称
	private String  feeType;		//费用类型
	private String  feeItem;		//费用类别
	private String 	yearMonth;		//会计期间
	private BigDecimal	baseFee;	//部门金额（基准币别显示）
	private String payStatus;		//状态
	private String contractNo;		//合同号
	
	/*预算属性*/
	private String budgetLevel;			//预算级别
	private String budgetSubject;		//级别内容
	private String budgetFrequence;		//预算频度
	private String budgetItem;			//预算项目
	private String budgetItemCode;		//预算科目代码
	private BigDecimal budgetValue;		//预算金额
	private BigDecimal premiumDeduction;//应收保费指标扣减
	private BigDecimal badDebtDeduction;//坏账扣减
	private BigDecimal othDeduction;	//其他调整
	private BigDecimal specialIncrease;	//特批流程增加
	private BigDecimal finalValue;		//调整后金额
	private BigDecimal usedValue;		//已用预算额
	private BigDecimal remainValue;		//剩余预算;
	private String controlFlag;			//是否控制
	
	/*合同属性*/
	private String contractType;		//合同类型
	private String chattingUser;		//洽谈人
	private String content;				//合同内容
	private String signedUnit;			//签订单位
	private String startDate;			//合同开始日期
	private String endDate;				//合同结束日期
	private Long payTimes;				//缴费期数
	private BigDecimal realPayFee;		//已支付金额
	private BigDecimal remainPayFee;	//未支付金额
	private String appliStatus;			//申请单状态
	
	public QueryVo(String certiNo, String appliUserCode, String appliDate,
			String summReason, String payTime, String payCurrency,
			BigDecimal payFee, BigDecimal returnFee, String loanDate,
			BigDecimal remainFee, String userName, String codeCName,
			String payee, String accountNo, String bankName,
			String detailedReason, BigDecimal sumBaseFee, String comCode,
			String comCName, String feeType, String feeItem, String yearMonth,
			BigDecimal baseFee, String payStatus, String contractNo,
			String budgetLevel, String budgetSubject, String budgetFrequence,
			String budgetItem, String budgetItemCode, BigDecimal budgetValue,
			BigDecimal premiumDeduction, BigDecimal badDebtDeduction,
			BigDecimal othDeduction, BigDecimal specialIncrease,
			BigDecimal finalValue, BigDecimal usedValue,
			BigDecimal remainValue, String controlFlag, String contractType,
			String chattingUser, String content, String signedUnit,
			String startDate, String endDate, Long payTimes,
			BigDecimal realPayFee, BigDecimal remainPayFee, String appliStatus) {
		super();
		this.certiNo = certiNo;
		this.appliUserCode = appliUserCode;
		this.appliDate = appliDate;
		this.summReason = summReason;
		this.payTime = payTime;
		this.payCurrency = payCurrency;
		this.payFee = payFee;
		this.returnFee = returnFee;
		this.loanDate = loanDate;
		this.remainFee = remainFee;
		this.userName = userName;
		this.codeCName = codeCName;
		this.payee = payee;
		this.accountNo = accountNo;
		this.bankName = bankName;
		this.detailedReason = detailedReason;
		this.sumBaseFee = sumBaseFee;
		this.comCode = comCode;
		this.comCName = comCName;
		this.feeType = feeType;
		this.feeItem = feeItem;
		this.yearMonth = yearMonth;
		this.baseFee = baseFee;
		this.payStatus = payStatus;
		this.contractNo = contractNo;
		this.budgetLevel = budgetLevel;
		this.budgetSubject = budgetSubject;
		this.budgetFrequence = budgetFrequence;
		this.budgetItem = budgetItem;
		this.budgetItemCode = budgetItemCode;
		this.budgetValue = budgetValue;
		this.premiumDeduction = premiumDeduction;
		this.badDebtDeduction = badDebtDeduction;
		this.othDeduction = othDeduction;
		this.specialIncrease = specialIncrease;
		this.finalValue = finalValue;
		this.usedValue = usedValue;
		this.remainValue = remainValue;
		this.controlFlag = controlFlag;
		this.contractType = contractType;
		this.chattingUser = chattingUser;
		this.content = content;
		this.signedUnit = signedUnit;
		this.startDate = startDate;
		this.endDate = endDate;
		this.payTimes = payTimes;
		this.realPayFee = realPayFee;
		this.remainPayFee = remainPayFee;
		this.appliStatus = appliStatus;
	}

	/** add by zhuqingxiang end */
	
	
	public QueryVo(){		
	}
	
	public String getAppliStatus() {
		return appliStatus;
	}

	public void setAppliStatus(String appliStatus) {
		this.appliStatus = appliStatus;
	}

	public String getChattingUser() {
		return chattingUser;
	}

	public void setChattingUser(String chattingUser) {
		this.chattingUser = chattingUser;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getContractType() {
		return contractType;
	}

	public void setContractType(String contractType) {
		this.contractType = contractType;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getSignedUnit() {
		return signedUnit;
	}
	
	public Long getPayTimes() {
		return payTimes;
	}

	public void setPayTimes(Long payTimes) {
		this.payTimes = payTimes;
	}

	public BigDecimal getRealPayFee() {
		return realPayFee;
	}

	public void setRealPayFee(BigDecimal realPayFee) {
		this.realPayFee = realPayFee;
	}

	public BigDecimal getRemainPayFee() {
		return remainPayFee;
	}

	public void setRemainPayFee(BigDecimal remainPayFee) {
		this.remainPayFee = remainPayFee;
	}

	public void setSignedUnit(String signedUnit) {
		this.signedUnit = signedUnit;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	
	public BigDecimal getBadDebtDeduction() {
		return badDebtDeduction;
	}

	public void setBadDebtDeduction(BigDecimal badDebtDeduction) {
		this.badDebtDeduction = badDebtDeduction;
	}

	public String getBudgetFrequence() {
		return budgetFrequence;
	}

	public void setBudgetFrequence(String budgetFrequence) {
		this.budgetFrequence = budgetFrequence;
	}

	public String getBudgetItemCode() {
		return budgetItemCode;
	}

	public void setBudgetItemCode(String budgetItemCode) {
		this.budgetItemCode = budgetItemCode;
	}

	public String getBudgetLevel() {
		return budgetLevel;
	}

	public void setBudgetLevel(String budgetLevel) {
		this.budgetLevel = budgetLevel;
	}

	public String getBudgetSubject() {
		return budgetSubject;
	}

	public void setBudgetSubject(String budgetSubject) {
		this.budgetSubject = budgetSubject;
	}

	public BigDecimal getBudgetValue() {
		return budgetValue;
	}

	public void setBudgetValue(BigDecimal budgetValue) {
		this.budgetValue = budgetValue;
	}

	public String getControlFlag() {
		return controlFlag;
	}

	public void setControlFlag(String controlFlag) {
		this.controlFlag = controlFlag;
	}

	public BigDecimal getFinalValue() {
		return finalValue;
	}

	public void setFinalValue(BigDecimal finalValue) {
		this.finalValue = finalValue;
	}

	public BigDecimal getOthDeduction() {
		return othDeduction;
	}

	public void setOthDeduction(BigDecimal othDeduction) {
		this.othDeduction = othDeduction;
	}

	public BigDecimal getPremiumDeduction() {
		return premiumDeduction;
	}

	public void setPremiumDeduction(BigDecimal premiumDeduction) {
		this.premiumDeduction = premiumDeduction;
	}

	public BigDecimal getRemainValue() {
		return remainValue;
	}

	public void setRemainValue(BigDecimal remainValue) {
		this.remainValue = remainValue;
	}

	public BigDecimal getSpecialIncrease() {
		return specialIncrease;
	}

	public void setSpecialIncrease(BigDecimal specialIncrease) {
		this.specialIncrease = specialIncrease;
	}

	public BigDecimal getUsedValue() {
		return usedValue;
	}

	public void setUsedValue(BigDecimal usedValue) {
		this.usedValue = usedValue;
	}
	
	public String getContractNo() {
		return contractNo;
	}

	public void setContractNo(String contractNo) {
		this.contractNo = contractNo;
	}

	public String getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	public String getAppliDate() {
		return appliDate;
	}

	public void setAppliDate(String appliDate) {
		this.appliDate = appliDate;
	}

	public String getAppliUserCode() {
		return appliUserCode;
	}

	public void setAppliUserCode(String appliUserCode) {
		this.appliUserCode = appliUserCode;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public BigDecimal getBaseFee() {
		return baseFee;
	}

	public void setBaseFee(BigDecimal baseFee) {
		this.baseFee = baseFee;
	}

	public String getCertiNo() {
		return certiNo;
	}

	public void setCertiNo(String certiNo) {
		this.certiNo = certiNo;
	}

	public String getCodeCName() {
		return codeCName;
	}

	public void setCodeCName(String codeCName) {
		this.codeCName = codeCName;
	}

	public String getComCName() {
		return comCName;
	}

	public void setComCName(String comCName) {
		this.comCName = comCName;
	}

	public String getComCode() {
		return comCode;
	}

	public void setComCode(String comCode) {
		this.comCode = comCode;
	}

	public String getDetailedReason() {
		return detailedReason;
	}

	public void setDetailedReason(String detailedReason) {
		this.detailedReason = detailedReason;
	}

	public String getFeeItem() {
		return feeItem;
	}

	public void setFeeItem(String feeItem) {
		this.feeItem = feeItem;
	}

	public String getFeeType() {
		return feeType;
	}

	public void setFeeType(String feeType) {
		this.feeType = feeType;
	}

	public String getLoanDate() {
		return loanDate;
	}

	public void setLoanDate(String loanDate) {
		this.loanDate = loanDate;
	}

	public String getPayCurrency() {
		return payCurrency;
	}

	public void setPayCurrency(String payCurrency) {
		this.payCurrency = payCurrency;
	}

	public String getPayee() {
		return payee;
	}

	public void setPayee(String payee) {
		this.payee = payee;
	}

	public BigDecimal getPayFee() {
		return payFee;
	}

	public void setPayFee(BigDecimal payFee) {
		this.payFee = payFee;
	}

	public String getPayStatus() {
		return payStatus;
	}

	public void setPayStatus(String payStatus) {
		this.payStatus = payStatus;
	}

	public String getPayTime() {
		return payTime;
	}

	public void setPayTime(String payTime) {
		this.payTime = payTime;
	}

	public BigDecimal getRemainFee() {
		return remainFee;
	}

	public void setRemainFee(BigDecimal remainFee) {
		this.remainFee = remainFee;
	}

	public BigDecimal getReturnFee() {
		return returnFee;
	}

	public void setReturnFee(BigDecimal returnFee) {
		this.returnFee = returnFee;
	}

	public String getSummReason() {
		return summReason;
	}

	public void setSummReason(String summReason) {
		this.summReason = summReason;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getYearMonth() {
		return yearMonth;
	}

	public void setYearMonth(String yearMonth) {
		this.yearMonth = yearMonth;
	}

	public String getBudgetItem() {
		return budgetItem;
	}

	public void setBudgetItem(String budgetItem) {
		this.budgetItem = budgetItem;
	}

	public BigDecimal getSumBaseFee() {
		return sumBaseFee;
	}

	public void setSumBaseFee(BigDecimal sumBaseFee) {
		this.sumBaseFee = sumBaseFee;
	}
   
}
