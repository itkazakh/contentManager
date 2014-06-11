package cn.com.sinosoft.saa.service.facade;

import java.util.List;

/**
 * 定义权限控制接口类
 * @author wuyanlong 
 *
 */
public interface SaaPowerService {
	/**
	 * 检查是否有权
	 * @param userCode 员工代码
	 * @param taskCode 功能代码
	 * @param powerType 权限值 1-内网权限 2-外网权限
	 * @param gradesIdString 岗位列表
	 * @return true 有权限 / false 无权限
	 */
	public boolean checkPower(String userCode, String taskCode,int powerType,String gradesIdString);
	/**
	 * 获取管理权限范围
	 * 
	 * @param strings[0] userCode
	 *            员工代码
	 * @param strings[1] userCodeFields
	 *            员工代码字段名
	 * @param strings[2] companyCodeFields
	 *            机构代码字段名
	 * @param strings[3] riskCodeFields
	 *            险种代码字段名
	 * @param strings[4] adminFlag
	 * 				机构范围标志：A-返回该管理员管理机构范围所对应的所有代理机构；B-返回该管理员管理机构范围           
	 * @return String 查询范围的SQL查询条件
	 */
	public String addAuthPower(String[] strings);
	/**
	 * 获取业务权限范围
	 * @param userCode 员工代码
	 * @param taskcode 功能代码
	 * @param userCodeFields 员工代码字段名
	 * @param companyCodeFields 机构代码字段名
	 * @param riskCodeFields 险种代码字段名
	 * @param gradesIdString 岗位列表
	 * @return String 查询范围的SQL查询条件
	 */
	public String addPower(String userCode, String taskCode,String userCodeFields, 
			String companyCodeFields,String riskCodeFields,String gradesIdString);
	/**
	 * 根据当前员工获取有效授权人员列表
	 * @param userCode 员工代码
	 * @return list 授权员工列表
	 */
	public List<String> getInsteadUserList(String userCode);
	/**
	 * 根据代班员工和授权员工查询授权岗位id集合
	 * @param userCode 员工代码
	 * @param insteadUserCode 授权员工
	 * @return String 授权岗位id集合
	 */
	public String getInsteadGradesIdString(String userCode,String insteadUserCode);
	/**
	 * 登录服务
	 * @param userCode 员工代码
	 * @param password 员工密码
	 */
	public void login(String userCode, String password);
	
	
//	public SaaGrade getLowUndwrtGrade(String taskCode, String comCode,
//			String taskType);
	/**
	 * 根据功能代码、机构代码、险种代码返回有权限的人员列表
	 */
	public List<String> getPowerUser(String taskCode, String comCode ,
			String riskCode);
	/**
	 * 根据功能代码、机构代码、险种代码(可为空)返回有权限的人员列表
	 */
	public List<String> getPowerUserCodes(String taskCode, String comCode ,
			String riskCode);
	/**
	 * 根据人员代码、功能代码返回可操作机构列表
	 */
	public List<String> getPowerComList(String userCode, String taskCode);
	
	/*根据机构用户代码获取角色
	 * */
	public String processRoleId(String userCode,String comCode);
	
	
	/**
	 * 
	 * @param userCode
	 *            人员代码
	 * @param note
	 *            节点
	 * @return
	 * 		taskCodeList<String>
	 */
	public List<String> findUserTaskCodeByNote(String userCode, String note);
}