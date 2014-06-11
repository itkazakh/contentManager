package cn.com.expense.eps.sys.service.spring;

import java.util.List;
import ins.framework.common.Page;
import ins.framework.common.QueryRule;
import ins.framework.dao.GenericDaoHibernate;
import cn.com.expense.eps.model.EpsPayWay;
import cn.com.expense.eps.sys.service.facade.PayWayService;

public class PayWayServiceSpringImpl extends GenericDaoHibernate<EpsPayWay, String> implements PayWayService {
	
	public Page findPayWay(QueryRule queryRule, int pageNo, int pageSize) {
		return super.find(queryRule, pageNo, pageSize);
		
	}
	public void addPayWay(EpsPayWay epsPayWay){
		// 保存对应的信息
		super.save(epsPayWay);
		// 同步更新payWayTitle表的信息
		if("0".equals(epsPayWay.getTitleRelation())){
		}
	}
	
//	/**
//	 * 用这个方法来获得需要同步更新的
//	 * @param epsPayWay
//	 * @return
//	 */
//	private void tranEpsPayWayTitle(EpsPayWay epsPayWay) {
//		epsPayWayTitle.setBankAccountNo("a");
//		epsPayWayTitle.setDcInd(epsPayWay.getDcInd());
//		epsPayWayTitle.setF01(epsPayWay.getF01());
//		epsPayWayTitle.setF02(epsPayWay.getF02());
//		epsPayWayTitle.setF03(epsPayWay.getF03());
//		epsPayWayTitle.setF04(epsPayWay.getF04());
//		epsPayWayTitle.setF05(epsPayWay.getF05());
//		epsPayWayTitle.setF06(epsPayWay.getF06());
//		epsPayWayTitle.setF07(epsPayWay.getF07());
//		epsPayWayTitle.setF08(epsPayWay.getF08());
//		epsPayWayTitle.setF09(epsPayWay.getF09());
//		epsPayWayTitle.setF10(epsPayWay.getF10());
//		epsPayWayTitle.setF11(epsPayWay.getF11());
//		epsPayWayTitle.setF12(epsPayWay.getF12());
//		epsPayWayTitle.setF13(epsPayWay.getF13());
//		epsPayWayTitle.setF14(epsPayWay.getF14());
//		epsPayWayTitle.setF15(epsPayWay.getF15());
//		epsPayWayTitle.setF16(epsPayWay.getF16());
//		epsPayWayTitle.setF17(epsPayWay.getF17());
//		epsPayWayTitle.setF18(epsPayWay.getF18());
//		epsPayWayTitle.setF19(epsPayWay.getF19());
//		epsPayWayTitle.setF20(epsPayWay.getF20());
//		epsPayWayTitle.setF21(epsPayWay.getF21());
//		epsPayWayTitle.setF22(epsPayWay.getF22());
//		epsPayWayTitle.setF23(epsPayWay.getF23());
//		epsPayWayTitle.setF24(epsPayWay.getF24());
//		epsPayWayTitle.setF25(epsPayWay.getF25());
//		epsPayWayTitle.setF26(epsPayWay.getF26());
//		epsPayWayTitle.setF27(epsPayWay.getF27());
//		epsPayWayTitle.setF28(epsPayWay.getF28());
//		epsPayWayTitle.setF29(epsPayWay.getF29());
//		epsPayWayTitle.setF30(epsPayWay.getF30());
//		epsPayWayTitle.setFlag(epsPayWay.getFlag());
//		epsPayWayTitle.setPayWayCode(epsPayWay.getPayWayCode());
//		epsPayWayTitle.setPayWayName(epsPayWay.getPayWayCName());
//		epsPayWayTitle.setTitleCode(epsPayWay.getTitleCode());
//		epsPayWayTitle.setTitleName(epsPayWay.getTitleName());
//	}
	
	
	public void deletePayWayByPK(String payWayCode){
		// 先获取需要删除的对象的信息
		QueryRule queryRule = QueryRule.getInstance();
		queryRule.addEqual("payWayCode", payWayCode);
		EpsPayWay epsPayWay = super.findUnique(queryRule);
		// 先删除payWayCode表的数据
		super.deleteByPK(payWayCode);
		// 如果有关联，同时删除关联表的信息
		if("0".equals(epsPayWay.getTitleRelation())){
			QueryRule queryRulePayWayTitle = QueryRule.getInstance();
			queryRulePayWayTitle.addEqual("payWayCode", payWayCode);
			queryRulePayWayTitle.addEqual("titleCode", epsPayWay.getTitleCode());
			queryRulePayWayTitle.addEqual("dcInd", epsPayWay.getDcInd());
		}
	}
	public EpsPayWay findPayWayByPK(String payWayCode) {
		return super.get(payWayCode);
	}
	public void updatePayWay(EpsPayWay epsPayWay) {
		super.update(epsPayWay);
		QueryRule queryRule = QueryRule.getInstance();
		queryRule.addEqual("payWayCode", epsPayWay.getPayWayCode());
		queryRule.addEqual("titleCode", epsPayWay.getTitleCode());
		queryRule.addEqual("dcInd", epsPayWay.getDcInd());
		
	}
	public EpsPayWay getPayWay(QueryRule queryRule) {
		return super.findUnique(queryRule);
	}
	public List<EpsPayWay> findPayWayByQuerRule(QueryRule queryRule) {
		return super.find(queryRule);
	}
}
