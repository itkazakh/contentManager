package cn.com.expense.eps.sys.service.facade;

import ins.framework.common.Page;
import ins.framework.common.QueryRule;

import java.util.List;

import cn.com.expense.eps.model.EpsUser;

/**
 * 员工管理 业务接口
 * 
 * @author 张喜英
 *
 */
public interface EpsUserService {
	
       public EpsUser findEpsUserByPK(String userCode);
       
       public void addEpsUser(EpsUser epsUser);
       
       public void updateEpsUser(EpsUser epsUser);
       
       public void deleteEpsUserByPK(String userCode);
       
       public Page findEpsUser(QueryRule queryRule, int pageNo, int pageSize);
       
       public List<EpsUser> findEpsUser(QueryRule queryRule);
}
