package cn.com.expense.eps.sys.web;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import com.sinosoft.sysframework.common.datatype.DateTime;
import cn.com.expense.eps.model.EpsPayWay;
import cn.com.expense.eps.sys.service.facade.EpsCompanyService;
import cn.com.expense.eps.sys.service.facade.PayWayService;
import cn.com.sinosoft.saa.service.facade.CodeService;
import ins.framework.common.Page;
import ins.framework.common.QueryRule;
import ins.framework.web.Struts2Action;
/**
 * @author wangzijian 20090624
 * @业务规则 做为支付方式配置的类，包括查询，新增等方法。
 */
@SuppressWarnings("serial")
public class PayWayAction extends Struts2Action{
	/** action 所需要用到的servce */
	private PayWayService payWayService;
	private EpsCompanyService epsCompanyService;
	private CodeService codeService;
	/** action 所需要用到的数据对象 */
	private EpsPayWay epsPayWay;	// 用这个对象来获取对应的页面元素。
	/**	页面返回的一些信息 */
	private String payWayCode;
	private String actionType;
	//都是为了完成页面上字段的中文显示的
	private String articleType;		// 专项代码
	private String articleTypeName;	// 专项名称
	private String permitCenterCodeName;	// 适用机构名称
	private String exceptCenterCodeName;	// 除外机构名称
	private String permitPayTypeName;		// 适用收付类型名称
	private String opPayWayName;			// 业务收付方式名称
	// 用于校验
	/**
	 * 返回输入查询条件的界面
	 * @return
	 */
	public String prepareFindPayWay(){
		epsPayWay = null;
		return SUCCESS;
	}
	/**
	 * 返回查询的收付方式列表
	 * @return
	 */
	public String findPayWay(){
		// 进行页号和每页数量初始化
		if (pageNo == 0) {
			pageNo = 1;
		}
		if (pageSize == 0) {
			pageSize = 20;
		}
		// 组织查询条件
		QueryRule queryRule = QueryRule.getInstance();
		generateTranslateRule(queryRule, epsPayWay);
		// 返回分页的结果
		Page page = payWayService.findPayWay(queryRule, pageNo, pageSize);
		// 将结果以JSON的方式读取并返回到页面中
		try {
			this.writeJSONData(page, "payWayCode","payWayCName","payWayType","dcInd","permitCenterCode","validStatus");
		} catch (Exception e) {
			e.printStackTrace();
			this.writeJSONMsg(e.getMessage());
		}
		return NONE;
	}
	/**
	 * 准备增加收付方式
	 * @return
	 */
	public String prepareAddPayWay(){
		epsPayWay = null;
		actionType = "add";
		return SUCCESS;

	}
	public String addPayWay() throws SecurityException, IllegalArgumentException, NoSuchMethodException, IllegalAccessException, InvocationTargetException{
		// 补全信息
		epsPayWay.setCreateDat(DateTime.current());
		String userCode = (String)getSession().getAttribute("UserCode");
		epsPayWay.setCreateCode(userCode);
		// 给F字段赋值，因为可能有多项，因此使用了Method类来进行处理
		if(articleType != null && articleType.length()>0){
			configFcode(articleType,epsPayWay);
		}
		payWayService.addPayWay(epsPayWay);
		return SUCCESS;
	}
	/**
	 * 根据页面返回的选择的Tcode的信息来决定需要回写的f字段的值。
	 * @return
	 * @throws NoSuchMethodException 
	 * @throws SecurityException 
	 * @throws InvocationTargetException 
	 * @throws IllegalAccessException 
	 * @throws IllegalArgumentException 
	 */
	private void configFcode(String articleType, EpsPayWay epsPayWay) throws SecurityException, NoSuchMethodException, IllegalArgumentException, IllegalAccessException, InvocationTargetException{
		String[] tCode= articleType.split(",");
		Class[] fClass = new Class[1];
		fClass[0] = String.class;
		Method fMethod;
//		EpsArticleType epsArticleType;
//		for(String t:tCode){
//			epsArticleType = articleTypeService.findEpsArticleTypeByPK(t);
//			if(epsArticleType != null);
//			String fMethodName = "set" + epsArticleType.getFcode();
//			fMethod = EpsPayWay.class.getMethod(fMethodName, fClass);
//			fMethod.invoke(epsPayWay, "*");
//		}
	}
	/**
	 * 用来根据查询的对象来返回查询条件
	 * @param queryRule
	 * @param epsPayWay
	 */
	private void generateTranslateRule(QueryRule queryRule, EpsPayWay epsPayWay){
		if(epsPayWay.getPayWayCode() != null && epsPayWay.getPayWayCode().length() > 0){
			queryRule.addEqual("payWayCode", epsPayWay.getPayWayCode());
		}
		if(epsPayWay.getPayWayCName() != null && epsPayWay.getPayWayCName().length() > 0){
			queryRule.addEqual("payWayCName", epsPayWay.getPayWayCName());
		}
		if(epsPayWay.getPayWayType() != null && epsPayWay.getPayWayType().length() > 0){
			queryRule.addEqual("payWayType", epsPayWay.getPayWayType());
		}
		if(epsPayWay.getValidStatus() != null && epsPayWay.getValidStatus().length() > 0 && !"9".equals(epsPayWay.getValidStatus())){
			queryRule.addEqual("validStatus", epsPayWay.getValidStatus());
		}
		queryRule.addAscOrder("payWayCode");
	}

	/** 删除员工信息 */
	public String deletePayWay() {
		payWayService.deletePayWayByPK(payWayCode);// Service根据员工ID号来删除
		return SUCCESS;
	}


