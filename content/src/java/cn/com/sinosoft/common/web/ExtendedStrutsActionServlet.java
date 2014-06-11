package cn.com.sinosoft.common.web;

import java.io.File;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.sinosoft.sysframework.common.util.FileUtils;
import com.sinosoft.sysframework.common.util.PlatformUtils;
import com.sinosoft.sysframework.reference.AppConfig;
import com.sinosoft.sysframework.reference.DBFactory;

/**
 * 初始化了一大堆我自己用不到的东西
*<p>
* CopyRight (c):Sinosoft 
*</p>
*<p> 
* Project: undwrt 
* </p>
* <p>
* Comments: 
* </p>
* <p>
* Author： WuBo
* </p>
* <p>
* Create Date： 2008 下午02:21:03
* </p>
 */
public class ExtendedStrutsActionServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private static Log logger = LogFactory
			.getLog(ExtendedStrutsActionServlet.class);

	/**
	 * @see javax.servlet.GenericServlet#init()
	 */
	public void init() throws ServletException {
		super.init();
		String configPath = getServletContext().getRealPath("/");
		if (configPath == null || configPath.trim().length() == 0) {
			String actionPathName = FileUtils
					.getRealPathName(ExtendedStrutsActionServlet.class);
			configPath = actionPathName.substring(0, actionPathName
					.lastIndexOf("/WEB-INF"));
		}
		if (!configPath.endsWith(PlatformUtils.FILE_SEPARATOR)) {
			configPath += PlatformUtils.FILE_SEPARATOR;
		}
		configPath += "WEB-INF" + PlatformUtils.FILE_SEPARATOR + "config"
				+ PlatformUtils.FILE_SEPARATOR;
		initWebApplicationConfig(configPath);
	}

	/**
	 * 初始化应用配置
	 * 
	 * @param configPath
	 *            目录{web_root}/WEB-INF/config
	 * @throws ServletException
	 */
	public static synchronized void initWebApplicationConfig(String configPath)
			throws ServletException {
		try {
			if (new File(configPath + "log.properties").exists()) {
				com.sinosoft.sysframework.log.Logger.configure(configPath
						+ "log.properties");
			} else {
				logger.info("No log.properties could be found.");
			}
			
			if (new File(configPath + "dbmanager-config.xml").exists()) {
				DBFactory.configure(configPath + "dbmanager-config.xml");
			} else {
				logger.info("No dbmanager-config.xml could be found.");
			}
			
			if (new File(configPath + PlatformUtils.FILE_SEPARATOR
					+ "appconfig").exists()) {
				AppConfig.configure(configPath + PlatformUtils.FILE_SEPARATOR
						+ "appconfig");
			} else {
				logger.info("No appconfig could be found.");
			}
		} catch (Exception e) {
			logger.warn(e.getMessage(), e);
			throw new ServletException(e);
		}
	}

}