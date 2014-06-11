package cn.com.hy369.jion.service.spring;

import java.util.List;

import ins.framework.common.Page;
import ins.framework.common.QueryRule;
import ins.framework.dao.GenericDaoHibernate;
import cn.com.hy369.jion.service.facade.JionInfoService;
import cn.com.hy369.model.JionInfo;

public class JionInfoServiceSpringImpl extends
GenericDaoHibernate<JionInfo, String> implements JionInfoService {

	public Page findJionInfo(QueryRule queryRule, int pageNo, int pageSize) {
		
		return super.find(queryRule, pageNo, pageSize);
	}

	public List<JionInfo> findJionInfoList(QueryRule queryRule) {
		return super.find(queryRule);
	}

	public void addJionInfo(JionInfo jionInfo) {
		super.save(jionInfo);
	}

	public void deleteJionInfoPrm(String infoNo) {
		super.deleteByPK(infoNo);
	}

}