	public String prepareUpdatePayWay() throws SecurityException, IllegalArgumentException, NoSuchMethodException, IllegalAccessException, InvocationTargetException{
		actionType = "update";
		epsPayWay = payWayService.findPayWayByPK(payWayCode);
		// 完成codeto name的转换
		codeToName();
		return SUCCESS;
	}
	/**
	 * 完成code to name 的转换
	 * @param epsPayWay
	 * @throws InvocationTargetException 
	 * @throws IllegalAccessException 
	 * @throws NoSuchMethodException 
	 * @throws IllegalArgumentException 
	 * @throws SecurityException 
	 */
	private void codeToName() throws SecurityException, IllegalArgumentException, NoSuchMethodException, IllegalAccessException, InvocationTargetException {
		String permitCenterCode = epsPayWay.getPermitCenterCode();
		String exceptCenterCode = epsPayWay.getExceptCenterCode();
		String permitPayType = epsPayWay.getPermitPayType();
		String opPayWay = epsPayWay.getOpPayWay();
		permitCenterCodeName = codeService.translateCode("centerCode", permitCenterCode, "", "C");
		exceptCenterCodeName = codeService.translateCode("centerCode", exceptCenterCode, "", "C");
		permitPayTypeName = codeService.translateCode("PayType", permitPayType, "", "C");
		opPayWayName = codeService.translateCode("OPPayWay", opPayWay, "", "C");
		
		// 单独处理F字段到T字段的转换
		configArticleType();
		articleTypeName = codeService.translateCode("tcode", articleType, "", "C");
	}
	/**
	 * 根据返回的对象组织专项
	 * @param articleType2
	 * @param articleType
	 * @param epsPayWay
	 * @throws NoSuchMethodException 
	 * @throws SecurityException 
	 * @throws InvocationTargetException 
	 * @throws IllegalAccessException 
	 * @throws IllegalArgumentException 
	 */
	private void configArticleType() throws SecurityException, NoSuchMethodException, IllegalArgumentException, IllegalAccessException, InvocationTargetException {
		Class[] fClass = null;
		Object parameters[] = null;
		Method method = null;
		String menthodName = null;
		String filedNameCode = null;
		String code = null;
		for (int i = 1; i <= 30; i++) {
			if (i >= 10) {
				menthodName = "getF" + i;
				filedNameCode = "F" + i;
			} else {
				menthodName = "getF0" + i;
				filedNameCode = "F0" + i;
			}
			method = EpsPayWay.class.getMethod(menthodName, fClass);
			code = (String) method.invoke(epsPayWay, parameters);
			if ("*".equals(code)) {
				QueryRule queryRule = QueryRule.getInstance();
				queryRule.addEqual("fcode", filedNameCode);
//				String tCode = articleTypeService.findUniqueArticleType(queryRule).getArticleID();
//				if (articleType == null) {
//					articleType = tCode;
//				} else {
//					articleType += "," + tCode;
//				}
			} 
		}
	}
	public String updatePayWay() throws SecurityException, IllegalArgumentException, NoSuchMethodException, IllegalAccessException, InvocationTargetException{
		// 补全信息
		epsPayWay.setUpdateCode((String)getSession().getAttribute("UserCode"));
		epsPayWay.setUpdateDate(DateTime.current());
		// 给F字段赋值，因为可能有多项，因此使用了Method类来进行处理
		configFcode(articleType,epsPayWay);
		payWayService.updatePayWay(epsPayWay);
		return SUCCESS;
	}
	// 以下是公用元素的get，set方法来留作框架初始化复制的时候使用
	public EpsPayWay getEpsPayWay() {
		return epsPayWay;
	}

	public void setEpsPayWay(EpsPayWay epsPayWay) {
		this.epsPayWay = epsPayWay;
	}

	public PayWayService getPayWayService() {
		return payWayService;
	}

	public void setPayWayService(PayWayService payWayService) {
		this.payWayService = payWayService;
	}

	public String getArticleType() {
		return articleType;
	}
	public void setArticleType(String articleType) {
		this.articleType = articleType;
	}
	public String getPayWayCode() {
		return payWayCode;
	}
	public void setPayWayCode(String payWayCode) {
		this.payWayCode = payWayCode;
	}
	public String getActionType() {
		return actionType;
	}
	public void setActionType(String actionType) {
		this.actionType = actionType;
	}
	public String getArticleTypeName() {
		return articleTypeName;
	}
	public void setArticleTypeName(String articleTypeName) {
		this.articleTypeName = articleTypeName;
	}
	public String getPermitCenterCodeName() {
		return permitCenterCodeName;
	}
	public void setPermitCenterCodeName(String permitCenterCodeName) {
		this.permitCenterCodeName = permitCenterCodeName;
	}
	public String getExceptCenterCodeName() {
		return exceptCenterCodeName;
	}
	public void setExceptCenterCodeName(String exceptCenterCodeName) {
		this.exceptCenterCodeName = exceptCenterCodeName;
	}
	public String getPermitPayTypeName() {
		return permitPayTypeName;
	}
	public void setPermitPayTypeName(String permitPayTypeName) {
		this.permitPayTypeName = permitPayTypeName;
	}
	public String getOpPayWayName() {
		return opPayWayName;
	}
	public void setOpPayWayName(String opPayWayName) {
		this.opPayWayName = opPayWayName;
	}
	public EpsCompanyService getEpsCompanyService() {
		return epsCompanyService;
	}
	public void setEpsCompanyService(EpsCompanyService epsCompanyService) {
		this.epsCompanyService = epsCompanyService;
	}
	public CodeService getCodeService() {
		return codeService;
	}
	public void setCodeService(CodeService codeService) {
		this.codeService = codeService;
	}
	
}
