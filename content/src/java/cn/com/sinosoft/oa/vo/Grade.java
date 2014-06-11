package cn.com.sinosoft.oa.vo;

public class Grade {

	protected long id;
	protected String gradeCName;
	protected String gradeTName;
	protected String gradeEName;
	protected String commonGrade;
	protected String comCode;
	protected String creatorCode;
	protected String createTime;
	protected String updaterCode;
	protected String updateTime;
	protected String validStatus;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getGradeCName() {
		return gradeCName;
	}

	public void setGradeCName(String gradeCName) {
		this.gradeCName = gradeCName;
	}

	public String getGradeTName() {
		return gradeTName;
	}

	public void setGradeTName(String gradeTName) {
		this.gradeTName = gradeTName;
	}

	public String getGradeEName() {
		return gradeEName;
	}

	public void setGradeEName(String gradeEName) {
		this.gradeEName = gradeEName;
	}

	public String getCommonGrade() {
		return commonGrade;
	}

	public void setCommonGrade(String commonGrade) {
		this.commonGrade = commonGrade;
	}

	public String getComCode() {
		return comCode;
	}

	public void setComCode(String comCode) {
		this.comCode = comCode;
	}

	public String getCreatorCode() {
		return creatorCode;
	}

	public void setCreatorCode(String creatorCode) {
		this.creatorCode = creatorCode;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getUpdaterCode() {
		return updaterCode;
	}

	public void setUpdaterCode(String updaterCode) {
		this.updaterCode = updaterCode;
	}

	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}

	public String getValidStatus() {
		return validStatus;
	}

	public void setValidStatus(String validStatus) {
		this.validStatus = validStatus;
	}

}
