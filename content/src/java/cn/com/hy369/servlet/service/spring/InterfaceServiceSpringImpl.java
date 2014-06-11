package cn.com.hy369.servlet.service.spring;

import ins.framework.common.QueryRule;
import ins.framework.dao.GenericDaoHibernate;
import java.util.Iterator;
import java.util.List;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.Node;
import com.sinosoft.sysframework.common.datatype.DateTime;

import cn.com.hy369.adinfo.service.facade.AdInfoService;
import cn.com.hy369.card.service.facade.CardService;
import cn.com.hy369.cardtype.service.facade.CardTypeService;
import cn.com.hy369.jion.service.facade.JionInfoService;
import cn.com.hy369.model.AdInfo;
import cn.com.hy369.model.JionInfo;
import cn.com.hy369.model.LearningCard;
import cn.com.hy369.model.LearningCardType;
import cn.com.hy369.model.Resource;
import cn.com.hy369.model.ResourceType;
import cn.com.hy369.resource.service.facade.ResourceService;
import cn.com.hy369.resourcetype.service.facade.ResourceTypeService;
import cn.com.hy369.servlet.service.facade.InterfaceService;

@SuppressWarnings("unchecked")
public class InterfaceServiceSpringImpl extends GenericDaoHibernate implements InterfaceService {
	public Document findAccMessage(Document document) {
		String accType = "";
		//得到根节点PACKET 
		Element packet = document.getRootElement();
		//得到HEAD节点
		for (Iterator<Element> it = packet.elementIterator("HEAD"); it.hasNext();)
		{
			Element head = it.next();
			accType = parseNode(head.selectSingleNode("ACCTYPE"));
			System.out.println("regist=" + accType);
			break;
		}
		Document documentReponse = null;
		if("1".equals(accType)){
			// 根据相关信息组织返回的内容。
			documentReponse = getLoginMessage(packet);
		}
		// 加盟
		if("2".equals(accType)){
			documentReponse = getJionInfo(packet);
		}
		// 返回目录菜单
		if("3".equals(accType)){
			documentReponse = getResourceType(packet);
		}
		if("4".equals(accType)){
			documentReponse = getResource(packet);
		}
		if("5".equals(accType)){
			documentReponse = getPassInfo(packet);
		}
		return documentReponse;
	}
	
	private Document getPassInfo(Element packet) {
		// 首先获取接口传入的参数
		CardService cardService = (CardService)applicationContext.getBean("cardService");
		String errorMessage = "";
		LearningCard learningCard = null;
		Document documentReponse = DocumentHelper.createDocument();
		Element packetElement = documentReponse.addElement("PACKET")
		.addAttribute("type", "REQUEST")
		.addAttribute("version", "1.0");
		for (Iterator<Element> it = packet.elementIterator("PASSINFO"); it.hasNext();)
		{
			String userCode = "";
			String oldPassWord = "";
			String newPassWord = "";
			String phoneNo = "";
			Element head = it.next();
			userCode = parseNode(head.selectSingleNode("USERCODE"));
			oldPassWord = parseNode(head.selectSingleNode("OLDPASSWORD"));
			newPassWord = parseNode(head.selectSingleNode("NEWPASSWORD"));
			phoneNo = parseNode(head.selectSingleNode("PHONENO"));
			System.out.println("regist=" + userCode);
			// 开始进行验证
			learningCard = cardService.findCardByPrim(userCode);
			if(learningCard == null){
				errorMessage = "不存在用户";
			}else  if(!oldPassWord.equals(learningCard.getPassWord())){
				errorMessage = "用户名或密码不正确";
			}else{
				learningCard.setPassWord(newPassWord);
				learningCard.setPhoneNo(phoneNo);
				cardService.updateCard(learningCard);
			}
			break;
		}
		if(errorMessage.length() > 1){
			Element headElement = packetElement.addElement("HEAD");
			headElement.addElement("ACCTYPE").setText("1");
			Element infoElement = packetElement.addElement("BODY");
			infoElement.addElement("SUCCESS").setText("-1");
			infoElement.addElement("ERROR").setText(errorMessage);
		}else{
			Element headElement = packetElement.addElement("HEAD");
			headElement.addElement("ACCTYPE").setText("1");
			Element infoElement = packetElement.addElement("BODY");
			infoElement.addElement("SUCCESS").setText("1");
			infoElement.addElement("SUCCESSINFO").setText("更改成功！");
		}
		documentReponse.setXMLEncoding("utf-8");
		return documentReponse;
	}

