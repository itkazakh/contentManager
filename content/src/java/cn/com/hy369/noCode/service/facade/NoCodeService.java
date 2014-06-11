package cn.com.hy369.noCode.service.facade;

import cn.com.hy369.model.NoCode;

public interface NoCodeService {

	int findMaxNo(String tableName);

	void updateNoCode(NoCode noCode);

	void deleteNoCode(String tableName);

	void addNoCode(NoCode noCode);

}
