package ins.platform.menu.service.facade;

import java.util.Locale;

import javax.jws.WebMethod;
import javax.jws.WebService;

public interface MenuService {
	public static final String SHOW_MENU1 = "showMenu";

	public static final String CONFIG_MENU1 = "configMenu";

	/**
	 * 不带险种的生成树内容(用于显示)
	 * 
	 * @param upperId
	 *            上级菜单ID 为0时表示顶级菜单
	 * @param comCode
	 *            机构代码
	 * @param userCode
	 *            用户代码
	 * @param gradeCodes
	 *            岗位代码列表
	 * @param systemCode
	 *            系统代码
	 * @param menuStyle
	 *            菜单类型
	 * @param language
	 *            语言
	 * @param powerType
	 *            权限值 1-内网权限 2-外网权限
	 * @param gradesIdString
	 *            岗位列表
	 * @return 树内容
	 */
	public String showMenu(Integer upperMenuId, String comCode, String userCode, String gradeCodes, String systemCode,
			String menuStyle, String language, int powerType, String gradesIdString);

	/**
	 * 不带险种的生成树内容(用于显示)
	 * 
	 * @param upperId
	 *            上级菜单ID 为0时表示顶级菜单
	 * @param comCode
	 *            机构代码
	 * @param userCode
	 *            用户代码
	 * @param gradeCodes
	 *            岗位代码列表
	 * @param systemCode
	 *            系统代码
	 * @param riskCode
	 * 				险种代码        
	 * @param menuStyle
	 *            菜单类型
	 * @param language
	 *            语言
	 * @param powerType
	 *            权限值 1-内网权限 2-外网权限
	 * @param gradesIdString
	 *            岗位列表
	 * @return 树内容
	 */
	public String showMenu(Integer upperMenuId, String comCode, String userCode, String gradeCodes, String systemCode,
			String riskCode, String menuStyle, String language, int powerType, String gradesIdString);

	public String showMenu(Integer upperMenuId, String comCode, String userCode, String gradeCodes, String systemCode,
			Locale locale, int powerType, String gradesIdString);

}