	private Document getJionInfo(Element packet) {
		JionInfoService jionInfoService = (JionInfoService)applicationContext.getBean("jionInfoService");
		// 解析传过来的文件，组装成DTO。
		String infoNo = "100";
		String userName = "";
		String phoneNo = "";
		String postCode = "";
		String email = "";
		String address = "";
		String message = "";
		for (Iterator<Element> it = packet.elementIterator("JIONINFO"); it.hasNext();)
		{
			Element jionInfo = it.next();
			userName = parseNode(jionInfo.selectSingleNode("USERNAME"));
			phoneNo = parseNode(jionInfo.selectSingleNode("PHONENO"));
			postCode = parseNode(jionInfo.selectSingleNode("POSTCODE"));
			email = parseNode(jionInfo.selectSingleNode("EMAIL"));
			address = parseNode(jionInfo.selectSingleNode("ADDRESS"));
			message = parseNode(jionInfo.selectSingleNode("MESSAGE"));
			System.out.println("regist=" + userName);
			break;
		}
		QueryRule queryRule = QueryRule.getInstance();
		queryRule.addAscOrder("infoNo");
		JionInfo jionInfo = new JionInfo();
		List<JionInfo> jionInfoList = jionInfoService.findJionInfoList(queryRule);
		if(jionInfoList == null || jionInfoList.isEmpty()){
			
		}else{
			JionInfo jionInfoTemp = jionInfoList.get(jionInfoList.size()-1);
			infoNo = Integer.toString(Integer.parseInt(jionInfoTemp.getInfoNo()) + 1); 
		}
		boolean success = false;
		DateTime currency = DateTime.current();
		jionInfo.setInfoNo(infoNo);
		jionInfo.setAddress(address);
		jionInfo.setCreateDate(currency);
		jionInfo.setEmail(email);
		jionInfo.setMessage(message);
		jionInfo.setPhoneNo(phoneNo);
		jionInfo.setUserName(userName);
		jionInfo.setPostCode(postCode);
		try{
			jionInfoService.addJionInfo(jionInfo);
		}catch(Exception e){
			success = true;
		}
		
		
		// 开始组装信息
		Document documentReponse = DocumentHelper.createDocument();
		Element packetElement = documentReponse.addElement("PACKET")
		.addAttribute("type", "REQUEST")
		.addAttribute("version", "1.0");
		if(success){
			// 当不存在的时候
			Element headElement = packetElement.addElement("HEAD");
			headElement.addElement("ACCTYPE").setText("2");
			Element infoElement = packetElement.addElement("BODY");
			infoElement.addElement("SUCCESS").setText("-1");
			infoElement.addElement("SUCCESSINFO").setText("保存失败");
		}else{
			Element headElement = packetElement.addElement("HEAD");
			headElement.addElement("ACCTYPE").setText("2");
			Element infoElement = packetElement.addElement("BODY");
			infoElement.addElement("SUCCESS").setText("1");
			infoElement.addElement("SUCCESSINFO").setText("保存成功");
		}
		
		return documentReponse;
	}

