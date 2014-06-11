package cn.com.sinosoft.saa.web;

import ins.framework.web.Struts2Action;
import cn.com.sinosoft.saa.service.facade.SaaPowerService;
import cn.com.sinosoft.saa.service.facade.SaaUserService;

@SuppressWarnings("serial")
public class SaaUserPowerAction extends Struts2Action{
	private SaaPowerService saaPowerService;
	private SaaUserService saaUserService;
	private String comCode;
	private String centerCode;
	private String userCode;
	private String password;
	public String login(){
			// 进行登录验证
			saaPowerService.login(userCode, password);
			getSession().setAttribute("UserCode", userCode);
			getSession().setAttribute("ComCode", comCode);
			getSession().setAttribute("CenterCode", centerCode);
			getSession().setAttribute("PowerType", 1);
			return SUCCESS;
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
	public String getComCode() {
		return comCode;
	}
	public void setComCode(String comCode) {
		this.comCode = comCode;
	}
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
