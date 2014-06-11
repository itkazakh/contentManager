package cn.com.expense.eps.util.tag;

import ins.framework.cache.CacheFactory;
import ins.framework.cache.CacheService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;

import org.apache.struts2.ServletActionContext;
import org.apache.taglibs.standard.lang.support.ExpressionEvaluatorManager;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.opensymphony.xwork2.util.ValueStack;
import cn.com.expense.eps.util.SysConstConfig;
import cn.com.sinosoft.saa.service.facade.CodeService;

@SuppressWarnings("serial")
public class CodeSelectTag extends ItemTag {
	/**
	 * ��ʼ����ʵ��
	 */
	private static CacheService cacheManager = CacheFactory.getIntance(
			SysConstConfig.CACHE_TYPE, "CodeSelect");

	protected String list;

	protected String multiple;

	protected String codeType;

	protected String riskCode;

	protected String language;

	protected String emptyOption;

	protected CodeService codeService;

	@SuppressWarnings("unchecked")
	public int doStartTag() throws JspException {
		if (language == null) {
			language = "C";
		}

		if (riskCode == null) {
			riskCode = "PUB";
		}

		if (codeService == null) {
			WebApplicationContext wac = WebApplicationContextUtils
					.getRequiredWebApplicationContext(pageContext
							.getServletContext());

			codeService = (CodeService) wac.getBean("codeService");
		}
		ValueStack valueStack = ServletActionContext.getContext()
				.getValueStack();
		StringBuffer commonHTML = generateHTML();
		ArrayList valueList = new ArrayList();
		StringBuffer buffer = new StringBuffer();
		if (id == null) {
			id = name;
		}
		if (value != null) {
			if (value.startsWith("{") && value.endsWith("}")) {
				value = value.substring(1, value.length() - 1);
				String[] values = value.split(",");
				for (int i = 0; i < values.length; i++) {
					if (values[i].startsWith("'") && values[i].endsWith("'")) {
						values[i] = values[i].substring(1,
								values[i].length() - 1);
					}
					valueList.add(values[i].trim());
				}
			} else {
				Object valueObject = valueStack.findValue(value);
				if (valueObject instanceof java.util.List) {
					java.util.List objList = (java.util.List) valueObject;
					for (Object obj : objList) {
						valueList.add(obj.toString().trim());
					}
				} else {
					if (value.startsWith("'") && value.endsWith("'")) {
						value = value.substring(1, value.length() - 1);
					}
					valueList.add(value.trim());
				}
			}
		}
		java.util.Map<String, String> map = null;
		String key = cacheManager.generateCacheKey("CodeSelect", codeType,
				riskCode, language);
		Object result = cacheManager.getCache(key);
		if (result != null) {
			map = (java.util.Map<String, String>) result;
		} else {
			map = codeService.listCodes(codeType, riskCode, language);
			cacheManager.putCache(key, map);
		}

		buffer.append("<select");
		buffer.append(commonHTML);
		if (id != null) {
			buffer.append(" id=\"").append(id).append("\"");
		}
		buffer.append(">");

		if (emptyOption != null && emptyOption.equalsIgnoreCase("true")) {
			buffer.append("<option value=\"\"></option>");
		}
		Iterator iterator = map.keySet().iterator();
		while (iterator.hasNext()) {
			String keyText = (String) iterator.next();
			String valueText = map.get(keyText);
			buffer.append("<option value=\"").append(keyText).append("\"");

			if (valueList.contains(keyText)) {
				buffer.append(" selected");
			}
			buffer.append(">").append(valueText).append("</option>");
		}

		buffer.append("</select>");

		JspWriter writer = pageContext.getOut();
		try {
			writer.print(buffer.toString());
		} catch (IOException e) {
			throw new JspException(e.toString());
		}
		return EVAL_BODY_INCLUDE;
	}

	public int doEndTag() throws JspException {
		clearValue();
		list = null;
		multiple = null;
		return EVAL_PAGE;
	}

	public void setMultiple(String multiple) throws JspException {
		this.multiple = multiple;
		if (multiple != null && multiple.startsWith("${")
				&& multiple.endsWith("}")) {
			this.multiple = (String) ExpressionEvaluatorManager.evaluate(
					"multiple", multiple, Object.class, this, pageContext);
		}
	}

	public void setCodeType(String codeType) throws JspException {
		this.codeType = codeType;
		if (codeType != null && codeType.startsWith("${")
				&& codeType.endsWith("}")) {
			this.codeType = (String) ExpressionEvaluatorManager.evaluate(
					"codeType", codeType, Object.class, this, pageContext);
		}
	}

	public void setEmptyOption(String emptyOption) throws JspException {
		this.emptyOption = emptyOption;
		if (emptyOption != null && emptyOption.startsWith("${")
				&& emptyOption.endsWith("}")) {
			this.emptyOption = (String) ExpressionEvaluatorManager
					.evaluate("emptyOption", emptyOption, Object.class, this,
							pageContext);
		}
	}

	public void setLanguage(String language) throws JspException {
		this.language = language;
		if (language != null && language.startsWith("${")
				&& language.endsWith("}")) {
			this.language = (String) ExpressionEvaluatorManager.evaluate(
					"language", language, Object.class, this, pageContext);
		}
	}

	public void setRiskCode(String riskCode) throws JspException {
		this.riskCode = riskCode;
		if (riskCode != null && riskCode.startsWith("${")
				&& riskCode.endsWith("}")) {
			this.riskCode = (String) ExpressionEvaluatorManager.evaluate(
					"riskCode", riskCode, Object.class, this, pageContext);
		}
	}
}
