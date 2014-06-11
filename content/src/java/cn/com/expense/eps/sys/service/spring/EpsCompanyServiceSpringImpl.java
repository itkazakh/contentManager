package cn.com.expense.eps.sys.service.spring;

import java.util.List;

import ins.framework.common.Page;
import ins.framework.common.QueryRule;
import ins.framework.dao.GenericDaoHibernate;
import cn.com.expense.eps.model.EpsCompany;
import cn.com.expense.eps.sys.service.facade.EpsCompanyService;

/**
 * 机构管理业务接口实现类
 * 
 * @author 张喜英
 *
 */
public class EpsCompanyServiceSpringImpl extends GenericDaoHibernate<EpsCompany,String> implements
		EpsCompanyService {

	public void addEpsCompany(EpsCompany epsCompany) {
		 super.save(epsCompany);
	}

	public void deleteEpsCompanyByPK(String comCode) {
		super.deleteByPK(comCode);

	}

	public Page findEpsCompany(QueryRule queryRule, int pageNo, int pageSize) {
		
		return super.find(queryRule, pageNo, pageSize);
	}

	public List<EpsCompany> findEpsCompany(QueryRule queryRule) {
		return super.find(queryRule);
	}

	public EpsCompany findEpsCompanyByPK(String comCode) {
		return super.findUnique("comCode", comCode);
	}
    
	public void updateEpsCompay(EpsCompany epsCompany) {
		super.update(epsCompany);
	}

}
