package cn.com.sinosoft.saa.web;

import ins.framework.exception.BusinessException;
import ins.framework.web.Struts2Action;

import java.util.ArrayList;
import java.util.List;

import cn.com.sinosoft.saa.model.SaaBusinessline;
import cn.com.sinosoft.saa.model.SaaClass;
import cn.com.sinosoft.saa.model.SaaCompany;
import cn.com.sinosoft.saa.model.SaaRisk;
import cn.com.sinosoft.saa.model.SaaUser;
import cn.com.sinosoft.saa.service.facade.SaaGradeService;
import cn.com.sinosoft.saa.service.facade.SaaInsuranceCategoryService;
import cn.com.sinosoft.saa.service.facade.SaaInsuranceService;
import cn.com.sinosoft.saa.service.facade.SaaPowerService;
import cn.com.sinosoft.saa.service.facade.SaaProductLineService;
import cn.com.sinosoft.saa.service.facade.SaaUserService;
import cn.com.sinosoft.saa.util.IConstants;
import cn.com.sinosoft.saa.vo.SaaGradeTaskVO;
import cn.com.sinosoft.saa.vo.SaaRiskObjectVO;
import cn.com.sinosoft.saa.vo.SaaUserGradeVO;

@SuppressWarnings("serial")
public class SaaUserGradeAction extends Struts2Action{
	private SaaGradeService saaGradeService;
	private SaaPowerService saaPowerService;
	private SaaUser saaUser;
	private String userCode;
	private String saaGradeID;
	private String rootTaskCode;
	private String[] treeCheckBox;
	private List<SaaUserGradeVO> userGrades = new ArrayList<SaaUserGradeVO>(0);
	private List<SaaGradeTaskVO> gradeTasks = new ArrayList<SaaGradeTaskVO>(0);
	private List<SaaGradeTaskVO> systemTasks = new ArrayList<SaaGradeTaskVO>(0);
	//业务权限设置用->
	private List<SaaRiskObjectVO> saaRiskObjectVOList = new ArrayList<SaaRiskObjectVO>(0);
	private SaaProductLineService saaProductLineService;
	private SaaInsuranceService saaInsuranceService;
	private SaaInsuranceCategoryService saaInsuranceCategoryService;
	private List<SaaCompany> saaSpareCompanys = new ArrayList<SaaCompany>(0);
	private List<SaaCompany> saaPermitCompanys  = new ArrayList<SaaCompany>(0);
	private List<SaaCompany> saaExceptCompanys  = new ArrayList<SaaCompany>(0);
	private List<SaaBusinessline> saaProductLines = new ArrayList<SaaBusinessline>(0);
	private List<SaaRisk> saaInsurances = new ArrayList<SaaRisk>(0);
	private List<SaaClass> saaInsuranceCategories = new ArrayList<SaaClass>(0);
	private String[] forbidSelect;
	private String[] allowSelect;
	private SaaUserService saaUserService;
	private List<SaaUser> saaUserSameComs = new ArrayList<SaaUser>(0);
	
	public String prepareQueryUser(){
		return SUCCESS;
	}
	
	public String prepareQueryAgentUser(){
		return SUCCESS;
	}
	public String prepareUpdateUserGrade() {
		String userCode1=(String)getSession().getAttribute("UserCode");
		boolean hasPower=saaPowerService.checkPower(userCode1, IConstants.SAA_USERPOWER_CONFIG_USERGRADE, (Integer)getSession().getAttribute("PowerType"), "");
		if(!hasPower){
			throw new BusinessException("您沒有人员岗位授予权限！",false);
		}
		saaUser = saaUserService.findSaaUserByUserCode(userCode,(String)getSession().getAttribute("UserCode"));
		if (null==saaUser) {
			throw new BusinessException("对不起您没有员工："+userCode+" 的管理权限！",false);
		}
//		userGrades = saaUserGradeService.getUserGradeVOList(userCode,(String)getSession().getAttribute("UserCode"));
		return SUCCESS;
	}
	public String updateUserGrade(){
		String userCode1=(String)getSession().getAttribute("UserCode");
		boolean hasPower=saaPowerService.checkPower(userCode1, IConstants.SAA_USERPOWER_CONFIG_USERGRADE, (Integer)getSession().getAttribute("PowerType"), "");
		if(!hasPower){
			throw new BusinessException("您沒有人员岗位授予权限！",false);
		}
//		saaUserGradeService.updateUserGrade(userGrades, userCode,(String)getSession().getAttribute("UserCode"));
		return SUCCESS;
	}
	public String prepareUpdateUserGradePower(){
		String userCode1=(String)getSession().getAttribute("UserCode");
		boolean hasPower=saaPowerService.checkPower(userCode1, IConstants.SAA_USERPOWER_CONFIG_USERADDPOWER, (Integer)getSession().getAttribute("PowerType"), "");
		if(!hasPower){
			throw new BusinessException("您沒有人员岗位业务范围授予权限！",false);
		}
		return SUCCESS;
	}
	
