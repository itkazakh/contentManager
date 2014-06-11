package cn.com.hy369.common.web;

import java.io.BufferedInputStream;

import cn.com.hy369.common.service.spring.DatabaseBackup;
import ins.framework.web.Struts2Action;

@SuppressWarnings("serial")
public class BackUpAction extends Struts2Action {
	public String prepareBackUp(){
		return SUCCESS;
	}
	
	public String backUpDateBase(){
		String binPath = "\"D:\\Program Files (x86)\\MySQL\\MySQL Server 5.0\\bin\\\"";   
        String userName = "root";
        String pwd = "root";   
        DatabaseBackup bak = new DatabaseBackup(binPath, userName, pwd);   
        bak.backup("/ttt.sql", "hy365db");   
               // bak.restore("c:/ttt.sql", "ttt"); 
		return SUCCESS;
	}
	
	public String restoreDateBase(){
		System.out.print("restore");
		return SUCCESS;
	}
}