	private Document getResource(Element packet) {
		ResourceService resourceService = (ResourceService)applicationContext.getBean("resourceService");
		AdInfoService adInfoService = (AdInfoService)applicationContext.getBean("adInfoService");
		// 获取资源文件的路径。
		String resourceTypeID = "";
		String areaID = "";
		for (Iterator<Element> it = packet.elementIterator("VIDEOLIST"); it.hasNext();)
		{
			Element head = it.next();
			resourceTypeID = parseNode(head.selectSingleNode("VIDEOLISTID"));
			areaID = parseNode(head.selectSingleNode("AREAID"));
			System.out.println("regist=" + resourceTypeID);
			break;
		}
		QueryRule queryRule = QueryRule.getInstance();
		queryRule.addEqual("typeID", resourceTypeID);
		List<Resource> resourceList = resourceService.findResourceByRule(queryRule);
		// 开始组装信息
		Document documentReponse = DocumentHelper.createDocument();
		Element packetElement = documentReponse.addElement("PACKET")
		.addAttribute("type", "REQUEST")
		.addAttribute("version", "1.0");
		if(resourceList == null || resourceList.isEmpty()){
			// 当不存在的时候
			Element headElement = packetElement.addElement("HEAD");
			headElement.addElement("ACCTYPE").setText("4");
			Element infoElement = packetElement.addElement("BODY");
			infoElement.addElement("SUCCESS").setText("-1");
			infoElement.addElement("ERROR").setText("不存在对应的信息");
		}else{
			Element headElement = packetElement.addElement("HEAD");
			headElement.addElement("ACCTYPE").setText("4");
			Element infoElement = packetElement.addElement("BODY");
			infoElement.addElement("SUCCESS").setText("1");
			infoElement.addElement("MENUID").setText(resourceTypeID);
			for(Resource resource : resourceList){
				Element typeElement = packetElement.addElement("RESOURCE");
				typeElement.addElement("RESNO").setText(Integer.toString(resource.getResNo()) );
				typeElement.addElement("RESOURCENAME").setText(resource.getResourceName() + "(" + resource.getClickTimes() + ")");
				typeElement.addElement("RESOURCEADDRESS").setText(resource.getResourceAddress());
				typeElement.addElement("RESOURCEINFO").setText(resource.getResourceInfo() == null ? "":resource.getResourceInfo());
				// 根据条件查询对应资源和省份的广告
				QueryRule queryRuleaD = QueryRule.getInstance();
				queryRuleaD.addEqual("resourceID", Integer.toString(resource.getResNo()));
				queryRuleaD.addEqual("areaNo", areaID);
				List<AdInfo> adInfoList = adInfoService.findAdInfo(queryRuleaD);
				String adUrl = "";
				String adLink = "";
				String adUrl1 = "";
				String adLink1 = "";
				String adUrl2 = "";
				String adLink2 = "";
				String adUrl3 = "";
				String adLink3 = "";
				String adUrl4 = "";
				String adLink4 = "";
				String adUrl5 = "";
				String adLink5 = "";
				if(adInfoList != null && !adInfoList.isEmpty()){
					for(AdInfo adInfo : adInfoList){
						adUrl = adInfo.getAdInfo();
						adLink = adInfo.getAdLink();
						adUrl1 = adInfo.getAdInfo1();
						adLink1 = adInfo.getAdLink1();
						adUrl2 = adInfo.getAdInfo2();
						adLink2 = adInfo.getAdLink2();
						adUrl3 = adInfo.getAdInfo3();
						adLink3 = adInfo.getAdLink3();
						adUrl4 = adInfo.getAdInfo4();
						adLink4 = adInfo.getAdLink4();
						adUrl5 = adInfo.getAdInfo5();
						adLink5 = adInfo.getAdLink5();
						break;
					}
				}
				typeElement.addElement("ADURL").setText(adUrl);
				typeElement.addElement("ADLINK").setText(adLink);
				typeElement.addElement("ADURL1").setText(adUrl1);
				typeElement.addElement("ADLINK1").setText(adLink1);
				typeElement.addElement("ADURL2").setText(adUrl2);
				typeElement.addElement("ADLINK2").setText(adLink2);
				typeElement.addElement("ADURL3").setText(adUrl3);
				typeElement.addElement("ADLINK3").setText(adLink3);
				typeElement.addElement("ADURL4").setText(adUrl4);
				typeElement.addElement("ADLINK4").setText(adLink4);
				typeElement.addElement("ADURL5").setText(adUrl5);
				typeElement.addElement("ADLINK5").setText(adLink5);
			}
		}
		
		return documentReponse;
	}

