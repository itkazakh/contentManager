package cn.com.hy369.resource.service.spring;

import java.util.ArrayList;
import java.util.List;

import ins.framework.common.Page;
import ins.framework.common.QueryRule;
import ins.framework.dao.GenericDaoHibernate;
import cn.com.hy369.model.Resource;
import cn.com.hy369.model.ResourceType;
import cn.com.hy369.resource.service.facade.ResourceService;
import cn.com.hy369.resourcetype.service.facade.ResourceTypeService;

public class ResourceServiceSpringImpl extends
GenericDaoHibernate<Resource, Integer> implements ResourceService {
	private ResourceTypeService resourceTypeService ;
	public String showResource() {
		StringBuffer buffer = new StringBuffer(3000);
//		// 添加YUI的js部分。
		/**
		 * 大概的思路是，先查询一级的，然后遍历，查看其所有下级机构再遍历。
		 */
		buffer.append("<script type=\"text/javascript\">");
		buffer.append("		var tree;");
		buffer.append("		function treeInit(){");
		buffer.append("		tree = new YAHOO.widget.TreeView(\"treeDiv1\");");
		// 开始绘制节点信息
		drawTree(null,1,buffer);

		// 开始画
		buffer.append("		tree.draw();}");
		buffer.append("		YAHOO.util.Event.addListener(window,'load',treeInit);"); 
		buffer.append("</script>");
		return buffer.toString();
	}

	private void drawTree(String typeID,int typeLevel,StringBuffer buffer) {
		QueryRule queryRule = QueryRule.getInstance();
		queryRule.addEqual("typeLevel", typeLevel);
		if(typeID != null){
			queryRule.addEqual("upperTypeID", typeID);
		}else{
			typeID = "";
		}
		// 查询当前级别的所有资源类别
		queryRule.addAscOrder("displayNo");
		List<ResourceType> resourceTypeList = resourceTypeService.findResourceType(queryRule);
		if(resourceTypeList != null && !resourceTypeList.isEmpty()){
			for(ResourceType resourceType : resourceTypeList){
				// 画出当前的资源类别
				if(typeLevel == 1){
					// 是第一级菜单的时候如下绘写,
					buffer.append("		var tree"+ resourceType.getTypeID() +" = new YAHOO.widget.TextNode(\"<a target='resourceEdit' href='resourceManager.do?resource.typeID="+ resourceType.getTypeID() +"'><div style='font-size:12px'>"+ resourceType.getTypeCName() +"</div></a>\",tree.getRoot(),false);");
				}else{
					buffer.append("		var tree"+ resourceType.getTypeID() +" = new YAHOO.widget.TextNode(\"<a target='resourceEdit' href='resourceManager.do?resource.typeID="+ resourceType.getTypeID() +"'><div style='font-size:12px'>"+ resourceType.getTypeCName() +"</div></a>\",tree"+ typeID +",false);");
				}	
				// 直接递归，如果没有就不会循环了。
				drawTree(resourceType.getTypeID(), typeLevel + 1,buffer);
			}
		}
	}

	public void addResource(Resource resource) {
		super.save(resource);
	}

	public Resource findResourceUnion(int resourceID) {
		return super.get(resourceID);
	}

	public void updateResource(Resource resource) {
		super.update(resource);
	}

	public ResourceTypeService getResourceTypeService() {
		return resourceTypeService;
	}

	public void setResourceTypeService(ResourceTypeService resourceTypeService) {
		this.resourceTypeService = resourceTypeService;
	}

	public List<Resource> findResourceByRule(QueryRule queryRule) {
		return super.find(queryRule);
	}

	public Page findResource(QueryRule queryRule, int pageNo, int pageSize) {
		return super.find(queryRule, pageNo, pageSize);
	}

	public void deleteResource(Resource resource) {
		super.delete(resource);
	}

	public void addResourceAll(ArrayList<Resource> resourceAList) {
		super.saveAll(resourceAList);
	}
	
}
