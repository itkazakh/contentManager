package cn.com.hy369.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "resourcetype")
public class ResourceType implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/** 类型Id */
	private String typeID;
	/** 上一级类型Id */
	private String upperTypeID;
	/** 类型级别 */
	private int typeLevel;
	/** 系统代码 */
	private String systemCode;
	/** 类型中文名 */
	private String typeCName;
	/** 显示序号 */
	private int displayNo;
	/** 有效状态 */
	private String validStatus;
	/** 任务代码 */
	private String taskCode;
	/**
	 * 类型Id
	 * @return
	 */
	@Id
	@Column(name = "TYPEID")
	public String getTypeID() {
		return typeID;
	}
	public void setTypeID(String typeID) {
		this.typeID = typeID;
	}
	/**
	 * 上一级类型id
	 * @return
	 */
	@Column(name = "UPPERTYPEID")
	public String getUpperTypeID() {
		return upperTypeID;
	}
	public void setUpperTypeID(String upperTypeID) {
		this.upperTypeID = upperTypeID;
	}
	@Column(name = "TYPELEVEL")
	public int getTypeLevel() {
		return typeLevel;
	}
	public void setTypeLevel(int typeLevel) {
		this.typeLevel = typeLevel;
	}
	@Column(name = "SYSTEMCODE")
	public String getSystemCode() {
		return systemCode;
	}
	public void setSystemCode(String systemCode) {
		this.systemCode = systemCode;
	}
	@Column(name = "TYPECNAME")
	public String getTypeCName() {
		return typeCName;
	}
	public void setTypeCName(String typeCName) {
		this.typeCName = typeCName;
	}
	@Column(name = "DISPLAYNO")
	public int getDisplayNo() {
		return displayNo;
	}
	public void setDisplayNo(int displayNo) {
		this.displayNo = displayNo;
	}
	@Column(name = "VALIDSTATUS")
	public String getValidStatus() {
		return validStatus;
	}
	public void setValidStatus(String validStatus) {
		this.validStatus = validStatus;
	}
	@Column(name = "TASKCODE")
	public String getTaskCode() {
		return taskCode;
	}
	public void setTaskCode(String taskCode) {
		this.taskCode = taskCode;
	}
	
}