	/** 员工岗位权限配置—各员工岗位的查询 */
	public String initUserGradeList() {
		String userCode1=(String)getSession().getAttribute("UserCode");
		boolean hasPower=saaPowerService.checkPower(userCode1, IConstants.SAA_USERPOWER_CONFIG_USERADDPOWER, (Integer)getSession().getAttribute("PowerType"), "");
		if(!hasPower){
			throw new BusinessException("您沒有人员岗位业务范围授予权限！",false);
		}
		saaUser = saaUserService.findSaaUserByUserCode(userCode,(String)getSession().getAttribute("UserCode"));		
		if (null==saaUser) {
			throw new BusinessException("对不起您没有员工："+userCode+" 的管理权限！",false);
		}
//		userGrades = saaUserGradeService.getUserGradeVOList(userCode,(String)getSession().getAttribute("UserCode"));
		return SUCCESS;
	}
	public String viewUserGrade(){
		String userCode1=(String)getSession().getAttribute("UserCode");
		boolean hasPower=saaPowerService.checkPower(userCode1, IConstants.SAA_USERPOWER_CONFIG_USERADDPOWER, (Integer)getSession().getAttribute("PowerType"), "");
		if(!hasPower){
			throw new BusinessException("您沒有人员岗位业务范围授予权限！",false);
		}
//		gradeTasks = saaGradeService.findSaaGradeTaskVOList(saaGradeID,(String)getSession().getAttribute("UserCode"));
		systemTasks=saaGradeService.findRootSaaGradeTaskVO((String)getSession().getAttribute("UserCode"));
		return SUCCESS;
	}
	//根据某根节点获取功能代码子树
	public String preGradeTaskCodeBySys(){
		gradeTasks = saaGradeService.findSaaGradeTaskVOListByRootCode(saaGradeID,(String)getSession().getAttribute("UserCode"),rootTaskCode);    
		return SUCCESS;
	}
	public String viewUserGradePower(){
		String userCode1=(String)getSession().getAttribute("UserCode");
		boolean hasPower=saaPowerService.checkPower(userCode1, IConstants.SAA_USERPOWER_CONFIG_USERADDPOWER, (Integer)getSession().getAttribute("PowerType"), "");
		if(!hasPower){
			throw new BusinessException("您沒有人员岗位业务范围授予权限！",false);
		}
		//人员权限设置->
//		saaSpareCompanys = saaUserGradeService.findSpareCompanyList(userCode1);
//		saaPermitCompanys = saaUserGradeService.findSaaPermitCompanyList(userCode,saaGradeID);
//		saaExceptCompanys = saaUserGradeService.findSaaExceptCompanyList(userCode,saaGradeID);
//		saaRiskObjectVOList = saaUserGradeService.findSaaRiskObjectVOList(userCode,saaGradeID,userCode1);
		saaUserSameComs = saaUserService.findSaaUserSameComList(userCode ,userCode1);
		//人员权限设置<-
		return SUCCESS;
	}
	
