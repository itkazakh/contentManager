package cn.com.expense.eps.util;

import java.util.HashMap;
import java.util.Map;

import ins.framework.cache.CacheFactory;

/**
 * 常量类
 * @author 
 *
 */
public class SysConstConfig {

	public static final String BILL_TA = "01";//出差申请单
	public static final String BILL_FA = "02";//固定资产购买申请单
	public static final String BILL_CA = "03";//合同
	public static final String BILL_TE = "04";//差旅费报销单
	public static final String BILL_CE = "05";//手续费报销单
	public static final String BILL_EE = "06";//招待费报销单
	public static final String BILL_FE = "07";//资产购买报销单
	public static final String BILL_ME = "08";//车辆使用报销单
	public static final String BILL_OE = "09";//其他费用报销单
	public static final String BILL_BA = "10";//预支单
	public static final String BILL_AT = "11";//机票管理单
	public static final String BILL_NA = "12";//支付号
	public static final String BILL_A  = "13";//实收单

	public static final String BASE_CURRENCY = "CNY";  //基准币别
	
	public static final String HOTEL_FEE[] = {"2000201","2000301"};	//城市区域里的住宿费用
	public static final String FOOD_FEE[] = {"2000202","2000302"};//城市区域里的餐饮费用
	
	public static final String TOP_USERCODE = "0000000000";
	public static final String TOP_COMPANY = "00000000";
	
	public static final String DEMILITER = "|";
	
	//public static final int CACHE_TYPE = CacheFactory.SINGLETON_CACHE;
	
	public static final String VALID = "1"; // 有效
	public static final String INVALID = "0"; // 无效
	
	// 申请单类型
	public static final String CertiType_ccsq = "00" ; // 出差申请
	public static final String CertiType_zcsq = "01" ; // 资产购买申请
	public static final String CertiType_htsq = "02" ; // 合同申请
	public static final String CertiType_jpsq = "03" ; // 机票申请
	public static final String CertiType_yzd = "10" ;  // 预支单
	public static final String CertiType_clf = "20" ;  // 差旅费
	public static final String CertiType_zdf = "21" ;  // 招待费
	public static final String CertiType_sxf = "22" ;  // 手续费
	public static final String CertiType_zcgm = "23" ; // 资产购买
	public static final String CertiType_clsy = "24" ; // 车辆使用
	public static final String CertiType_qt = "29" ;   // 其他
	
	// 申请单状态
	public static final String AppliStatus_cg = "0";   // 草稿件
	public static final String AppliStatus_spz = "1";  // 审批中
	public static final String AppliStatus_jj = "2";   // 拒绝
	public static final String AppliStatus_dh = "3";   // 打回
	public static final String AppliStatus_sptg = "4";  // 已通过
	
	// 申请单提交类型
	public static final String AppliCommitType_submit = "submit";   // 提交审批
	public static final String AppliCommitType_refuse = "refuse";   // 拒绝
	public static final String AppliCommitType_return = "return";   // 打回	
	public static final String AppliCommitType_resubmit = "resubmit";//重新提交
	public static final String AppliCommitType_compliance = "Compliance";//提交到合规部
	
	// 往来情况
	public static final String OppStatus_wu = "0";    // 无往来 
	public static final String OppStatus_1 = "1";     // 有往来，但是还未确定费用
	public static final String OppStatus_2 = "2";     // 有往来，费用已确定
	public static final String OppStatus_3 = "3";     // 有往来，往来款已支付
	
	// 支付确认状态
	public static final String RefundStatus_dzf = "0"; //待支付
	public static final String RefundStatus_dqr = "1"; //已支付待确认
	public static final String RefundStatus_yqr = "2"; //已确认
	
	// 还款状态
	public static final String RePayStatus_whk = "0";  // 未还款
	public static final String RePayStatus_bfhk = "1"; // 部分还款
	public static final String RePayStatus_yhk = "2";  // 已还款
	
	// 付款类型
	public static final String PayType_bx = "10";  // 报销单、预支单支付类型
	public static final String PayType_hk = "20";  // 还款类型
	public static final String PayType_wl = "30";
	
