package cn.com.expense.eps.util;

import ins.framework.common.Page;
import ins.framework.utils.StringUtils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.com.sinosoft.saa.service.facade.CodeService;
import cn.com.expense.eps.vo.Code;
import cn.com.expense.eps.vo.CodeCondition;


/**
 * class comments write here...
 * 
 * @version created date: 2007-1-8 13:19:00
 */
public class DwrInvokeDataAction {

	public static final int MAX_RECORDS = 30;// 代码查询的最大记录数

	private CodeService codeService;

	@SuppressWarnings("unchecked")
	public List<Code> getDcode(CodeCondition cond) {
		
		String riskCode = cond.getRiskCode();
		String language = cond.getLanguage();
		String codeType = cond.getCodeType();
		String typeParam = cond.getTypeParam();
		String extraCond = cond.getExtraCond();
		String query = cond.getQuery();
		System.out.println("DwrInvokeDataAction.java::::codeType------------->"+codeType);
		if ("*".equals(query)) {
			query = "%";
		} else {
			query = "%" + query + "%";
		}
		int maxRecords = MAX_RECORDS;
		if ("firstLoad".equals(cond.getType())) {
			maxRecords = 100; // 如果是firstLoad方式，应该不限个数，但为了防止展现太多，最多显示100条
		}

		Page page = new Page();
		page = codeService.listCodeSelect(codeType, riskCode, language, query,
				1, maxRecords, "001", typeParam, extraCond);
		List<Object[]> codeList = page.getResult();
		System.out.println("DwrInvokeDataAction.java::::codeList.size------------->"+codeList.size());
		List<Code> retList = new ArrayList<Code>(0);
		for (Object[] objects : codeList) {
			if (objects[1] != null) {
				Code co = new Code();
				if (objects[1] != null) {
					co.setName(StringUtils.trimToEmpty(objects[1].toString()));
				}
				if (objects[0] != null) {
					co.setCode(objects[0].toString());
				}
				retList.add(co);
			}
		}
		return retList;
	}

	@SuppressWarnings("unchecked")
	public Map getAllCode(CodeCondition[] conds) {
		Map retMaps = new HashMap<String, List<Code>>(0);
		for (CodeCondition cond : conds) {
			if (cond != null) {
				if ("firstLoad".equals(cond.getType())) {
					retMaps.put(cond.getCodeType(), getDcode(cond));
				}
			}
		}
		return retMaps;
	}

	public CodeService getCodeService() {
		return codeService;
	}

	public void setCodeService(CodeService codeService) {
		this.codeService = codeService;
	}

}
