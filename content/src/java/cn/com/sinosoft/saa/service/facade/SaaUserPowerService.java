package cn.com.sinosoft.saa.service.facade;

import ins.framework.common.Page;

import java.io.FileInputStream;
import java.util.Date;
import java.util.List;

import cn.com.sinosoft.saa.model.SaaUser;
import cn.com.sinosoft.saa.vo.SaaAuthTaskVO;
import cn.com.sinosoft.saa.vo.SaaRiskObjectVO;

public interface SaaUserPowerService {
	public List<SaaUser> findSaaUserList(String userCode);

	public void copyUserPower(String userCodeFrom, String userCodeTo,
			String operUserCode, Date date);

	// public Page findSaaUserList(SaaUser saaUser,int pageNO,int
	// pageSize,String userCodeOperate);
	public List<SaaAuthTaskVO> findSaaAuthTaskVOListByUserCode(
			String userCodeOperate, String userCode);

	public List<SaaRiskObjectVO> findSaaAuthProductVOListByUserCode(
			String userCodeOperate, String userCode);

	public List<SaaAuthTaskVO> findSaaAuthTaskVOListByUserCodeRootTask(
			String userCodeOperate, String userCode, String rootTaskCode);

	public void updateTaskPower(String[] taskCodes, String userCode);

	public void updateProductPower(String[] productCodes, String userCode);

	public void updateComPower(String authComCode, String authExceptComCode,
			String userCode);

	public String findAuthCompanySql(String userCode);

	public String findAuthExceptCompanySql(String userCode);

	public String findSaaUserAuthComCode(String userCode);

	public String findSaaUserAuthExceptComCode(String userCode);

	public String findSaaUserAuthComName(String useCode);

	public String findSaaUserAuthExceptComName(String useCode);

	public String findSubCompanySql(String userCode);

	public void updateUserPowerByExcel(FileInputStream file, String userCode);

	public void exportUserPowerToExcel(String comCodes);
	
	public List<SaaAuthTaskVO> findRootSaaAuthTaskVOList(String userCodeOperate);
}
