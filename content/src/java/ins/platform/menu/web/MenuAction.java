package ins.platform.menu.web;

import ins.framework.web.Struts2Action;
import ins.platform.menu.service.facade.MenuService;

import com.opensymphony.xwork2.ActionContext;

public class MenuAction extends Struts2Action {
	private static final long serialVersionUID = 1L;

	private String companyCode;

	private String userCode;

	private String gradeCodes = "";

	private String systemCode;

	private Integer menuId;

	private String menuContent;

	private int powerType;

	private String gradesIdString = "";

	private String request_locale;

	private transient MenuService menuService;

	public String showMenu() {
		menuContent = menuService.showMenu(menuId, companyCode, userCode, gradeCodes, systemCode, ActionContext
				.getContext().getLocale(), powerType, gradesIdString);
		return SUCCESS;
	}

	public void setCompanyCode(String companyCode) {
		this.companyCode = companyCode;
	}

	public void setGradeCodes(String gradeCodes) {
		this.gradeCodes = gradeCodes;
	}

	public void setSystemCode(String systemCode) {
		this.systemCode = systemCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}

	public String getMenuContent() {
		return menuContent;
	}

	public void setMenuContent(String menuContent) {
		this.menuContent = menuContent;
	}

	public String getCompanyCode() {
		return companyCode;
	}

	public String getGradeCodes() {
		return gradeCodes;
	}

	public String getSystemCode() {
		return systemCode;
	}

	public String getUserCode() {
		return userCode;
	}

	public Integer getMenuId() {
		return menuId;
	}

	public void setMenuId(Integer menuId) {
		this.menuId = menuId;
	}

	public int getPowerType() {
		return powerType;
	}

	public void setPowerType(int powerType) {
		this.powerType = powerType;
	}

	public String getGradesIdString() {
		return gradesIdString;
	}

	public void setGradesIdString(String gradesIdString) {
		this.gradesIdString = gradesIdString;
	}

	public String getRequest_locale() {
		return request_locale;
	}

	public void setRequest_locale(String requestLocale) {
		request_locale = requestLocale;
	}

}
