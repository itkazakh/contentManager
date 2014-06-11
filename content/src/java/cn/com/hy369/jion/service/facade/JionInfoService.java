package cn.com.hy369.jion.service.facade;

import java.util.List;

import cn.com.hy369.model.JionInfo;
import ins.framework.common.Page;
import ins.framework.common.QueryRule;

public interface JionInfoService {

	Page findJionInfo(QueryRule queryRule, int pageNo, int pageSize);

	List<JionInfo> findJionInfoList(QueryRule queryRule);

	void addJionInfo(JionInfo jionInfo);

	void deleteJionInfoPrm(String infoNo);

}
