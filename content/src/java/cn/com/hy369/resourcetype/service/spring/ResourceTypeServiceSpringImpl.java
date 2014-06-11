package cn.com.hy369.resourcetype.service.spring;

import java.util.List;
import ins.framework.common.QueryRule;
import ins.framework.dao.GenericDaoHibernate;
import cn.com.hy369.model.ResourceType;
import cn.com.hy369.resourcetype.service.facade.ResourceTypeService;

public class ResourceTypeServiceSpringImpl extends
GenericDaoHibernate<ResourceType, String> implements ResourceTypeService {

	public String showResourceType() {
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
		queryRule.addAscOrder("displayNo");
		// 查询当前级别的所有资源类别
		List<ResourceType> resourceTypeList = super.find(queryRule);
		if(resourceTypeList != null && !resourceTypeList.isEmpty()){
			for(ResourceType resourceType : resourceTypeList){
				// 画出当前的资源类别
				if(typeLevel == 1){
					// 是第一级菜单的时候如下绘写,
					buffer.append("		var tree"+ resourceType.getTypeID() +" = new YAHOO.widget.TextNode(\"<a target='resourceTypeEdit' href='resourceTypeManager.do?resourceType.typeID="+ resourceType.getTypeID() +"'><div style='font-size:12px'>"+ resourceType.getTypeCName() +"</div></a>\",tree.getRoot(),false);");
				}else{
					buffer.append("		var tree"+ resourceType.getTypeID() +" = new YAHOO.widget.TextNode(\"<a target='resourceTypeEdit' href='resourceTypeManager.do?resourceType.typeID="+ resourceType.getTypeID() +"'><div style='font-size:12px'>"+ resourceType.getTypeCName() +"</div></a>\",tree"+ typeID +",false);");
				}	
				// 直接递归，如果没有就不会循环了。
				drawTree(resourceType.getTypeID(), typeLevel + 1,buffer);
			}
		}
	}

	public void addResourceType(ResourceType resourceType) {
		super.save(resourceType);
	}

	public ResourceType findResourceTypeUnion(String typeID) {
		return super.get(typeID);
	}

	public void updateResourceType(ResourceType resourceType) {
		super.update(resourceType);
	}

	public List<ResourceType> findResourceType(QueryRule queryRule) {
		return super.find(queryRule);
	}

	public void deleteTypeID(String typeID) {
		super.deleteByPK(typeID);
	}

}
