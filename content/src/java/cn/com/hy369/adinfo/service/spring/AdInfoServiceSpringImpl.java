package cn.com.hy369.adinfo.service.spring;

import java.util.List;

import ins.framework.common.Page;
import ins.framework.common.QueryRule;
import ins.framework.dao.GenericDaoHibernate;
import cn.com.hy369.adinfo.service.facade.AdInfoService;
import cn.com.hy369.model.AdInfo;

public class AdInfoServiceSpringImpl extends
GenericDaoHibernate<AdInfo, String> implements AdInfoService {

	public Page findAdInfo(QueryRule queryRule, int pageNo, int pageSize) {
		return super.find(queryRule, pageNo, pageSize);
	}

	public void addAdInfo(AdInfo adInfo) {
		super.save(adInfo);
		
	}

	public AdInfo findAdInfoByPrim(String adNo) {
		return super.get(adNo);
	}

	public void updateAdInfo(AdInfo adInfo) {
		super.update(adInfo);
		
	}

	public void deleteAdInfo(AdInfo adInfo) {
		super.delete(adInfo);
		
	}

	public List<AdInfo> findAdInfo(QueryRule queryRule) {
		return super.find(queryRule);
	}

}
