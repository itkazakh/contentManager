package cn.com.hy369.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "resource")
public class Resource implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/** 资源编号 */
	private int resNo;
	/** 资源名称 */
	private String resourceName;
	/** 类型Id */
	private String typeID;
	/** 类型中文名 */
	private String typeCName;
	/** 资源位置 */
	private String resourceAddress;
	/** 资源格式 */
	private String resourceFile;
	/** 资源添加日期 */
	private Date createDate;
	/** 资源信息 */
	private String resourceInfo;
	/** 点击次数 */
	private long clickTimes;

	/**
	 * 资源编号
	 * @return
	 */
	@Id
	@Column(name = "RESNO")
	public int getResNo() {
		return resNo;
	}

	public void setResNo(int resNo) {
		this.resNo = resNo;
	}

	/**
	 * 资源名称
	 * @return
	 */
	@Column(name = "RESOURCENAME")
	public String getResourceName() {
		return resourceName;
	}

	public void setResourceName(String resourceName) {
		this.resourceName = resourceName;
	}
	/**
	 * 类型Id
	 * @return
	 */
	@Column(name = "TYPEID")
	public String getTypeID() {
		return typeID;
	}
	public void setTypeID(String typeID) {
		this.typeID = typeID;
	}
	/**
	 * 资源类型名称
	 * @return
	 */
	@Column(name = "TYPECNAME")
	public String getTypeCName() {
		return typeCName;
	}
	public void setTypeCName(String typeCName) {
		this.typeCName = typeCName;
	}
	/**
	 * 资源位置
	 * @return
	 */
	@Column(name = "RESOURCEADDRESS")
	public String getResourceAddress() {
		return resourceAddress;
	}
	public void setResourceAddress(String resourceAddress) {
		this.resourceAddress = resourceAddress;
	}
	/**
	 * 资源格式
	 * @return
	 */
	@Column(name = "RESOURCEFILE")
	public String getResourceFile() {
		return resourceFile;
	}
	public void setResourceFile(String resourceFile) {
		this.resourceFile = resourceFile;
	}
	/**
	 * 创建日期
	 * @return
	 */
	@Temporal(TemporalType.DATE)
	@Column(name = "CREATEDATE")
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	/**
	 * 资源描述
	 * @return
	 */
	@Column(name = "RESOURCEINFO")
	public String getResourceInfo() {
		return resourceInfo;
	}
	public void setResourceInfo(String resourceInfo) {
		this.resourceInfo = resourceInfo;
	}
	/**
	 * 点击次数
	 * @return
	 */
	@Column(name = "CLICKTIMES")
	public long getClickTimes() {
		return clickTimes;
	}
	public void setClickTimes(long clickTimes) {
		this.clickTimes = clickTimes;
	}
	
}
