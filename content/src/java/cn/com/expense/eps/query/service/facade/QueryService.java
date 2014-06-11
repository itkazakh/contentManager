package cn.com.expense.eps.query.service.facade;

import java.util.List;

import cn.com.expense.eps.query.model.QueryVo;

public interface QueryService {
	/*查询并组织符合条件的个人借款数据*/
	public List<QueryVo> findPersonalLoansBySql(String sql);
	/*查询并组织符合条件的每日付款统计数据*/
	public List<QueryVo> findDailyPayment(String sql);
	/*获取符合查询条件的报销单号*/
	public List<String> findValidateCertiNos(String sql);
	/*查询包含编码为comCode的成本中心的报销单号*/
	public List<String> findValidateCertiNosByComCode(List<String> certiNosOri,String comCode);
	
 }
