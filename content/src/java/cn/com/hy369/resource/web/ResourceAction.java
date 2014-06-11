package cn.com.hy369.resource.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.sinosoft.sysframework.common.datatype.DateTime;
import cn.com.hy369.model.Resource;
import cn.com.hy369.model.ResourceType;
import cn.com.hy369.resource.service.facade.ResourceService;
import cn.com.hy369.resourcetype.service.facade.ResourceTypeService;
import ins.framework.common.Page;
import ins.framework.common.QueryRule;
import ins.framework.web.Struts2Action;
@SuppressWarnings("serial")
public class ResourceAction extends Struts2Action{
	// 一些页面用到的变量
	private String resourceTypeContent;
	private String actionType;		// 用来确定是更新还是新增的
	private Resource resource;
	private String addType;			// 添加方式
	private String vedioType;		// 资源类型
	private String resourceList;
	private String resNo;
	private String resourceURL;		// 资源目录跟资源文件搭档在一起作为资源地址。
	private HashMap<String, String> addTypeRadio = new HashMap<String, String>();		// 添加方式选择
	private HashMap<String, String> vedioTypeRadioMap = new HashMap<String, String>();		// 文件格式选择
	// 一些需要载入的service
	private ResourceService resourceService ;
	private ResourceTypeService resourceTypeService;
	public String prepareQueryResource(){
		return SUCCESS;
	}
	/**
	 * 绘出菜单部分
	 * @return
	 */
	public String queryResourceTree(){
		resourceTypeContent = resourceService.showResource();
		return SUCCESS;
	}
	/**
	 * 准备增加，会获取一分部分页面信息来进行初始化的
	 * @return
	 */
	public String prepareAddResource(){
		actionType = "add";
		return SUCCESS;
	}
	
	public String addResource(){
		resourceService.addResource(resource);
		return SUCCESS;
	}
	
	public String queryResourceMenu(){
		
		return SUCCESS;
	}
	
	public String resourceManager(){
		String typeID = resource.getTypeID();
		ResourceType resourceType = resourceTypeService.findResourceTypeUnion(typeID);
		resource.setTypeCName(resourceType.getTypeCName());
		return SUCCESS;
	}
	
	public String prepareUpdateResource(){
		actionType = "update";
		resource = resourceService.findResourceUnion(Integer.parseInt(resNo) );
		return SUCCESS;
	}
	
	public String updateResource(){
		resourceService.updateResource(resource);
		return SUCCESS;
	}
	/**
	 * 手工增加资源
	 * @return
	 */
	public String addResourceHand(){
		DateTime createDate = DateTime.current();
		// 获取当前最大的resNo
		int resNo = 100;
		QueryRule queryRule = QueryRule.getInstance();
		queryRule.addAscOrder("resNo");
		List<Resource> resourceL = resourceService.findResourceByRule(queryRule);
		if(resourceL != null && !resourceL.isEmpty()){
			int size = resourceL.size();
			resNo = resourceL.get(size-1).getResNo();
		}
		int resNoInt = resNo;
		String resourceFile = getVedioTypeRadioMap().get(vedioType);
		if("0".equals(addType)){
			resNo = resNoInt + 1;
			resource.setCreateDate(createDate);
			// 自己生成resNo
			resource.setResNo(resNo);
			// 根据目录，名称，类型来组装数据
			resource.setResourceAddress(resourceURL + resource.getResourceAddress() + resourceFile);
			resource.setResourceFile(resourceFile);
			resourceService.addResource(resource);
		}
		// 如果是多张则解析文本域中的内容进行批量添加。
		if("1".equals(addType)){
			
			String resourceArray[] = resourceList.split("\r\n");
			ArrayList<Resource> resourceAList = new ArrayList<Resource>(0);
			Resource resourceTemp = null;
			for(String resourceInfo:resourceArray){
				
				resNoInt++;
				resourceTemp = new Resource();
				if(resourceInfo !=null && !"".equals(resourceInfo)){
					String resourcePass[] = resourceInfo.split("#");
					resourceTemp.setResNo(resNoInt);
					resourceTemp.setResourceName(resourcePass[1]);
					resourceTemp.setCreateDate(createDate);
					resourceTemp.setTypeCName(resource.getTypeCName());
					resourceTemp.setTypeID(resource.getTypeID());
					String resourceAddress = resourceURL + resourcePass[0] + resourceFile;
					resourceTemp.setResourceAddress(resourceAddress);
					resourceTemp.setResourceFile(resourceFile);
					resourceAList.add(resourceTemp);
				}
			}
			resourceService.addResourceAll(resourceAList);
		}
		return SUCCESS;
	}
	
	public String prepareQueryResourceReal(){
		return SUCCESS;
	}
	
	public String queryResource(){
		if (pageNo == 0) {
			pageNo = 1;
		}
		if (pageSize == 0) {
			pageSize = 20;
		}
		QueryRule queryRule = QueryRule.getInstance();
		if(resource.getResNo() != 0){
			queryRule.addEqual("resNo", resource.getResNo());
		}
		if(resource.getResourceName() != null && !"".equals(resource.getResourceName().trim())){
			queryRule.addEqual("resourceName", resource.getResourceName().trim());
		}
		// 根据状态判断时间的问题
		Page page = resourceService.findResource(queryRule, pageNo, pageSize);	
		try {
				
			this.writeJSONData(page, "resNo", "resourceName", "typeCName","resourceAddress","createDate");
		} catch (Exception e) {
			this.writeJSONMsg(e.getMessage());}
		return null;
	}
	
	public String deleteResource(){
		resource = resourceService.findResourceUnion(Integer.parseInt(resNo) );
		resourceService.deleteResource(resource);
		return SUCCESS;
	}
	//------------------------------------华丽的分割线-----------------------------

	public ResourceService getResourceService() {
		return resourceService;
	}

	public void setResourceService(ResourceService resourceService) {
		this.resourceService = resourceService;
	}

	public String getActionType() {
		return actionType;
	}

	public void setActionType(String actionType) {
		this.actionType = actionType;
	}

	public Resource getResource() {
		return resource;
	}

	public void setResource(Resource resource) {
		this.resource = resource;
	}
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
	public HashMap<String, String> getAddTypeRadio() {
		addTypeRadio.put("0", "单独");
		addTypeRadio.put("1", "批量");
		return addTypeRadio;
	}

	public HashMap<String, String> getVedioTypeRadioMap() {
		vedioTypeRadioMap.put("0", ".flv");
		vedioTypeRadioMap.put("1", ".swf");
		return vedioTypeRadioMap;
	}
	public void setVedioTypeRadioMap(HashMap<String, String> vedioTypeRadioMap) {
		this.vedioTypeRadioMap = vedioTypeRadioMap;
	}
	public void setAddTypeRadio(HashMap<String, String> addTypeRadio) {
		this.addTypeRadio = addTypeRadio;
	}
	public String getAddType() {
		return addType;
	}
	public void setAddType(String addType) {
		this.addType = addType;
	}
	public String getResourceList() {
		return resourceList;
	}
	public void setResourceList(String resourceList) {
		this.resourceList = resourceList;
	}
	public String getResNo() {
		return resNo;
	}
	public void setResNo(String resNo) {
		this.resNo = resNo;
	}
	public String getVedioType() {
		return vedioType;
	}
	public void setVedioType(String vedioType) {
		this.vedioType = vedioType;
	}
	public String getResourceURL() {
		return resourceURL;
	}
	public void setResourceURL(String resourceURL) {
		this.resourceURL = resourceURL;
	}
	
}