	// 权限角色ID
	public static final String Role_ybry = "10";    // 一般人员
	public static final String Role_bmjl = "18";    // 部门经理
	public static final String Role_bmzj = "19";    // 部门总监
	public static final String Role_cwcn = "70";    // 财务出纳
	public static final String Role_cwkj = "71";    // 会计
	public static final String Role_sxfshy = "72";  // 手续费审核员
	public static final String Role_cwjl = "78";    // 财务经理
	public static final String Role_cwzj = "79";    // 财务总监
	public static final String Role_zsbm = "80";    // 总经理室直属部门人员
	public static final String Role_hgshy = "81";   // 合规部审核员
	public static final String Role_zm = "88";      // 总经理秘书
	public static final String Role_zjl = "89";     // 总经理
	
	// 部门类型
	public static final String DeptType_hsjg = "1";   // 核算机构
	public static final String DeptType_zjls = "2";   // 总经理室
	public static final String DeptType_zjlzs = "3";  // 总经理直属部门
	public static final String DeptType_cw = "4";     // 财务部门
	public static final String DeptType_hg = "5";     // 合规部
	public static final String DeptType_it = "6";     // IT部
	public static final String DeptType_pt = "0";     // 普通部门
	
	// 出差类型
	public static final String Evection_gn = "0";     // 国内出差
	public static final String Evection_gw = "1";     // 国外出差
	public static final String Evection_wu = "*";     // 非出差申请
	public static final double Evection_amount = 500; // 出差申请判断限额
	// 出差申请,国内出差,小于500元时,自动提交角色
	public static final String evection_autoRole1 = Role_ybry+","+Role_bmjl+","+Role_cwcn+","+Role_cwkj+","+Role_sxfshy+","+Role_cwjl;
	// 出差申请,国内出差,无条件自动提交角色
	public static final String evection_autoRole2 = Role_bmzj+","+Role_cwzj+","+Role_zsbm+","+Role_hgshy+","+Role_zm+","+Role_zjl;
	
	// 申请单提交时待审批信息中的审核状态
	public static final Map roleMap;
	public static final Map submitMap;
	static {
		roleMap = new HashMap();
		roleMap.put(SysConstConfig.Role_bmjl,"部门经理");
		roleMap.put(SysConstConfig.Role_bmzj,"部门总监");
		roleMap.put(SysConstConfig.Role_hgshy,"合规部审核员");
		roleMap.put(SysConstConfig.Role_cwcn,"出纳");
		roleMap.put(SysConstConfig.Role_sxfshy,"手续费审核员");
		roleMap.put(SysConstConfig.Role_cwjl,"财务经理");
		roleMap.put(SysConstConfig.Role_cwzj,"财务总监");
		roleMap.put(SysConstConfig.Role_zjl,"总经理");
	}

	static {
		submitMap = new HashMap();
		submitMap.put(SysConstConfig.AppliCommitType_submit, "审核");
		submitMap.put(SysConstConfig.AppliCommitType_return, "打回");
		submitMap.put(SysConstConfig.AppliCommitType_refuse, "拒绝");
	}
	
	// 凭证相关
	public static final String VoucherType = "3";	
	public static final String MaxFlag_Max = "1";			// 凭证最大号，在原来的设计中，如果为0就是段号会有特殊的处理，但是现在看来这种处理是没有必要的
	public static final int VOUCHERNOSERIALLENGTH = 4;
	public static final String Exchange_ItemCode = "6601";
	public static final String Exchange_ItemName = "汇兑损益";
	public static final String AccBookCode = "02";			// 账套
	public static final String AccBookType = "11";			
	public static final String VoucherFlag_ToAudit = "1";
	public static final String Voucher_GenerateWay = "1";
	public static final int CACHE_TYPE = CacheFactory.SINGLETON_CACHE;
	
	//预算状态
	public static final String budget_commit="提交";
	public static final String budget_reback="打回";
	
	//成本中心总数
	public static final int feeComNo=3;
}
