package ins.platform.menu.service.spring;

import ins.framework.dao.GenericDaoHibernate;
import ins.framework.power.PowerService;
import ins.platform.menu.model.SmcMenu;
import ins.platform.menu.service.facade.BocinsMenuService;
import ins.platform.menu.service.facade.MenuService;
import ins.platform.menu.service.facade.MinganMenuService;
import ins.platform.menu.service.facade.PiccMenuService;

import java.util.Locale;
import java.util.Map;
import java.util.TreeMap;
import org.apache.log4j.Logger;
//import org.apache.commons.logging.Log;
//import org.apache.commons.logging.LogFactory;

/**
 * PICC样式的菜单生成器
 */
public class MenuServiceSpringImpl extends
		GenericDaoHibernate<SmcMenu, Integer> implements MenuService {

	protected final Logger logger = Logger.getLogger(MenuServiceSpringImpl.class);

	protected PowerService powerService;
	private MinganMenuService minganMenuService;
	private PiccMenuService piccMenuService;
	private BocinsMenuService bocinsMenuService;
	protected static Map<String, String> imageMap = new TreeMap<String, String>();

	
	public PowerService getPowerService() {
		return powerService;
	}

	public void setPowerService(PowerService powerService) {
		this.powerService = powerService;
	}

	public MinganMenuService getMinganMenuService() {
		return minganMenuService;
	}

	public void setMinganMenuService(MinganMenuService minganMenuService) {
		this.minganMenuService = minganMenuService;
	}

	public PiccMenuService getPiccMenuService() {
		return piccMenuService;
	}

	public void setPiccMenuService(PiccMenuService piccMenuService) {
		this.piccMenuService = piccMenuService;
	}

	/**
	 * 执行生成PICC样式的树(用于显示） *
	 * 
	 * @param upperIdId
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
	 * @return
	 */
	public String showMenu(Integer upperMenuId,String comCode, String userCode,String gradeCodes, String systemCode, String menuStyle,
			String language,int powerType,String gradesIdString) {
		comCode="";
		gradeCodes="";
		if (menuStyle == null || menuStyle.equalsIgnoreCase("picc")) {
			return piccMenuService.showMenu(upperMenuId, comCode, userCode,
					gradeCodes, systemCode, language);
		}
		if (menuStyle.equalsIgnoreCase("mingan")) {
			return minganMenuService.showMenu(upperMenuId, comCode, userCode,
					gradeCodes, systemCode, language);
		}
		if (menuStyle.equalsIgnoreCase("bocins")) {
			System.out.println("----------------------------92--------------------------------");
			
			return bocinsMenuService.showMenu(upperMenuId, comCode, userCode,
					gradeCodes, systemCode, language, powerType, gradesIdString);
		}
		return piccMenuService.showMenu(upperMenuId, comCode, userCode,
				gradeCodes, systemCode, language);
	}
	public String showMenu(Integer upperMenuId,String comCode, String userCode,String gradeCodes, String systemCode,String riskCode, String menuStyle,
			String language,int powerType,String gradesIdString){
		return bocinsMenuService.showMenu(upperMenuId, comCode, userCode,
				gradeCodes, systemCode,riskCode, language, powerType, gradesIdString);
	}

	public BocinsMenuService getBocinsMenuService() {
		return bocinsMenuService;
	}

	public void setBocinsMenuService(BocinsMenuService bocinsMenuService) {
		this.bocinsMenuService = bocinsMenuService;
	}

	public String showMenu(Integer upperMenuId, String comCode, String userCode, String gradeCodes, String systemCode,
			String menuStyle, Locale locale, int powerType, String gradesIdString) {
		// TODO Auto-generated method stub
		return null;
	}

	public String showMenu(Integer upperMenuId, String comCode, String userCode, String gradeCodes, String systemCode,
			String riskCode, String menuStyle, Locale locale, int powerType, String gradesIdString) {
		// TODO Auto-generated method stub
		return null;
	}

	public String showMenu(Integer upperMenuId, String comCode, String userCode, String gradeCodes, String systemCode,
			Locale locale, int powerType, String gradesIdString) {
		// TODO Auto-generated method stub
		return null;
	}

}