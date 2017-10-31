package com.terrence.crm.dol.base.core.jdbc.dialect;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * MySQL方言分页部分
 */
public class MySQLDialect extends Dialect{

	private static final Logger logger = LoggerFactory.getLogger(MySQLDialect.class);  
	
	public boolean supportsLimitOffset(){
		return true;
	}
	
    public boolean supportsLimit() {   
        return true;   
    }  
    
	public String getLimitString(String sql, int offset,String offsetPlaceholder, int limit, String limitPlaceholder) {
		StringBuffer sqlBuffer = new StringBuffer();
        if (offset > 0) {   
        	sqlBuffer.append(sql);
        	sqlBuffer.append(" limit ");
        	sqlBuffer.append(offsetPlaceholder);
        	sqlBuffer.append(" , ");
        	sqlBuffer.append(limitPlaceholder);

        } else {   
        	sqlBuffer.append(sql);
        	sqlBuffer.append(" limit ");
        	sqlBuffer.append(limitPlaceholder);
        }  
        logger.debug("limit string:{}", sqlBuffer.toString());
        return sqlBuffer.toString();
	}   
  
}
