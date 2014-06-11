package cn.com.sinosoft.saa.service.facade;

import ins.framework.common.Page;

import java.util.List;
import java.util.Map;

import cn.com.sinosoft.saa.model.SaaBusinessline;
import cn.com.sinosoft.saa.model.SaaClass;
import cn.com.sinosoft.saa.model.SaaRisk;
//现在还用不上
//import cn.com.cis.claim.car.schema.model.PrpDdeductCond;

/**
 * ���뷭�����
 *
 */
public interface CodeService {

	
	
	public String USERCODE = "UserCode";
	
	public String AGENTUSERCODE = "AgentUserCode";

	public String REGISTUSER = "RegistUser";

	public String COMCODE = "ComCode";
	
	public String AGENTCOMCODE = "AgentComCode";

	public String RISKCODE = "RiskCode";

	public String AGENTCODE = "AgentCode";

	public String KINDCODE = "KindCode";

	public String ITEMCODE = "ItemCode";
	
	public String INJUREDPARTSCLASS="InjuredPartsClass";

	public String CURRENCYCODE = "CurrencyCode";

	public String CUSTOMERCODE = "CustomerCode";

	public String LIMITCODE = "LimitCode";

	public String METHODTASK = "methodTask";

	public String TASKCODE = "TaskCode";

	public String PERSONNAME = "PersonName";

	public String CONFIGCODE = "ConfigCode";

	public String HOSPITALLEVEL = "HospitalLevel";

	public String EXAMFACTORY = "ExamFactory";

	public String REPAIRFACTORY = "RepairFactory";

	public String REPAIRFACTORYINVOICE = "RepairFactoryInvoice";

	public String DISASTERCODE = "DisasterCode";

	public String GROUPID = "GroupId";

	public String GRADEID = "GradeId";

	public String NODEID = "NodeId";

	public String NODEIDEXCEPTANYPAY = "NodeIdExceptAnyPay";

	public String VALIDFLAG_Y = "1";

	public String VALIDFLAG_N = "0";

	public String USERTREE = "UserTree";

	public String GROUPTREE = "GroupTree";

	public String POWERUSER = "PowerUser";
	
	public String PAYTYPE = "PayType";
	
	public String DEFLOSSAREA = "DefLossArea";
	
	public String DIRECTCLAIMITEM = "DirectClaimItem";
	
	public String DIRECTCLAIMTYPE = "DirectClaimType";
	
	public String OCCUPATION = "Occupation";
	
	public String FEETYPECODE="FeeTypeCode";
	
	public String JOBINFO = "JobInfo";
	
	public String WOUNDLEVEL = "WoundLevel";