	public String viewAgentUserGradePower(){
		String userCode1=(String)getSession().getAttribute("UserCode");
		boolean hasPower=saaPowerService.checkPower(userCode1, IConstants.SAA_USERPOWER_CONFIG_USERADDPOWER, (Integer)getSession().getAttribute("PowerType"), "");
		if(!hasPower){
			throw new BusinessException("您沒有人员岗位业务范围授予权限！",false);
		}
		//人员权限设置->
//		saaSpareCompanys = saaUserGradeService.findAgentSpareCompanyList(userCode1);
//		saaPermitCompanys = saaUserGradeService.findSaaPermitCompanyList(userCode,saaGradeID);
//		saaExceptCompanys = saaUserGradeService.findSaaExceptCompanyList(userCode,saaGradeID);
//		saaRiskObjectVOList = saaUserGradeService.findSaaRiskObjectVOList(userCode,saaGradeID,userCode1);
		saaUserSameComs = saaUserService.findSaaUserSameComList(userCode ,userCode1);
		//人员权限设置<-
		return SUCCESS;
	}
	public String viewGrade(){
		String userCode1=(String)getSession().getAttribute("UserCode");
		boolean hasPower=saaPowerService.checkPower(userCode1, IConstants.SAA_USERPOWER_CONFIG_USERADDPOWER, (Integer)getSession().getAttribute("PowerType"), "");
		if(!hasPower){
			throw new BusinessException("您沒有人员岗位业务范围授予权限！",false);
		}
		gradeTasks = saaGradeService.findSaaGradeTaskVOList(saaGradeID,(String)getSession().getAttribute("UserCode"));
		return SUCCESS;
	}
	public String prepareUpdateUserServicePower(){
		String userCode1=(String)getSession().getAttribute("UserCode");
		boolean hasPower=saaPowerService.checkPower(userCode1, IConstants.SAA_USERPOWER_CONFIG_USERADDPOWER, (Integer)getSession().getAttribute("PowerType"), "");
		if(!hasPower){
			throw new BusinessException("您沒有人员岗位业务范围授予权限！",false);
		}
		saaUser = saaUserService.findSaaUserByUserCode(userCode,(String)getSession().getAttribute("UserCode"));
		if (null==saaUser) {
			throw new BusinessException("对不起您没有员工："+userCode+" 的管理权限！",false);
		}
		return SUCCESS;
	}
	public String updateUserServicePower(){
		String userCode1=(String)getSession().getAttribute("UserCode");
		boolean hasPower=saaPowerService.checkPower(userCode1, IConstants.SAA_USERPOWER_CONFIG_USERADDPOWER, (Integer)getSession().getAttribute("PowerType"), "");
		if(!hasPower){
			throw new BusinessException("您沒有人员岗位业务范围授予权限！",false);
		}
		//String saaUserGradeID = saaUserGradeService.getUserGradeID(userCode, saaGradeID);
//		saaUserGradeService.updateUserServicePower(allowSelect,forbidSelect,userCode,saaGradeID,treeCheckBox);
		return SUCCESS;
	}
	
/** ************************************************************************ */
	
