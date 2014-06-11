package cn.com.hy369.resource.service.facade;

import java.util.ArrayList;
import java.util.List;

import ins.framework.common.Page;
import ins.framework.common.QueryRule;
import cn.com.hy369.model.Resource;

public interface ResourceService {
	/**
	 * 展示类别的树结构
	 * @return
	 */
	String showResource();
	/**
	 * 插入资源类型
	 * @param resourceType
	 */
	void addResource(Resource resource);
	/**
	 * 根据主键查找对象
	 * @param typeID
	 * @return
	 */
	Resource findResourceUnion(int i);
	void updateResource(Resource resource);
	List<Resource> findResourceByRule(QueryRule queryRule);
	Page findResource(QueryRule queryRule, int pageNo, int pageSize);
	void deleteResource(Resource resource);
	void addResourceAll(ArrayList<Resource> resourceAList);

}
