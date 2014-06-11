package cn.com.hy369.resourcetype.service.facade;

import ins.framework.common.QueryRule;

import java.util.List;

import cn.com.hy369.model.Resource;
import cn.com.hy369.model.ResourceType;

public interface ResourceTypeService {
	/**
	 * 展示类别的树结构
	 * @return
	 */
	String showResourceType();
	/**
	 * 插入资源类型
	 * @param resourceType
	 */
	void addResourceType(ResourceType resourceType);
	/**
	 * 根据主键查找对象
	 * @param typeID
	 * @return
	 */
	ResourceType findResourceTypeUnion(String typeID);
	void updateResourceType(ResourceType resourceType);
	List<ResourceType> findResourceType(QueryRule queryRule);
	void deleteTypeID(String typeID);

}