	private Document getResourceType(Element packet) {
		ResourceTypeService resourceTypeService = (ResourceTypeService)applicationContext.getBean("resourceTypeService");
		// 获取上一级的id
		String upperTypeID = "";
		for (Iterator<Element> it = packet.elementIterator("MENU"); it.hasNext();)
		{
			Element head = it.next();
			upperTypeID = parseNode(head.selectSingleNode("MENUID"));
			System.out.println("regist=" + upperTypeID);
			break;
		}
		QueryRule queryRule = QueryRule.getInstance();
		queryRule.addEqual("upperTypeID", upperTypeID);
		queryRule.addAscOrder("displayNo");
		List<ResourceType> resourceTypeList = resourceTypeService.findResourceType(queryRule);
		// 开始组装信息
		Document documentReponse = DocumentHelper.createDocument();
		Element packetElement = documentReponse.addElement("PACKET")
		.addAttribute("type", "REQUEST")
		.addAttribute("version", "1.0");
		if(resourceTypeList == null || resourceTypeList.isEmpty()){
			// 当不存在的时候
			Element headElement = packetElement.addElement("HEAD");
			headElement.addElement("ACCTYPE").setText("3");
			Element infoElement = packetElement.addElement("BODY");
			infoElement.addElement("SUCCESS").setText("-1");
			infoElement.addElement("ERROR").setText("不存在对应的信息");
		}else{
			Element headElement = packetElement.addElement("HEAD");
			headElement.addElement("ACCTYPE").setText("3");
			Element infoElement = packetElement.addElement("BODY");
			infoElement.addElement("SUCCESS").setText("1");
			infoElement.addElement("MENUID").setText(upperTypeID);
			for(ResourceType resourceType : resourceTypeList){
				Element typeElement = packetElement.addElement("RESOURCETYPE");
				typeElement.addElement("TYPEID").setText(resourceType.getTypeID());
				typeElement.addElement("TYPENAME").setText(resourceType.getTypeCName());
			}
		}
		
		return documentReponse;
	}

	private Document getLoginMessage(Element packet) {
		// 首先获取接口传入的参数
		CardService cardService = (CardService)applicationContext.getBean("cardService");
		CardTypeService cardTypeService = (CardTypeService)applicationContext.getBean("cardTypeService");
		LearningCardType learningCardType = null;
		String errorMessage = "";
		LearningCard learningCard = null;
		Document documentReponse = DocumentHelper.createDocument();
		Element packetElement = documentReponse.addElement("PACKET")
		.addAttribute("type", "REQUEST")
		.addAttribute("version", "1.0");
		for (Iterator<Element> it = packet.elementIterator("LOGIN"); it.hasNext();)
		{
			String userCode = "";
			String passWord = "";
			String loginLoc = "";
			Element head = it.next();
			userCode = parseNode(head.selectSingleNode("USERCODE"));
			passWord = parseNode(head.selectSingleNode("PASSWORD"));
			loginLoc = parseNode(head.selectSingleNode("LOGINLOC"));
			System.out.println("regist=" + userCode);
			// 开始进行验证
			learningCard = cardService.findCardByPrim(userCode);
			if(learningCard == null){
				errorMessage = "不存在用户";
			}else if(learningCard.getEndDate() != null && learningCard.getEndDate().compareTo(DateTime.current()) < 0){// 校验卡的有效期。
				errorMessage = "用户已经过期";
			}else if(!passWord.equals(learningCard.getPassWord())){
				errorMessage = "用户名或密码不正确";
			}else{
			}
			break;
		}
		if(errorMessage.length() > 1){
			Element headElement = packetElement.addElement("HEAD");
			headElement.addElement("ACCTYPE").setText("1");
			Element infoElement = packetElement.addElement("BODY");
			infoElement.addElement("SUCCESS").setText("-1");
			infoElement.addElement("ERROR").setText(errorMessage);
		}else{
			Element headElement = packetElement.addElement("HEAD");
			headElement.addElement("ACCTYPE").setText("1");
			Element infoElement = packetElement.addElement("BODY");
			learningCardType = cardTypeService.findCardTypeByPrim(learningCard.getCardTypeCode());
			DateTime currency = DateTime.current();
			if(learningCard.getStartDate() == null){
				learningCard.setStartDate(currency);
				learningCard.setEndDate(currency.addDay(learningCardType.getDefalutTime().intValue()));
				cardService.updateCard(learningCard);
			}
			infoElement.addElement("SUCCESS").setText("1");
			infoElement.addElement("USERNAME").setText(learningCard.getCardCode());
			infoElement.addElement("CARDTYPE").setText(learningCardType.getCardTypeName());
			infoElement.addElement("CARDTIME").setText(learningCard.getEndDate().toString());
		}
		documentReponse.setXMLEncoding("utf-8");
		return documentReponse;
	}

	private static String parseNode(Node node)
	{
		if (node == null)
		{
			return null;
		}
		return node.getText();
	}
	
}
