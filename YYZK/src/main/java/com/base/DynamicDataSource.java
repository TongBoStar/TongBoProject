package com.base;

import java.sql.SQLFeatureNotSupportedException;

import org.apache.log4j.Logger;
import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource; 

import com.terrence.crm.common.util.DbContextHolder;


public class DynamicDataSource extends AbstractRoutingDataSource { 

	static Logger log = Logger.getLogger("DynamicDataSource"); 
	
	String defaultDbType;
	public String getDefaultDbType() {
		return defaultDbType;
	}
	public void setDefaultDbType(String defaultDbType) {
		this.defaultDbType = defaultDbType;
	}
	@Override 
	protected Object determineCurrentLookupKey() { 
	  
	  /*if(DbContextHolder.getDbType()==null){
		  DbContextHolder.setDbType(defaultDbType); 
	  }	*/
	  return DbContextHolder.getDbType(); 
	}
	
	public java.util.logging.Logger getParentLogger()
			throws SQLFeatureNotSupportedException {
		// TODO Auto-generated method stub
		return null;
	} 

} 
