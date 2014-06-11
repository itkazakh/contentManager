package cn.com.expense.eps.sys.service.facade;

import java.util.List;

import cn.com.expense.eps.model.EpsPayWay;
import ins.framework.common.Page;
import ins.framework.common.QueryRule;

public interface PayWayService {
	public Page findPayWay(QueryRule queryRule, int pageNo,int pageSize);
	public void addPayWay(EpsPayWay epsPayWay);
	public void deletePayWayByPK(String payWayCode);
	public EpsPayWay findPayWayByPK(String payWayCode);
	public void updatePayWay(EpsPayWay epsPayWay);
	public EpsPayWay getPayWay(QueryRule queryRule);
	public List<EpsPayWay> findPayWayByQuerRule(QueryRule queryRule);
}
