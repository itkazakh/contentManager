package cn.com.expense.eps.acc.model;

import java.io.Serializable;

/**
 * 因为凭证会先生成页面经过修改后再保存，所以需要知道回写那些相关表的数据只能先封装起来。
 * @author wangzijian 20090715
 *
 */
public class ResetVoucherNo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public static final String PAYFEEDETAIL = "EpsPayFeeDetail";
	public static final String FEESUB = "EpsFeeSub";
	public static final String FEEPLAN = "EpsFeePlan";
	/** 业务号，如果是feeplan表的是certiNo,payfeedetail表的,feesub表的certino,s */
	private String businessNo;
	/** 序列号，为了精确确定回写那些数据*/
	private Integer serialNo;
	/** 表名，生成凭证的时候需要回写payfeedetail,feesub,feeplan表的数据，为了分开所以加入这个属性*/
	private String tableName;
	public String getBusinessNo() {
		return businessNo;
	}
	public void setBusinessNo(String businessNo) {
		this.businessNo = businessNo;
	}
	public Integer getSerialNo() {
		return serialNo;
	}
	public void setSerialNo(Integer serialNo) {
		this.serialNo = serialNo;
	}
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	
}