	/**
	 * �������<br>
	 * ֧�ֵĴ��������У�<br>
	 *
	 * <pre>
	 * UserCode Ա������
	 * ComCode  �����
	 * RiskCode ���ִ���
	 * KindCode �ձ����
	 * ItemCode �����Ŀ����
	 * CurrencyCode �ұ����
	 * CustomerCode �ͻ�����
	 * LimitCode �޶�/��������
	 * �Լ�PrpDtype��ָ���Ĵ��룬�磺
	 * 		CarKind ��~����
	 * 		SexCode �Ա����
	 * 		DamageCode ����ԭ��
	 * 		...
	 * </pre>
	 *
	 * �������´��룬��ѯ�Ա����Ϊ1���������
	 *
	 * <pre>
	 * String value = codeService.translateCode(&quot;SexCode&quot;, &quot;1&quot;, &quot;DAA&quot;, &quot;C&quot;);
	 * </pre>
	 *
	 * @param codeType
	 *            ��������
	 * @param codeCode
	 *            ����
	 * @param riskCode
	 *            ���ִ���
	 * @param language
	 *            ����(C:����/E:Ӣ��)
	 * @return �������
	 */
//	public String translateCode(String codeType, String codeCode,
//			String riskCode, String language);
//
//	/**
//	 * �������<br>
//	 * ֧�ֵĴ��������У�<br>
//	 *
//	 * <pre>
//	 * UserCode Ա������
//	 * ComCode  �����
//	 * RiskCode ���ִ���
//	 * KindCode �ձ����
//	 * ItemCode �����Ŀ����
//	 * CurrencyCode �ұ����
//	 * CustomerCode �ͻ�����
//	 * LimitCode �޶�/��������
//	 * �Լ�PrpDtype��ָ���Ĵ��룬�磺
//	 * 		CarKind ��~����
//	 * 		SexCode �Ա����
//	 * 		DamageCode ����ԭ��
//	 * 		...
//	 * </pre>
//	 *
//	 * �������´��룬��ѯ�Ա����Ϊ1���������
//	 *
//	 * <pre>
//	 * String value = codeService.translateCode(&quot;SexCode&quot;, &quot;1&quot;, &quot;DAA&quot;, &quot;C&quot;);
//	 * </pre>
//	 *
//	 * @param codeType
//	 *            ��������
//	 * @param codeCode
//	 *            ����
//	 * @param riskCode
//	 *            ���ִ���
//	 * @param language
//	 *            ����(C:����/E:Ӣ��)
//	 * @return �������
//	 */
//	public String translateCode(String codeType, String codeEName,
//			String riskCode);
//	/**
//	 * �������<br>
//	 * ֧�ֵĴ��������У�<br>
//	 *
//	 * <pre>
//	 * KindCode �ձ����
//	 * ItemCode �����Ŀ����
//	 * CurrencyCode �ұ����
//	 * LimitCode �޶�/��������
//	 * �Լ�PrpDtype��ָ���Ĵ��룬�磺
//	 * 		CarKind ��~����
//	 * 		SexCode �Ա����
//	 * 		DamageCode ����ԭ��
//	 * 		...
//	 * </pre>
//	 *
//	 * �������´��룬��ѯ�Ա����Ϊ1���������
//	 *
//	 * <pre>
//	 * Map&lt;String, String&gt; codes = codeService.listCodes(&quot;SexCode&quot;, &quot;DAA&quot;, &quot;C&quot;);
//	 * </pre>
//	 *
//	 * @param codeType
//	 *            ��������
//	 * @param riskCode
//	 *            ���ִ���
//	 * @param language
//	 *            ����(C:����/E:Ӣ��)
//	 * @return �������
//	 */
//	public Map<String, String> listCodes(String codeType, String riskCode,
//			String language);
//
//	/**
//	 * �������
//	 *
//	 * @param codeType
//	 *            ��������
//	 * @param riskCode
//	 *            ����
//	 * @param language
//	 *            ����
//	 * @param otherCondition
//	 *            �������,ʵ�����Ϊa,���� a.id.codecode in('01','02','03')
//	 * @return
//	 */
//	public Map<String, String> listCodes(String codeType, String riskCode,
//			String language, String otherCondition);
//
//	/**
//	 * �������<br>
//	 * ֧�ֵĴ��������У�<br>
//	 *
//	 * <pre>
//	 * KindCode �ձ����
//	 * ItemCode �����Ŀ����
//	 * CurrencyCode �ұ����
//	 * LimitCode �޶�/��������
//	 * �Լ�PrpDtype��ָ���Ĵ��룬�磺
//	 * 		CarKind ��~����
//	 * 		SexCode �Ա����
//	 * 		DamageCode ����ԭ��
//	 * 		...
//	 * </pre>
//	 *
//	 * �������´��룬��ѯ�Ա����Ϊ1���������
//	 *
//	 * <pre>
//	 * List
//	 * <Code>
//	 * codes = codeService.listCodeList(&quot;SexCode&quot;, &quot;DAA&quot;, &quot;C&quot;);
//	 * </pre>
//	 *
//	 * @param codeType
//	 *            ��������
//	 * @param riskCode
//	 *            ���ִ���
//	 * @param language
//	 *            ����(C:����/E:Ӣ��)
//	 * @return �������
//	 */
//	public List<Code> listCodeList(String codeType, String riskCode,
//			String language);
//	
//	/**
//	 * 
//	 * �������
//	 * */
//	public List<Code> listListCode(String codeType, String riskCode,
//			String language,String typeParam);
//
//	/**
//	 * �������<br>
//	 * ֧�ֵĴ��������У�<br>
//	 *
//	 * <pre>
//	 * KindCode �ձ����
//	 * ItemCode �����Ŀ����
//	 * CurrencyCode �ұ����
//	 * LimitCode �޶�/��������
//	 * �Լ�PrpDtype��ָ���Ĵ��룬�磺
//	 * 		CarKind ��~����
//	 * 		SexCode �Ա����
//	 * 		DamageCode ����ԭ��
//	 * 		...
//	 * </pre>
//	 *
//	 * �������´��룬��ѯ�Ա����Ϊ1���������
//	 *
//	 * <pre>
//	 * List
//	 * <Code>
//	 * codes = codeService.listCodeList(&quot;SexCode&quot;, &quot;DAA&quot;, &quot;C&quot;, &quot;asc&quot;);
//	 * </pre>
//	 *
//	 * @param codeType
//	 *            ��������
//	 * @param riskCode
//	 *            ���ִ���
//	 * @param language
//	 *            ����(C:����/E:Ӣ��)
//	 * @param order
//	 *            ����(asc:����/desc:����)
//	 * @return �������
//	 */
//	public List<Code> listOrderCodeList(String codeType, String riskCode,
//			String language, String order);
//	
//	/**
//	 *
//	 * @param codeType
//	 *            ��������
//	 * @param riskCode
//	 *            ���ִ���
//	 * @param language
//	 *            ����(C:����/E:Ӣ��)
//	 * @param order
//	 *            ����(asc:����/desc:����)
//	 * @param typeParam          
//	 * @return �������
//	 */
//	public List<Code> listOrderListCode(String codeType, String riskCode,
//			String language, String order,String typeParam);
//	
//
	
