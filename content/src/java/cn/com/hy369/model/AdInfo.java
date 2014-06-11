package cn.com.hy369.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "adinfo")
public class AdInfo implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/** 广告序号 */
	private String adNo;
	/** 资源序号 */
	private String resourceID;
	/** 资源名称 */
	private String resourceName;
	/** 地区序号 */
	private String areaNo;
	/** 地区名称 */
	private String areaName;
	/** 广告信息 */
	private String adInfo;
	/** 广告链接 */
	private String adLink;
	/** 广告信息 */
	private String adInfo1;
	/** 广告链接 */
	private String adLink1;
	/** 广告信息 */
	private String adInfo2;
	/** 广告链接 */
	private String adLink2;
	/** 广告信息 */
	private String adInfo3;
	/** 广告链接 */
	private String adLink3;
	/** 广告信息 */
	private String adInfo4;
	/** 广告链接 */
	private String adLink4;
	/** 广告信息 */
	private String adInfo5;
	/** 广告链接 */
	private String adLink5;
	/**
	 * 广告序号
	 * @return
	 */
	@Id
	@Column(name = "ADNO")
	public String getAdNo() {
		return adNo;
	}
	public void setAdNo(String adNo) {
		this.adNo = adNo;
	}
	/**
	 * 资源序号
	 * @return
	 */
	@Column(name = "RESOURCEID")
	public String getResourceID() {
		return resourceID;
	}
	public void setResourceID(String resourceID) {
		this.resourceID = resourceID;
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
	 * 地区序号
	 * @return
	 */
	@Column(name = "AREANO")
	public String getAreaNo() {
		return areaNo;
	}
	public void setAreaNo(String areaNo) {
		this.areaNo = areaNo;
	}
	/**
	 * 地区名称
	 * @return
	 */
	@Column(name = "AREANAME")
	public String getAreaName() {
		return areaName;
	}
	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}
	/**
	 * 广告信息
	 * @return
	 */
	@Column(name = "ADINFO")
	public String getAdInfo() {
		return adInfo;
	}
	public void setAdInfo(String adInfo) {
		this.adInfo = adInfo;
	}
	/**
	 * 广告链接
	 * @return
	 */
	@Column(name = "ADLINK")
	public String getAdLink() {
		return adLink;
	}
	public void setAdLink(String adLink) {
		this.adLink = adLink;
	}
	/**
	 * 广告信息1
	 * @return
	 */
	@Column(name = "ADINFO1")
	public String getAdInfo1() {
		return adInfo1;
	}
	public void setAdInfo1(String adInfo1) {
		this.adInfo1 = adInfo1;
	}
	/**
	 * 广告链接1
	 * @return
	 */
	@Column(name = "ADLINK1")
	public String getAdLink1() {
		return adLink1;
	}
	public void setAdLink1(String adLink1) {
		this.adLink1 = adLink1;
	}
	/**
	 * 广告信息2
	 * @return
	 */
	@Column(name = "ADINFO2")
	public String getAdInfo2() {
		return adInfo2;
	}
	public void setAdInfo2(String adInfo2) {
		this.adInfo2 = adInfo2;
	}
	/**
	 * 广告链接2
	 * @return
	 */
	@Column(name = "ADLINK2")
	public String getAdLink2() {
		return adLink2;
	}
	public void setAdLink2(String adLink2) {
		this.adLink2 = adLink2;
	}
	/**
	 * 广告信息2
	 * @return
	 */
	@Column(name = "ADINFO3")
	public String getAdInfo3() {
		return adInfo3;
	}
	public void setAdInfo3(String adInfo3) {
		this.adInfo3 = adInfo3;
	}
	/**
	 * 广告链接2
	 * @return
	 */
	@Column(name = "ADLINK3")
	public String getAdLink3() {
		return adLink3;
	}
	public void setAdLink3(String adLink3) {
		this.adLink3 = adLink3;
	}
	/**
	 * 广告信息4
	 * @return
	 */
	@Column(name = "ADINFO4")
	public String getAdInfo4() {
		return adInfo4;
	}
	public void setAdInfo4(String adInfo4) {
		this.adInfo4 = adInfo4;
	}
	/**
	 * 广告链接4
	 * @return
	 */
	@Column(name = "ADLINK4")
	public String getAdLink4() {
		return adLink4;
	}
	public void setAdLink4(String adLink4) {
		this.adLink4 = adLink4;
	}
	/**
	 * 广告信息5
	 * @return
	 */
	@Column(name = "ADINFO5")
	public String getAdInfo5() {
		return adInfo5;
	}
	public void setAdInfo5(String adInfo5) {
		this.adInfo5 = adInfo5;
	}
	/**
	 * 广告链接5
	 * @return
	 */
	@Column(name = "ADLINK5")
	public String getAdLink5() {
		return adLink5;
	}
	public void setAdLink5(String adLink5) {
		this.adLink5 = adLink5;
	}
	
	
}
