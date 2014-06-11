package cn.com.sinosoft.saa.service.facade;

import java.util.List;

import cn.com.sinosoft.saa.model.SaaCompany;
//import cn.com.sinosoft.saa.model.SaaGrade;
//import cn.com.sinosoft.saa.model.SaaGradeTask;
//import cn.com.sinosoft.saa.model.SaaTask;
import cn.com.sinosoft.saa.vo.SaaGradeTaskVO;

public interface SaaGradeService {

//	public List<SaaGrade> initSaaGradeList(String userCode);
//
//	public List<SaaGradeTask> findSaaGradeTaskList(String saaGradeID);
//
//	public List<SaaGradeTask> findSaaGradeTasks(String saaGradeID);

	public List<SaaGradeTaskVO> findSaaGradeTaskVOList(String saaGradeID,
			String userCode);

	public List<SaaGradeTaskVO> findSaaGradeTaskVOListByRootCode(
			String saaGradeID, String userCode, String rootTaskCode);

	public List<SaaGradeTaskVO> findRootSaaGradeTaskVO(String userCode);

//	public List<SaaTask> findSaaTaskList();
//
//	public SaaGrade findSaaGradeByGradeID(String saaGradeID);
//
//	public List<SaaTask> findSaaTaskListByRootTask(String rootTaskCode);
//
//	public void updateSaaGrade(String[] taskCodes, String[] intranetCheckBox,
//			String[] internetCheckBox, SaaGrade saaGrade, String userCodeOper);
//
//	public void addSaaGrade(String[] taskCodes, String[] intranetCheckBox,
//			String[] internetCheckBox, SaaGrade saaGrade, String userCodeOper);

	public String getSaaGradeTaskId(Long saaGradeId);

	public List<Long> getSaaGradeTaskIdList(Long saaGradeId);

	public void deleteSaaGradeByGradeID(String saaGradeId);

}
