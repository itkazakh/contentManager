package cn.com.sinosoft.saa.service.spring;

import ins.framework.cache.CacheManager;
import ins.framework.common.QueryRule;
import ins.framework.dao.GenericDaoHibernate;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import cn.com.sinosoft.saa.util.TreeNode;
import cn.com.sinosoft.saa.service.facade.SaaPowerHelpService;

@SuppressWarnings("unchecked")
public class SaaPowerHelpServiceSpringImpl extends GenericDaoHibernate implements
		SaaPowerHelpService {
	private static CacheManager cacheManager = CacheManager
	.getIntance("SaaPowerHelpService");
	/**
	 * 检查功能代码在岗位上是否存在
	 * 
	 * @param taskCode
	 *            功能代码
	 * @param gradeId
	 *            岗位id
	 * @return true 存在 false 不存在
	 */
//	@SuppressWarnings("unchecked")
//	public boolean checkTaskByGrade(String taskCode, List<Long> gradeList) {
//		boolean isExist = false;
//		StringBuilder builder = new StringBuilder();
//		String hql = "select task from SaaTask task where task.taskCode =?";
//		saaTaskList = super.findByHql(hql, taskCode);
//		for(int i=0; i<gradeList.size();i++){
//			builder.append(",'");
//			builder.append(gradeList.get(i));
//			builder.append("'");
//		}
//		if (saaTaskList != null && saaTaskList.size() > 0) {
//			hql = "select gradeTask from SaaGradeTask gradeTask where gradeTask.saaGrade.id in ("+builder.substring(1) +")"+
//					" and gradeTask.saaTask.id=?";
//			saaGradeTaskList = super.findByHql(hql, saaTaskList.get(0)
//					.getId());
//			if (saaGradeTaskList != null && saaGradeTaskList.size() > 0) {
//				isExist = true;
//			}
//		}
//		return isExist;
//	}

	/**
	 * 在添加权限范围时查询对应岗位的业务允许机构
	 * 在添加权限范围时查询对应岗位的业务除外机构
	 * @param permitCom 允许机构集合
	 * @param exceCom 禁止机构范围集合
	 * @return String 机构sql
	 */
	@SuppressWarnings("unchecked")
	public String getComPerRange(String permitCom) {
		StringBuilder builder = new StringBuilder();
		StringBuilder resBuilder = new StringBuilder();
		
//		builder.append("select prpDcompany.comCode from PrpDcompany prpDcompany where 1=1");
		
		if (permitCom.length() > 0) {
			resBuilder.append(" in (");
//			builder.append(" and prpDcompany.comCode in (");
			builder.append(permitCom);
			builder.append(")");
			
		} else {
			resBuilder.append(" in (''");
			builder.append(")");
			builder.append(" and 1=2");
		}
		
		resBuilder.append(builder.toString());
		return resBuilder.toString();
	}
	public String getComExcRange(String exceCom) {
		StringBuilder builder = new StringBuilder();
		StringBuilder resBuilder = new StringBuilder();
		if (exceCom.length() > 2) {
			builder.append(" not in (");
//			builder.append(" not in ( select prpDcompanyb.comCode from PrpDcompany prpDcompanyb ");
//			builder
//					.append(" where prpDcompanyb.comCode in (");
			builder.append(exceCom);
			builder.append(")");
		}else {
			builder.append("nohave");
		}
		resBuilder.append(builder.toString());
		return resBuilder.toString();
	}
	/**
	 * 获取业务允许机构范围
	 * @param id  员工岗位表的主键
	 * @return 业务允许机构范围
	 */
	public Collection<String> getPermitCom(long id) {
		List<String> subComList = new ArrayList<String>(0);
		List<String> permitCompanyList = this.findByHql(
				"select distinct comCode from SaaPermitCompany permitCompany where "
						+ "permitCompany.saaUserGrade.id =?", id);
		if(permitCompanyList.size() >0){
			subComList=this.getSubCompanyCodeList(permitCompanyList);
			permitCompanyList.addAll(subComList);
		}
		return permitCompanyList;
	}
	/**
	 * 获取允许授权机构范围
	 * @param userCode  管理员员工代码
	 * @return 分级管理员允许授权机构范围
	 */
	public Collection<String> getAuthPermitCom(String userCode){
		List<String> subComList = new ArrayList<String>(0);
		List<String> authCompanyList = this.findByHql(
				"select distinct comCode from SaaAuthCompany authCompany where "
						+ "authCompany.userCode =?", userCode);
		if(authCompanyList.size() >0){
			subComList=this.getSubCompanyCodeList(authCompanyList);
			authCompanyList.addAll(subComList);
		}
		return authCompanyList;
	}
	/**
	 * 获取允许授权机构对应代理机构范围
	 * @param userCode  管理员员工代码
	 * @return 分级管理员允许授权机构对应代理机构范围
	 */
	public Collection<String> getAuthPermitAgentCom(String userCode){
		List<String> subComList = new ArrayList<String>(0);
		List ComList=new ArrayList();
		ComList.addAll(getAuthPermitCom(userCode));
		List<String> authCompanyList = this.findByHql(
				"select distinct comCode from SaaCompany Company where "
						+ "Company.agentInsCom in ("
						+removeDuplicateWithOrder(ComList)+")");

		for (int i = 0; i < authCompanyList.size(); i++) {
			System.out.println(authCompanyList.get(i));
		}
		if(authCompanyList.size() >0){
			subComList=this.getSubCompanyCodeList(authCompanyList);
			authCompanyList.addAll(subComList);
		}
		return authCompanyList;
	}
//	public String getPermitCom(long id) {
//		String permitCom="";
//		StringBuilder builder = new StringBuilder();
//		List<String> subComList = new ArrayList<String>(0);
//		List<String> permitCompanyList = this.findByHql(
//				"select distinct comCode from SaaPermitCompany permitCompany where "
//						+ "permitCompany.saaUserGrade.id =?", id);
//		if (permitCompanyList.size() > 0) {
//			subComList=this.getSubCompanyCodeList(permitCompanyList);
//			for (int i = 0; i <subComList.size(); i++) {
//				builder.append(",'" + subComList.get(i) + "'");
//			}
//			String[] comCodes=permitCompanyList.get(0).split(",");
//			for (int i = 0; i <comCodes.length; i++) {
//				builder.append(",'" + comCodes[i] + "'");
//			}
//		}
//		if(builder.toString().length()>0){
//			permitCom=builder.substring(1);
//		}
//		return permitCom;
//	}
	/**
	 * 删除ArrayList中重复元素，保持顺序
	 */
		public String removeDuplicateWithOrder(List list) {
		  Set set = new HashSet();
		  StringBuilder builder = new StringBuilder();
		  String permitCode="";
		  List newList = new ArrayList();
		  for (Iterator iter = list.iterator(); iter.hasNext();) {
		   Object element = iter.next();
		   if (set.add(element))
		    newList.add(element);
		  }
		  list.clear();
		  list.addAll(newList);
		  for(int i=0;i<list.size();i++){
			  builder.append(",'"+list.get(i)+"'");
		  }
		  if(!(list.size()>0)){
			  builder.append(",''");
		  }
		  if(builder.toString().length()>0){
			  permitCode=builder.toString().substring(1);
		  }else{
			  permitCode="''";
		  }
		  return permitCode;
		 }
	
	
	/**
	 * 业务机构禁止范围
	 * @param id 员工岗位表的主键
	 * @return
	 */
	public String getExceCom(long id) {
		String exceCom="";
		StringBuilder builder = new StringBuilder();
		List<String> subComList = new ArrayList<String>(0);
		List<String> exceptCompanyList = this.findByHql(
				"select distinct comCode from SaaExceptCompany exceptCompanyt where "
						+ "exceptCompanyt.saaUserGrade.id =?", id);
		if (exceptCompanyList.size() > 0) {
			
			subComList=this.getSubCompanyCodeList(exceptCompanyList);
			for (int i = 0; i <subComList.size(); i++) {
				builder.append(",'" + subComList.get(i) + "'");
			}
//				builder.append(exceptCompanyList.get(0));
//			String[] comCodes=exceptCompanyList.get(0).split(",");
//			for (int i = 0; i < comCodes.length; i++) {
//				builder.append(",'" + comCodes[i] + "'");
//			}
		}
		if(builder.toString().length()>0){
			exceCom=builder.substring(1);
		}
		
		return exceCom;
	}
	/**
	 * 业务机构禁止范围
	 * @param id 员工岗位表的主键
	 * @return
	 */
	public List<String> getExceComList(long id) {
		StringBuilder builder = new StringBuilder();
		List<String> subComList = new ArrayList<String>(0);
		List<String> exceptCompanyList = this.findByHql(
				"select distinct comCode from SaaExceptCompany exceptCompanyt where "
						+ "exceptCompanyt.saaUserGrade.id =?", id);
		if (exceptCompanyList.size() > 0) {
			
			subComList=this.getSubCompanyCodeList(exceptCompanyList);
			if(subComList.size()>0){
				exceptCompanyList.addAll(subComList);
			}
		}
		
		return exceptCompanyList;
	}
	/**
	 * 管理员授权机构禁止范围
	 * @param userCode 管理员员工代码
	 * @return
	 */
	public Collection<String> getAuthExceCom(String userCode) {
		List<String> subComList = new ArrayList<String>(0);
		List<String> exceptCompanyList = this.findByHql(
				"select distinct comCode from SaaAuthExceptCompany authExceptCompany where "
				+ "authExceptCompany.userCode =?", userCode);
		if (exceptCompanyList.size() > 0) {	
			subComList=this.getSubCompanyCodeList(exceptCompanyList);
			exceptCompanyList.addAll(subComList);
		}
		
		return exceptCompanyList;
	}
	/**
	 * 在添加权限范围时查询业务允许产品表来获取险种
	 * 
	 * @param id
	 *            员工岗位表的主键
	 * @return String 险种集合
	 */
	@SuppressWarnings("unchecked")
	public Collection<String> getRisksByProductCode(long id) {
		List<String> productCodeList = this.findByHql(
				"select distinct permitProduct.productCode from SaaPermitProduct permitProduct where "
						+ "permitProduct.saaUserGrade.id =?", id);
		List<String> proCodeList=new ArrayList();
		if (productCodeList.size() > 0) {
			for(int i=0;i<productCodeList.size();i++){
			int key = getProductType(productCodeList.get(i).trim());
			switch (key) {
			case 0:// 表示产品
				proCodeList.addAll(this.findByHql(
				"select distinct saaRisk.riskCode from SaaRisk saaRisk where "
						+ "saaRisk.classCode in(select distinct saaClass.classCode from SaaClass saaClass where saaClass.businessLineCode=?)", productCodeList.get(i).trim()));

				break;
			case 1:// 表示险类
				int subint=productCodeList.get(i).indexOf(".")+1;
				String classCode=productCodeList.get(i).substring(subint);
				proCodeList.addAll(this.findByHql(
				"select distinct saaRisk.riskCode from SaaRisk saaRisk where "
						+ "saaRisk.classCode =?", classCode));
				break;
			case 2:// 表示险种
				int codeint=productCodeList.get(i).lastIndexOf(".")+1;
				proCodeList.add(productCodeList.get(i).substring(codeint));
				break;
			default:
				throw new IllegalArgumentException(
						"productCode must have value");
			 }
			}
		}
		
//		System.out.println(tempBuilder.substring(1));
//		if(tempBuilder.toString().length()>0){
//		 builder.append(tempBuilder.substring(1));
//		}
		return proCodeList;
	}
	/**
	 * 管理员的产品控制范围
	 * 
	 * @param userCode
	 *            管理员员工代码
	 * @return List 产品集合
	 */
	@SuppressWarnings("unchecked")
	public Collection<String> getAuthRisksByProductCode(String userCode) {
		List<String> productCodeList = this.findByHql(
				"select distinct authProduct.productCode from SaaAuthProduct authProduct where "
						+ "authProduct.userCode =?", userCode);
		List<String> proCodeList=new ArrayList();
		if (productCodeList.size() > 0) {
			for(int i=0;i<productCodeList.size();i++){
			int key = getProductType(productCodeList.get(i).trim());
			switch (key) {
			case 0:// 表示产品
				proCodeList.addAll(this.findByHql(
				"select distinct saaRisk.riskCode from SaaRisk saaRisk where "
						+ "saaRisk.classCode in(select distinct saaClass.classCode from SaaClass saaClass where saaClass.businessLineCode=?)", productCodeList.get(i).trim()));

				break;
			case 1:// 表示险类
				int subint=productCodeList.get(i).indexOf(".")+1;
				String classCode=productCodeList.get(i).substring(subint);
				proCodeList.addAll(this.findByHql(
				"select distinct saaRisk.riskCode from SaaRisk saaRisk where "
						+ "saaRisk.classCode =?", classCode));
				break;
			case 2:// 表示险种
				proCodeList.add(productCodeList.get(i).trim());
				break;
			default:
				throw new IllegalArgumentException(
						"productCode must have value");
			 }
			}
		}
		return productCodeList;
		}
	/**
	 * 产品种类判断
	 * @productStr 产品串
	 * @return 0-产品线;1-险类;2-险种
	 */
	public int getProductType(String prodectStr){

		if(prodectStr.indexOf(".")==-1){
			return 0;
		}else if(prodectStr.indexOf(".")==prodectStr.lastIndexOf(".")){
			return 1;
		}else{
			return 2;
		}
	}
	//*******************************************************
	/**
	 * 得到当前机构列表的所有下属机构(外部接口)
	 * 
	 * @param comCodes
	 * @return
	 */
	public List<String> getSubCompanyCodeList(List<String> comCodes) {
//		String key = cacheManager.generateCacheKey("subCompanyCodeList",
//				comCodes);
//		Object result = cacheManager.getCache(key);
//		if (result != null) {
//			return (List<String>) result;
//		}
		List<String> comCodeList = this.getSubCompanyCode(comCodes);
//		cacheManager.putCache(key, comCodeList);
		return comCodeList;
	}
	/**
	 * 得到当前机构列表的所有下属机构(权限专用接口)
	 * 
	 * @param comCodes
	 * @return
	 */
	@SuppressWarnings( { "unchecked", "unused" })
	private List<String> getSubCompanyCode(List<String> comCodes) {
		List<String> comCodeReturn = new ArrayList<String>(0);
		for (String str : comCodes) {
			comCodeReturn.addAll(this.getSubAllCompanyCode(str));
		}
		return comCodeReturn;
	}
	/**
	 * 得到当前机构列表的所有下属机构
	 * 
	 * @param comCode
	 * @return
	 */
	@SuppressWarnings("unchecked")
	private List<String> getSubAllCompanyCode(String comCode) {
		String key = cacheManager
				.generateCacheKey("subAllCompanyCode", comCode);
		Object result = cacheManager.getCache(key);
		if (result != null) {
			return (List<String>) result;
		}
		List<String> comCodeList = new ArrayList<String>(0);	
		TreeNode<String> node = this.getCompanyTree().get(comCode);
		if (node != null) {
			List<TreeNode<String>> children = node.getAllChildren();
			if (children != null && children.size() != 0) {
				for (TreeNode<String> child : children) {
					comCodeList.add(child.getValue());
				}
			}
			comCodeList.add(node.getValue());
		}
		cacheManager.putCache(key, comCodeList);
		return comCodeList;
	}
	
	private Map<String, TreeNode<String>> getCompanyTree() {
		Map<String, TreeNode<String>> treeNodeMap = (Map<String, TreeNode<String>>) cacheManager
				.getCache("CompanyTree");
		if (treeNodeMap == null) {
			treeNodeMap = initCompanyTreeCache();
		}
		return treeNodeMap;
	}
	
	private Map<String, TreeNode<String>> initCompanyTreeCache() {
		Map<String, TreeNode<String>> companyTree = new HashMap<String, TreeNode<String>>();
		List<Object[]> list = super
				.findByHql("select com.comCode, com.uppercomcode from SaaCompany com where com.validStatus='1'");
		for (Object[] str : list) {
			TreeNode<String> node = new TreeNode<String>((String) str[0]);
			companyTree.put(node.getValue(), node);
		}
		for (Object[] str : list) {
			TreeNode<String> node = companyTree.get((String) str[0]);
			TreeNode<String> parent = companyTree.get((String) str[1]);
			if (parent != null && parent != node) {
				node.setParent(parent);
				parent.addChild(node);
			}
		}
		cacheManager.putCache("CompanyTree", companyTree);
		return companyTree;
	}
	
	public Map builderGradeMap(String taskCode, String taskType) {
		Map gradeMap = new HashMap();
		StringBuffer builder = new StringBuffer();
		if (taskCode.length() > 0) {
			List gradeNameList = new ArrayList();
			builder.append("select gradeTask.saaGrade.id from SaaGradeTask gradeTask, SaaTask task ");
			builder.append(" where gradeTask.saaTask.id =task.id and task.taskCode = ?");
			List gradeIDList = this.findByHql(builder.toString(),taskCode);
			if (gradeIDList.size() > 0) {
				builder = new StringBuffer();
				builder
						.append("select grade.gradeCName from SaaGrade grade where grade.id = ?");
				gradeNameList = this.findByHql(builder.toString(), gradeIDList.get(0));
			}
			if (taskType.equals("1")) {
				if (gradeNameList.get(0).equals("一级核保岗")) {
					gradeMap.put(" ", 0);
				} else if (gradeNameList.get(0).equals("二级核保岗")) {
					gradeMap.put("一级核保岗", 1);
					gradeMap.put("二级核保岗", 2);
				} else if (gradeNameList.get(0).equals("三级核保岗")) {
					gradeMap.put("一级核保岗", 1);
					gradeMap.put("二级核保岗", 2);
					gradeMap.put("三级核保岗", 3);
				} else if (gradeNameList.get(0).equals("四级核保岗")) {
					gradeMap.put("一级核保岗", 1);
					gradeMap.put("二级核保岗", 2);
					gradeMap.put("三级核保岗", 3);
				} else if (gradeNameList.get(0).equals("五级核保岗")) {
					gradeMap.put("一级核保岗", 1);
					gradeMap.put("二级核保岗", 2);
					gradeMap.put("三级核保岗", 3);
					gradeMap.put("四级核保岗", 4);
				} else if (gradeNameList.get(0).equals("六级核保岗")) {
					gradeMap.put("一级核保岗", 1);
					gradeMap.put("二级核保岗", 2);
					gradeMap.put("三级核保岗", 3);
					gradeMap.put("四级核保岗", 4);
					gradeMap.put("五级核保岗", 5);
				} else if (gradeNameList.get(0).equals("七级核保岗")) {
					gradeMap.put("一级核保岗", 1);
					gradeMap.put("二级核保岗", 2);
					gradeMap.put("三级核保岗", 3);
					gradeMap.put("四级核保岗", 4);
					gradeMap.put("五级核保岗", 5);
					gradeMap.put("六级核保岗", 6);
				} else if (gradeNameList.get(0).equals("八级核保岗")) {
					gradeMap.put("一级核保岗", 1);
					gradeMap.put("二级核保岗", 2);
					gradeMap.put("三级核保岗", 3);
					gradeMap.put("四级核保岗", 4);
					gradeMap.put("五级核保岗", 5);
					gradeMap.put("六级核保岗", 6);
					gradeMap.put("七级核保岗", 7);
				} else if (gradeNameList.get(0).equals("九级核保岗")) {
					gradeMap.put("一级核保岗", 1);
					gradeMap.put("二级核保岗", 2);
					gradeMap.put("三级核保岗", 3);
					gradeMap.put("四级核保岗", 4);
					gradeMap.put("五级核保岗", 5);
					gradeMap.put("六级核保岗", 6);
					gradeMap.put("七级核保岗", 7);
					gradeMap.put("八级核保岗", 8);
				}
			} else if (taskType.equals("2")) {
				if (gradeNameList.get(0).equals("一级核赔岗")) {
					gradeMap.put(" ", 0);
				} else if (gradeNameList.get(0).equals("二级核赔岗")) {
					gradeMap.put("一级核赔岗", 1);
					gradeMap.put("二级核赔岗", 2);
				} else if (gradeNameList.get(0).equals("三级核赔岗")) {
					gradeMap.put("一级核赔岗", 1);
					gradeMap.put("二级核赔岗", 2);
					gradeMap.put("三级核赔岗", 3);
				} else if (gradeNameList.get(0).equals("四级核赔岗")) {
					gradeMap.put("一级核赔岗", 1);
					gradeMap.put("二级核赔岗", 2);
					gradeMap.put("三级核赔岗", 3);
				} else if (gradeNameList.get(0).equals("五级核赔岗")) {
					gradeMap.put("一级核赔岗", 1);
					gradeMap.put("二级核赔岗", 2);
					gradeMap.put("三级核赔岗", 3);
					gradeMap.put("四级核赔岗", 4);
				} else if (gradeNameList.get(0).equals("六级核赔岗")) {
					gradeMap.put("一级核赔岗", 1);
					gradeMap.put("二级核赔岗", 2);
					gradeMap.put("三级核赔岗", 3);
					gradeMap.put("四级核赔岗", 4);
					gradeMap.put("五级核赔岗", 5);
				} else if (gradeNameList.get(0).equals("七级核赔岗")) {
					gradeMap.put("一级核赔岗", 1);
					gradeMap.put("二级核赔岗", 2);
					gradeMap.put("三级核赔岗", 3);
					gradeMap.put("四级核赔岗", 4);
					gradeMap.put("五级核赔岗", 5);
					gradeMap.put("六级核赔岗", 6);
				} else if (gradeNameList.get(0).equals("八级核赔岗")) {
					gradeMap.put("一级核赔岗", 1);
					gradeMap.put("二级核赔岗", 2);
					gradeMap.put("三级核赔岗", 3);
					gradeMap.put("四级核赔岗", 4);
					gradeMap.put("五级核赔岗", 5);
					gradeMap.put("六级核赔岗", 6);
					gradeMap.put("七级核赔岗", 7);
				} else if (gradeNameList.get(0).equals("九级核赔岗")) {
					gradeMap.put("一级核赔岗", 1);
					gradeMap.put("二级核赔岗", 2);
					gradeMap.put("三级核赔岗", 3);
					gradeMap.put("四级核赔岗", 4);
					gradeMap.put("五级核赔岗", 5);
					gradeMap.put("六级核赔岗", 6);
					gradeMap.put("七级核赔岗", 7);
					gradeMap.put("八级核赔岗", 8);
				}
			}
		} else {
			if (taskType.equals("1")) {
				gradeMap.put("一级核保岗", 1);
				gradeMap.put("二级核保岗", 2);
				gradeMap.put("三级核保岗", 3);
				gradeMap.put("四级核保岗", 4);
				gradeMap.put("五级核保岗", 5);
				gradeMap.put("六级核保岗", 6);
				gradeMap.put("七级核保岗", 7);
				gradeMap.put("八级核保岗", 8);
				gradeMap.put("九级核保岗", 9);
			} else if (taskType.equals("2")) {
				gradeMap.put("一级核赔岗", 1);
				gradeMap.put("二级核赔岗", 2);
				gradeMap.put("三级核赔岗", 3);
				gradeMap.put("四级核赔岗", 4);
				gradeMap.put("五级核赔岗", 5);
				gradeMap.put("六级核赔岗", 6);
				gradeMap.put("七级核赔岗", 7);
				gradeMap.put("八级核赔岗", 8);
				gradeMap.put("九级核赔岗", 9);
			}
		}
		return gradeMap;
	}
}