	/**
	 * 翻译代码<br>
	 * 支持的代码类型有：<br>
	 * 
	 * <pre>
	 * UserCode 员工代码
	 * ComCode  机构代码
	 * </pre>
	 * 
	 * 例如以下代码，查询性别代码为1的中文名称
	 * 
	 * <pre>
	 * String value = codeService.translateCode(&quot;SexCode&quot;, &quot;1&quot;, &quot;DAA&quot;, &quot;C&quot;);
	 * </pre>
	 * 
	 * @param codeType
	 *            代码类型
	 * @param codeCode
	 *            代码
	 * @param riskCode
	 *            险种代码
	 * @param language
	 *            语种(C:中文/E:英文)
	 * @return 代码名称
	 */
	public String translateCode(String codeType, String codeCode,
			String riskCode, String language);
	/**
	 * 代码服务<br>
	 * 支持的代码类型有：<br>
	 * 
	 * 
	 * 例如以下代码，查询性别代码为1的中文名称
	 * 
	 * <pre>
	 * Map&lt;String, String&gt; codes = codeService.listCodes(&quot;SexCode&quot;, &quot;DAA&quot;, &quot;C&quot;);
	 * </pre>
	 * 
	 * @param codeType
	 *            代码类型
	 * @param riskCode
	 *            险种代码
	 * @param language
	 *            语种(C:中文/E:英文)
	 * @return 代码名称
	 */
	public Map<String, String> listCodes(String codeType, String riskCode,
			String language);
	/**
	 * ����ѡ�����<br>
	 *
	 * @param codeType
	 *            ��������
	 * @param riskCode
	 *            ���ִ���
	 * @param language
	 *            ����(C:����/E:Ӣ��)
	 * @param order
	 *            ����(asc:����/desc:����)
	 * @param matches
	 *            ƥ���ַ�
	 * @param typeParam
	 *            �^�V��ԃ�ą���
	 * @return ����List
	 */
	public Page listCodeSelect(String codeType, String riskCode,
			String language, String matches, int pageNo, int pageSize,
			String userCode, String typeParam, String extraCond);
	public List<SaaBusinessline> getAllbusinesslineCodes();
	
	public List<SaaClass> getAllClassCodeBybusinessLineCode(String businessLineCode);
	
	public List<SaaRisk> getAllRiskCodeByClassCode(String classCode);
	
	public String processCodeCom(String userCode);
	
	public String processCodeCenter(String comCode);
}
