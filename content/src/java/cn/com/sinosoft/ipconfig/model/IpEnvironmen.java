package cn.com.sinosoft.ipconfig.model;

// Generated by Hibernate Tools 3.2.0.b9 (sinosoft version)

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * IpEnvironmen generated by Tools.Don't edit.
 */
@Entity
@Table(name = "IPENVIRONMEN")
public class IpEnvironmen implements java.io.Serializable {
	private static final long serialVersionUID = 1L;

	/** 环境类别代码 */
	private String environmentTypeCode;
	/** 环境类别名称 */
	private String environmentTypeName;
	/** 创建人 */
	private String creatorCode;
	/** 创建时间 */
	private Date createTime;
	/** 最后修改人 */
	private String updaterCode;
	/** 最后修改时间 */
	private Date updateTime;
	/** 效力状态 */
	private String validStatus;
	private List<IpServiceConfig> ipServiceConfigs = new ArrayList<IpServiceConfig>(
			0);

	public IpEnvironmen() {
	}

	/**       
	 * 环境类别代码
	 */
	@Id
	@Column(name = "ENVIRONMENTTYPECODE")
	public String getEnvironmentTypeCode() {
		return this.environmentTypeCode;
	}

	public void setEnvironmentTypeCode(String environmentTypeCode) {
		this.environmentTypeCode = environmentTypeCode;
	}

	/**       
	 * 环境类别名称
	 */

	@Column(name = "ENVIRONMENTTYPENAME")
	public String getEnvironmentTypeName() {
		return this.environmentTypeName;
	}

	public void setEnvironmentTypeName(String environmentTypeName) {
		this.environmentTypeName = environmentTypeName;
	}

	/**       
	 * 创建人
	 */

	@Column(name = "CREATORCODE")
	public String getCreatorCode() {
		return this.creatorCode;
	}

	public void setCreatorCode(String creatorCode) {
		this.creatorCode = creatorCode;
	}

	/**       
	 * 创建时间
	 */
	@Temporal(TemporalType.DATE)
	@Column(name = "CREATETIME")
	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	/**       
	 * 最后修改人
	 */

	@Column(name = "UPDATERCODE")
	public String getUpdaterCode() {
		return this.updaterCode;
	}

	public void setUpdaterCode(String updaterCode) {
		this.updaterCode = updaterCode;
	}

	/**       
	 * 最后修改时间
	 */
	@Temporal(TemporalType.DATE)
	@Column(name = "UPDATETIME")
	public Date getUpdateTime() {
		return this.updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	/**       
	 * 效力状态
	 */

	@Column(name = "VALIDSTATUS")
	public String getValidStatus() {
		return this.validStatus;
	}

	public void setValidStatus(String validStatus) {
		this.validStatus = validStatus;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "ipEnvironmen")
	public List<IpServiceConfig> getIpServiceConfigs() {
		return this.ipServiceConfigs;
	}

	public void setIpServiceConfigs(List<IpServiceConfig> ipServiceConfigs) {
		this.ipServiceConfigs = ipServiceConfigs;
	}

}