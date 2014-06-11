package cn.com.expense.eps.sys.service.facade;

import ins.framework.common.Page;
import ins.framework.common.QueryRule;

import java.util.List;

import cn.com.expense.eps.model.EpsCompany;

/**
 * 机构管理 业务接口
 * @author 张喜英
 *
 */

public interface EpsCompanyService {
   /**
    * 根据机构代码得到机构对象
    * 
    * @param comCode 主键 机构代码
    * @return 机构对象
    */
    public EpsCompany findEpsCompanyByPK(String comCode);
    
    /**
     * 保存一个机构对象
     * 
     * @param epsCompany 机构对象
     */
    public void addEpsCompany(EpsCompany epsCompany);
    
    /**
     *更新一个机构对象
     * 
     * @param epsCompany 机构对象
     */
    public void updateEpsCompay(EpsCompany epsCompany);
   
    /**
     * 根据机构代码删除一个机构对象
     * 
     * @param comCode 机构代码
     */
    public void deleteEpsCompanyByPK(String comCode);
    
    /**
     * 
     * @param queryRule
     * @param pageNo
     * @param pageSize
     * @return
     */
    public Page findEpsCompany(QueryRule queryRule, int pageNo, int pageSize);
    
    /**
     * 
     * @param queryRule
     * @return
     */
    public List<EpsCompany> findEpsCompany(QueryRule queryRule);
}
