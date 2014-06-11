package cn.com.sinosoft.saa.web;

import ins.framework.common.Page;
import ins.framework.exception.BusinessException;
import ins.framework.web.Struts2Action;

import java.util.ArrayList;
import java.util.List;

import cn.com.sinosoft.saa.model.SaaUser;
import cn.com.sinosoft.saa.service.facade.SaaPowerService;
import cn.com.sinosoft.saa.service.facade.SaaUserService;
import cn.com.sinosoft.saa.util.IConstants;
import cn.com.sinosoft.saa.vo.SaaUserGradeVO;

@SuppressWarnings("serial")
public class SaaUserInsteadAction extends Struts2Action{
	private SaaPowerService saaPowerService;
	private SaaUserService saaUserService;
	private String userCode;
	private SaaUser saaUser;
	private List<SaaUserGradeVO> saaUserGradeVOs = new ArrayList<SaaUserGradeVO>(0);
	private List<SaaUser> saaUserList = new ArrayList<SaaUser>(0);
	public String prepareQueryUser(){
		String userCode1=(String)getSession().getAttribute("UserCode");
		boolean hasPower=saaPowerService.checkPower(userCode1, IConstants.SAA_INSTEAD_QUERY, (Integer)getSession().getAttribute("PowerType"), "");
		if(!hasPower){
			throw new BusinessException("您沒有代岗授权查询权限！",false);
		}
		return SUCCESS;
	}
//	public String queryUserList(){
//		try {
//			Page page = saaUserInsteadService.getUserList(saaUser, this.pageNo,
//					this.pageSize);
//			this.writeJSONData(page, "userCode", "userName", "comCode",
//					"validStatus");
//		} catch (Exception e) {
//			this.writeJSONMsg(e.getMessage());}
//		return null;
//	}

	public String prepareInsteadUser(){
		String userCode1=(String)getSession().getAttribute("UserCode");
		boolean hasPower=saaPowerService.checkPower(userCode1, IConstants.SAA_INSTEAD_QUERY, (Integer)getSession().getAttribute("PowerType"), "");
		if(!hasPower){
			throw new BusinessException("您沒有代岗授权查询权限！",false);
		}
		saaUser = saaUserService.findSaaUserByUserCode(userCode,(String)getSession().getAttribute("UserCode"));
		if (null==saaUser) {
			throw new BusinessException("对不起您没有员工："+userCode+" 的管理权限！",false);
		}
//		saaUserGradeVOs = saaUserGradeService.getInseadUserGradeVOList(userCode,(String)getSession().getAttribute("UserCode"));
		return SUCCESS;
	}
	public String insteadUser(){
		String userCode1=(String)getSession().getAttribute("UserCode");
		boolean hasPower=saaPowerService.checkPower(userCode1, IConstants.SAA_INSTEAD_BACK, (Integer)getSession().getAttribute("PowerType"), "");
		if(!hasPower){
			throw new BusinessException("您沒有代岗授权回收权限！",false);
		}
		return SUCCESS;
	}
	public String checkUserInstead(){
		String checkResult = "editUserInstead";
		if(checkResult.equals("editUserInstead")){
			saaUser = saaUserService.findSaaUserByUserCode(userCode,(String)getSession().getAttribute("UserCode"));
			if (null==saaUser) {
				throw new BusinessException("对不起您没有员工："+userCode+" 的管理权限！",false);
			}
//			saaUserGradeVOs = saaUserGradeService.getInseadUserGradeVOList(userCode,(String)getSession().getAttribute("UserCode"));
			return "editUserInstead";
		}else{
			return "viewUserInstead";
		}
	}
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

	public List<SaaUser> getSaaUserList() {
		return saaUserList;
	}
	public void setSaaUserList(List<SaaUser> saaUserList) {
		this.saaUserList = saaUserList;
	}
	public List<SaaUserGradeVO> getSaaUserGradeVOs() {
		return saaUserGradeVOs;
	}
	public void setSaaUserGradeVOs(List<SaaUserGradeVO> saaUserGradeVOs) {
		this.saaUserGradeVOs = saaUserGradeVOs;
	}
	public SaaUserService getSaaUserService() {
		return saaUserService;
	}
	public void setSaaUserService(SaaUserService saaUserService) {
		this.saaUserService = saaUserService;
	}

	public SaaPowerService getSaaPowerService() {
		return saaPowerService;
	}

	public void setSaaPowerService(SaaPowerService saaPowerService) {
		this.saaPowerService = saaPowerService;
	}
}
