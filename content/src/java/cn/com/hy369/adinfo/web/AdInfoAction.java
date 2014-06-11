package cn.com.hy369.adinfo.web;

import java.util.HashMap;
import java.util.List;

import cn.com.hy369.adinfo.service.facade.AdInfoService;
import cn.com.hy369.model.AdInfo;
import ins.framework.common.Page;
import ins.framework.common.QueryRule;
import ins.framework.web.Struts2Action;

/**
 * 广告信息管理
 * @author wangzijian
 *
 */
@SuppressWarnings("serial")
public class AdInfoAction extends Struts2Action{
	// 一些页面上的信息
	AdInfoService adInfoService ;
	AdInfo adInfo ;
	private String actionType;
	private String adNo;
	private HashMap<String, String> areaMap = new HashMap<String, String>();		// 为了得到省的列表
	// 开始完成动作
	public String prepareQueryAdInfo(){
		adInfo = null;
		return SUCCESS;
	}
	
	public String queryAdInfo(){
		if (pageNo == 0) {
			pageNo = 1;
		}
		if (pageSize == 0) {
			pageSize = 20;
		}
		QueryRule queryRule = QueryRule.getInstance();
		if(adInfo.getResourceName() != null && !"".equals(adInfo.getResourceName().trim())){
			queryRule.addEqual("resourceName", adInfo.getResourceName());
		}
		Page page = adInfoService.findAdInfo(queryRule, pageNo, pageSize);	
		try {
				
			this.writeJSONData(page, "adNo", "resourceName", "areaName","adInfo","adLink");
		} catch (Exception e) {
			this.writeJSONMsg(e.getMessage());}
		return null;
	}
	
	public String prepareAddAdInfo(){
		adInfo = null;
		actionType = "add";
		return SUCCESS;
	}
	
	public String addAdInfo(){
		String adNoTemp = "100";
		QueryRule queryRule = QueryRule.getInstance();
		queryRule.addAscOrder("adNo");
		List<AdInfo> adInfoList = adInfoService.findAdInfo(queryRule);
		if(adInfoList != null && !adInfoList.isEmpty()){
			adNoTemp = adInfoList.get(adInfoList.size() - 1).getAdNo();
		}
		adNoTemp = Integer.toString(Integer.parseInt(adNoTemp) + 1);
		adInfo.setAdNo(adNoTemp);
		String areaNo = adInfo.getAreaNo();
		String areaName = getAreaMap().get(areaNo);
		adInfo.setAreaName(areaName);
		adInfoService.addAdInfo(adInfo);
		return SUCCESS;
	}
	
	public String prepareUpdateAdInfo(){
		adInfo = adInfoService.findAdInfoByPrim(adNo);
		actionType = "update";
		return SUCCESS;
	}
	
	public String updateAdInfo(){
		String areaNoTemp = adInfo.getAreaNo();
		adInfo.setAreaName(getAreaMap().get(areaNoTemp));
		adInfoService.updateAdInfo(adInfo);
		return SUCCESS;
	}
	
	public String deleteAdInfo(){
		adInfo = adInfoService.findAdInfoByPrim(adNo);
		adInfoService.deleteAdInfo(adInfo);
		return SUCCESS;
	}

	
	
	//----------------------华丽的分割线
	public AdInfoService getAdInfoService() {
		return adInfoService;
	}

	public void setAdInfoService(AdInfoService adInfoService) {
		this.adInfoService = adInfoService;
	}

	public AdInfo getAdInfo() {
		return adInfo;
	}

	public void setAdInfo(AdInfo adInfo) {
		this.adInfo = adInfo;
	}

	public String getActionType() {
		return actionType;
	}

	public void setActionType(String actionType) {
		this.actionType = actionType;
	}

	public String getAdNo() {
		return adNo;
	}

	public void setAdNo(String adNo) {
		this.adNo = adNo;
	}

	public HashMap<String, String> getAreaMap() {
		areaMap.put("101369", "北京");
		areaMap.put("102369", "天津");
		areaMap.put("103369", "河北");
		areaMap.put("104369", "内蒙古");
		areaMap.put("105369", "山西");
		areaMap.put("106369", "上海");
		areaMap.put("107369", "安徽");
		areaMap.put("108369", "江苏");
		areaMap.put("109369", "浙江");
		areaMap.put("110369", "山东");
		areaMap.put("111369", "福建");
		areaMap.put("112369", "江西");
		areaMap.put("113369", "广东");
		areaMap.put("114369", "广西");
		areaMap.put("115369", "海南");
		areaMap.put("116369", "河南");
		areaMap.put("117369", "湖北");
		areaMap.put("118369", "湖南");
		areaMap.put("119369", "黑龙江");
		areaMap.put("120369", "吉林");
		areaMap.put("121369", "辽宁");
		areaMap.put("122369", "陕西");
		areaMap.put("123369", "甘肃");
		areaMap.put("124369", "宁夏");
		areaMap.put("125369", "青海");
		areaMap.put("126369", "新疆");
		areaMap.put("127369", "重庆");
		areaMap.put("128369", "四川");
		areaMap.put("129369", "云南");
		areaMap.put("130369", "贵州");
		areaMap.put("131369", "西藏");
		areaMap.put("132369", "香港");
		areaMap.put("133369", "澳门");
		areaMap.put("134369", "台湾");
		return areaMap;
	}

	public void setAreaMap(HashMap<String, String> areaMap) {
		this.areaMap = areaMap;
	}
	
}
