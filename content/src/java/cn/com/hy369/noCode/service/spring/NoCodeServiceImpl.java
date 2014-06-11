package cn.com.hy369.noCode.service.spring;

import ins.framework.dao.GenericDaoHibernate;
import cn.com.hy369.model.NoCode;
import cn.com.hy369.noCode.service.facade.NoCodeService;

public class NoCodeServiceImpl extends
GenericDaoHibernate<NoCode, String> implements NoCodeService {

	public int findMaxNo(String tableName) {
		if(super.get(tableName) == null){
			return 0;
		}
		return (int)super.get(tableName).getMaxNo();
	}

	public void updateNoCode(NoCode noCode) {
		super.update(noCode);
		
	}

	public void deleteNoCode(String tableName) {
		super.deleteByPK(tableName);
	}

	public void addNoCode(NoCode noCode) {
		super.save(noCode);
		
	}
	
}
