package cn.com.expense.eps.sys.service.spring;

import ins.framework.common.Page;
import ins.framework.common.QueryRule;
import ins.framework.dao.GenericDaoHibernate;

import java.util.List;

import com.sinosoft.sysframework.common.util.EncryptUtils;

import cn.com.expense.eps.model.EpsUser;
import cn.com.expense.eps.sys.service.facade.EpsUserService;

/**
 * 员工管理业务实现类
 * 
 * @author 张喜英
 *
 */
public class EpsUserServiceSpringImpl extends GenericDaoHibernate<EpsUser,String> implements
		EpsUserService {
   
	public void addEpsUser(EpsUser epsUser) {
		String encryption = EncryptUtils.md5(epsUser.getPassWord()).toUpperCase();
		epsUser.setPassWord(encryption);
		super.save(epsUser);
	}

	public void deleteEpsUserByPK(String userCode) {
		super.deleteByPK(userCode);
	}

	public Page findEpsUser(QueryRule queryRule, int pageNo, int pageSize) {
		return super.find(queryRule, pageNo, pageSize);
	}

	public List<EpsUser> findEpsUser(QueryRule queryRule) {
		return super.find(queryRule);
	}

	public EpsUser findEpsUserByPK(String userCode) {
        return super.findUnique("userCode", userCode);
	}

	public void updateEpsUser(EpsUser epsUser) {
		String encryption = EncryptUtils.md5(epsUser.getPassWord()).toUpperCase();
		epsUser.setPassWord(encryption);
		super.update(epsUser);
	}
   

}
