package cn.com.sinosoft.saa.web;

import ins.framework.common.Page;
import ins.framework.common.QueryRule;
import ins.framework.web.Struts2Action;
import cn.com.sinosoft.saa.model.SaaUser;
import cn.com.sinosoft.saa.service.facade.SaaUserService;
/**
 * <p>用户管理处理类</P>
 * @author wangzijian
 * 包括新增，查询，删除和修改用户的信息
 */
@SuppressWarnings("serial")
public class SaaUserAction extends Struts2Action{
	private SaaUser saaUser;
	private SaaUserService saaUserService; 
	private String actionType;
	private String userCode;
	public String prepareQueryUser(){
		saaUser = null;
		return SUCCESS;
	}
	
	/**
	 * 根据页面输入信息查询用户列表
	 * @return
	 */
	public String queryUser(){
		if (pageNo == 0) {
			pageNo = 1;
		}
		if (pageSize == 0) {
			pageSize = 20;
		}
		QueryRule queryRule = QueryRule.getInstance();
		if(saaUser.getUserCode() != null && !"".equals(saaUser.getUserCode().trim())){
			queryRule.addEqual("userCode", saaUser.getUserCode());
		}
		if(saaUser.getUserName() != null && !"".equals(saaUser.getUserName().trim())){
			queryRule.addEqual("userName", saaUser.getUserName());
		}
		Page page = saaUserService.findUser(queryRule, pageNo, pageSize);	
		try {
				
			this.writeJSONData(page, "userCode", "userName", "password","phone");
		} catch (Exception e) {
			this.writeJSONMsg(e.getMessage());}
		return null;
	}
	
	public String prepareAddUser(){
		saaUser = null;
		actionType = "add";
		return SUCCESS;
	}
	/**
	 * 保存新的用户信息
	 * @return
	 */
	public String addUser(){
		saaUserService.addUser(saaUser);
		return SUCCESS;
	}
	
	public String prepareUpdateUser(){
		actionType = "update";
		saaUser = saaUserService.findSaaUserByUserCode(userCode);
		return SUCCESS;
	}
	
	public String updateUser(){
		saaUserService.updateSaaUser(saaUser);
		return SUCCESS;
	}
	public String deleteUser(){
		saaUser = saaUserService.findSaaUserByUserCode(userCode);
		saaUserService.deleteSaaUser(saaUser);
		return SUCCESS;
	}
	
	//--------------------------华丽的分割线
	public SaaUserService getSaaUserService() {
		return saaUserService;
	}
	public void setSaaUserService(SaaUserService saaUserService) {
		this.saaUserService = saaUserService;
	}
	public SaaUser getSaaUser() {
		return saaUser;
	}
	public void setSaaUser(SaaUser saaUser) {
		this.saaUser = saaUser;
	}
	public String getActionType() {
		return actionType;
	}
	public void setActionType(String actionType) {
		this.actionType = actionType;
	}
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

}
