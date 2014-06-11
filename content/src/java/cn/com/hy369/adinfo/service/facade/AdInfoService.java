package cn.com.hy369.adinfo.service.facade;

import java.util.List;

import cn.com.hy369.model.AdInfo;
import ins.framework.common.Page;
import ins.framework.common.QueryRule;

public interface AdInfoService {

	Page findAdInfo(QueryRule queryRule, int pageNo, int pageSize);

	void addAdInfo(AdInfo adInfo);

	AdInfo findAdInfoByPrim(String adNo);

	void updateAdInfo(AdInfo adInfo);

	void deleteAdInfo(AdInfo adInfo);

	List<AdInfo> findAdInfo(QueryRule queryRule);
	
}
