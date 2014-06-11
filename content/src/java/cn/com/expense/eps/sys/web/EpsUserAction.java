package cn.com.expense.eps.sys.web;

import java.util.ArrayList;
import java.util.List;

import ins.framework.common.Page;
import ins.framework.common.QueryRule;
import ins.framework.web.Struts2Action;
import cn.com.expense.eps.model.EpsCompany;
import cn.com.expense.eps.model.EpsUser;
import cn.com.expense.eps.sys.service.facade.EpsCompanyService;
import cn.com.expense.eps.sys.service.facade.EpsUserService;


/**
 * 员工管理 Action类
 * 
 * @author 张喜英
 *
 */
public class EpsUserAction extends Struts2Action {
     
	private static final long serialVersionUID = -1063472907350761380L;

	private EpsUserService epsUserService;
    
	private EpsCompanyService epsCompanyService;
	
	private EpsUser epsUser;
	
	private EpsCompany epsCompany;
	
	private String userCode;
	
	private String comCode;
	
	private String userName;
	
	private String validStatus;
	
	private String type;
	
    public String prepareFindEpsUser(){
    	return SUCCESS;
    }
	
    public String findEpsUser(){
    	if (pageNo == 0) {
			pageNo = 1;
		}
		if (pageSize == 0) {
			pageSize = 20;
		}
		QueryRule queryRule = QueryRule.getInstance();//获得查询条件实例
      
		if(epsUser.getUserCode()!=null &&!epsUser.getUserCode().equals("")){
			queryRule.addLike("userCode", epsUser.getUserCode().trim());//添加查询条件userCode
		}
		if (epsUser.getUserName()!= null &&!epsUser.getUserName().equals("")) {
			queryRule.addLike("userName",epsUser.getUserName().trim());//添加查询条件userName
		}
		if(epsCompany.getComCode()!= null &&!epsCompany.getComCode().equals("")){
			queryRule.addEqual("epsCompany.comCode", epsCompany.getComCode().trim());
		}
		if(epsUser.getValidStatus()!= null &&!epsUser.getValidStatus().equals("")){
			queryRule.addEqual("validStatus", epsUser.getValidStatus().trim());
		}
		
		queryRule.addAscOrder("userCode");

		Page page = epsUserService.findEpsUser(queryRule, pageNo, pageSize);
		try {
			this.writeJSONData(page, "userCode", "userName","epsCompany.comCName","userEName","queryPermission","draftPermission","email","validStatus");
		} catch (Exception e) {
			this.writeJSONMsg(e.getMessage());
		}
		return NONE;
    }

    public String prepareAddEpsUser(){
    	epsUser = null;
    	type="add";
    	
    	return SUCCESS;
    }
    
    public String addEpsUser(){
    	
    	List<EpsUser> userList = new ArrayList<EpsUser>();
    	epsCompany = epsCompanyService.findEpsCompanyByPK(epsCompany.getComCode());
    	userList.add(epsUser);
    	
    	epsUser.setEpsCompany(epsCompany);
    	epsCompany.setEpsUsers(userList);
    	
    	epsUserService.addEpsUser(epsUser);
    	
    	return SUCCESS;
    }
    
    public String prepareUpdateEpsUser(){
    	epsUser =  epsUserService.findEpsUserByPK(userCode);
    	epsCompany = epsUser.getEpsCompany();
    	
    	type="update";
    	return SUCCESS;
    }
    
    public String updateEpsUser(){
    	List<EpsUser> userList = new ArrayList<EpsUser>();
    	epsCompany = epsCompanyService.findEpsCompanyByPK(epsCompany.getComCode());
    	userList.add(epsUser);
    	epsUser.setEpsCompany(epsCompany);
    	epsCompany.setEpsUsers(userList);
    	epsUserService.updateEpsUser(epsUser);
    	return SUCCESS;
    }
    
    public String viewEpsUser(){
    	epsUser = epsUserService.findEpsUserByPK(userCode);
    	epsCompany = epsUser.getEpsCompany();
    	return SUCCESS;
    }
    
    public String deleteEpsUser(){
    	
    	epsUserService.deleteEpsUserByPK(userCode);

    	return SUCCESS;
    }
    
    public void setEpsUserService(EpsUserService epsUserService) {
		this.epsUserService = epsUserService;
	}

	public void setEpsCompanyService(EpsCompanyService epsCompanyService) {
		this.epsCompanyService = epsCompanyService;
	}
     
	public EpsUser getEpsUser() {
		return epsUser;
	}

	public void setEpsUser(EpsUser epsUser) {
		this.epsUser = epsUser;
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getValidStatus() {
		return validStatus;
	}

	public void setValidStatus(String validStatus) {
		this.validStatus = validStatus;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getComCode() {
		return comCode;
	}

	public void setComCode(String comCode) {
		this.comCode = comCode;
	}

	public EpsCompany getEpsCompany() {
		return epsCompany;
	}

	public void setEpsCompany(EpsCompany epsCompany) {
		this.epsCompany = epsCompany;
	}

	public EpsUserService getEpsUserService() {
		return epsUserService;
	}

	public EpsCompanyService getEpsCompanyService() {
		return epsCompanyService;
	}
    
    
}
