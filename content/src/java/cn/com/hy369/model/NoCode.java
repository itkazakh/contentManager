package cn.com.hy369.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name = "nocode")
public class NoCode implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/** 表名 */
	private String tableName;
	/** 最大号 */
	private long maxNo;
	
	/**
	 * 表名
	 * @return
	 */
	@Id
	@Column(name = "TABLENAME")
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	/**
	 * 最大号
	 * @return
	 */
	@Column(name = "MAXNO")
	public long getMaxNo() {
		return maxNo;
	}
	public void setMaxNo(long maxNo) {
		this.maxNo = maxNo;
	}

	
	

}
