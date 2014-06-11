package cn.com.hy369.resourcetype.web;

import java.util.List;

import cn.com.hy369.model.NoCode;
import cn.com.hy369.model.Resource;
import cn.com.hy369.model.ResourceType;
import cn.com.hy369.noCode.service.facade.NoCodeService;
import cn.com.hy369.resource.service.facade.ResourceService;
import cn.com.hy369.resourcetype.service.facade.ResourceTypeService;
import ins.framework.common.QueryRule;
import ins.framework.exception.BusinessException;
import ins.framework.web.Struts2Action;
@SuppressWarnings("serial")
public class ResourceTypeAction extends Struts2Action{
	// 一些页面用到的变量
	private String resourceTypeContent;
	private String actionType;		// 用来确定是更新还是新增的
	private ResourceType resourceType;
	// 一些需要载入的service
	private ResourceTypeService resourceTypeService ;
	private ResourceService resourceService;
	private NoCodeService noCodeService;
	public String prepareQueryResourceType(){
		return SUCCESS;
	}
	/**
	 * 绘出菜单部分
	 * @return
	 */
	public String queryResourceTypeTree(){
		resourceTypeContent = resourceTypeService.showResourceType();
		return SUCCESS;
	}
	/**
	 * 准备增加，会获取一分部分页面信息来进行初始化的
	 * @return
	 */
	public String prepareAddResourceType(){
		actionType = "add";
		resourceType.setSystemCode("hy369");
		resourceType.setValidStatus("1");
		return SUCCESS;
	}
	
	public String addResourceType(){
		// 如果是顶级的菜单就用369+单位数，如果是刺激菜单就是上一级菜单加上双位数。
		String tableName = "typelevel" + resourceType.getTypeLevel();
		int maxNo = noCodeService.findMaxNo(tableName);
		if("1".equals(resourceType.getUpperTypeID())){
			resourceType.setTypeID("369" + maxNo++);
		}else{
			resourceType.setTypeID(resourceType.getUpperTypeID() + maxNo++);
		}
		// 保存最大号
		NoCode noCode = new NoCode();
		noCode.setMaxNo(maxNo);
		noCode.setTableName(tableName);
		noCodeService.deleteNoCode(tableName);
		noCodeService.addNoCode(noCode);
		resourceTypeService.addResourceType(resourceType);
		return SUCCESS;
	}
	
	public String queryResourceTypeMenu(){
		
		return SUCCESS;
	}
	
	public String resourceTypeManager(){
		String typeID = resourceType.getTypeID();
		resourceType = resourceTypeService.findResourceTypeUnion(typeID);
		return SUCCESS;
	}
	
	public String prepareUpdateResourceType(){
		actionType = "update";
		String typeID = resourceType.getTypeID();
		resourceType = resourceTypeService.findResourceTypeUnion(typeID);
		return SUCCESS;
	}
	
	public String updateResourceType(){
		resourceTypeService.updateResourceType(resourceType);
		return SUCCESS;
	}
	
	public String deleteResourceType(){
		String typeID = resourceType.getTypeID();
		QueryRule queryRule = QueryRule.getInstance();
		queryRule.addEqual("typeID", typeID);
		List<Resource> resourceList = resourceService.findResourceByRule(queryRule);
		if(resourceList != null && !resourceList.isEmpty()){
			throw new BusinessException("存在下级资源不能进行删除",true);
		}
		resourceTypeService.deleteTypeID(typeID);
		return SUCCESS;
	}
	//------------------------------------华丽的分割线-----------------------------
	public String getResourceTypeContent() {
		return resourceTypeContent;
	}

	public void setResourceTypeContent(String resourceTypeContent) {
		this.resourceTypeContent = resourceTypeContent;
	}

	public ResourceTypeService getResourceTypeService() {
		return resourceTypeService;
	}

	public void setResourceTypeService(ResourceTypeService resourceTypeService) {
		this.resourceTypeService = resourceTypeService;
	}

	public String getActionType() {
		return actionType;
	}

	public void setActionType(String actionType) {
		this.actionType = actionType;
	}

	public ResourceType getResourceType() {
		return resourceType;
	}

	public void setResourceType(ResourceType resourceType) {
		this.resourceType = resourceType;
	}
	public ResourceService getResourceService() {
		return resourceService;
	}
	public void setResourceService(ResourceService resourceService) {
		this.resourceService = resourceService;
	}
	public NoCodeService getNoCodeService() {
		return noCodeService;
	}
	public void setNoCodeService(NoCodeService noCodeService) {
		this.noCodeService = noCodeService;
	}
	
}
