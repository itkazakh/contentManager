package cn.com.sinosoft.oa;

import java.io.Serializable;
/**
 * 用于保存欢迎页面的提示的内容，并用于页面显示
 * @author wangzijian 20090717
 *
 */
public class Prompt implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/** 需要支付的申请单数目 */
	private int claimsToPay;
	/** 需要支付的申请单对应的链接 */
	private String claimsToPayURL;
	/** 待确认的申请单 */
	private int claimsToConfirm; 
	private String claimsToConfirmURL;
	/** 待还款的预支单 */
	private int advanceToRepayment;
	private String advanceToRepaymentURL;
	/** 待处理的往来款 */
	private int oppCenterToProcess;
	private String oppCenterToProcessURL;
	/** 待审批的出差申请 */
	private int evectionApplysToAudit;
	/** 待审批的固定资产购买 */
	private int assetApplysToAudit;
	/** 待审批的合同申请 */
	private int compactApplysToAudit;
	/** 待审批的报销单*/
	private int expenseAccountToAudit;
	/** 待审批的预支 */
	private int advanceToAudit;
	/** 待审批的机票*/
	private int airToAudit;
	public int getClaimsToPay() {
		return claimsToPay;
	}
	public void setClaimsToPay(int claimsToPay) {
		this.claimsToPay = claimsToPay;
	}
	public String getClaimsToPayURL() {
		return claimsToPayURL;
	}
	public void setClaimsToPayURL(String claimsToPayURL) {
		this.claimsToPayURL = claimsToPayURL;
	}
	public int getAdvanceToRepayment() {
		return advanceToRepayment;
	}
	public void setAdvanceToRepayment(int advanceToRepayment) {
		this.advanceToRepayment = advanceToRepayment;
	}
	public String getAdvanceToRepaymentURL() {
		return advanceToRepaymentURL;
	}
	public void setAdvanceToRepaymentURL(String advanceToRepaymentURL) {
		this.advanceToRepaymentURL = advanceToRepaymentURL;
	}
	public int getClaimsToConfirm() {
		return claimsToConfirm;
	}
	public void setClaimsToConfirm(int claimsToConfirm) {
		this.claimsToConfirm = claimsToConfirm;
	}
	public String getClaimsToConfirmURL() {
		return claimsToConfirmURL;
	}
	public void setClaimsToConfirmURL(String claimsToConfirmURL) {
		this.claimsToConfirmURL = claimsToConfirmURL;
	}
	public int getOppCenterToProcess() {
		return oppCenterToProcess;
	}
	public void setOppCenterToProcess(int oppCenterToProcess) {
		this.oppCenterToProcess = oppCenterToProcess;
	}
	public String getOppCenterToProcessURL() {
		return oppCenterToProcessURL;
	}
	public void setOppCenterToProcessURL(String oppCenterToProcessURL) {
		this.oppCenterToProcessURL = oppCenterToProcessURL;
	}
	public int getAdvanceToAudit() {
		return advanceToAudit;
	}
	public void setAdvanceToAudit(int advanceToAudit) {
		this.advanceToAudit = advanceToAudit;
	}
	public int getAssetApplysToAudit() {
		return assetApplysToAudit;
	}
	public void setAssetApplysToAudit(int assetApplysToAudit) {
		this.assetApplysToAudit = assetApplysToAudit;
	}
	public int getCompactApplysToAudit() {
		return compactApplysToAudit;
	}
	public void setCompactApplysToAudit(int compactApplysToAudit) {
		this.compactApplysToAudit = compactApplysToAudit;
	}
	public int getEvectionApplysToAudit() {
		return evectionApplysToAudit;
	}
	public void setEvectionApplysToAudit(int evectionApplysToAudit) {
		this.evectionApplysToAudit = evectionApplysToAudit;
	}
	public int getExpenseAccountToAudit() {
		return expenseAccountToAudit;
	}
	public void setExpenseAccountToAudit(int expenseAccountToAudit) {
		this.expenseAccountToAudit = expenseAccountToAudit;
	}
	public int getAirToAudit() {
		return airToAudit;
	}
	public void setAirToAudit(int airToAudit) {
		this.airToAudit = airToAudit;
	}
	
}
