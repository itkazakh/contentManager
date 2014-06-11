package cn.com.hy369.jion.web;

import cn.com.hy369.jion.service.facade.JionInfoService;
import cn.com.hy369.model.JionInfo;
import ins.framework.common.Page;
import ins.framework.common.QueryRule;
import ins.framework.web.Struts2Action;

@SuppressWarnings("serial")
public class JionInfoAction extends Struts2Action{
	private String infoNo;
	private JionInfo jionInfo;
	private JionInfoService jionInfoService;
	// 开始完成动作
	public String prepareQueryJionInfo(){
		jionInfo = null;
		return SUCCESS;
	}
	
	public String queryJionInfo(){
		if (pageNo == 0) {
			pageNo = 1;
		}
		if (pageSize == 0) {
			pageSize = 20;
		}
		QueryRule queryRule = QueryRule.getInstance();
		if(jionInfo.getUserName() != null && !"".equals(jionInfo.getUserName().trim())){
			queryRule.addEqual("userName", jionInfo.getUserName());
		}
		if(jionInfo.getPhoneNo() != null && !"".equals(jionInfo.getPhoneNo().trim())){
			queryRule.addEqual("phoneNo", jionInfo.getPhoneNo());
		}
		// 根据状态判断时间的问题
		Page page = jionInfoService.findJionInfo(queryRule, pageNo, pageSize);	
		try {
				
			this.writeJSONData(page, "infoNo","userName", "phoneNo", "postCode","email","address","message");
		} catch (Exception e) {
			this.writeJSONMsg(e.getMessage());}
		return null;
	}
	
	public String deleteJionInfo(){
		jionInfoService.deleteJionInfoPrm(infoNo);
		return SUCCESS;
	}
	
//-------------------------------------------华丽的分割线------------------------------
	public JionInfo getJionInfo() {
		return jionInfo;
	}

	public void setJionInfo(JionInfo jionInfo) {
		this.jionInfo = jionInfo;
	}

	public JionInfoService getJionInfoService() {
		return jionInfoService;
	}

	public void setJionInfoService(JionInfoService jionInfoService) {
		this.jionInfoService = jionInfoService;
	}

	public String getInfoNo() {
		return infoNo;
	}

	public void setInfoNo(String infoNo) {
		this.infoNo = infoNo;
	}
	
	
}