	public SaaUser getSaaUser() {
		return saaUser;
	}
	public void setSaaUser(SaaUser saaUser) {
		this.saaUser = saaUser;
	}
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	public List<SaaUserGradeVO> getUserGrades() {
		return userGrades;
	}
	public void setUserGrades(List<SaaUserGradeVO> userGrades) {
		this.userGrades = userGrades;
	}
	public SaaGradeService getSaaGradeService() {
		return saaGradeService;
	}
	public void setSaaGradeService(SaaGradeService saaGradeService) {
		this.saaGradeService = saaGradeService;
	}
	public String getSaaGradeID() {
		return saaGradeID;
	}
	public void setSaaGradeID(String saaGradeID) {
		this.saaGradeID = saaGradeID;
	}
	public List<SaaGradeTaskVO> getGradeTasks() {
		return gradeTasks;
	}
	public void setGradeTasks(List<SaaGradeTaskVO> gradeTasks) {
		this.gradeTasks = gradeTasks;
	}
	public SaaProductLineService getSaaProductLineService() {
		return saaProductLineService;
	}
	public void setSaaProductLineService(SaaProductLineService saaProductLineService) {
		this.saaProductLineService = saaProductLineService;
	}
	public SaaInsuranceService getSaaInsuranceService() {
		return saaInsuranceService;
	}
	public void setSaaInsuranceService(SaaInsuranceService saaInsuranceService) {
		this.saaInsuranceService = saaInsuranceService;
	}
	public SaaInsuranceCategoryService getSaaInsuranceCategoryService() {
		return saaInsuranceCategoryService;
	}
	public void setSaaInsuranceCategoryService(
			SaaInsuranceCategoryService saaInsuranceCategoryService) {
		this.saaInsuranceCategoryService = saaInsuranceCategoryService;
	}
	public List<SaaRisk> getSaaInsurances() {
		return saaInsurances;
	}
	public void setSaaInsurances(List<SaaRisk> saaInsurances) {
		this.saaInsurances = saaInsurances;
	}
	public List<SaaClass> getSaaInsuranceCategories() {
		return saaInsuranceCategories;
	}
	public void setSaaInsuranceCategories(List<SaaClass> saaInsuranceCategories) {
		this.saaInsuranceCategories = saaInsuranceCategories;
	}
	public List<SaaBusinessline> getSaaProductLines() {
		return saaProductLines;
	}
	public void setSaaProductLines(List<SaaBusinessline> saaProductLines) {
		this.saaProductLines = saaProductLines;
	}
/*	public String getSaaUserGradeID() {
		return saaUserGradeID;
	}
	public void setSaaUserGradeID(String saaUserGradeID) {
		this.saaUserGradeID = saaUserGradeID;
	}*/
	public String[] getForbidSelect() {
		return forbidSelect;
	}
	public void setForbidSelect(String[] forbidSelect) {
		this.forbidSelect = forbidSelect;
	}
	public String[] getAllowSelect() {
		return allowSelect;
	}
	public void setAllowSelect(String[] allowSelect) {
		this.allowSelect = allowSelect;
	}
	public List<SaaRiskObjectVO> getSaaRiskObjectVOList() {
		return saaRiskObjectVOList;
	}
	public void setSaaRiskObjectVOList(List<SaaRiskObjectVO> saaRiskObjectVOList) {
		this.saaRiskObjectVOList = saaRiskObjectVOList;
	}
	public List<SaaUser> getSaaUserSameComs() {
		return saaUserSameComs;
	}
	public void setSaaUserSameComs(List<SaaUser> saaUserSameComs) {
		this.saaUserSameComs = saaUserSameComs;
	}
	public SaaUserService getSaaUserService() {
		return saaUserService;
	}
	public void setSaaUserService(SaaUserService saaUserService) {
		this.saaUserService = saaUserService;
	}
	public String[] getTreeCheckBox() {
		return treeCheckBox;
	}
	public void setTreeCheckBox(String[] treeCheckBox) {
		this.treeCheckBox = treeCheckBox;
	}
	public List<SaaCompany> getSaaSpareCompanys() {
		return saaSpareCompanys;
	}
	public void setSaaSpareCompanys(List<SaaCompany> saaSpareCompanys) {
		this.saaSpareCompanys = saaSpareCompanys;
	}
	public List<SaaCompany> getSaaPermitCompanys() {
		return saaPermitCompanys;
	}
	public void setSaaPermitCompanys(List<SaaCompany> saaPermitCompanys) {
		this.saaPermitCompanys = saaPermitCompanys;
	}
	public List<SaaCompany> getSaaExceptCompanys() {
		return saaExceptCompanys;
	}
	public void setSaaExceptCompanys(List<SaaCompany> saaExceptCompanys) {
		this.saaExceptCompanys = saaExceptCompanys;
	}
	public SaaPowerService getSaaPowerService() {
		return saaPowerService;
	}
	public void setSaaPowerService(SaaPowerService saaPowerService) {
		this.saaPowerService = saaPowerService;
	}
	public List<SaaGradeTaskVO> getSystemTasks() {
		return systemTasks;
	}
	public void setSystemTasks(List<SaaGradeTaskVO> systemTasks) {
		this.systemTasks = systemTasks;
	}
	public String getRootTaskCode() {
		return rootTaskCode;
	}
	public void setRootTaskCode(String rootTaskCode) {
		this.rootTaskCode = rootTaskCode;
	}
}
