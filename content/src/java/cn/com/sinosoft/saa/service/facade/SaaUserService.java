package cn.com.sinosoft.saa.service.facade;

import ins.framework.common.Page;
import ins.framework.common.QueryRule;

import java.util.List;

import cn.com.sinosoft.saa.model.SaaUser;

public interface SaaUserService {
	public Page getUserList(SaaUser saaUser, int pageNo, int pageSize,
			String userCodeOperate);

	public void queryUserJSP(String userCode, String comCode,
			String saaGradeCode, String userCodeOperate);

	public void queryUserJSPByUserCode(String userCode, String userCodeOperate);

	public List<SaaUser> findSaaUserSameComList(String userCode,
			String userCodeOperate);

	public SaaUser findSaaUserByUserCode(String userCode, String operUserCode);
	/**
	 * 根据主键查找对象
	 * @param userCode
	 * @return
	 */
	public SaaUser findSaaUserByUserCode(String userCode);

	public Page getAgengUserList(SaaUser saaUser, int pageNo, int pageSize,
			String userCodeOperate);
	/**
	 * 得到用户列表
	 * @param queryRule
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Page findUser(QueryRule queryRule, int pageNo, int pageSize);

	public void addUser(SaaUser saaUser);

	public void updateSaaUser(SaaUser saaUser);

	public void deleteSaaUser(SaaUser saaUser);
}
