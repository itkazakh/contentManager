package cn.com.hy369.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "jioninfo")
public class JionInfo implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/** 信息ID */
	private String infoNo;
	/** 用户名称 */
	private String userName;
	/** 电话号码 */
	private String phoneNo;
	/** 用户邮编 */
	private String postCode;
	/** 电子邮箱 */
	private String email;
	/** 联系地址 */
	private String address;
	/** 留言内容 */
	private String message;
	/** 留言日期 */
	private Date createDate;
	/**
	 * 信息ID
	 * @return
	 */
	@Id
	@Column(name = "INFONO")
	public String getInfoNo() {
		return infoNo;
	}
	public void setInfoNo(String infoNo) {
		this.infoNo = infoNo;
	}
	/**
	 * 用户名称
	 * @return
	 */
	@Column(name = "USERNAME")
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	/**
	 * 电话号码
	 * @return
	 */
	@Column(name = "PHONENO")
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	/**
	 * 邮政编码
	 * @return
	 */
	@Column(name = "POSTCODE")
	public String getPostCode() {
		return postCode;
	}
	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}
	/**
	 * 电子邮件
	 * @return
	 */
	@Column(name = "EMAIL")
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * 地址
	 * @return
	 */
	@Column(name = "ADDRESS")
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	/**
	 * 留言
	 * @return
	 */
	@Column(name = "MESSAGE")
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	/**
	 * 留言日期
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
	
}
