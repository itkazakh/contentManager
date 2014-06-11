
package cn.com.sinosoft.oa.service.facade;

import java.util.List;

import javax.xml.ws.Holder;

import cn.com.sinosoft.oa.vo.Grade;
import cn.com.sinosoft.oa.vo.OAAuthor;
import cn.com.sinosoft.oa.vo.UserGrade;

public interface OAInterfServiceSoap{
	public List<OAAuthor> findSingleUserGrade(String userCode);
	
	public String accreditAdminister(String userCode,String authorCode,List<OAAuthor> accredits);
	
	public List<Grade> findAllGrade();
	
	public List<String> findProductionTree();
	
	public List<UserGrade> findAllUserByGrade(String gradeId);
	
	
}
